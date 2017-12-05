//
//  Nanomp4.swift
//
//  Created by Dhanushka Adrian on 12/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Nanomp4: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let size = "size"
    static let dims = "dims"
    static let duration = "duration"
    static let preview = "preview"
    static let url = "url"
  }

  // MARK: Properties
  public var size: Int?
  public var dims: [Int]?
  public var duration: Float?
  public var preview: String?
  public var url: String?

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
    size = json[SerializationKeys.size].int
    if let items = json[SerializationKeys.dims].array { dims = items.map { $0.intValue } }
    duration = json[SerializationKeys.duration].float
    preview = json[SerializationKeys.preview].string
    url = json[SerializationKeys.url].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = size { dictionary[SerializationKeys.size] = value }
    if let value = dims { dictionary[SerializationKeys.dims] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = preview { dictionary[SerializationKeys.preview] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.size = aDecoder.decodeObject(forKey: SerializationKeys.size) as? Int
    self.dims = aDecoder.decodeObject(forKey: SerializationKeys.dims) as? [Int]
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Float
    self.preview = aDecoder.decodeObject(forKey: SerializationKeys.preview) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(size, forKey: SerializationKeys.size)
    aCoder.encode(dims, forKey: SerializationKeys.dims)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(preview, forKey: SerializationKeys.preview)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
