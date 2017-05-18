//
//  LPFTarBar.m
//  test
//
//  Created by 李鹏飞 on 2017/5/18.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFTarBar.h"
#import "LPFTarBarButon.h"

@interface LPFTarBar ()
/**
 设置之前选中的按钮
 */
@property (nonatomic,weak) UIButton *selectBtn;
@end

@implementation LPFTarBar
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
}

/**专门用来布局子视图, 别忘了调用super方法*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        //取得按钮
        UIButton *btn = self.subviews[i];
        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        btn.frame = CGRectMake(x, y, width, height);
    }
}

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    //1.先将之前选中的按钮设置为未选中
    self.selectBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectBtn = button;
    
    //却换视图控制器的事情,应该交给controller来做
    //最好这样写, 先判断该代理方法是否实现
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectBtn.tag to:button.tag];
    }
    
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    //self.selectedIndex = button.tag;
}  

@end
