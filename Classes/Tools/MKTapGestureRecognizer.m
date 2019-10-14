//
// Created by Milker on 2019-08-05.
// Copyright (c) 2019 Milker. All rights reserved.
//

#import "MKTapGestureRecognizer.h"
#import "MKYogaLayout.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation MKTapGestureRecognizer {

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = ((UITouch *)[[touches allObjects] firstObject]);
    UIView *v = touch.view;
    if (v.mk_bgHighlight) {
        v.backgroundColor = v.mk_bgHighlight;
    } else {
        v.alpha = 0.5;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = ((UITouch *)[[touches allObjects] firstObject]);
    UIView *v = touch.view;
    if (CGRectContainsPoint(v.bounds, [touch locationInView:v])) {
        if (v.mk_bgHighlight) {
            v.backgroundColor = v.mk_bgHighlight;
        } else {
            v.alpha = 0.5;
        }
    } else {
        if (v.mk_bgHighlight) {
            v.backgroundColor = v.mk_bg ?: [UIColor whiteColor];
        } else {
            v.alpha = 1;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = ((UITouch *)[[touches allObjects] firstObject]);
    UIView *v = touch.view;
    if (v.mk_bgHighlight) {
        v.backgroundColor = v.mk_bg ?: [UIColor whiteColor];
    } else {
        v.alpha = 1;
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    UITouch *touch = ((UITouch *)[[touches allObjects] firstObject]);
    UIView *v = touch.view;
    if (v.mk_bgHighlight) {
        v.backgroundColor = v.mk_bg ?: [UIColor whiteColor];
    } else {
        v.alpha = 1;
    }
}


@end