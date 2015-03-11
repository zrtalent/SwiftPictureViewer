//
//  TableViewController.swift
//  SwiftPictureViewer
//
//  Created by Zr on 15/3/11.
//  Copyright (c) 2015年 Tarol. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }

    ///  准备表格的cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 提取cell信息
        let info = cellInfo(indexPath)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(info.cellId, forIndexPath: indexPath) as! StatusCell
        
        // 判断表格的闭包是否被设置
        if cell.photoDidSelected == nil {
            // 设置闭包
            weak var weakSelf = self
            cell.photoDidSelected = { (status: Status, photoIndex: Int)->() in
                println("\(status.text) \(photoIndex)")
                // 将数据传递给照片浏览器视图控制器
                // 使用类方法调用，不需要知道视图控制器太多的内部细节
                let vc = PhotoBrowserViewController.photoBrowserViewController()
                
                vc.urls = status.largeUrls
                vc.selectedIndex = photoIndex
                
                weakSelf?.presentViewController(vc, animated: true, completion: nil)
            }
        }
        
        cell.status = info.status
        
        return cell
    }
    
}
