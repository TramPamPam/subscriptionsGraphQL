//
//  Network.swift
//  SubscriptionGraphQL
//
//  Created by Oleksandr on 10.04.2021.
//

import Foundation
import Apollo
import Combine
import ApolloWebSocket

// MARK: - Singleton Wrapper

class Network {
    static let shared = Network()
    private init() {}

    let url = URL(string: backendURL)!
    let store = ApolloStore(cache: InMemoryNormalizedCache())

    /// A web socket transport to use for subscriptions
    private lazy var webSocketTransport: WebSocketTransport = {
        let request = URLRequest(url: url)
        return WebSocketTransport(request: request)
    }()

    /// An HTTP transport to use for queries and mutations
    private lazy var normalTransport: RequestChainNetworkTransport = {
        let provider = LegacyInterceptorProvider(store: store)
        return RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url)
    }()

    /// A split network transport to allow the use of both of the above
    /// transports through a single `NetworkTransport` instance.
    private lazy var splitNetworkTransport = SplitNetworkTransport(
        uploadingNetworkTransport: self.normalTransport,
        webSocketNetworkTransport: self.webSocketTransport
    )

    /// Create a client using the `SplitNetworkTransport`.
    private(set) lazy var client = ApolloClient(
        networkTransport: self.splitNetworkTransport,
        store: store)

    var callback: (([ToDoDetail]) -> Void)?

    var listen: Apollo.Cancellable?

    func subscribe() {
        listen = client.subscribe(subscription: ListenSubscription()) { (result) in
            print("ListenSubscription trigger")
            switch result {
            case .success(let graph):
                let todos = graph.data?.queryTodo?
                    .compactMap{ $0?.fragments.toDoDetail }
                self.callback?(todos ?? [])
                print(todos?.count ?? -1)
            case .failure(let error):
                print(error)
            }
        }
    }

    func addNew() {
        client.perform(mutation: AddNotCompletedMutation(title: UUID().uuidString, description: "desc \(UUID().uuidString)")) { (result) in
            switch result {
            case .success(let graph):
                print("AddNotCompletedMutation completed \(graph.data != nil)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
