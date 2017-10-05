//
//  LPFAnimateViewController.m
//  test
//
//  Created by 李鹏飞 on 2017/10/5.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFAnimateViewController.h"
#import "LPFLoginViewController.h"

#import "UIView+Extension.h"

#define KDuration 1.0
#define KMaxAlpha 1.0
#define KMinAlpha 0.0

//是否为3.5inch
#define WLThreeInch ([UIScreen mainScreen].bounds.size.height == 480.0)
// 是否为4inch
#define WLFourInch ([UIScreen mainScreen].bounds.size.height == 568.0)
//是否为4.7inch
#define WLFiveInch ([UIScreen mainScreen].bounds.size.height == 667.0)
//是否为5.5inch
#define WLFiveHalfInch ([UIScreen mainScreen].bounds.size.height == 736.0)
//获取屏幕宽高
#define Screen_height  [[UIScreen mainScreen] bounds].size.height
#define Screen_width   [[UIScreen mainScreen] bounds].size.width
#define userDefaults [NSUserDefaults standardUserDefaults]
//宽高比系数计算(宽高必须是按4寸屏给出的)
#define LPFWidth(width) (width/(double)320)*Screen_width
#define LPFHeight(height) (height /(double)568)*Screen_height
@interface LPFAnimateViewController ()
@property (nonatomic, weak) UIImageView *BGimageView;
@property (nonatomic, weak) UIImageView *phoneImage;
@property (nonatomic, weak) UIImageView *handIm;
@property (nonatomic, weak) UIImageView *popIm;
@property (nonatomic, weak) UIImageView *bottomIm;
@property (nonatomic, weak) UIImageView *yingdaIm;
@property (nonatomic, weak) UIImageView *bluPointIm;
@property (nonatomic, weak) UIImageView *iphoneIm;
@property (nonatomic, weak) UIImageView *catyIm;
@property (nonatomic, weak) UIImageView *weizibottomIm;
@property (nonatomic, weak) UIButton *jumpBtn;
@property (nonatomic, weak) UIImageView *right01Im;
@property (nonatomic, weak) UIImageView *right02Im;
@property (nonatomic, weak) UIImageView *right03Im;
@property (nonatomic, weak) UIImageView *right04Im;
@property (nonatomic, weak) UIImageView *faxianIm;
@property (nonatomic, weak) UIImageView *rightTop01Im;
@property (nonatomic, weak) UIImageView *leftTop04Im;
@property (nonatomic, weak) UIImageView *rightBottom03Im;
@property (nonatomic, weak) UIImageView *leftBottom02Im;
@property (nonatomic, weak) UIImageView *zhoubianIm;
@property (nonatomic, weak) UIImageView *fujinIm;
@property (nonatomic, weak) UIImageView *hhzixunIm;
@property (nonatomic, weak) UIImageView *hhyouxiIm;
@property (nonatomic, weak) UIButton *tiyanIm;
@property (nonatomic, weak) UIButton *rerunBtn;
@end

@implementation LPFAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSubView];
    [self setSubViewOrigin];
    [self runAnimate];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.view.hidden = YES;
    
}
- (void)setSubView
{
    UIImageView *BGimageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    BGimageView.image = [UIImage imageNamed:WLThreeInch?@"20_4s":@"20"];
    [self.view addSubview:BGimageView];
    self.BGimageView = BGimageView;
    
    UIImageView *phoneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"01_4s":@"01"]];
    [self.view addSubview:phoneImage];
    self.phoneImage = phoneImage;
    
    UIImageView *handIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"02_4s":@"02"]];
    [self.view addSubview:handIm];
    self.handIm = handIm;
    
    UIImageView *popIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"03_4s":@"03"]];
    [self.view addSubview:popIm];
    self.popIm = popIm;
    
    UIImageView *bottomIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"04_4s":@"04"]];
    [self.view addSubview:bottomIm];
    self.bottomIm = bottomIm;
    
    UIImageView *yingdaIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"05_4s":@"05"]];
    [self.view addSubview:yingdaIm];
    self.yingdaIm = yingdaIm;
    
    UIImageView *bluPointIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"13_4s":@"13"]];
    [self.view addSubview:bluPointIm];
    self.bluPointIm = bluPointIm;
    
    UIImageView *iphoneIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"06_4s":@"06"]];
    [self.view addSubview:iphoneIm];
    self.iphoneIm = iphoneIm;
    
    UIImageView *catyIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"07_4s":@"07"]];
    [self.view addSubview:catyIm];
    self.catyIm = catyIm;
    
    UIImageView *weizibottomIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"08_4s":@"08"]];
    [self.view addSubview:weizibottomIm];
    self.weizibottomIm = weizibottomIm;
    
    UIImage *image = [UIImage imageNamed:self.isFromeXinshou?@"31":@"22"];
    CGFloat jumpW;
    CGFloat jumpH;
    if (self.isFromeXinshou) {
        jumpW = 50;
        jumpH = 50;
    }else
    {
        jumpW = image.size.width;
        jumpH = image.size.height;
    }
    UIButton *jumpBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-jumpW-14, 15, jumpW, jumpH)];
    if (self.isFromeXinshou) {
        if (WLThreeInch) {
            jumpBtn.frame = CGRectMake(Screen_width-jumpW-14, 0, jumpW, jumpH);
        }
        [jumpBtn setImage:image forState:UIControlStateNormal];
    }else
    {
        [jumpBtn setBackgroundImage:image forState:UIControlStateNormal];
    }
    
    [jumpBtn addTarget:self action:@selector(jumpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpBtn];
    self.jumpBtn = jumpBtn;
    
    UIImageView *right01Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"09"]];
    [self.view addSubview:right01Im];
    self.right01Im = right01Im;
    
    UIImageView *right02Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"10"]];
    [self.view addSubview:right02Im];
    self.right02Im = right02Im;
    
    UIImageView *right03Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"11"]];
    [self.view addSubview:right03Im];
    self.right03Im = right03Im;
    
    UIImageView *right04Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12"]];
    [self.view addSubview:right04Im];
    self.right04Im = right04Im;
    
    UIImageView *faxianIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"14_4s":@"14"]];
    [self.view addSubview:faxianIm];
    self.faxianIm = faxianIm;
    
    
    UIImageView *zhoubianIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"23_4s":@"23"]];
    [self.view addSubview:zhoubianIm];
    self.zhoubianIm = zhoubianIm;
    
    UIImageView *fujinIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"24_4s":@"24"]];
    [self.view addSubview:fujinIm];
    self.fujinIm = fujinIm;
    
    UIImageView *hhzixunIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"25_4s":@"25"]];
    [self.view addSubview:hhzixunIm];
    self.hhzixunIm = hhzixunIm;
    
    UIImageView *hhyouxiIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"26_4s":@"26"]];
    [self.view addSubview:hhyouxiIm];
    self.hhyouxiIm = hhyouxiIm;
    
    
    UIImageView *rightTop01Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"15_4s":@"15"]];
    [self.view addSubview:rightTop01Im];
    self.rightTop01Im = rightTop01Im;
    
    UIImageView *leftTop04Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"16_4s":@"16"]];
    [self.view addSubview:leftTop04Im];
    self.leftTop04Im = leftTop04Im;
    
    UIImageView *rightBottom03Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"17_4s":@"17"]];
    [self.view addSubview:rightBottom03Im];
    self.rightBottom03Im = rightBottom03Im;
    
    UIImageView *leftBottom02Im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:WLThreeInch?@"18_4s":@"18"]];
    [self.view addSubview:leftBottom02Im];
    self.leftBottom02Im = leftBottom02Im;
    
    
    UIImage *rerun = [UIImage imageNamed:WLThreeInch?@"27_4s":@"27"];
    UIImage *rerunP = [UIImage imageNamed:WLThreeInch?@"27_p_4s":@"27_p"];
    UIButton *rerunBtn = [[UIButton alloc] init];
    rerunBtn.size = rerun.size;
    [rerunBtn addTarget:self action:@selector(rerunBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [rerunBtn setBackgroundImage:rerun forState:UIControlStateNormal];
    [rerunBtn setBackgroundImage:rerunP forState:UIControlStateHighlighted];
    [self.view addSubview:rerunBtn];
    self.rerunBtn = rerunBtn;
    
    
    UIImage *tiyan = [UIImage imageNamed:WLThreeInch?@"19_4s":@"19"];
    UIImage *tiyanP = [UIImage imageNamed:WLThreeInch?@"19_p_4s":@"19_p"];
    UIButton *tiyanIm = [[UIButton alloc] init];
    [tiyanIm addTarget:self action:@selector(jumpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tiyanIm setBackgroundImage:tiyan forState:UIControlStateNormal];
    [tiyanIm setBackgroundImage:tiyanP forState:UIControlStateHighlighted];
    tiyanIm.size = tiyan.size;
    [self.view addSubview:tiyanIm];
    self.tiyanIm = tiyanIm;
    
}
#pragma mark - 运行动画
- (void)runAnimate
{
    //    WLLog(@"动画开始===%@",[NSDate date]);
    [UIView animateWithDuration:KDuration animations:^{
        self.phoneImage.alpha = KMaxAlpha;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:KDuration animations:^{
            if (WLFiveInch) {
                self.handIm.x = LPFWidth(95)-7;
            }else
            {
                self.handIm.x = WLThreeInch?110:LPFWidth(95);
            }
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:KDuration animations:^{
                self.popIm.x = WLThreeInch?Screen_width-50-self.popIm.image.size.width:Screen_width-LPFWidth(32.5)-self.popIm.image.size.width;
                self.popIm.alpha = KMaxAlpha;
                [UIView animateWithDuration:KDuration animations:^{
                    self.bottomIm.y = WLThreeInch?Screen_height-self.bottomIm.image.size.height-40:Screen_height-self.bottomIm.image.size.height-LPFHeight(56);
                    self.bottomIm.alpha = KMaxAlpha;
                } completion:^(BOOL finished) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:KDuration-0.5 animations:^{
                            self.phoneImage.alpha = KMinAlpha;
                            self.handIm.alpha = KMinAlpha;
                        } completion:^(BOOL finished) {
                            [UIView animateWithDuration:KDuration animations:^{
                                self.yingdaIm.centerX = Screen_width/2;
                                self.yingdaIm.alpha = KMaxAlpha;
                            } completion:^(BOOL finished) {
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    [UIView animateWithDuration:KDuration animations:^{
                                        self.bluPointIm.transform = CGAffineTransformScale([self transformForOrientation], 20, 20);
                                        [UIView animateWithDuration:KDuration animations:^{
                                            self.iphoneIm.x = 0;
                                        } completion:^(BOOL finished) {
                                            [UIView animateWithDuration:KDuration animations:^{
                                                self.catyIm.y = WLThreeInch?141.5:LPFHeight(163);
                                                self.catyIm.alpha = KMaxAlpha;
                                                [UIView animateWithDuration:KDuration animations:^{
                                                    self.weizibottomIm.y = Screen_height-self.bottomIm.image.size.height-(WLThreeInch?40:LPFHeight(56));
                                                    self.weizibottomIm.alpha = KMaxAlpha;
                                                } completion:^(BOOL finished) {
                                                    [UIView animateKeyframesWithDuration:KDuration delay:[self getRandomNumber:0 to:KDuration] options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
                                                        self.right01Im.x = Screen_width-self.right01Im.image.size.width;
                                                    } completion:^(BOOL finished) {
                                                        
                                                    }];
                                                    [UIView animateKeyframesWithDuration:KDuration delay:[self getRandomNumber:0 to:KDuration] options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
                                                        self.right02Im.x = Screen_width-self.right02Im.image.size.width;
                                                    } completion:^(BOOL finished) {
                                                        
                                                    }];
                                                    [UIView animateKeyframesWithDuration:KDuration delay:[self getRandomNumber:0 to:KDuration] options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
                                                        self.right03Im.x = Screen_width-self.right03Im.image.size.width;
                                                    } completion:^(BOOL finished) {
                                                        
                                                    }];
                                                    [UIView animateKeyframesWithDuration:KDuration delay:[self getRandomNumber:0 to:KDuration] options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
                                                        self.right04Im.x = Screen_width-self.right04Im.image.size.width;
                                                    } completion:^(BOOL finished) {
                                                        
                                                    }];
                                                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                        [UIView animateWithDuration:KDuration animations:^{
                                                            self.phoneImage.alpha = KMinAlpha;
                                                            self.handIm.alpha = KMinAlpha;
                                                            self.popIm.alpha = KMinAlpha;
                                                            self.bottomIm.alpha = KMinAlpha;
                                                            self.yingdaIm.alpha = KMinAlpha;
                                                            
                                                            self.iphoneIm.alpha = KMinAlpha;
                                                            self.catyIm.alpha = KMinAlpha;
                                                            self.weizibottomIm.alpha = KMinAlpha;
                                                            self.right01Im.alpha = KMinAlpha;
                                                            self.right02Im.alpha = KMinAlpha;
                                                            self.right03Im.alpha = KMinAlpha;
                                                            self.right04Im.alpha = KMinAlpha;
                                                            [UIView animateWithDuration:KDuration animations:^{
                                                                self.bluPointIm.center = CGPointMake(Screen_width/2, Screen_height/2-self.bluPointIm.image.size.height/3);
                                                                self.bluPointIm.transform = CGAffineTransformScale([self transformForOrientation], 1, 1);
                                                                self.faxianIm.alpha = KMaxAlpha;
                                                            } completion:^(BOOL finished) {
                                                                
                                                                [UIView animateWithDuration:KDuration animations:^{
                                                                    self.zhoubianIm.x = LPFWidth(55.5);
                                                                    self.fujinIm.x = LPFWidth(18);
                                                                    
                                                                } completion:^(BOOL finished) {
                                                                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                        [UIView animateWithDuration:KDuration animations:^{
                                                                            self.zhoubianIm.x = -self.zhoubianIm.image.size.width;
                                                                            self.fujinIm.x = Screen_width;
                                                                        } completion:^(BOOL finished) {
                                                                            [UIView animateWithDuration:KDuration animations:^{
                                                                                self.hhzixunIm.x = LPFWidth(15);
                                                                                self.hhyouxiIm.x = LPFWidth(57);
                                                                            } completion:^(BOOL finished) {
                                                                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                                    [UIView animateWithDuration:KDuration animations:^{
                                                                                        self.hhzixunIm.x = Screen_width;
                                                                                        self.hhyouxiIm.x = -self.hhyouxiIm.image.size.width;
                                                                                    } completion:^(BOOL finished) {
                                                                                        [UIView animateWithDuration:KDuration animations:^{
                                                                                            self.rightTop01Im.x = Screen_width-self.rightTop01Im.image.size.width-LPFWidth(18);
                                                                                            self.leftBottom02Im.x = LPFWidth(42);
                                                                                            self.rightBottom03Im.x = Screen_width-self.rightBottom03Im.image.size.width-LPFWidth(6);
                                                                                            self.leftTop04Im.x = LPFWidth(14);
                                                                                            
                                                                                            
                                                                                            self.rightTop01Im.alpha = KMaxAlpha;
                                                                                            self.leftBottom02Im.alpha = KMaxAlpha;
                                                                                            self.rightBottom03Im.alpha = KMaxAlpha;
                                                                                            self.leftTop04Im.alpha = KMaxAlpha;
                                                                                        } completion:^(BOOL finished) {
                                                                                            [UIView animateWithDuration:KDuration animations:^{
                                                                                                self.rerunBtn.alpha = KMaxAlpha;
                                                                                                self.tiyanIm.alpha = KMaxAlpha;
                                                                                                CGFloat mrg = WLThreeInch?32.5:LPFHeight(67.5);
                                                                                                self.rerunBtn.y = Screen_height-self.rerunBtn.currentBackgroundImage.size.height-mrg;
                                                                                                self.tiyanIm.y = Screen_height-self.rerunBtn.currentBackgroundImage.size.height-mrg;
                                                                                            } completion:^(BOOL finished) {
                                                                                                
                                                                                            }];
                                                                                            //                                                                                            WLLog(@"动画结束===%@",[NSDate date]);
                                                                                        }];
                                                                                    }];
                                                                                    
                                                                                });
                                                                                
                                                                            }];
                                                                        }];
                                                                    });
                                                                }];
                                                                
                                                            }];
                                                        } completion:^(BOOL finished) {
                                                            
                                                        }];
                                                    });
                                                }];
                                            } completion:^(BOOL finished) {
                                            }];
                                        }];
                                    } completion:^(BOOL finished) {
                                    }];
                                    
                                });
                            }];
                        }];
                    });
                }];
            } completion:^(BOOL finished) {
            }];
        }];
    }];
    
    
}
/**
 *  开始使用
 */
- (void)jumpBtnClick:(UIButton *)btn
{
    
    if (self.isFromeXinshou) {
        
        [self dismissViewControllerAnimated:YES completion:^{
            [[UIApplication sharedApplication] setStatusBarHidden:NO];
        }];
    }else
    {
        [userDefaults setObject:@"notLoginSucceed" forKey:@"KisLoginSucceed"];
        [userDefaults synchronize];
        LPFLoginViewController *loginVc = [[LPFLoginViewController alloc] init];
        UIWindow *windon = [UIApplication sharedApplication].keyWindow;
        windon.rootViewController = loginVc;
    }
    
}
#pragma mark - 重新播放动画
- (void)rerunBtnClick:(UIButton *)btn
{
    [self setSubViewOrigin];
    
    [self runAnimate];
}
- (void)setSubViewOrigin
{
    CGFloat pY = Screen_height-LPFHeight(205)-self.phoneImage.image.size.height;
    self.phoneImage.y = WLThreeInch?189.5:pY;
    self.phoneImage.x = WLThreeInch?66.5:LPFWidth(44);
    self.phoneImage.alpha = KMinAlpha;
    
    self.handIm.x = - self.handIm.image.size.width;
    if (WLFiveInch) {
        self.handIm.y = LPFHeight(329)+5;
    }else
    {
        self.handIm.y = WLThreeInch?285:LPFHeight(329);
    }
    self.handIm.alpha = KMaxAlpha;
    
    self.popIm.x = -self.popIm.image.size.width;
    self.popIm.y = WLThreeInch?26.5:LPFHeight(24.5);
    self.popIm.alpha = KMinAlpha;
    
    self.bottomIm.center = CGPointMake(Screen_width/2, 0);
    self.bottomIm.y = Screen_height;
    self.bottomIm.alpha = KMinAlpha;
    
    CGFloat yidaCenX = -(Screen_width/2);
    self.yingdaIm.center = CGPointMake(yidaCenX, Screen_height/2+40);
    self.yingdaIm.alpha = KMinAlpha;
    
    self.bluPointIm.center = CGPointMake(-self.bluPointIm.image.size.width, Screen_height/2);
    
    self.iphoneIm.x = -self.iphoneIm.image.size.width;
    if (WLFiveInch) {
        self.iphoneIm.y = LPFHeight(62.5)+20;
    }else
    {
        self.iphoneIm.y = WLThreeInch?53:LPFHeight(62.5);
    }
    
    self.iphoneIm.alpha = KMaxAlpha;
    
    self.catyIm.alpha = KMinAlpha;
    self.catyIm.y = -self.catyIm.image.size.height;
    self.catyIm.x = self.iphoneIm.image.size.width-(WLThreeInch?15:18);
    
    self.weizibottomIm.center = CGPointMake(Screen_width/2, 0);
    self.weizibottomIm.y = Screen_height;
    self.weizibottomIm.alpha = KMinAlpha;
    
    
    self.right01Im.y = CGRectGetMaxY(self.jumpBtn.frame);
    self.right01Im.x = Screen_width;
    self.right01Im.alpha = KMaxAlpha;
    
    self.right02Im.y = CGRectGetMaxY(self.right01Im.frame)+LPFHeight(15);
    self.right02Im.x = Screen_width;
    self.right02Im.alpha = KMaxAlpha;
    
    self.right03Im.y = (WLThreeInch?141.5:LPFHeight(163))+self.catyIm.image.size.height+(WLThreeInch?5:LPFHeight(10));
    self.right03Im.x = Screen_width;
    self.right03Im.alpha = KMaxAlpha;
    
    self.right04Im.y = CGRectGetMaxY(self.right03Im.frame)+LPFHeight(15);
    self.right04Im.x = Screen_width;
    self.right04Im.alpha = KMaxAlpha;
    
    self.faxianIm.center = CGPointMake(Screen_width/2, Screen_height/2-self.bluPointIm.image.size.height/3);
    self.faxianIm.alpha = KMinAlpha;
    
    
    self.zhoubianIm.x = Screen_width;
    self.zhoubianIm.y = LPFHeight(78);
    
    self.fujinIm.x = -self.fujinIm.image.size.width;
    CGFloat fujiY = Screen_height-self.fujinIm.image.size.height-LPFHeight(127.5);
    self.fujinIm.y = fujiY;
    
    self.hhzixunIm.x = -self.hhzixunIm.image.size.width;
    self.hhzixunIm.y = LPFHeight(77.5);
    
    self.hhyouxiIm.x = Screen_width;
    CGFloat hhyouxiY = Screen_height-self.hhzixunIm.image.size.height-LPFHeight(138.5);
    self.hhyouxiIm.y = hhyouxiY;
    
    self.rightTop01Im.y = LPFHeight(49.5);
    self.rightTop01Im.x = Screen_width;
    self.rightTop01Im.alpha = KMinAlpha;
    
    self.leftTop04Im.y = LPFHeight(131);
    self.leftTop04Im.x = -self.leftTop04Im.image.size.width;
    self.leftTop04Im.alpha = KMinAlpha;
    
    self.rightBottom03Im.y = Screen_height-self.rightBottom03Im.image.size.height-LPFHeight(225);
    self.rightBottom03Im.x = Screen_width;
    self.rightBottom03Im.alpha = KMinAlpha;
    
    self.leftBottom02Im.y = Screen_height-self.leftBottom02Im.image.size.height-LPFHeight(154);
    self.leftBottom02Im.x = -self.leftBottom02Im.image.size.width;
    self.leftBottom02Im.alpha = KMinAlpha;
    
    
    if (self.isFromeXinshou)
    {
        self.rerunBtn.y = Screen_height;
        self.rerunBtn.alpha = KMinAlpha;
        self.rerunBtn.centerX = Screen_width/2;
    }else
    {
        self.rerunBtn.y = Screen_height;
        self.rerunBtn.alpha = KMinAlpha;
        self.rerunBtn.centerX = Screen_width/2-self.rerunBtn.currentBackgroundImage.size.width/2-LPFWidth(10.5);
        
        self.tiyanIm.centerX = Screen_width/2+self.rerunBtn.currentBackgroundImage.size.width/2+LPFWidth(10.5);
        self.tiyanIm.y = Screen_height;
        self.tiyanIm.alpha = KMinAlpha;
    }
    
}
#pragma mark - 缩放方法
- (CGAffineTransform)transformForOrientation {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationLandscapeLeft == orientation) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    } else if (UIInterfaceOrientationLandscapeRight == orientation) {
        return CGAffineTransformMakeRotation(M_PI/2);
    } else if (UIInterfaceOrientationPortraitUpsideDown == orientation) {
        return CGAffineTransformMakeRotation(-M_PI);
    } else {
        return CGAffineTransformIdentity;
    }
}

-(double)getRandomNumber:(int)from to:(int)to
{
    return (double)(from + (arc4random() % (to - from + 1)));
}
@end
