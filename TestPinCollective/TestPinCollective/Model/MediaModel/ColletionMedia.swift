//
//  ColletionMedia.swift
//
//  Created by Dhanushka Adrian on 12/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ColletionMedia: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let results = "results"
    static let next = "next"
  }

  // MARK: Properties
  public var results: [Results]?
  public var next: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    if let items = json[SerializationKeys.results].array { results = items.map { Results(json: $0) } }
    next = json[SerializationKeys.next].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
    if let value = next { dictionary[SerializationKeys.next] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.results = aDecoder.decodeObject(forKey: SerializationKeys.results) as? [Results]
    self.next = aDecoder.decodeObject(forKey: SerializationKeys.next) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(results, forKey: SerializationKeys.results)
    aCoder.encode(next, forKey: SerializationKeys.next)
  }

}
