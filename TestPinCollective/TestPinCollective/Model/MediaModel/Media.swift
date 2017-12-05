//
//  Media.swift
//
//  Created by Dhanushka Adrian on 12/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Media: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let tinywebm = "tinywebm"
    static let mp4 = "mp4"
    static let tinygif = "tinygif"
    static let loopedmp4 = "loopedmp4"
    static let gif = "gif"
    static let nanogif = "nanogif"
    static let webm = "webm"
    static let nanomp4 = "nanomp4"
    static let mediumgif = "mediumgif"
    static let nanowebm = "nanowebm"
    static let tinymp4 = "tinymp4"
  }

  // MARK: Properties
  public var tinywebm: Tinywebm?
  public var mp4: Mp4?
  public var tinygif: Tinygif?
  public var loopedmp4: Loopedmp4?
  public var gif: Gif?
  public var nanogif: Nanogif?
  public var webm: Webm?
  public var nanomp4: Nanomp4?
  public var mediumgif: Mediumgif?
  public var nanowebm: Nanowebm?
  public var tinymp4: Tinymp4?

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
    tinywebm = Tinywebm(json: json[SerializationKeys.tinywebm])
    mp4 = Mp4(json: json[SerializationKeys.mp4])
    tinygif = Tinygif(json: json[SerializationKeys.tinygif])
    loopedmp4 = Loopedmp4(json: json[SerializationKeys.loopedmp4])
    gif = Gif(json: json[SerializationKeys.gif])
    nanogif = Nanogif(json: json[SerializationKeys.nanogif])
    webm = Webm(json: json[SerializationKeys.webm])
    nanomp4 = Nanomp4(json: json[SerializationKeys.nanomp4])
    mediumgif = Mediumgif(json: json[SerializationKeys.mediumgif])
    nanowebm = Nanowebm(json: json[SerializationKeys.nanowebm])
    tinymp4 = Tinymp4(json: json[SerializationKeys.tinymp4])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = tinywebm { dictionary[SerializationKeys.tinywebm] = value.dictionaryRepresentation() }
    if let value = mp4 { dictionary[SerializationKeys.mp4] = value.dictionaryRepresentation() }
    if let value = tinygif { dictionary[SerializationKeys.tinygif] = value.dictionaryRepresentation() }
    if let value = loopedmp4 { dictionary[SerializationKeys.loopedmp4] = value.dictionaryRepresentation() }
    if let value = gif { dictionary[SerializationKeys.gif] = value.dictionaryRepresentation() }
    if let value = nanogif { dictionary[SerializationKeys.nanogif] = value.dictionaryRepresentation() }
    if let value = webm { dictionary[SerializationKeys.webm] = value.dictionaryRepresentation() }
    if let value = nanomp4 { dictionary[SerializationKeys.nanomp4] = value.dictionaryRepresentation() }
    if let value = mediumgif { dictionary[SerializationKeys.mediumgif] = value.dictionaryRepresentation() }
    if let value = nanowebm { dictionary[SerializationKeys.nanowebm] = value.dictionaryRepresentation() }
    if let value = tinymp4 { dictionary[SerializationKeys.tinymp4] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.tinywebm = aDecoder.decodeObject(forKey: SerializationKeys.tinywebm) as? Tinywebm
    self.mp4 = aDecoder.decodeObject(forKey: SerializationKeys.mp4) as? Mp4
    self.tinygif = aDecoder.decodeObject(forKey: SerializationKeys.tinygif) as? Tinygif
    self.loopedmp4 = aDecoder.decodeObject(forKey: SerializationKeys.loopedmp4) as? Loopedmp4
    self.gif = aDecoder.decodeObject(forKey: SerializationKeys.gif) as? Gif
    self.nanogif = aDecoder.decodeObject(forKey: SerializationKeys.nanogif) as? Nanogif
    self.webm = aDecoder.decodeObject(forKey: SerializationKeys.webm) as? Webm
    self.nanomp4 = aDecoder.decodeObject(forKey: SerializationKeys.nanomp4) as? Nanomp4
    self.mediumgif = aDecoder.decodeObject(forKey: SerializationKeys.mediumgif) as? Mediumgif
    self.nanowebm = aDecoder.decodeObject(forKey: SerializationKeys.nanowebm) as? Nanowebm
    self.tinymp4 = aDecoder.decodeObject(forKey: SerializationKeys.tinymp4) as? Tinymp4
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(tinywebm, forKey: SerializationKeys.tinywebm)
    aCoder.encode(mp4, forKey: SerializationKeys.mp4)
    aCoder.encode(tinygif, forKey: SerializationKeys.tinygif)
    aCoder.encode(loopedmp4, forKey: SerializationKeys.loopedmp4)
    aCoder.encode(gif, forKey: SerializationKeys.gif)
    aCoder.encode(nanogif, forKey: SerializationKeys.nanogif)
    aCoder.encode(webm, forKey: SerializationKeys.webm)
    aCoder.encode(nanomp4, forKey: SerializationKeys.nanomp4)
    aCoder.encode(mediumgif, forKey: SerializationKeys.mediumgif)
    aCoder.encode(nanowebm, forKey: SerializationKeys.nanowebm)
    aCoder.encode(tinymp4, forKey: SerializationKeys.tinymp4)
  }

}
