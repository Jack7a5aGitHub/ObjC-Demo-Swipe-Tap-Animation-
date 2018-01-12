//
//  OverlayView.h
//  TinderLike(Storyboard)
//
//  Created by Jack Wong on 2018/01/12.
//  Copyright © 2018 Jack. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , GGOverlayViewMode) {
    GGOverlayViewModeLeft,
    GGOverlayViewModeRight
};

@interface OverlayView : UIView

@property (nonatomic) GGOverlayViewMode mode;
@property (nonatomic, strong) UIImageView *imageView;

@end
