//
//  utils.hpp
//  magicPen
//
//  Created by william on 2020/3/21.
//  Copyright © 2020 william. All rights reserved.
//

#ifndef utils_hpp
#define utils_hpp
#include "base.h"


/// 加载文件内容
/// @param filePath 文件路径
const GLchar* loadFileContext(const GLchar *filePath);


/// 创建program对象
/// @param vertShader 顶点着色器对象
/// @param fragShader 片元着色器对象
GLuint createProgram(GLuint vertShader, GLuint fragShader);


/// 创建shader对象
/// @param shaderType 着色器类型
/// @param shaderSrc  着色器source
GLuint createShader(const GLenum shaderType, const GLchar *shaderSrc);

#endif /* utils_hpp */
