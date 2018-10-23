/*!
 
 SVGKit - https://github.com/SVGKit/SVGKit
 
 THE MOST IMPORTANT ELEMENTS YOU'LL INTERACT WITH:
 
 1. SVGKImage = contains most of the convenience methods for loading / reading / displaying SVG files
 2. SVGKImageView = the easiest / fastest way to display an SVGKImage on screen
 3. SVGKLayer = the low-level way of getting an SVG as a bunch of layers
 
 SVGKImage makes heavy use of the following classes - you'll often use these classes (most of them given to you by an SVGKImage):
 
 4. SVGKSource = the "file" or "URL" for loading the SVG data
 5. SVGKParseResult = contains the parsed SVG file AND/OR the list of errors during parsing
 
 */

#include "TargetConditionals.h"
#import "SVGKDefine.h"

#define V_1_COMPATIBILITY_COMPILE_CALAYEREXPORTER_CLASS 0

#import "DOMHelperUtilities.h"
#import "SVGCircleElement.h"
#import "SVGClipPathElement.h"
#import "SVGDefsElement.h"
#import "SVGDescriptionElement.h"
#import "SVGKImage.h"
#import "SVGElement.h"
#import "SVGEllipseElement.h"
#import "SVGGElement.h"
#import "SVGImageElement.h"
#import "SVGLineElement.h"
#import "SVGPathElement.h"
#import "SVGPolygonElement.h"
#import "SVGPolylineElement.h"
#import "SVGRectElement.h"
#import "BaseClassForAllSVGBasicShapes.h"
#import "SVGKSource.h"
#import "SVGTitleElement.h"
#import "SVGUtils.h"
#import "SVGKPattern.h"
#import "SVGKImageView.h"
#import "SVGKFastImageView.h"
#import "SVGKLayeredImageView.h"
#import "SVGKLayer.h"
#import "TinySVGTextAreaElement.h"

#ifndef SVGKIT_LOG_CONTEXT
    #define SVGKIT_LOG_CONTEXT 556
#endif

@interface SVGKit : NSObject

+ (void) enableLogging;

@end





// MARK: - Framework Header File Content
#if SVGKIT_MAC
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

//! Project version number for SVGKitFramework-iOS.
FOUNDATION_EXPORT double SVGKitFramework_VersionNumber;

//! Project version string for SVGKitFramework-iOS.
FOUNDATION_EXPORT const unsigned char SVGKitFramework_VersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SVGKitFramework_iOS/PublicHeader.h>


#import "DOMObject.h"
#import "DOMAttr.h"
#import "DOMCDATASection.h"
#import "DOMCharacterData.h"
#import "DOMComment.h"
#import "DOMCSSStyleDeclaration.h"
#import "DOMCSSRule.h"
#import "DOMCSSStyleSheet.h"
#import "DOMCSSStyleRule.h"
#import "DOMCSSRuleList.h"
#import "DOMCSSRuleList+Mutable.h"
#import "DOMCSSPrimitiveValue.h"
#import "DOMCSSPrimitiveValue_ConfigurablePixelsPerInch.h"
#import "DOMCSSValueList.h"
#import "DOMCSSValue_ForSubclasses.h"
#import "DOMCSSValue.h"
#import "DOMDocument+Mutable.h"
#import "DOMDocument.h"
#import "DOMDocumentCSS.h"
#import "DOMDocumentStyle.h"
#import "DOMStyleSheetList+Mutable.h"
#import "DOMStyleSheetList.h"
#import "DOMStyleSheet.h"
#import "DOMMediaList.h"
#import "DOMDocumentFragment.h"
#import "DOMDocumentType.h"
#import "DOMHelperUtilities.h"
#import "DOMElement.h"
#import "DOMEntityReference.h"
#import "DOMNamedNodeMap.h"
#import "DOMNamedNodeMap_Iterable.h"
#import "DOMNode+Mutable.h"
#import "DOMNode.h"
#import "DOMNodeList+Mutable.h"
#import "DOMNodeList.h"
#import "DOMProcessingInstruction.h"
#import "DOMText.h"
#import "DOMGlobalSettings.h"
#import "SVGAngle.h"
#import "SVGAnimatedPreserveAspectRatio.h"
#import "SVGDefsElement.h"
#import "SVGDocument.h"
#import "SVGDocument_Mutable.h"
#import "SVGElementInstance.h"
#import "SVGElementInstance_Mutable.h"
#import "SVGElementInstanceList.h"
#import "SVGElementInstanceList_Internal.h"
#import "SVGGElement.h"
#import "SVGStylable.h"
#import "SVGLength.h"
#import "SVGMatrix.h"
#import "SVGNumber.h"
#import "SVGPoint.h"
#import "SVGPreserveAspectRatio.h"
#import "SVGRect.h"
#import "SVGSVGElement_Mutable.h"
#import "SVGTransform.h"
#import "SVGUseElement.h"
#import "SVGUseElement_Mutable.h"
#import "SVGViewSpec.h"
#import "SVGHelperUtilities.h"
#import "SVGTransformable.h"
#import "SVGFitToViewBox.h"
#import "SVGTextPositioningElement.h"
#import "SVGTextContentElement.h"
#import "SVGTextPositioningElement_Mutable.h"
#import "ConverterSVGToCALayer.h"
#import "SVGGradientElement.h"
#import "SVGGradientStop.h"
#import "SVGLinearGradientElement.h"
#import "SVGRadialGradientElement.h"
#import "SVGStyleCatcher.h"
#import "SVGStyleElement.h"
#import "SVGCircleElement.h"
#import "SVGDescriptionElement.h"
#import "SVGElement.h"
#import "SVGElement_ForParser.h"
#import "SVGEllipseElement.h"
#import "SVGGroupElement.h"
#import "SVGImageElement.h"
#import "SVGLineElement.h"
#import "SVGPathElement.h"
#import "SVGPolygonElement.h"
#import "SVGPolylineElement.h"
#import "SVGRectElement.h"
#import "BaseClassForAllSVGBasicShapes.h"
#import "BaseClassForAllSVGBasicShapes_ForSubclasses.h"
#import "SVGSVGElement.h"
#import "SVGTextElement.h"
#import "SVGTitleElement.h"
#if V_1_COMPATIBILITY_COMPILE_CALAYEREXPORTER_CLASS
#import "CALayerExporter.h"
#endif
#import "SVGKImage+CGContext.h"
#import "SVGKExporterNSData.h"
#if SVGKIT_MAC
#import "SVGKExporterNSImage.h"
#else
#import "SVGKExporterUIImage.h"
#endif
#import "SVGKSourceLocalFile.h"
#import "SVGKSourceString.h"
#import "SVGKSourceURL.h"
#import "SVGKParserDefsAndUse.h"
#import "SVGKParserDOM.h"
#import "SVGKParserGradient.h"
#import "SVGKParserPatternsAndGradients.h"
#import "SVGKParserStyles.h"
#import "SVGKParserSVG.h"
#import "SVGKParser.h"
#import "SVGKParseResult.h"
#import "SVGKParserExtension.h"
#import "SVGKPointsAndPathsParser.h"
#import "CALayer+RecursiveClone.h"
#import "SVGGradientLayer.h"
#import "CALayerWithChildHitTest.h"
#import "CAShapeLayerWithHitTest.h"
#import "CGPathAdditions.h"
#import "SVGKLayer.h"
#import "SVGKImage.h"
#import "SVGKSource.h"
#import "NSCharacterSet+SVGKExtensions.h"
#import "SVGKFastImageView.h"
#import "SVGKImageView.h"
#import "SVGKLayeredImageView.h"
#import "SVGKPattern.h"
#import "SVGUtils.h"
#if SVGKIT_MAC
#import "SVGKImageRep.h"
#endif
#import "NSData+NSInputStream.h"
#import "SVGKSourceNSData.h"
#import "SVGSwitchElement.h"
