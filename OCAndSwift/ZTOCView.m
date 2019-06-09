//
//  ZTOCView.m
//  OCAndSwift
//
//  Created by zt on 2019/6/9.
//  Copyright © 2019 zt. All rights reserved.
//

#import "ZTOCView.h"

@implementation ZTOCView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.numberOfLines = 0;
        [self addSubview:label];
        label.text = @"黄色区域是ocView，点击后，通过Block更改底部button的颜色，并将文字改成确定";
        label.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.changeColorBlock) {
        self.changeColorBlock([UIColor yellowColor]);
    }
}
@end
