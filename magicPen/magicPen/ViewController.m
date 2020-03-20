//
//  ViewController.m
//  magicPen
//
//  Created by william on 2020/3/20.
//  Copyright © 2020 william. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) EAGLContext *context;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (self.context == nil) {
        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }
    if (self.context == nil) {
        NSLog(@"Failed to create OpenGLES context");
    }
    GLKView *view = (GLKView*)self.view;
    view.context = self.context;
    // 初始化深度缓冲区为24bit
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:self.context];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
}

@end
