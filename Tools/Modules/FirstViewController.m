//
//  FirstViewController.m
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//
struct StructTemp {
    CGFloat num1;
    CGFloat num2;
};

typedef struct CG_BOXABLE StructTemp StructTemp;
//CG_INLINE StructTemp
//StructTempMake(CGFloat num1, CGFloat num2)
//{
//    StructTemp temp;
//    temp.num1 = num1;
//    temp.num2 = num2;
//    return temp;
//}

#import "FirstViewController.h"
#import "TTTestView.h"
#import "TTVi.h"
@interface Person :NSObject

@property (nonatomic, strong) NSMutableArray *arr;
@end

@implementation Person

 - (NSMutableArray *)arr
{
    if (!_arr)
    {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

@end
@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    
    __weak IBOutlet TTTestView *testVi;
}

@property (nonatomic, assign) StructTemp numbers;
@property (weak, nonatomic) IBOutlet UITableView *table;
/***/
@property (nonatomic, copy) NSArray *dataArr;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *xibTap;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = tkWhiteColor();
    
    // stackView 的 subview 如果hidden掉, 则stackView 将会重新布局, 将其他子控件根据选择的模式填充满stackView.而因为stackView又一次重新布局, 所以也使得你hidden掉subview 也是具有动画性的. 但是需要注意的是,只能是设置hidden属性才行, 而alpha等其他属性,是无法提供这个效果的
    
    // 在viewDidLoad 中获取的frame 是xib中view的 初始frame, 此时还没有根据机型适应到真正的frame
    
    
//    CGRectMake(0, 0, 0, 0);

    Person *p1 = [self setupPerSon];
    Person *p2 = [self setupPerSon];
    Person *p3 = [self setupPerSon];
    self.dataArr = @[p1,p2,p3];
    
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
  UITapGestureRecognizer *tap = [testVi tt_addTapGestureWithTarget:self sel:@selector(testAction)];
    UIView *vi = [[UIView alloc] initWithFrame:tkRect(10, 10, 100, 100)];
    vi.userInteractionEnabled = YES;
    [vi addGestureRecognizer:tap];
    vi.backgroundColor = [UIColor greenColor];
    [self.view addSubview:vi];
//    [testVi tt_addTapGestureWithSel:nil];
//    testVi.tt_gestureHandle = ^(UIGestureRecognizer * _Nonnull gesture) {
//        //
//        DLog(@"default action");
//    };
    
    TTVi *v2 = [TTVi build];
    v2.frame = tkRect(200, 300, 200, 200);
    v2.backgroundColor = tkRandowColor();
    [self.view addSubview:v2];
}
- (IBAction)xibTapVi:(id)sender {
    DLog(@"XibTapViewClick");
}


- (IBAction)onHandle1Click:(id)sender {
    testVi.handle = ^{
        DLog(@"Handle1Click");
    };
//    testVi.handle = nil;
}
- (IBAction)onHandle2Click:(id)sender {
    testVi.handle = ^{
        DLog(@"handle2Click");
    };
//    testVi.handle = nil;
}
- (IBAction)onHandle3Click:(id)sender {
    testVi.handle = ^{
        DLog(@"handle3Click");
    };
//    testVi.handle = nil;
}

- (IBAction)addBtnClick:(id)sender {
    
//    Person *p1 = self.dataArr[0];
//    [p1.arr addObject:@(arc4random() % 100)];
//    [self.table reloadData];
    [self testMoreRequest];
}

- (void)testMoreRequest {
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        //
        [self doSomeThings:@"op 1" time:5];
    }];
    NSBlockOperation *openration2 = [NSBlockOperation blockOperationWithBlock:^{
        //
        [self doSomeThings:@"op 2" time:1];
//        dispatch_async(dispatch_queue_create("111", DISPATCH_QUEUE_CONCURRENT), ^{
//            //
//            [NSThread sleepForTimeInterval:2];
//            DLog(@"%@",@"op 2");
//        });
    }];
    [openration2 addDependency:operation1];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:openration2];
    [queue addOperation:operation1];
    queue.maxConcurrentOperationCount = 3;
    
//    [operation1 start];
//    [openration2 start];
}

- (void)testAction
{
    DLog(@" action 被接受到了");
}
- (void)doSomeThings:(NSString *)thing time:(NSInteger)t
{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //
//            [NSThread sleepForTimeInterval:t];
//            DLog(@"%@",thing);
//    });
    [NSThread sleepForTimeInterval:t];
    DLog(@"%@",thing);
}
- (Person *)setupPerSon
{
    Person *p = [Person new];
    [p.arr addObjectsFromArray:@[@(1), @(2), @(3)]];
    return p;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Person *p = self.dataArr[section];
    return p.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    NSInteger section = indexPath.section;
    UIColor *color = [UIColor redColor];
    switch (section)
    {
        case 0:
            color = [UIColor yellowColor];
            break;
        case 1:
        {
            color = [UIColor purpleColor];
        }
            break;
        default:
            break;
    }
    Person *p  = self.dataArr[indexPath.section];
    cell.textLabel.text = [p.arr[indexPath.row] stringValue];
    cell.backgroundColor = color;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
