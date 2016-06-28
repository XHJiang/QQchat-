//
//  JXHMessage.h
//  聊天
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JXHMessageTypeMe = 0,
    JXHMessageTypeOther = 1
} JXHMessageType;

@interface JXHMessage : NSObject

/** 文本 */
@property (nonatomic, copy) NSString *text;

/** 时间 */
@property (nonatomic, copy) NSString *time;

/** 种类 */
@property (nonatomic, assign) JXHMessageType type;

/** 是否隐藏时间 */
@property (nonatomic, assign, getter = isHideTime) BOOL hideTime;

/** cell 高度 */
@property (nonatomic, assign) CGFloat cellheigh;


+ (instancetype)messageWithDic:(NSDictionary *)dic;

@end
