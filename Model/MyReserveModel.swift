//
//  MyReserveModel.swift
//  Warning
//
//  Created by 이주송 on 2022/10/02.
//

import Foundation

class MyReserveModel {
    
    public var myReserveStc: [MyReserveStc] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return myReserveStc.count
    }
    
    // MARK: - func
    
    public func getRoomNumber(index: Int) -> Int {
        return myReserveStc[index].room ?? 999
    }
    
    public func getSheetNum(index: Int) -> Int {
        return myReserveStc[index].sheet_num ?? 999
    }
    
    public func inputData(room:Int, sheet_num:Int) {
        self.myReserveStc.append(MyReserveStc(room: room, sheet_num: sheet_num))
    }
                                 
}
