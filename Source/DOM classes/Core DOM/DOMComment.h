/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-1728279322

 interface Comment : CharacterData {
 };
*/

#if __has_include(<WebKit/DOMComment.h>)
#import <WebKit/DOMComment.h>
#else

#import <Foundation/Foundation.h>

#import "DOMCharacterData.h"

@interface DOMComment : DOMCharacterData

- (id)initWithValue:(NSString*) v;

@end

#endif
