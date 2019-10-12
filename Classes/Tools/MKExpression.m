//
//  MPExpression.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKExpression.h"

@implementation MKExpression


// {{ user.nickname.length > 0 }}
// {{ array.count > 0 }}
+ (id)resultWithExpression:(NSString *)expression context:(id)context {
    if (![expression isKindOfClass:[NSString class]]) {
        return expression;
    }
    if ([expression hasPrefix:@"{{"] && [expression hasSuffix:@"}}"]) {
        // 表达式
        expression = [expression stringByReplacingOccurrencesOfString:@"}}" withString:@""];
        expression = [expression stringByReplacingOccurrencesOfString:@"{{" withString:@""];
        return [MKExpression eval:expression context:context];
    } else {
        return expression;
    }
    return nil;
}

+ (id)eval:(NSString *)expression context:(id)context {
    @try {
        if ([expression containsString:@"?"]) {
            // 三目云算法
            NSArray *exp = [expression componentsSeparatedByString:@"?"];
            NSString *eval = exp[0];
            NSArray *res = [exp[1] componentsSeparatedByString:@":"];

            BOOL result = NO;
            if ([eval containsString:@">"] || [eval containsString:@"="] || [eval containsString:@"<"]) {
                NSPredicate* pre = [NSPredicate predicateWithFormat:eval];
                result = [pre evaluateWithObject:context];
            } else {
                NSExpression *exp = [NSExpression expressionWithFormat:expression];
                result = [exp expressionValueWithObject:context context:nil];
            }
            if (result) {
                return [MKExpression eval:res[0] context:context];
            } else {
                return [MKExpression eval:res[1] context:context];
            }
        } else {
            NSExpression *exp = [NSExpression expressionWithFormat:expression];
            id value = [exp expressionValueWithObject:context context:nil];
            return value;
        }
    } @catch(NSException *e) {
        return @"";
    }
}


@end
