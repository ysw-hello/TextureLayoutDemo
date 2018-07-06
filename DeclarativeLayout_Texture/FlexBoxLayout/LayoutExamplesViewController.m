//
//  LayoutExamplesViewController.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "LayoutExamplesViewController.h"
#import "LayoutExampleNodes.h"

@interface LayoutExamplesViewController ()

@property (nonatomic, strong) LayoutExampleNodes *customNode;

@end

@implementation LayoutExamplesViewController

- (instancetype)initWithLayoutExampleClass:(Class)layoutExampleClass {
    NSAssert([layoutExampleClass isSubclassOfClass:[LayoutExampleNodes class]], @"Must be a subclass of LayoutExampleNodes");
    
    self = [super initWithNode:[ASDisplayNode new]];
    if (self) {
        self.title = @"布局示例";
        
        _customNode = [layoutExampleClass new];

        [self.node addSubnode:_customNode];
        
        BOOL needOnlyYCenter = [layoutExampleClass isEqual:[HeaderWithRightAndLeftItems class]] || [layoutExampleClass isEqual:[FlexibleSeparatorSurroundingContent class]];
        
        self.node.backgroundColor = needOnlyYCenter ? [UIColor lightGrayColor] : [UIColor whiteColor];
        
        __weak typeof(self) weakSelf = self;
        self.node.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:needOnlyYCenter ? ASCenterLayoutSpecCenteringY : ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY child:weakSelf.customNode];
        };
        
    }
    
    return self;
}




@end
