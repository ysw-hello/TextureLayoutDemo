//
//  CollectionCellNode.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/29.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "CollectionCellNode.h"

@implementation CollectionCellNode {
    ASImageNode *_imageNode;
}

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        _imageNode = [[ASImageNode alloc] init];
        _imageNode.image = image;
        [self addSubnode:_imageNode];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _imageNode.image = image;
}

- (UIImage *)image {
    return _imageNode.image;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    CGSize imageSize = self.image.size;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero
                                                  child:[ASRatioLayoutSpec ratioLayoutSpecWithRatio:imageSize.height/imageSize.width child:_imageNode]];
}

@end
