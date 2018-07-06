//
//  ExampleCellNode.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "ExampleCellNode.h"
#import "LayoutExampleNodes.h"

@interface ExampleCellNode ()
@property (nonatomic, strong) ASTextNode *titleNode;
@property (nonatomic, strong) ASTextNode *descriptionNode;

@end

@implementation ExampleCellNode

- (instancetype)initWithLayoutExampleClass:(Class)layoutExampleClass {
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        
        _layoutExampleClass = layoutExampleClass;
        
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.attributedText = [NSAttributedString attributedStringWithString:[layoutExampleClass title] fontSize:16 color:[UIColor blackColor]];
        
        _descriptionNode = [[ASTextNode alloc] init];
        _descriptionNode.attributedText = [NSAttributedString attributedStringWithString:[layoutExampleClass descriptionTitle] fontSize:12 color:[UIColor lightGrayColor]];
        
    }
    
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *verticalStackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    verticalStackSpec.alignItems = ASStackLayoutAlignItemsStart;
    verticalStackSpec.spacing = 5.0;
    verticalStackSpec.children = @[self.titleNode, self.descriptionNode];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 16, 10, 10) child:verticalStackSpec];
}

@end
