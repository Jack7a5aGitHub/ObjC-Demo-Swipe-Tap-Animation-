//
//  childViewController.m
//  TinderLike(Storyboard)
//
//  Created by Jack Wong on 2018/01/12.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "childViewController.h"
#import "DraggableViewBackground.h"

@interface childViewController ()

@end

@implementation childViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DraggableViewBackground *setupView = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:setupView];
}

- (void)didReceiveMemoryWarning {
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
