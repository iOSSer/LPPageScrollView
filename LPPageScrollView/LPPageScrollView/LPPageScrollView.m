//
//  LPPageScrollView.m
//  LPPageScrollView
//
//  Created by MacBook on 15/8/19.
//  Copyright (c) 2015年 LiPeng. All rights reserved.
//

#import "LPPageScrollView.h"

@interface LPPageScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *tempCoverImages;

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

- (void)setCoverImages:(NSMutableArray *)coverImages
{
    _coverImages = [NSMutableArray arrayWithArray:coverImages];
    _tempCoverImages = [NSArray arrayWithArray:coverImages];
    if (_coverImages.count < 1) {
        NSAssert(_coverImages.count < 1, @"coverImages.count < 1");
        return;
    }
    
    NSString *firstObject = _coverImages.firstObject;
    NSString *lastObject = _coverImages.lastObject;
    
//    [_coverImages insertObject:firstObject atIndex:_coverImages.count - 1];
    [_coverImages insertObject:lastObject atIndex:0];
    
    [self initSubviews];
}



- (void) initSubviews
{
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
    _pageControl.numberOfPages =  _tempCoverImages.count;
    _pageControl.layer.cornerRadius = 8;
    _pageControl.layer.masksToBounds = YES;
    
    _pageScrollView.contentOffset = CGPointMake(CGRectGetWidth(_pageScrollView.frame), _pageScrollView.contentOffset.y);
    _pageControl.currentPage = 0;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    
    if (page == 0) {
        scrollView.contentOffset = CGPointMake(CGRectGetWidth(scrollView.frame) * (_coverImages.count - 1), scrollView.contentOffset.y);
    }else if (page == _coverImages.count - 1)
    {
        scrollView.contentOffset = CGPointZero;
    }
    
    page = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
//    NSLog(@"page %d", page);
    if (page == 0) {
        _pageControl.currentPage = _coverImages.count - 1;
    }else if (page == _coverImages.count - 1) {
        _pageControl.currentPage = 1;
        return;
    }
    _pageControl.currentPage = page;
}

@end
