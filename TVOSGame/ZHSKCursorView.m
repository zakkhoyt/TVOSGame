//
//  ZHSKCursorView.m
//  TVOSGame
//
//  Created by Zakk Hoyt on 11/11/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHSKCursorView.h"

@interface ZHSKCursorView () <UIFocusEnvironment>
@property (nonatomic) CGFloat firstX;
@property (nonatomic) CGFloat firstY;
@property (nonatomic, strong) UIView *cursorView;
@property (nonatomic, strong) ZHSKCursorViewPointBlock tapBlock;
@end

@implementation ZHSKCursorView


-(void)setTapBlock:(ZHSKCursorViewPointBlock)tapBlock{
    _tapBlock = tapBlock;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if(self.cursorView == nil){
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
        [self addGestureRecognizer:panGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
        _firstX = self.center.x;
        _firstY = self.center.y;
        
        self.cursorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.cursorView.backgroundColor = [UIColor greenColor];
        self.cursorView.layer.cornerRadius = self.cursorView.bounds.size.width / 2.0;
        self.cursorView.layer.masksToBounds = YES;
        self.cursorView.center = self.center;
        [self addSubview:self.cursorView];
    }
}



-(void)panGesture:(UIPanGestureRecognizer*)sender{
    NSLog(@"pan");
    
    // Get point in view
    CGPoint point = [sender translationInView:self];
    
    // Clip to bounds
    CGFloat x = _firstX+point.x;
    x = MIN(x, self.bounds.size.width);
    x = MAX(x, 0);
    
    CGFloat y = _firstY+point.y;
    y = MIN(y, self.bounds.size.height);
    y = MAX(y, 0);
    
    
    // Update cursor position
    CGPoint cursorPoint = CGPointMake(x, y);
    self.cursorView.center = cursorPoint;
    
    // Store for next time
    if(sender.state == UIGestureRecognizerStateEnded){
        _firstX = cursorPoint.x;
        _firstY = cursorPoint.y;
    }
    
}

-(void)tapGesture:(UITapGestureRecognizer*)sender{
    NSLog(@"tap");
    
    
    if(self.tapBlock){
        self.tapBlock(CGPointMake(_firstX, _firstY));
    }
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    v.backgroundColor = [UIColor redColor];
//    v.layer.cornerRadius = self.cursorView.bounds.size.width / 2.0;
//    v.layer.masksToBounds = YES;
//    v.center = CGPointMake(_firstX, _firstY);
//    [self addSubview:v];
    
}

- (BOOL)shouldUpdateFocusInContext:(UIFocusUpdateContext *)context{
    return YES;
}

@end
