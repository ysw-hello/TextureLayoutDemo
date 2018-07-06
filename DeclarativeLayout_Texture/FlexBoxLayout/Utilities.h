//
//  Utilities.h
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Additions)
+ (UIColor *)darkBlueColor;
+ (UIColor *)lightBlueColor;
@end

@interface UIImage (Additions)
- (UIImage *)makeCircularImageWithSize:(CGSize)size withBorderWidth:(CGFloat)width;
+ (UIImage *)imageWithSize:(CGSize)size fillColor:(UIColor *)fillColor shapeBlock:(UIBezierPath *(^)(void))shapeBlock;
@end

@interface NSAttributedString (Additions)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(UIColor *)color;
@end
