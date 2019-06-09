//
//  ZTOCView.h
//  OCAndSwift
//
//  Created by zt on 2019/6/9.
//  Copyright © 2019 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeColor)(UIColor * _Nullable color);
NS_ASSUME_NONNULL_BEGIN

@interface ZTOCView : UIView


/**
 改变view的颜色
 */
@property (nonatomic, copy) ChangeColor changeColorBlock;

@end

NS_ASSUME_NONNULL_END
