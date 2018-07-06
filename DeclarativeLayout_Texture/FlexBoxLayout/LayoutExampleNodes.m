//
//  LayoutExampleNodes.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/7/5.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "LayoutExampleNodes.h"

@interface HeaderWithRightAndLeftItems ()
@property (nonatomic, strong) ASTextNode *usernameNode;
@property (nonatomic, strong) ASTextNode *postLocationNode;
@property (nonatomic, strong) ASTextNode *postTimeNode;

@end

@interface PhotoWithInsetTextOverlay ()
@property (nonatomic, strong) ASNetworkImageNode *photoNode;
@property (nonatomic, strong) ASTextNode *titleNode;

@end

@interface PhotoWithOutsetIconOverlay ()
@property (nonatomic, strong) ASNetworkImageNode *photoNode;
@property (nonatomic, strong) ASNetworkImageNode *iconNode;

@end

@interface FlexibleSeparatorSurroundingContent ()
@property (nonatomic, strong) ASImageNode *topSeparator;
@property (nonatomic, strong) ASImageNode *bottomSeparator;
@property (nonatomic, strong) ASTextNode *textNode;

@end

@interface CornerLayoutExample ()
@property (nonatomic, strong) ASImageNode *dotNode;
@property (nonatomic, strong) ASImageNode *photoNode1;
@property (nonatomic, strong) ASTextNode *badgeTextNode;
@property (nonatomic, strong) ASImageNode *badgeImageNode;
@property (nonatomic, strong) ASImageNode *photoNode2;
@end

@interface UserProfileSample ()
@property (nonatomic, strong) ASImageNode *badgeNode;
@property (nonatomic, strong) ASImageNode *avatarNode;
@property (nonatomic, strong) ASTextNode *usernameNode;
@property (nonatomic, strong) ASTextNode *subtitleNode;
@property (nonatomic, assign) CGFloat photoSizeValue;
@property (nonatomic, assign) CGFloat iconSizeValue;
@end


@implementation LayoutExampleNodes

+ (NSString *)title {
    return @"";
}

+ (NSString *)descriptionTitle {
    return @"";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

@implementation HeaderWithRightAndLeftItems

+ (NSString *)title {
    return @"Header with left and right justified text";
}

+ (NSString *)descriptionTitle {
    return @"case one";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _usernameNode = [[ASTextNode alloc] init];
        _usernameNode.attributedText = [NSAttributedString attributedStringWithString:@"Timmy" fontSize:20 color:[UIColor darkBlueColor]];
        _usernameNode.maximumNumberOfLines = 1;
        _usernameNode.truncationMode = NSLineBreakByTruncatingTail;
        
        _postLocationNode = [[ASTextNode alloc] init];
        _postLocationNode.maximumNumberOfLines = 1;
        _postLocationNode.attributedText = [NSAttributedString attributedStringWithString:@"中国 北京 海淀区 上地六街 作业帮" fontSize:20 color:[UIColor lightBlueColor]];
        _postLocationNode.truncationMode = NSLineBreakByTruncatingTail;
        
        _postTimeNode = [[ASTextNode alloc] init];
        _postTimeNode.attributedText = [NSAttributedString attributedStringWithString:@"30min" fontSize:20 color:[UIColor lightGrayColor]];
        _postTimeNode.maximumNumberOfLines = 1;
        _postTimeNode.truncationMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    nameLocationStack.style.flexShrink = 1.0;
    nameLocationStack.style.flexGrow = 1.0;
    nameLocationStack.children = @[_usernameNode, _postLocationNode];
    
    ASStackLayoutSpec *headerStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:40 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[nameLocationStack, _postTimeNode]];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 0, 10) child:headerStack];
}
@end

@implementation PhotoWithInsetTextOverlay

+ (NSString *)title {
    return @"Photo with inset text overlay";
}

+ (NSString *)descriptionTitle {
    return @"case two";
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _photoNode = [[ASNetworkImageNode alloc] init];
        _photoNode.URL = [NSURL URLWithString:@"http://img.hb.aicdn.com/f2cb3273ee4c3717b60b34f5b567b6ecbecfa80d55006-5NDSBB_fw658"];
        _photoNode.willDisplayNodeContentWithRenderingContext = ^(CGContextRef  _Nonnull context, id  _Nullable drawParameters) {
            CGRect bounds = CGContextGetClipBoundingBox(context);
            [[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:10] addClip];
        };
        
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.maximumNumberOfLines = 2;
        _titleNode.truncationMode = NSLineBreakByTruncatingTail;
        _titleNode.attributedText = [NSAttributedString attributedStringWithString:@"This is a cool icon! This is a good boy!" fontSize:16 color:[UIColor cyanColor]];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    CGFloat photoDimension = constrainedSize.max.width / 2.0;
    _photoNode.style.preferredSize = CGSizeMake(photoDimension, photoDimension);
    
    UIEdgeInsets inset = UIEdgeInsetsMake(12, 12, INFINITY, 12);
    ASInsetLayoutSpec *textInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:inset child:_titleNode];
    
    return [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_photoNode overlay:textInsetSpec];
}

@end

@implementation PhotoWithOutsetIconOverlay

+ (NSString *)title {
    return @"Photo with outset icon overlay";
}

+ (NSString *)descriptionTitle {
    return @"case three";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _photoNode = [[ASNetworkImageNode alloc] init];
        _photoNode.URL = [NSURL URLWithString:@"http://img.hb.aicdn.com/f2cb3273ee4c3717b60b34f5b567b6ecbecfa80d55006-5NDSBB_fw658"];
        
        _iconNode = [[ASNetworkImageNode alloc] init];
        _iconNode.URL = [NSURL URLWithString:@"http://texturegroup.org/static/images/layout-examples-photo-with-outset-icon-overlay-icon.png"];
        
        [_iconNode setImageModificationBlock:^UIImage * _Nullable(UIImage * _Nonnull image) {
            CGSize profileImageSize = CGSizeMake(60, 60);
            return [image makeCircularImageWithSize:profileImageSize withBorderWidth:10];
        }];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _iconNode.style.preferredSize = CGSizeMake(40, 40);
    _iconNode.style.layoutPosition = CGPointMake(150, 0);
    
    _photoNode.style.preferredSize = CGSizeMake(150, 150);
    _photoNode.style.layoutPosition = CGPointMake(40/2.0, 40/2.0);
    
    ASAbsoluteLayoutSpec *absoluteSpec = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithChildren:@[_photoNode, _iconNode]];
    absoluteSpec.sizing = ASAbsoluteLayoutSpecSizingSizeToFit;
    
    return absoluteSpec;
}

@end

@implementation FlexibleSeparatorSurroundingContent

+ (NSString *)title {
    return @"Top and bottom cell separator lines";
}

+ (NSString *)descriptionTitle {
    return @"case four";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _topSeparator = [[ASImageNode alloc] init];
        _topSeparator.image = [UIImage as_resizableRoundedImageWithCornerRadius:1.0 cornerColor:[UIColor brownColor] fillColor:[UIColor cyanColor]];
        
        _textNode = [[ASTextNode alloc] init];
        _textNode.attributedText = [NSAttributedString attributedStringWithString:@"this is a long text node" fontSize:16 color:[UIColor blackColor]];
        
        _bottomSeparator = [[ASImageNode alloc] init];
        _bottomSeparator.image = [UIImage as_resizableRoundedImageWithCornerRadius:1.0 cornerColor:[UIColor brownColor] fillColor:[UIColor blackColor]];
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _topSeparator.style.flexGrow = 1.0;
    _bottomSeparator.style.flexGrow = 1.0;
    _textNode.style.alignSelf = ASStackLayoutAlignSelfCenter;
    
    ASStackLayoutSpec *verticalStackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    verticalStackSpec.spacing = 20;
    verticalStackSpec.justifyContent = ASStackLayoutJustifyContentCenter;
    verticalStackSpec.children = @[_topSeparator, _textNode, _bottomSeparator];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(60, 0, 60, 0) child:verticalStackSpec];
}

@end

@implementation CornerLayoutExample

static CGFloat const kSampleAvatarSize = 100;
static CGFloat const kSampleIconSize = 26;
static CGFloat const kSampleBadgeCornerRadius = 12;

+ (NSString *)title {
    return @"Corner image layout";
}

+ (NSString *)descriptionTitle {
    return @"case five";
}

- (UIImage *)avatarImageWithSize:(CGSize)size {
    return [UIImage imageWithSize:size fillColor:[UIColor lightGrayColor] shapeBlock:^UIBezierPath *{
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        return [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:MIN(size.width, size.height) / 20];
    }];
}

- (UIImage *)cornerImageWithSize:(CGSize)size {
    return [UIImage imageWithSize:size fillColor:[UIColor redColor] shapeBlock:^UIBezierPath *{
        return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    }];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        UIImage *avatarImage = [self avatarImageWithSize:CGSizeMake(kSampleAvatarSize, kSampleAvatarSize)];
        
        NSAttributedString *numberText = [NSAttributedString attributedStringWithString:@"99+" fontSize:20 color:[UIColor whiteColor]];
        
        _dotNode = [ASImageNode new];
        _dotNode.image = [self cornerImageWithSize:CGSizeMake(8, 8)];
        
        _photoNode1 = [ASImageNode new];
        _photoNode1.image = avatarImage;
        
        _badgeTextNode = [ASTextNode new];
        _badgeTextNode.attributedText = numberText;
        
        _badgeImageNode = [ASImageNode new];
        _badgeImageNode.image = [UIImage as_resizableRoundedImageWithCornerRadius:kSampleBadgeCornerRadius cornerColor:[UIColor clearColor] fillColor:[UIColor brownColor]];
        
        _photoNode2 = [ASImageNode new];
        _photoNode2.image = avatarImage;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASBackgroundLayoutSpec *badgeSpec = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:_badgeTextNode background:_badgeImageNode];
    
    ASCornerLayoutSpec *cornerSpec1 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:_photoNode1 corner:_dotNode location:ASCornerLayoutLocationTopRight];
    
    ASCornerLayoutSpec *cornerSpec2 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:_photoNode2 corner:badgeSpec location:ASCornerLayoutLocationTopLeft];
    
    //super inherit
    self.photoNode.style.preferredSize = CGSizeMake(kSampleAvatarSize, kSampleAvatarSize);
    self.iconNode.style.preferredSize = CGSizeMake(kSampleIconSize, kSampleIconSize);
    ASCornerLayoutSpec *cornerSpec3 = [ASCornerLayoutSpec cornerLayoutSpecWithChild:self.photoNode corner:self.iconNode location:ASCornerLayoutLocationBottomLeft];
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    stackSpec.spacing = 40;
    stackSpec.children = @[cornerSpec1, cornerSpec2, cornerSpec3];
    
    return stackSpec;
}

@end

@implementation UserProfileSample

+ (NSString *)title {
    return @"Common user profile layout";
}

+ (NSString *)descriptionTitle {
    return @"case six";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _photoSizeValue = 44;
        _iconSizeValue = 12;
        
        CGSize iconSize = CGSizeMake(_iconSizeValue, _iconSizeValue);
        CGSize photoSize = CGSizeMake(_photoSizeValue, _photoSizeValue);
        
        _badgeNode = [ASImageNode new];
        _badgeNode.style.preferredSize = iconSize;
        _badgeNode.image = [UIImage imageWithSize:iconSize fillColor:[UIColor redColor] shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, iconSize.width, iconSize.height)];
        }];
        
        _avatarNode = [ASImageNode new];
        _avatarNode.style.preferredSize = photoSize;
        _avatarNode.image = [UIImage imageWithSize:photoSize fillColor:[UIColor lightBlueColor] shapeBlock:^UIBezierPath *{
            return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, photoSize.width, photoSize.height)];
        }];
        
        _usernameNode = [ASTextNode new];
        _usernameNode.attributedText = [NSAttributedString attributedStringWithString:@"Timmy Yan" fontSize:17 color:[UIColor blackColor]];
        _usernameNode.maximumNumberOfLines = 1;
        _usernameNode.debugName = @"userNameNode";
        
        _subtitleNode = [ASTextNode new];
        _subtitleNode.attributedText = [NSAttributedString attributedStringWithString:@"May you run away half your life and back young(愿你出走半生，归来依然少年)" fontSize:14 color:[UIColor lightGrayColor]];
        _subtitleNode.maximumNumberOfLines = 1;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASCornerLayoutSpec *avatarBox = [ASCornerLayoutSpec cornerLayoutSpecWithChild:_avatarNode corner:_badgeNode location:ASCornerLayoutLocationBottomRight];
    avatarBox.offset = CGPointMake(-6, -6);
    
    ASStackLayoutSpec *textBox = [ASStackLayoutSpec verticalStackLayoutSpec];
    textBox.justifyContent = ASStackLayoutJustifyContentSpaceAround;
    textBox.children = @[_usernameNode, _subtitleNode];
    
    ASStackLayoutSpec *profileBox = [ASStackLayoutSpec horizontalStackLayoutSpec];
    profileBox.spacing = 10;
    profileBox.children = @[avatarBox, textBox];
    
    NSArray *elems = @[_usernameNode, _subtitleNode, textBox, profileBox];
    for (id <ASLayoutElement> elem in elems) {
        elem.style.flexShrink = 1;
    }
    NSLog(@"类结构树：%@", [profileBox asciiArtString]);
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(120, 20, INFINITY, 20) child:profileBox];
    
}

@end
