//
//  AppColors.h
//  photoApp
//
//  Created by mkdev on 13/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppColors : UIColor
+(UIColor *)getRbgWithRed:(float)red green:(float)green blue:(float)blue alpha: (float)alpha;
+(UIColor *)blueBackground;
+(UIColor *)blueBackgroundComplement;
@end
