//
//  MPExpression.h
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKExpression : NSObject

+ (id)resultWithExpression:(NSString *)expression context:(id)context;

@end
