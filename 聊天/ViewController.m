//
//  ViewController.m
//  聊天
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

#import "ViewController.h"
#import "JXHMessage.h"
#import "JXHMessageCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 存放数据的数组 */
@property (nonatomic, strong) NSArray *messages;


@end

@implementation ViewController

- (NSArray *)messages
{
    if (_messages == nil) {
        // 加载plist
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典转模型
        NSMutableArray *messageArray = [NSMutableArray array];
        // 记录上一条消息模型,取出时间算要不要显示时间
        JXHMessage *lastMessage = nil;
        for (NSDictionary *dict in dicArray) {
            JXHMessage *message = [JXHMessage messageWithDic:dict];
            // 比对时间
            message.hideTime = [message.time isEqualToString:lastMessage.time];
            [messageArray addObject:message];
            
            lastMessage = message;
        }
        _messages = messageArray;
    }
    return _messages;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取出模型
    JXHMessage *message = self.messages[indexPath.row];
    
    // 重用标示
    NSString *ID = (message.type == JXHMessageTypeMe) ? @"cell1" : @"cell2";
    
    // 加载message
    JXHMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.message = message;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JXHMessage *msg = self.messages[indexPath.row];
    return msg.cellheigh;
}

#pragma mark - <UITableViewDelegate>
// 先给个大概估值让他自己先占位
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
