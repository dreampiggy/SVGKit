/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-667469212
 
 interface CDATASection : Text {
 };
 */
#if __has_include(<WebKit/DOMText.h>)
#import <WebKit/DOMCDATASection.h>
#else

#import <Foundation/Foundation.h>

@class DOMText;
#import "DOMText.h"

@interface DOMCDATASection : DOMText

- (id)initWithValue:(NSString*) v;

@end

#endif
