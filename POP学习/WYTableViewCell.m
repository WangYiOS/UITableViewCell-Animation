//
//  WYTableViewCell.m
//  POP学习
//
//  Created by 王一 on 16/9/7.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import "WYTableViewCell.h"
#import <POP.h>
#import "Masonry.h"

@interface WYTableViewCell()
//文字
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation WYTableViewCell

//初始化控件创建
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //随机数字
        NSInteger age = arc4random()%10000000000000 + 8888888888;
        
        //创建控件
        self.titleLabel = [[UILabel alloc]init];
        [self.titleLabel sizeToFit];
        self.titleLabel.text = [NSString stringWithFormat:@"我们的数字为：%ld",(long)age];
        [self.contentView addSubview:self.titleLabel];
        
        [self setupFrame];
    }
    return self;
}

-(void)setupFrame{
    //文字
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.equalTo(@20);
    }];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //duration 持续时间
        scaleAnimation.duration = 0.1;
        //点击时，字体大小
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.titleLabel pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
    } else {
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //缩小的时候，字体大小
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        //缩小后弹回字体本来大小
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        //弹力值
        sprintAnimation.springBounciness = 20.f;
        [self.titleLabel pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
