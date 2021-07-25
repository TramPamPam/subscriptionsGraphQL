// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListenSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription Listen {
      queryTodo {
        __typename
        ... on Todo {
          ...ToDoDetail
        }
      }
    }
    """

  public let operationName: String = "Listen"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ToDoDetail.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("queryTodo", type: .list(.object(QueryTodo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(queryTodo: [QueryTodo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "queryTodo": queryTodo.flatMap { (value: [QueryTodo?]) -> [ResultMap?] in value.map { (value: QueryTodo?) -> ResultMap? in value.flatMap { (value: QueryTodo) -> ResultMap in value.resultMap } } }])
    }

    public var queryTodo: [QueryTodo?]? {
      get {
        return (resultMap["queryTodo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [QueryTodo?] in value.map { (value: ResultMap?) -> QueryTodo? in value.flatMap { (value: ResultMap) -> QueryTodo in QueryTodo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [QueryTodo?]) -> [ResultMap?] in value.map { (value: QueryTodo?) -> ResultMap? in value.flatMap { (value: QueryTodo) -> ResultMap in value.resultMap } } }, forKey: "queryTodo")
      }
    }

    public struct QueryTodo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Todo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ToDoDetail.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String, completed: Bool) {
        self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title, "description": description, "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var toDoDetail: ToDoDetail {
          get {
            return ToDoDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AddNotCompletedMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddNotCompleted($title: String!, $description: String!) {
      addTodo(input: [{title: $title, description: $description, completed: false}]) {
        __typename
        numUids
      }
    }
    """

  public let operationName: String = "AddNotCompleted"

  public var title: String
  public var description: String

  public init(title: String, description: String) {
    self.title = title
    self.description = description
  }

  public var variables: GraphQLMap? {
    return ["title": title, "description": description]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addTodo", arguments: ["input": [["title": GraphQLVariable("title"), "description": GraphQLVariable("description"), "completed": false]]], type: .object(AddTodo.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addTodo: AddTodo? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addTodo": addTodo.flatMap { (value: AddTodo) -> ResultMap in value.resultMap }])
    }

    public var addTodo: AddTodo? {
      get {
        return (resultMap["addTodo"] as? ResultMap).flatMap { AddTodo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addTodo")
      }
    }

    public struct AddTodo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AddTodoPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("numUids", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(numUids: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddTodoPayload", "numUids": numUids])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var numUids: Int? {
        get {
          return resultMap["numUids"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "numUids")
        }
      }
    }
  }
}

public final class AllToDosQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query allToDos {
      queryTodo {
        __typename
        ... on Todo {
          ...ToDoDetail
        }
      }
    }
    """

  public let operationName: String = "allToDos"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ToDoDetail.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("queryTodo", type: .list(.object(QueryTodo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(queryTodo: [QueryTodo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "queryTodo": queryTodo.flatMap { (value: [QueryTodo?]) -> [ResultMap?] in value.map { (value: QueryTodo?) -> ResultMap? in value.flatMap { (value: QueryTodo) -> ResultMap in value.resultMap } } }])
    }

    public var queryTodo: [QueryTodo?]? {
      get {
        return (resultMap["queryTodo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [QueryTodo?] in value.map { (value: ResultMap?) -> QueryTodo? in value.flatMap { (value: ResultMap) -> QueryTodo in QueryTodo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [QueryTodo?]) -> [ResultMap?] in value.map { (value: QueryTodo?) -> ResultMap? in value.flatMap { (value: QueryTodo) -> ResultMap in value.resultMap } } }, forKey: "queryTodo")
      }
    }

    public struct QueryTodo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Todo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ToDoDetail.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String, completed: Bool) {
        self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title, "description": description, "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var toDoDetail: ToDoDetail {
          get {
            return ToDoDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ToDoDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ToDoDetail on Todo {
      __typename
      id
      title
      description
      completed
    }
    """

  public static let possibleTypes: [String] = ["Todo"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("description", type: .nonNull(.scalar(String.self))),
      GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String, description: String, completed: Bool) {
    self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "title": title, "description": description, "completed": completed])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String {
    get {
      return resultMap["description"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var completed: Bool {
    get {
      return resultMap["completed"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "completed")
    }
  }
}
