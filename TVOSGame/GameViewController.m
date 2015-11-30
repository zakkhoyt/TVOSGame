//
//  GameViewController.m
//  TVOSGame
//
//  Created by Zakk Hoyt on 11/10/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "ZHSKCursorView.h"

@interface GameViewController ()
@end


@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    ZHSKCursorView * skView = (ZHSKCursorView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    
    // Callback for tap event
    [skView setTapBlock:^(CGPoint point) {
        [scene tapAtPoint:CGPointMake(point.x, skView.bounds.size.height - point.y)];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
