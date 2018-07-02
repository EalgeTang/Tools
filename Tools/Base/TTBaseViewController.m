//
//  TTBaseViewController.m
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTBaseViewController.h"

@interface TTBaseViewController ()

@end

@implementation TTBaseViewController

#pragma mark -  public

+ (instancetype)build
{
    NSString *xibName = NSStringFromClass([self class]);
    return [[self alloc] initWithNibName:xibName bundle:nil];
}

- (void)setupViews{}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
