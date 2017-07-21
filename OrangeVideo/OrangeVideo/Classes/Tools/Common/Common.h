//
//  Common.h
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]

#endif /* Common_h */
