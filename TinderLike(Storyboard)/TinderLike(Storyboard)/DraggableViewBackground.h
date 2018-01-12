//
//  DraggableViewBackground.h
//  TinderLike(Storyboard)
//
//  Created by Jack Wong on 2018/01/12.
//  Copyright © 2018 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableView.h"


@interface DraggableViewBackground : UIView <DraggableViewDelegate>

//methods called in DraggableView
-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@property (retain,nonatomic)NSArray* exampleCardLabels; //%%% the labels the cards
@property (retain,nonatomic)NSArray* ansLabels;
@property (retain,nonatomic)NSMutableArray* allCards; //%%% the labels the cards

@end
