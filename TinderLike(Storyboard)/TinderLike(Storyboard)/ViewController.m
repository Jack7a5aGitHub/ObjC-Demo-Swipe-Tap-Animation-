//
//  ViewController.m
//  TinderLike(Storyboard)
//
//  Created by Jack Wong on 2018/01/12.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    childViewController *childVC = [[childViewController alloc]init];
    [self addChildViewController:childVC];
    self.displayView = childVC.view;
    [childVC didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
