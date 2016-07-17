//
//  QiitaUserStatus.swift
//  ContributionGetter
//
//  Created by Jun on 2016/07/17.
//  Copyright © 2016年 Jun. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class QiitaUserStatus {
    
    class func getValues(id id: String) -> (contributions: String, followers: String, items: String)? {

        guard let url = NSURL(string: "http://qiita.com/\(id)") else {
            // 不正なURLの場合、nilを返す。
            return nil
        }

        guard let data = NSData(contentsOfURL: url) else {
            // 存在しないユーザの場合、nilを返す。
            return nil
        }
        
        guard let html = HTML(html: data, encoding: NSUTF8StringEncoding) else {
            // エンコードに失敗した場合、nilを返す。
            return nil
        }
        
        let values = html.css("span").filter{ $0["class"] == "userActivityChart_statCount" }.map{ $0.innerHTML! }
        
        if values.count == 0 {
            // ステータス取得に失敗した場合、nilを返す。
            return nil
        }
        return (contributions: values[0], followers: values[1], items: values[2])
    }
}