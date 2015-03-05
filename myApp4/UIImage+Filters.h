//
//  UIImage+Filters.h
//  myApp4
//
//  Created by Saeko Fuse on 2015/03/03.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage_Filters : UITableViewCell

- (UIImage*)saturateImage:(float)saturationAmount withContrast:(float)contrastAmount;
- (UIImage*)vignetteWithRadius:(float)inputRadius andIntensity:(float)inputIntensity;
-(UIImage*)worn;
-(UIImage* )blendMode:(NSString *)blendMode withImageNamed:(NSString *) imageName;
- (UIImage *)curveFilter;


@end
