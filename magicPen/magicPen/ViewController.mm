//
//  ViewController.m
//  magicPen
//
//  Created by william on 2020/3/20.
//  Copyright © 2020 william. All rights reserved.
//

#import "ViewController.h"
#import "scene.hpp"

const GLchar* loadFileContext(const GLchar *filePath) {
    assert(filePath);
    GLchar *fileContext = nullptr;
    NSString *nsFilePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:filePath] ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:nsFilePath];
    unsigned long dataSize = [data length];
    if (dataSize > 0) {
        fileContext = new GLchar[dataSize + 1];
        memset(fileContext, 0, sizeof(GLchar) * (dataSize + 1));
        memcpy(fileContext, [data bytes], dataSize);
        fileContext[dataSize] = '\0';
    }
    return fileContext;
}

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
