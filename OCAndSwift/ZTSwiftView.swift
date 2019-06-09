//
//  ZTSwiftView.swift
//  OCAndSwift
//
//  Created by zt on 2019/6/5.
//  Copyright © 2019 zt. All rights reserved.
//

import UIKit

typealias GetSelectColorSwift = (_ str : NSString) -> Void

class ZTSwiftView: UIView {

    //MARK:点击确认按钮后的block
    @objc var selectColorBlockSwift:GetSelectColorSwift?
    
    //******本页面所有的位置值
    var whiteView_xSpace:CGFloat = 48//白色背景框的左右边距
    var content_xSpace:CGFloat = 22//白框里面内容的左右边距
    var content_ySpace:CGFloat = 35//白框里面内容的上边距
    var titleLabel_height:CGFloat!//标题的高度
    var bottomBtn_height:CGFloat!//底部button的高度
        
    //******本页面所有的View
    let whiteView = UIView()//白色背景框
    let titleLabel = UILabel()//标题
    let closeBtn = UIButton()//关闭按钮
    let contentView = UIView()//中间的view
    let confirmButton = UIButton()//确认button
    
    //MARK:初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置为全屏大小，背景透明黑蒙板
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        content_ySpace = ((self.frame.width - 2*whiteView_xSpace) - (30 * 4))/5.0
        setupSubViews()
        configUI()
        addTarget()
    }
    
    //MARK:点击事件
    func addTarget() {
        
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        closeBtn.addTarget(self, action: #selector(closeTheView), for: .touchUpInside)
        
    }
    @objc func closeTheView() {
        
        self.removeFromSuperview()
    }
    @objc func confirm() -> Void {
        
        if (selectColorBlockSwift != nil) {
            selectColorBlockSwift!("从block里面传过来的值")
        }
    }
    //MARK:赋值操作
    func configUI() {
        titleLabel.text = "这是swiftView"
    }
    //MARK:UI搭建
    func setupSubViews() {
        //创建白色view
        createWhiteView()
        //创建标题label
        createTitleLabel()
        //创建关闭q按钮
        createCloseBtn()
        //创建中间的view
        createContentView()
        //创建底部button
        createBottomView()
        //白色区域的大小
        var rect = whiteView.frame
        rect.size.height = confirmButton.frame.maxY + 14
        whiteView.frame = rect
        whiteView.center = self.center
        whiteView.layer.cornerRadius = 5
    }
    func createBottomView() {
        
        whiteView.addSubview(confirmButton)
        
        confirmButton.setTitle("确定", for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        confirmButton.setTitleColor(UIColor.blue, for: .normal)
        confirmButton.frame = CGRect(x: content_xSpace, y: contentView.frame.maxY + 33, width: whiteView.frame.width - 2*content_xSpace, height: 44)
        confirmButton.layer.cornerRadius = 5
    }
    func createCloseBtn() {
        
        closeBtn.frame = CGRect(x: (whiteView.frame.width - 10 - 56), y: 20, width: 56, height: 16)
        whiteView.addSubview(closeBtn)
        
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(.red, for: .normal)
    }
    func createContentView() {
        
        contentView.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 33, width: whiteView.frame.width, height: 100)
        whiteView.addSubview(contentView)
        
        let ocView = ZTOCView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        contentView.addSubview(ocView)
        
        weak var weakSelf = self
        //点ocView中间的view后的block
        ocView.changeColorBlock = {(color : UIColor?) -> Void in
        
            weakSelf?.confirmButton.backgroundColor = color
            weakSelf?.confirmButton.setTitle("确定", for: .normal)
        }
    }
    func createTitleLabel() {
        
        titleLabel.frame = CGRect(x: content_xSpace, y: content_ySpace, width: whiteView.frame.width - 2*content_xSpace, height: 40)
        whiteView.addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = NSTextAlignment.center
    }
    func createWhiteView() {
        
        whiteView.frame = CGRect(x: whiteView_xSpace, y: 0, width: (self.frame.size.width - 2*whiteView_xSpace), height: 200)
        self.addSubview(whiteView)
        
        whiteView.backgroundColor = UIColor.white
        whiteView.center = self.center
    }
    //MARK:外部调用方法
    @objc public func reloadBtnTitle(title:NSString){
        confirmButton.backgroundColor = .white
        confirmButton.setTitle(title as String, for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
