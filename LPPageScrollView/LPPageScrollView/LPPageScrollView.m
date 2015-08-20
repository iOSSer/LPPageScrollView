//
//  LPPageScrollView.m
//  LPPageScrollView
//
//  Created by MacBook on 15/8/19.
//  Copyright (c) 2015年 LiPeng. All rights reserved.
//

#import "LPPageScrollView.h"

@interface LPPageScrollView()<UIScrollViewDelegate>



@end

@implementation LPPageScrollView

static CGFloat pageControlHeight = 20;

//@synthesize coverImages = _coverImages;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"init");
        self.pageScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.pageScrollView.delegate = self;
        [self addSubview:self.pageScrollView];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_pageControl];
        [self bringSubviewToFront:_pageControl];
    }
    return self;
}

- (void)setCoverImages:(NSArray *)coverImages
{
    _coverImages = coverImages;
    
    [self initSubviews];
}



- (void) initSubviews
{
    NSLog(@"%@", _coverImages);
    if (_coverImages.count < 1) {
       NSAssert(_coverImages.count < 1, @"coverImages.count < 1");
        return;
    }
    
    
    self.pageScrollView.pagingEnabled = YES;
//    self.pageScrollView.alwaysBounceHorizontal = NO;
    self.pageScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * _coverImages.count, self.bounds.size.height);
    [self.pageScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSUInteger i = 0; i < _coverImages.count; i ++) {
        CGFloat left = CGRectGetWidth(self.bounds) * i;
        UIImageView *coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(left, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        coverImage.backgroundColor = [UIColor orangeColor];
        coverImage.image = [UIImage imageNamed:_coverImages[i]];
        [self.pageScrollView addSubview:coverImage];
    }
    
    CGSize LPScreenSize = [UIScreen mainScreen].bounds.size;
//    CGFloat pcWidth = _coverImages.count * 20 < LPScreenSize.width ?: LPScreenSize.width;
    CGFloat pcWidth = _coverImages.count * 20;
    _pageControl.frame = CGRectMake((LPScreenSize.width - pcWidth) / 2, CGRectGetHeight(self.frame) - pageControlHeight - 10, pcWidth, pageControlHeight);
    _pageControl.numberOfPages =  3;
    _pageControl.layer.cornerRadius = 8;
    _pageControl.layer.masksToBounds = YES;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    if (_pageControl.currentPage == page) {
        return;
    }
    _pageControl.currentPage = page;
    NSLog(@"page %ld", (long)page);
}

@end
