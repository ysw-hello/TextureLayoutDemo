//
//  LayoutExampleNodes.h
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//


@interface LayoutExampleNodes : ASDisplayNode

+ (NSString *)title;
+ (NSString *)descriptionTitle;

@end

@interface HeaderWithRightAndLeftItems : LayoutExampleNodes
@end

@interface PhotoWithInsetTextOverlay : LayoutExampleNodes
@end

@interface PhotoWithOutsetIconOverlay : LayoutExampleNodes
@end

@interface FlexibleSeparatorSurroundingContent : LayoutExampleNodes
@end

@interface CornerLayoutExample : PhotoWithOutsetIconOverlay
@end

@interface UserProfileSample : LayoutExampleNodes
@end
