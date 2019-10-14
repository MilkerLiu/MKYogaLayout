//
//  UILabel+MKYogaStyle.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "UILabel+MKYogaStyle.h"

@implementation UILabel (MKYogaStyle)
static NSDictionary *textAlignmentEnumDic;
static NSDictionary *lineBreakModeEnumDic;

- (void)set_text:(id)value style:(NSDictionary *)style {
    NSString *text = [value isKindOfClass:NSString.class] ? value : [NSString stringWithFormat:@"%@", value ?: @""];

    NSDictionary *attrs = style[kLAttributeText];
    if ([attrs isKindOfClass:NSDictionary.class]) {

        CGFloat lineHeight = [attrs[kLAttributeTextLineHeight] floatValue];
        CGFloat lineSpace = [attrs[kLAttributeTextLineSpace] floatValue];
        NSTextAlignment textAlignment = (NSTextAlignment) [attrs[kLTextAlignment] integerValue];

        UIFont *font;
        CGFloat fontSize = [attrs[kLFont] floatValue];
        CGFloat fontBoldSize = [attrs[kLBoldFont] floatValue];
        if (fontBoldSize > 0) {
            font = [UIFont boldSystemFontOfSize:fontBoldSize];
        } else {
            font = [UIFont systemFontOfSize:fontSize > 0 ? fontSize : 14];
        }

        CGFloat baselineOffset = (lineHeight - font.lineHeight) / 4;

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        [paragraphStyle setMinimumLineHeight:lineHeight];
        [paragraphStyle setMaximumLineHeight:lineHeight];
        [paragraphStyle setAlignment:textAlignment];

        NSDictionary *textStyles = @{
                NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName: font,
                NSBaselineOffsetAttributeName: @(baselineOffset),
        };
        [attributedString addAttributes:textStyles range:NSMakeRange(0, [text length])];
        self.attributedText = attributedString;

    } else {
        self.text = text;
    }
    [self.yoga markDirty];
}

- (void)set_attributeText:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:NSAttributedString.class]) {
        self.attributedText = value;
    }
}

- (void)setText:(NSString *)text lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}

- (void)set_textColor:(id)value style:(NSDictionary *)style {
    self.textColor = [MKYogaTransform transColor:value];
}

- (void)set_maxLines:(id)value style:(NSDictionary *)style {
    self.numberOfLines = [value integerValue];
}

- (void)set_font:(id)value style:(NSDictionary *)style {
    self.font = [UIFont systemFontOfSize:[value floatValue]];
}

- (void)set_boldFont:(id)value style:(NSDictionary *)style {
    self.font = [UIFont boldSystemFontOfSize:[value floatValue]];
}

- (void)set_textAlignment:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:[NSNumber class]]) {
        self.textAlignment = [value integerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (!textAlignmentEnumDic) {
                textAlignmentEnumDic = @{
                        @"NSTextAlignmentLeft": @(NSTextAlignmentLeft),
                        @"NSTextAlignmentCenter": @(NSTextAlignmentCenter),
                        @"NSTextAlignmentRight": @(NSTextAlignmentRight),
                        @"NSTextAlignmentJustified": @(NSTextAlignmentJustified),
                        @"NSTextAlignmentNatural": @(NSTextAlignmentNatural)
                };
            }
        });
        self.textAlignment = [textAlignmentEnumDic[value] integerValue];
    }
}

- (void)set_lineBreakMode:(id)value style:(NSDictionary *)style {
    if ([value isKindOfClass:[NSNumber class]]) {
        self.lineBreakMode = [value integerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (!lineBreakModeEnumDic) {
                lineBreakModeEnumDic = @{
                        @"NSLineBreakByWordWrapping": @(NSLineBreakByWordWrapping),
                        @"NSLineBreakByCharWrapping": @(NSLineBreakByCharWrapping),
                        @"NSLineBreakByClipping": @(NSLineBreakByClipping),
                        @"NSLineBreakByTruncatingHead": @(NSLineBreakByTruncatingHead),
                        @"NSLineBreakByTruncatingTail": @(NSLineBreakByTruncatingTail),
                        @"NSLineBreakByTruncatingMiddle": @(NSLineBreakByTruncatingMiddle)
                };
            }
        });
        self.lineBreakMode = [lineBreakModeEnumDic[value] integerValue];
    }
}

@end
