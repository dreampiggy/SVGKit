/*
 SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-1312295772
 
 interface Text : CharacterData {
 Text               splitText(in unsigned long offset)
 raises(DOMException);
 };
*/

#if __has_include(<WebKit/DOMText.h>)
#import <WebKit/DOMText.h>
#else

#import <Foundation/Foundation.h>

@class DOMCharacterData;
#import "DOMCharacterData.h"

@interface DOMText : DOMCharacterData

- (id)initWithValue:(NSString*) v;

-(DOMText*) splitText:(unsigned long) offset;

@end

#endif
