//
//  CPKenburnsImageView.h
//  Tablview顶部浮动图片
//
//  Created by CoderDoctorLee on 16/6/15.
//  Copyright © 2016年 CoderDoctorLee. All rights reserved.
//

#import <UIKit/UIKit.h>
//没有注释，自己领悟吧
typedef NS_ENUM(NSInteger, CPKenburnsImageViewState) {
    CPKenburnsImageViewStateAnimating,
    CPKenburnsImageViewStatePausing
};

typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomCourse) {
    CPKenburnsImageViewZoomCourseRandom                = 0,
    CPKenburnsImageViewZoomCourseUpperLeftToLowerRight = 1,
    CPKenburnsImageViewZoomCourseUpperRightToLowerLeft = 2,
    CPKenburnsImageViewZoomCourseLowerLeftToUpperRight = 3,
    CPKenburnsImageViewZoomCourseLowerRightToUpperLeft = 4
};
typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomPoint) {
    CPKenburnsImageViewZoomPointLowerLeft  = 0,
    CPKenburnsImageViewZoomPointLowerRight = 1,
    CPKenburnsImageViewZoomPointUpperLeft  = 2,
    CPKenburnsImageViewZoomPointUpperRight = 3
};

@interface CPKenburnsImageView : UIImageView

@end

@interface CPKenburnsView : UIView
@property (nonatomic, strong) CPKenburnsImageView * imageView;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) CGFloat animationDuration;  //默认 13.f
@property (nonatomic, assign) CGFloat zoomRatio; //默认 0.1  0 ~ 1 not working
@property (nonatomic, assign) CGFloat endZoomRate; // 默认 1.2
@property (nonatomic, assign) CGFloat startZoomRate; // 默认 1.3
@property (nonatomic, assign) UIEdgeInsets padding; // 默认 UIEdgeInsetsMake(10, 10, 10, 10);
@property (nonatomic, assign) CPKenburnsImageViewZoomCourse course; // 默认 0

@property (nonatomic, assign) CPKenburnsImageViewState state;

- (void)restartMotion;
- (void)showWholeImage;
- (void)zoomAndRestartAnimation;
- (void)zoomAndRestartAnimationWithCompletion:(void(^)(BOOL finished))completion;
@end
