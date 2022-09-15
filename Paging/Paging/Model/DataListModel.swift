//
//  DataListModel.swift
//  Paging
//
//  Created by 이주송 on 2022/09/15.
//

class DataListModel {
    
    public var dataListsStruct: [DataLists] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return dataListsStruct.count
    }
    
    // MARK: - func
    
    public func getLabel(index: Int) -> String {
        return dataListsStruct[index].label ?? ""
    }
    
    public func getNumber(index: Int) -> String {
        return dataListsStruct[index].number ?? ""
    }

    public func inputData(cellLabel:String, cellNumber:String) {
        self.dataListsStruct.append(DataLists(label: cellLabel, number: cellNumber))
    }

}
