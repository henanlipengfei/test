//
//  LeftSlideViewController.m
//  LeftSlideViewController
//
//  Created by huangzhenyu on 15/06/18.
//  Copyright (c) 2015年 huangzhenyu. All rights reserved.

#import "LeftSlideViewController.h"
#import "LPFLeftVIewController.h"
#import "UIView+Extension.h"

@interface LeftSlideViewController ()<UIGestureRecognizerDelegate>
{
    CGFloat _scalef;  //实时横向位移
    CGFloat kMainPageDistance;//打开左侧窗时，中视图(右视图)露出的宽度
    CGFloat kMainPageScale; //打开左侧窗时，中视图(右视图）缩放比例
}

@property (nonatomic,strong) UITableView *leftTableview;
/**
 *  左侧视图
 */
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,assign) CGFloat leftTableviewW;
@property (nonatomic,strong) UIView *contentView;


////上一次的认证状态
//@property (nonatomic , strong) NSString *lastState;
////上一次认证身份
//@property (nonatomic , strong) NSString *lastAutype;


@end



@implementation LeftSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    if (KIsFHD)
//    {
//        kMainPageDistance = 77;
//        kMainPageScale = 0.946;
//    }else if(WLFourInch)
//    {
//        kMainPageDistance = 62;
//        kMainPageScale = 0.93;
//    }else if (WLThreeInch)
//    {
//        kMainPageDistance = 62;
//        kMainPageScale = 0.917;
//    }else
//    {
//        kMainPageDistance = 62;
//        kMainPageScale = 0.94;
//    }
    kMainPageDistance = kScreenWidth*0.15;
    kMainPageScale = 1.0;

}



/**
 @brief 初始化侧滑控制器
 @param leftVC 左视图控制器
 mainVC 中间视图控制器
 @result instancetype 初始化生成的对象
 */
- (instancetype)initWithLeftView:(UIViewController *)leftVC
                     andMainView:(UIViewController *)mainVC
{
    if(self = [super init]){
        self.speedf = vSpeedFloat;
        
        self.leftVC = leftVC;
        self.mainVC = mainVC;
        //滑动手势
        self.pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.mainVC.view.bounds];
        imageView.x = - [[UIScreen mainScreen] bounds].size.width;
        imageView.image = [UIImage imageNamed:@"img_shadow_set"];
        [self.mainVC.view insertSubview:imageView atIndex:0];
        [self.mainVC.view addGestureRecognizer:self.pan];
        
        [self.pan setCancelsTouchesInView:YES];
        self.pan.delegate = self;
        
        self.leftVC.view.hidden = YES;
        
        [self.view addSubview:self.leftVC.view];
        
        //蒙版
        UIView *view = [[UIView alloc] init];
        view.frame = self.leftVC.view.bounds;
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        self.contentView = view;
        [self.leftVC.view addSubview:view];
        
        
        //获取左侧tableview
//        for (UIView *obj in self.leftVC.view.subviews) {
//            if ([obj isKindOfClass:[UITableView class]]) {
//                self.leftView  = (UITableView *)obj;
//            }
//        }
        
        UIView *leftView = [self.leftVC.view viewWithTag:713];
        self.leftView = leftView;
        
        self.leftView .backgroundColor = [UIColor clearColor];
        self.leftView .frame = CGRectMake(0, 0, kScreenWidth - kMainPageDistance, kScreenHeight);
        //设置左侧tableview的初始位置和缩放系数
        self.leftView .transform = CGAffineTransformMakeScale(kLeftScale, kLeftScale);
        self.leftView .center = CGPointMake(kLeftCenterX, kScreenHeight * 0.5);
        [self.view addSubview:self.mainVC.view];
        self.closed = YES;//初始时侧滑窗关闭
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.leftVC.view.hidden = NO;
    
}

#pragma mark - 滑动手势

//滑动手势
- (void) handlePan: (UIPanGestureRecognizer *)rec{
    
    CGPoint point = [rec translationInView:self.view];
    _scalef = (point.x * self.speedf + _scalef);

    BOOL needMoveWithTap = YES;  //是否还需要跟随手指移动
    if (((self.mainVC.view.x <= 0) && (_scalef <= 0)) || ((self.mainVC.view.x >= (kScreenWidth - kMainPageDistance )) && (_scalef >= 0)))
    {
        //边界值管控
        _scalef = 0;
        needMoveWithTap = NO;
    }
    
    //根据视图位置判断是左滑还是右边滑动
    if (needMoveWithTap && (rec.view.frame.origin.x >= 0) && (rec.view.frame.origin.x <= (kScreenWidth - kMainPageDistance)))
    {
        CGFloat recCenterX = rec.view.center.x + point.x * self.speedf;
        if (recCenterX < kScreenWidth * 0.5 - 2) {
            recCenterX = kScreenWidth * 0.5;
        }
        
        CGFloat recCenterY = rec.view.center.y;
        
        rec.view.center = CGPointMake(recCenterX,recCenterY);

        //scale 1.0~kMainPageScale
//        CGFloat scale = 1 - (1 - kMainPageScale) * (rec.view.frame.origin.x / (kScreenWidth - kMainPageDistance));
    
//        rec.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,scale, scale);
        [rec setTranslation:CGPointMake(0, 0) inView:self.view];
        
        CGFloat leftTabCenterX = kLeftCenterX + ((kScreenWidth - kMainPageDistance) * 0.5 - kLeftCenterX) * (rec.view.frame.origin.x / (kScreenWidth - kMainPageDistance));

//        NSLog(@"%f",leftTabCenterX);
        
        
        //leftScale kLeftScale~1.0
        CGFloat leftScale = kLeftScale + (1 - kLeftScale) * (rec.view.frame.origin.x / (kScreenWidth - kMainPageDistance));
        
        self.leftView .center = CGPointMake(leftTabCenterX, kScreenHeight * 0.5);
        self.leftView .transform = CGAffineTransformScale(CGAffineTransformIdentity, leftScale,leftScale);
        
        //tempAlpha kLeftAlpha~0
        CGFloat tempAlpha = kLeftAlpha - kLeftAlpha * (rec.view.frame.origin.x / (kScreenWidth - kMainPageDistance));
        self.contentView.alpha = tempAlpha;
        
        if (rec.state == UIGestureRecognizerStateChanged) {
            CGFloat xs = rec.view.x/(self.view.width*0.85);
            CGFloat panY = xs*20;
            rec.view.y = panY;
            if (panY > 1) {
//                UIView *contentView = self.mainVC.view;
                //阴影效果
//                if (contentView.layer.shadowOpacity  == 0) {
//                    contentView.layer.shadowColor = [UIColor grayColor].CGColor;
//                    contentView.layer.shadowOffset = CGSizeMake(-8, 0);
//                    contentView.layer.shadowOpacity = 0.4;
//                    contentView.layer.shadowRadius = 4;
//                }
            }
        }
    }
    else
    {
        //超出范围，
        if (self.mainVC.view.x <= 0)
        {
            [self closeLeftView];
            _scalef = 0;
        }
        else if (self.mainVC.view.x >= (kScreenWidth - kMainPageDistance))
        {
            if (self.closed) {
                [self openLeftView];
            }
            
            _scalef = 0;
        }
    }
    //手势结束后修正位置,超过约一半时向多出的一半偏移
    if (rec.state == UIGestureRecognizerStateEnded) {
        if (fabs(_scalef) > vCouldChangeDeckStateDistance)
        {
            if (self.closed)
            {
                [self openLeftView];
            }
            else
            {
                [self closeLeftView];
            }
        }
        else
        {
            if (self.closed)
            {
                [self closeLeftView];
            }
            else
            {
                [self openLeftView];
            }
        }
        _scalef = 0;
    }
}


#pragma mark - 单击手势
-(void)handeTap:(UITapGestureRecognizer *)tap{
    
    if ((!self.closed) && (tap.state == UIGestureRecognizerStateEnded))
    {
        [UIView animateWithDuration:0.25 animations:^{
//            tap.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
            tap.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
            self.closed = YES;
            
            self.leftView .center = CGPointMake(kLeftCenterX, kScreenHeight * 0.5);
            self.leftView .transform = CGAffineTransformScale(CGAffineTransformIdentity,kLeftScale,kLeftScale);
            self.contentView.alpha = kLeftAlpha;

        } completion:^(BOOL finished) {
            _scalef = 0;
            [self removeSingleTap];
        }];
        
    }
    
}

#pragma mark - 修改视图位置
/**
 @brief 关闭左视图
 */
- (void)closeLeftView
{
    [UIView beginAnimations:nil context:nil];
     [UIView commitAnimations];

//    //清除阴影效果
    UIView *contentView = self.mainVC.view;
    contentView.layer.shadowColor = [UIColor whiteColor].CGColor;
    contentView.layer.shadowOffset = CGSizeMake(0, 0);
    contentView.layer.shadowOpacity = 0;
    contentView.layer.shadowRadius = 0;
    
    LPFLeftVIewController *leftVc = (LPFLeftVIewController *)self.leftVC;
    leftVc.isPus = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.mainVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);

       
        self.closed = YES;
        
        self.leftView .center = CGPointMake(kLeftCenterX, kScreenHeight * 0.5 );
         self.mainVC.view.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
        NSLog(@"关闭的%zd",self.mainVC.view.center);
        self.leftView .transform = CGAffineTransformScale(CGAffineTransformIdentity,kLeftScale,kLeftScale);
        self.contentView.alpha = kLeftAlpha;
    } completion:^(BOOL finished) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [self removeSingleTap];
    }];

}

/**
 @brief 打开左视图
 */
- (void)openLeftView;
{
    [UIView beginAnimations:nil context:nil];
    [UIView commitAnimations];
    UIView *contentView = self.mainVC.view;
    //阴影效果
    if (contentView.layer.shadowOpacity  == 0) {
        contentView.layer.shadowColor = [UIColor grayColor].CGColor;
        contentView.layer.shadowOffset = CGSizeMake(-8, 0);
        contentView.layer.shadowOpacity = 0.4;
        contentView.layer.shadowRadius = 4;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.mainVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,kMainPageScale,kMainPageScale);
       CGPoint center = kMainPageCenter;
       
        self.mainVC.view.center = CGPointMake(center.x, center.y+20);
        NSLog(@"打开的%zd",self.mainVC.view.center);
        self.closed = NO;
        
        self.leftView .center = CGPointMake((kScreenWidth - kMainPageDistance) * 0.5, kScreenHeight * 0.5);
        self.leftView .transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        self.contentView.alpha = 0;
    } completion:^(BOOL finished) {
      
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        [self disableTapButton];
    }];
    
}

#pragma mark - 行为收敛控制
- (void)disableTapButton
{
    for (UIButton *tempButton in [_mainVC.view subviews])
    {
        [tempButton setUserInteractionEnabled:NO];
    }
    //单击
    if (!self.sideslipTapGes)
    {
        //单击手势
        self.sideslipTapGes= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handeTap:)];
        [self.sideslipTapGes setNumberOfTapsRequired:1];
        
        [self.mainVC.view addGestureRecognizer:self.sideslipTapGes];
        self.sideslipTapGes.cancelsTouchesInView = YES;  //点击事件盖住其它响应事件,但盖不住Button;
    }
}

//关闭行为收敛
- (void) removeSingleTap
{
    for (UIButton *tempButton in [self.mainVC.view  subviews])
    {
        [tempButton setUserInteractionEnabled:YES];
    }
    //清除阴影效果
//    UIView *contentView = self.mainVC.view;
//    contentView.layer.shadowColor = [UIColor whiteColor].CGColor;
//    contentView.layer.shadowOffset = CGSizeMake(0, 0);
//    contentView.layer.shadowOpacity = 0;
//    contentView.layer.shadowRadius = 0;
    [self.mainVC.view removeGestureRecognizer:self.sideslipTapGes];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.sideslipTapGes = nil;
}

/**
 *  设置滑动开关是否开启
 *
 *  @param enabled YES:支持滑动手势，NO:不支持滑动手势
 */

- (void)setPanEnabled: (BOOL) enabled
{
    [self.pan setEnabled:enabled];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch {
    
    if(touch.view.tag == vDeckCanNotPanViewTag)
    {
//        NSLog(@"不响应侧滑");
        return NO;
    }
    else
    {
//        NSLog(@"响应侧滑");
        return YES;
    }
}

@end
