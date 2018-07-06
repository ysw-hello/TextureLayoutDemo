//
//  StackSpecLayoutViewController.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "StackSpecLayoutViewController.h"
#import "ExampleCellNode.h"
#import "LayoutExamplesViewController.h"
#import "LayoutExampleNodes.h"

@interface StackSpecLayoutViewController () <ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) NSArray *layoutExamples;
@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation StackSpecLayoutViewController

- (instancetype)init {
    _tableNode = [ASTableNode new];
    self = [super initWithNode:_tableNode];
    if (self) {
        self.title = @"弹性盒式布局";
        
        _tableNode.delegate = self;
        _tableNode.dataSource = self;
        
        _layoutExamples = @[[HeaderWithRightAndLeftItems class],
                            [PhotoWithInsetTextOverlay class],
                            [PhotoWithOutsetIconOverlay class],
                            [FlexibleSeparatorSurroundingContent class],
                            [CornerLayoutExample class],
                            [UserProfileSample class]
                            ];
        
    }
    return self;
}


#pragma mark - ASTableNodeDataSource & ASTableNodeDelegate
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return _layoutExamples.count;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[ExampleCellNode alloc] initWithLayoutExampleClass:_layoutExamples[indexPath.row]];
}

-(void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
    
    Class layoutExampleClass = [[tableNode nodeForRowAtIndexPath:indexPath] layoutExampleClass];
    LayoutExamplesViewController *detail = [[LayoutExamplesViewController alloc] initWithLayoutExampleClass:layoutExampleClass];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
