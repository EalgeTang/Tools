//
//  FirstViewController.m
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIStackView *stackVi;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = tkWhiteColor();
    
    self.stackVi.backgroundColor = tkRandowColor();
    self.btn.backgroundColor = tkRandowColor();
    // stackView 的 subview 如果hidden掉, 则stackView 将会重新布局, 将其他子控件根据选择的模式填充满stackView.而因为stackView又一次重新布局, 所以也使得你hidden掉subview 也是具有动画性的. 但是需要注意的是,只能是设置hidden属性才行, 而alpha等其他属性,是无法提供这个效果的
//    self.lab.hidden = YES;
//    self.lab.alpha = 0;
    [self.btn addTarget: self action:@selector(onBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onBtnClick
{
    [UIView animateWithDuration:0.35 animations:^{
        self.lab.hidden = YES;
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
