//
//  ViewController.swift
//  Paging
//
//  Created by 이주송 on 2022/09/15.
//
import UIKit

class ViewController: UIViewController {

    var label: [String] = ["김씨_0","이씨_0","황씨_0","강씨_0","최씨_0",
                           "김씨_1","이씨_1","황씨_1","강씨_1","최씨_1",
                           "김씨_2","이씨_2","황씨_2","강씨_2","최씨_2",
                           "김씨_3","이씨_3","황씨_3","강씨_3","최씨_3"]
    
    var number: [String] = ["1_0","2_0","3_0","4_0","5_0",
                          "1_1","2_1","3_1","4_1","5_1",
                          "1_2","2_2","3_2","4_2","5_2",
                          "1_3","2_3","3_3","4_3","5_3"]
    
    var fetchingMore = false
    
    var dataListModel = DataListModel ()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.registerCell()
        self.initData()
    }

    func registerCell() {
        self.tableView.register(UINib(nibName: "examCellTableViewCell", bundle: nil), forCellReuseIdentifier: "examCellTableViewCell")
    }

    func initData() {
        for i in 0..<self.label.count {
            self.dataListModel.inputData(cellLabel: self.label[i], cellNumber: self.number[i])
        }
        print(self.dataListModel.count)
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "examCellTableViewCell", for: indexPath) as? examCellTableViewCell else { return UITableViewCell() }
        
        cell.cellLabel.text = self.dataListModel.getLabel(index: indexPath.row)
        cell.cellNumber.text = self.dataListModel.getNumber(index: indexPath.row)
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height
        {
            if !fetchingMore
            {
                print("Paging On")
            }
        }
    }
    
}
