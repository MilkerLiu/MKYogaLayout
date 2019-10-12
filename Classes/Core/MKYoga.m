//
//  MKYogo.m
//  MKYogaLayout
//
//  Created by Milker on 2018/12/28.
//  Copyright © 2018 Milker. All rights reserved.
//

#import "MKYoga.h"

static MKYoga *instance;

@interface MKYoga ()

@property(nonatomic, copy) NSDictionary *styles;

@end

@implementation MKYoga


#pragma mark - tools

+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

+ (instancetype)shareInstance {
    if (instance) {
        return instance;
    }
    return (instance = [[MKYoga alloc] init]);
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super init];
    });
    return instance;
}

+ (void)registerStyleByFileName:(NSString *)fileName {
    [MKYoga shareInstance].styles = [MKYoga readLocalFileWithName:fileName];
}

+ (void)registerStyle:(NSDictionary *)styles {
    [MKYoga shareInstance].styles = styles;
}

+ (NSDictionary *)styleWithName:(NSString *)name {
    return [MKYoga shareInstance].styles[name];
}

@end
