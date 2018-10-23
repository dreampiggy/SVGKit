/**
 http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/css.html#CSS-CSSPrimitiveValue
 
 interface CSSPrimitiveValue : CSSValue {
 
 // UnitTypes
 const unsigned short      DOM_CSS_UNKNOWN                    = 0;
 const unsigned short      DOM_CSS_NUMBER                     = 1;
 const unsigned short      DOM_CSS_PERCENTAGE                 = 2;
 const unsigned short      DOM_CSS_EMS                        = 3;
 const unsigned short      DOM_CSS_EXS                        = 4;
 const unsigned short      DOM_CSS_PX                         = 5;
 const unsigned short      DOM_CSS_CM                         = 6;
 const unsigned short      DOM_CSS_MM                         = 7;
 const unsigned short      DOM_CSS_IN                         = 8;
 const unsigned short      DOM_CSS_PT                         = 9;
 const unsigned short      DOM_CSS_PC                         = 10;
 const unsigned short      DOM_CSS_DEG                        = 11;
 const unsigned short      DOM_CSS_RAD                        = 12;
 const unsigned short      DOM_CSS_GRAD                       = 13;
 const unsigned short      DOM_CSS_MS                         = 14;
 const unsigned short      DOM_CSS_S                          = 15;
 const unsigned short      DOM_CSS_HZ                         = 16;
 const unsigned short      DOM_CSS_KHZ                        = 17;
 const unsigned short      DOM_CSS_DIMENSION                  = 18;
 const unsigned short      DOM_CSS_STRING                     = 19;
 const unsigned short      DOM_CSS_URI                        = 20;
 const unsigned short      DOM_CSS_IDENT                      = 21;
 const unsigned short      DOM_CSS_ATTR                       = 22;
 const unsigned short      DOM_CSS_COUNTER                    = 23;
 const unsigned short      DOM_CSS_RECT                       = 24;
 const unsigned short      DOM_CSS_RGBCOLOR                   = 25;
 
 readonly attribute unsigned short   primitiveType;
 void               setFloatValue(in unsigned short unitType,
 in float floatValue)
 raises(DOMException);
 float              getFloatValue(in unsigned short unitType)
 raises(DOMException);
 void               setStringValue(in unsigned short stringType,
 in DOMString stringValue)
 raises(DOMException);
 DOMString          getStringValue()
 raises(DOMException);
 Counter            getCounterValue()
 raises(DOMException);
 Rect               getRectValue()
 raises(DOMException);
 RGBColor           getRGBColorValue()
 raises(DOMException);
 */
#if __has_include(<WebKit/DOMCSSPrimitiveValue.h>)
#import <WebKit/DOMCSSPrimitiveValue.h>
#else

#import "DOMCSSValue.h"

typedef enum DOMCSSPrimitiveType
{
	DOM_CSS_UNKNOWN                    = 0,
	DOM_CSS_NUMBER                     = 1,
	DOM_CSS_PERCENTAGE                 = 2,
	DOM_CSS_EMS                        = 3,
	DOM_CSS_EXS                        = 4,
	DOM_CSS_PX                         = 5,
	DOM_CSS_CM                         = 6,
	DOM_CSS_MM                         = 7,
	DOM_CSS_IN                         = 8,
	DOM_CSS_PT                         = 9,
	DOM_CSS_PC                         = 10,
	DOM_CSS_DEG                        = 11,
	DOM_CSS_RAD                        = 12,
	DOM_CSS_GRAD                       = 13,
	DOM_CSS_MS                         = 14,
	DOM_CSS_S                          = 15,
	DOM_CSS_HZ                         = 16,
	DOM_CSS_KHZ                        = 17,
	DOM_CSS_DIMENSION                  = 18,
	DOM_CSS_STRING                     = 19,
	DOM_CSS_URI                        = 20,
	DOM_CSS_IDENT                      = 21,
	DOM_CSS_ATTR                       = 22,
	DOM_CSS_COUNTER                    = 23,
	DOM_CSS_RECT                       = 24,
	DOM_CSS_RGBCOLOR                   = 25
} DOMCSSPrimitiveType;

@interface DOMCSSPrimitiveValue : DOMCSSValue

@property(nonatomic) DOMCSSPrimitiveType primitiveType;

-(void) setFloatValue:(DOMCSSPrimitiveType) unitType floatValue:(float) floatValue;

-(float) getFloatValue:(DOMCSSPrimitiveType) unitType;

-(void) setStringValue:(DOMCSSPrimitiveType) stringType stringValue:(NSString*) stringValue;

-(NSString*) getStringValue;

-(/* FIXME: have to add this type: Counter*/ void) getCounterValue;

-(/* FIXME: have to add this type: Rect*/ void) getRectValue;

-(/* FIXME: have to add this type: RGBColor*/ void) getRGBColorValue;

@end

#endif
