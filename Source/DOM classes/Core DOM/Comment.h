/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-1728279322

 interface Comment : CharacterData {
 };
*/

#import <Foundation/Foundation.h>

#import "CharacterData.h"

#if SVGKIT_MAC
// macOS's out-of-date Carbon API defined the `Comment` struct and cause naming conflict, so we need re-define it and use macro to avoid changing exist API
#define Comment SVGKComment
@interface SVGKComment : CharacterData
#else
@interface Comment : CharacterData
#endif

- (id)initWithValue:(NSString*) v;

@end
