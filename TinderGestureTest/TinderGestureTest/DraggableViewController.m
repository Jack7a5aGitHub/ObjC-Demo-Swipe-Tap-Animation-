//
//  DraggableViewController.m
//  TinderGestureTest
//
//  Created by Jack Wong on 2018/01/08.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "DraggableViewController.h"

#define ROTATION_MAX 1
#define ROTATION_STRENGTH 320
#define ROTATION_ANGLE M_PI/8

@interface DraggableViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *dragView;
@property (strong, nonatomic) IBOutlet UIImageView *draggableImageView;
@property (strong, nonatomic) IBOutlet UIImageView *backImageView;
@property (nonatomic) CGFloat divisor;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (nonatomic) BOOL showingBack;

@end

@implementation DraggableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetDragView];
    self.showingBack = YES;
    self.draggableImageView.image = [UIImage imageNamed:@"photo0"];
    self.backImageView.image = [UIImage imageNamed:@"photo1"];
    self.backImageView.hidden = YES;
    self.divisor = (self.view.frame.size.width / 2) / 0.61;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)panCard:(UIPanGestureRecognizer *)sender {
    
    self.dragView = sender.view;
    CGFloat pointX = [sender translationInView:self.view].x;
    CGFloat pointY = [sender translationInView:self.view].y;
    CGFloat xFromCenterX = self.dragView.center.x - self.view.center.x;
    CGFloat scale = MIN(100/fabs(xFromCenterX), 1);
    NSLog(@"x from center: %f", xFromCenterX);
    self.dragView.center = CGPointMake(self.view.center.x + pointX, self.view.center.y + pointY);
    self.dragView.transform = CGAffineTransformMakeRotation(xFromCenterX/self.divisor);
    self.dragView.transform = CGAffineTransformScale(self.dragView.transform, scale, scale);
    
    if (xFromCenterX > 0) {
        self.thumbImageView.image = [UIImage imageNamed:@"thumbUp"];
        self.thumbImageView.tintColor = [UIColor greenColor];
    } else {
        self.thumbImageView.image = [UIImage imageNamed:@"thumbDown"];
        self.thumbImageView.tintColor = [UIColor redColor];
    }
 
    self.thumbImageView.alpha = fabs(xFromCenterX) / self.view.center.x;
    
    switch (sender.state){
            
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            break;
            
        }
        case UIGestureRecognizerStateEnded:
        {
            if (self.dragView.center .x < 75){
                //Move out to the left side
                [UIView animateWithDuration:0.3 animations:^{
                    self.dragView.center = CGPointMake(self.dragView.center.x -200, self.dragView.center.y + 75);
                    self.dragView.alpha = 0;
                    
                }];
                NSLog(@"Ended move out to left");
                return;
            }   else if (self.dragView.center.x > (self.view.frame.size.width -75)){
                //Move to the right side
                [UIView animateWithDuration:0.3 animations:^{
                    self.dragView.center = CGPointMake(self.dragView.center.x +200, self.dragView.center.y + 75);
                    self.dragView.alpha = 0;
                    
                }];
                NSLog(@"Ended move out to right");
                return;
            } else {
                self.dragView.transform = CGAffineTransformIdentity;
                self.dragView.center = self.view.center;
                self.dragView.alpha = 1;
                self.thumbImageView.alpha = 0;
                NSLog(@"Ended but not yet gone");
            }

            sender.view.center = self.view.center;
        }
        case UIGestureRecognizerStateFailed:
            break;
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateCancelled:
        {

            break;
        }
            default:
            break;
   
    }
}
- (IBAction)tapCard:(UITapGestureRecognizer *)sender {
    
    if (self.showingBack == YES) {
        
        [UIView transitionFromView:self.draggableImageView toView:self.backImageView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
        self.showingBack = NO;
        self.backImageView.hidden = NO;
        self.draggableImageView.hidden = YES;
    } else {
        
        [UIView transitionFromView:self.backImageView toView:self.draggableImageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
        self.showingBack = YES;
        self.draggableImageView.hidden = NO;
        self.backImageView.hidden = YES;
    }
    
}

- (IBAction)resetButton:(id)sender {
    [self resetDragView];
}
-(void)resetDragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.dragView.center = self.view.center;
        self.dragView.alpha = 1;
        self.thumbImageView.alpha = 0;
        self.dragView.transform = CGAffineTransformIdentity;
        self.backImageView.hidden = YES;
        self.draggableImageView.hidden = NO;
    }];
}

@end
