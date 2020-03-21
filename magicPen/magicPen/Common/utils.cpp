//
//  utils.cpp
//  magicPen
//
//  Created by william on 2020/3/21.
//  Copyright © 2020 william. All rights reserved.
//

#include "utils.hpp"

GLuint createProgram(GLuint vertShader, GLuint fragShader) {
    GLuint program = 0;
    GLint linked = GL_FALSE;
    program = glCreateProgram();
    if (!program) {
        std::cerr << "failed to create program" << std::endl;
        goto exit;
    }
    // 绑定
    glAttachShader(program, vertShader);
    glAttachShader(program, fragShader);
    
    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (linked == GL_FALSE) {
        std::cerr << "could not link program" << std::endl;
        GLint infoLogLen = 0;
        glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLogLen);
        if(infoLogLen > 0) {
            GLchar *infoLog = (GLchar *)malloc(infoLogLen);
            glGetProgramInfoLog(program, infoLogLen, nullptr, infoLog);
            std::cerr << "could not link program, the error is:" << infoLog << std::endl;
            SAFE_FREE(infoLog);
        }
        glDeleteProgram(program);
        program = 0;
    }
    return program;
exit:
    glDeleteShader(vertShader);
    glDeleteShader(fragShader);
    return program;
}

GLuint createShader(const GLenum shaderType, const GLchar *shaderSrc) {
    GLuint shader = glCreateShader(shaderType);
    if(shader) {
        return 0;
    }
    glShaderSource(shader, 1, &shaderSrc, nullptr);
    GLint compiled = GL_FALSE;
    glCompileShader(shader);
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (!compiled) {
        GLint infoLogLen = 0;
        glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infoLogLen);
        if (infoLogLen > 0) {
            GLchar *infoLog = (GLchar *)malloc(sizeof(GLchar) * infoLogLen);
            if (infoLog) {
                glGetShaderInfoLog(shader, infoLogLen, nullptr, infoLog);
                std::cerr << "could not compile " << (shaderType == GL_VERTEX_SHADER ? "vertex" : "fragment") << "shader source, the error is:" << infoLog << std::endl;
                SAFE_FREE(infoLog);
            }
        }
        glDeleteShader(shader);
        return 0;
    }
    return shader;
}
