//
//  ZHSKCursorView.h
//  TVOSGame
//
//  Created by Zakk Hoyt on 11/11/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef void (^ZHSKCursorViewPointBlock)(CGPoint point);


@interface ZHSKCursorView : SKView
-(void)setTapBlock:(ZHSKCursorViewPointBlock)tapBlock;
@end
