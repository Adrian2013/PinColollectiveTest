//
//  Results.swift
//
//  Created by Dhanushka Adrian on 12/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Results: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let shares = "shares"
    static let media = "media"
    static let id = "id"
    static let itemurl = "itemurl"
    static let created = "created"
    static let hasaudio = "hasaudio"
    static let title = "title"
    static let tags = "tags"
    static let url = "url"
    static let hascaption = "hascaption"
  }

  // MARK: Properties
  public var shares: Int?
  public var media: [Media]?
  public var id: String?
  public var itemurl: String?
  public var created: Float?
  public var hasaudio: Bool? = false
  public var title: String?
  public var tags: [Any]?
  public var url: String?
  public var hascaption: Bool? = false

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
    shares = json[SerializationKeys.shares].int
    if let items = json[SerializationKeys.media].array { media = items.map { Media(json: $0) } }
    id = json[SerializationKeys.id].string
    itemurl = json[SerializationKeys.itemurl].string
    created = json[SerializationKeys.created].float
    hasaudio = json[SerializationKeys.hasaudio].boolValue
    title = json[SerializationKeys.title].string
    if let items = json[SerializationKeys.tags].array { tags = items.map { $0.object} }
    url = json[SerializationKeys.url].string
    hascaption = json[SerializationKeys.hascaption].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = shares { dictionary[SerializationKeys.shares] = value }
    if let value = media { dictionary[SerializationKeys.media] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = itemurl { dictionary[SerializationKeys.itemurl] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    dictionary[SerializationKeys.hasaudio] = hasaudio
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = tags { dictionary[SerializationKeys.tags] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    dictionary[SerializationKeys.hascaption] = hascaption
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.shares = aDecoder.decodeObject(forKey: SerializationKeys.shares) as? Int
    self.media = aDecoder.decodeObject(forKey: SerializationKeys.media) as? [Media]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.itemurl = aDecoder.decodeObject(forKey: SerializationKeys.itemurl) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? Float
    self.hasaudio = aDecoder.decodeBool(forKey: SerializationKeys.hasaudio)
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.tags = aDecoder.decodeObject(forKey: SerializationKeys.tags) as? [Any]
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.hascaption = aDecoder.decodeBool(forKey: SerializationKeys.hascaption)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(shares, forKey: SerializationKeys.shares)
    aCoder.encode(media, forKey: SerializationKeys.media)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(itemurl, forKey: SerializationKeys.itemurl)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(hasaudio, forKey: SerializationKeys.hasaudio)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(tags, forKey: SerializationKeys.tags)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(hascaption, forKey: SerializationKeys.hascaption)
  }

}
