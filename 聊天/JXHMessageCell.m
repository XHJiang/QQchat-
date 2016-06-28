//
//  JXHMessageCell.m
//  聊天
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

#import "JXHMessageCell.h"

#import "JXHMessage.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"


@interface JXHMessageCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end


@implementation JXHMessageCell

- (void)awakeFromNib {
    self.testButton.titleLabel.numberOfLines = 0;
}

- (void)setMessage:(JXHMessage *)message
{
    _message = message;
    
    if (message.hideTime) {
//        self.timeLabel.text = message.time;
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    } else {
        self.timeLabel.hidden = NO;
        self.timeLabel.text = self.message.time;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    }
    
    [self layoutIfNeeded];
    // 处理显示文字
    // 设置按钮的文字
    [self.testButton setTitle:self.message.text forState:UIControlStateNormal];
    // 强制布局
    [self layoutIfNeeded];
    
    NSLog(@"%@",NSStringFromCGSize(self.testButton.frame.size));
    
    // 设置按钮的高度就是titleLabel的高度
    [self.testButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH = self.testButton.titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];
    
//    [self.testButton makeConstraints:^(MASConstraintMaker *make) {
//        CGFloat buttonH = self.testButton.titleLabel.frame.size.height + 30;
//        make.height.equalTo(buttonH);
//    }];
    
    // 强制布局
    [self layoutIfNeeded];
    
    NSLog(@"%@",NSStringFromCGSize(self.testButton.frame.size));
    
    // 计算cell的高度
    CGFloat buttonMaxY = CGRectGetMaxY(self.testButton.frame);
    CGFloat iconMaxY = CGRectGetMaxY(self.iconView.frame);
    self.message.cellheigh = MAX(buttonMaxY, iconMaxY) + 10;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
