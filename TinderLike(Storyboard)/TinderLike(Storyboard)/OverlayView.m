//
//  OverlayView.m
//  TinderLike(Storyboard)
//
//  Created by Jack Wong on 2018/01/12.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noButton"]];
        [self addSubview:imageView];
    }
    return self;
}

-(void)setMode:(GGOverlayViewMode)mode
{
    if (_mode == mode) {
        return;
    }
    
    _mode = mode;
    
    if(mode == GGOverlayViewModeLeft) {
        imageView.image = [UIImage imageNamed:@"thumbDown"];
    } else {
        imageView.image = [UIImage imageNamed:@"thumbUp"];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    imageView.frame = CGRectMake(50, 50, 100, 100);
}


@end
