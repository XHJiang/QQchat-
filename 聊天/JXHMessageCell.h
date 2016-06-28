//
//  JXHMessageCell.h
//  聊天
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXHMessage;


@interface JXHMessageCell : UITableViewCell

/** 数据模型 */
@property (nonatomic, strong) JXHMessage *message;


@end
