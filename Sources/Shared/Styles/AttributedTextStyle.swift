//
//  AttributedTextStyle.swift
//  Pods
//
//  Created by Brian Strobach on 5/20/17.
//
//

import Foundation
//import DinoDNA

open class AttributedTextStyle: Style{
    open var attributes: [NSAttributedString.Key: Any] = [:]
    public init(attributes: [NSAttributedString.Key: Any] = [:]) {
        self.attributes = attributes
    }
}


extension TextStyle{
    public var attributed: AttributedTextStyle{
        var attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : color,
            .font : font,
        ]
        if let shadow = shadowStyle?.toNSShadow{
            attributes[.shadow] = shadow
        }
        return AttributedTextStyle(attributes: attributes)
    }
}
public extension String {
    
    /// Create a new NSMutableAttributedString instance from given String by applying passed attribute at given range.
    ///
    /// - Parameters:
    ///   - style: style to apply
    ///   - range: range to apply (nil means entire string's range)
    /// - Returns: an NSMutableAttributedString instance
    public func apply(style: AttributedTextStyle, range: Range<Int>? = nil) -> NSMutableAttributedString {
        return self.attributed.mutable.apply(style: style, range: range)
    }
    
    
    /// Apply attributes in order, as passed. The only exception is .default Style; it will be applied always as first style
    ///
    /// - Parameter styles: styles to apply
    /// - Returns: a new attributed string
    public func apply(styles: AttributedTextStyle...) -> NSMutableAttributedString {
        return self.apply(stylesArray: Array(styles))
    }
    
    /// Apply attributes in order, as passed. The only exception is .default Style; it will be applied always as first style
    ///
    /// - Parameter styles: styles to apply
    /// - Returns: a new attributed string
    public func apply(stylesArray styles: [AttributedTextStyle]) -> NSMutableAttributedString {
        return self.attributed.mutable.apply(stylesArray: Array(styles))
    }
    
    /// Apply style's attributes to given string with pattern matching specified
    ///
    /// - Parameters:
    ///   - styles: styles to apply
    ///   - pattern: pattern to search via regexp
    ///   - options: options of pattern matching
    /// - Returns: a new attributed string instance
    public func apply(styles: AttributedTextStyle..., pattern: String, options: NSRegularExpression.Options = []) -> NSMutableAttributedString {
        return self.attributed.mutable.apply(stylesArray: styles, pattern: pattern, options: options)
    }
    
    public func apply(style: AttributedTextStyle, to words: [String], options: NSRegularExpression.Options = []) -> NSMutableAttributedString{
        guard words.count > 0 else { return attributed.mutable }
        let regex = words.count > 1 ? "(" + words.joined(separator: "|") + ")" : "(\(words[0]))"
        return self.apply(styles: style, pattern: regex, options: options)
    }
    
}

public extension NSMutableAttributedString{
    @discardableResult
    public func apply(style: AttributedTextStyle, range: Range<Int>? = nil) -> NSMutableAttributedString {
        guard let range = range ?? Range.init(fullRange) else { return self }
        addAttributes(style.attributes, range: NSRange(range))
        return self
    }
    
    @discardableResult
    public func apply(styles: AttributedTextStyle...) -> NSMutableAttributedString {
        return self.apply(stylesArray: Array(styles))
    }
    
    @discardableResult
    public func apply(stylesArray styles: [AttributedTextStyle]) -> NSMutableAttributedString {
        addAttributes(styles.attributesDictionary, range: self.fullRange)
        return self
    }
    
    @discardableResult
    public func apply(styles: AttributedTextStyle..., pattern: String, options: NSRegularExpression.Options = []) -> NSMutableAttributedString {
        return apply(stylesArray: styles, pattern: pattern, options: options)
        
    }
    
    @discardableResult
    public func apply(stylesArray styles: [AttributedTextStyle], pattern: String, options: NSRegularExpression.Options = []) -> NSMutableAttributedString {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: options)
            regex.enumerateMatches(in: self.string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: fullRange) {
                (result : NSTextCheckingResult?, _, _) in
                if let r = result {
                    addAttributes(styles.attributesDictionary, range: r.range)
                }
            }
            return self
        } catch {
            return self
        }
    }

    @discardableResult
    public func apply(style: AttributedTextStyle, to words: [String], options: NSRegularExpression.Options = []) -> NSMutableAttributedString{
        guard words.count > 0 else { return self.apply(styles: style) }
        let regex = words.count > 1 ? "(" + words.joined(separator: "|") + ")" : "(\(words[0]))"
        return self.apply(styles: style, pattern: regex, options: options)
    }
}

public extension Array where Element: AttributedTextStyle {

    
    /// Generate a new attributes dictionary, merge of the attributes from a list of Style
    /// Array is generated by setting as initial style dictionary the default style (if present into the array)
    /// Any other Style is applied and replace existing key in the same order as passed
    internal var attributesDictionary: [NSAttributedString.Key: Any] {
        guard self.count > 1 else {
            return (self.first?.attributes ?? [:])
        }
        
        var dictionaries: [NSAttributedString.Key: Any] =  [:]
        self.forEach {
            dictionaries.merge(with: $0.attributes)
        }
        return dictionaries
    }
    
}

//MARK: String Extensions (NSRange)
public extension String {
    
    /// Transform a Range<Int> to NSRange based upon the content of self
    ///
    /// - Parameter range: range to convert
    /// - Returns: equivalent
    public func toNSRange(from range: Range<Int>?) -> NSRange {
        guard let range = range else {
            return self.toNSRange(from: self.toStringRange(from: NSMakeRange(0, self.count))!)
        }
        return self.toNSRange(from: self.toStringRange(range: range))
    }
    
    func toNSRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)        
    }
    
    public func toStringRange(range: Range<Int>) -> Range<String.Index> {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)// - range.lowerBound)
        return Range<String.Index>(uncheckedBounds: (startIndex,endIndex))
    }
    
    func toStringRange(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}
