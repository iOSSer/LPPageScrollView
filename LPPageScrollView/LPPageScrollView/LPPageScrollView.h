//
//  LPPageScrollView.h
//  LPPageScrollView
//
//  Created by MacBook on 15/8/19.
//  Copyright (c) 2015年 LiPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPPageScrollView : UIView

@property (nonatomic, strong) NSArray *coverImages; //封面图片数组

@property (nonatomic, strong) UIScrollView *pageScrollView; //pageScrollView

@property (nonatomic, strong) UIPageControl *pageControl; //pageControl

@end
