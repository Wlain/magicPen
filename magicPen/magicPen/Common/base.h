//
//  base.h
//  magicPen
//
//  Created by william on 2020/3/21.
//  Copyright © 2020 william. All rights reserved.
//

#ifndef base_h
#define base_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#include "glm.hpp"
#include "ext.hpp"
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <OpenGLES/ES3/gl.h>
#include <OpenGLES/ES3/glext.h>
#include <cstdio>
#include <cstdarg>
#include <cmath>
#include <cstring>
#include <string>
#include <sstream>
#include <functional>
#include <map>
#include <cassert>
#include <sys/time.h>

// 安全释放文件
#ifndef SAFE_DELETE
#define SAFE_LETELE(x) {if (x) delete (x); x = nullptr;}
#endif

#ifndef SAFE_FREE
#define SAFE_FREE(x) {if (x) free(x); x = nullptr;}
#endif

#ifndef SAFE_DELETE_ARRAY
#define SAFE_DELETE_ARRAY {if (x) delete [] x; x = nullptr;}
#endif

#define MATH_TOLERANCE          2e-37f
#define MATH_FLOAT_SMALL        1e-37f
#define MATH_PI                 3.141592657

#define GLERROR_CHECK() \
{ \
    GLenum glError = glGetError(); \
    if (glError != GL_NO_ERROR) { \
        printf("glGetError() = %i (0x%.8x) in filename = %s, line  = %i\n", glError, glError, __FILE__ , __LINE__); \
    } \
}

#endif /* base_h */
