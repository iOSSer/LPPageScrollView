//
//  LPPageScrollView.m
//  LPPageScrollView
//
//  Created by MacBook on 15/8/19.
//  Copyright (c) 2015年 LiPeng. All rights reserved.
//

#import "LPPageScrollView.h"

@interface LPPageScrollView()

//@property (nonatomic, strong) UIScrollView *pageScrollView;

@end

@implementation LPPageScrollView

//@synthesize coverImages = _coverImages;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"init");
//        self = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.backgroundColor = [UIColor orangeColor];
        self.frame = frame;
//        [self addSubview:self.pageScrollView];
        self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * 2, frame.size.height);
    }
    return self;
}

- (void)setCoverImages:(NSArray *)coverImages
{
    _coverImages = coverImages;
    
//    [self initSubviews];
}

- (void) initSubviews
{
    NSLog(@"%@", self.coverImages);
    if (self.coverImages.count < 1) {
       NSAssert(self.coverImages.count < 1, @"coverImages.count < 1");
        return;
    }
//    self.pagingEnabled = YES;
//    self.alwaysBounceHorizontal = NO;
    
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    for (NSUInteger i = 0; i < self.coverImages.count; i ++) {
//        CGFloat left = CGRectGetWidth(self.bounds) * i;
//        UIImageView *coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(left, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
//        coverImage.backgroundColor = [UIColor orangeColor];
//        [self addSubview:coverImage];
//    }
    
}

@end
