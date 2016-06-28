//
//  JXHMessage.m
//  聊天
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

#import "JXHMessage.h"

@implementation JXHMessage

+ (instancetype)messageWithDic:(NSDictionary *)dic
{
    JXHMessage *message = [[self alloc] init];
    [message setValuesForKeysWithDictionary:dic];
    return message;
}
//
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}

@end
