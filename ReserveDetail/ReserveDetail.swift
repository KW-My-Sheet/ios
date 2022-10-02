//
//  ReserveDetail.swift
//  Warning
//
//  Created by 이주송 on 2022/09/25.
//

import UIKit

class ReserveDetail: UIViewController {

    var GetReserve = getReserve ()
    var MyReserveDataModel = MyReserveModel ()
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        return button
    }()
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyReserveCells", bundle: .main), forCellReuseIdentifier: "MyReserveCells")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.title = "내 예약정보"
        self.getReserveDetail()
        self.tableView.reloadData()
    }
    
    func getReserveDetail() {
        self.GetReserve.getReserve(token: UserDevice.Token ?? "" , onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
                print("\(result.data.roomNum)열람실 \(result.data.sheetNum)번을 예약하셨습니다.")
                self.MyReserveDataModel.inputData(room: result.data.roomNum, sheet_num: result.data.sheetNum)
                
                print(self.MyReserveDataModel.getRoomNumber(index: 0))
                print(self.MyReserveDataModel.getSheetNum(index: 0))
                           
                self.tableView.reloadData()
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}

extension ReserveDetail: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.MyReserveDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyReserveCells", for: indexPath) as? MyReserveCells else { return UITableViewCell() }
        
        var cellRoomNumber = self.MyReserveDataModel.getRoomNumber(index: indexPath.row)
        var cellSheetNumber = self.MyReserveDataModel.getSheetNum(index: indexPath.row)
        
        cell.roomLabel.text = "제 \(cellRoomNumber)열람실"
        cell.sheetNumLabel.text = "\(cellSheetNumber)번"
            
        switch cellRoomNumber {
        case 1:
            cell.roomImage.image = UIImage(named: "001_Color.png")
        case 2:
            cell.roomImage.image = UIImage(named: "002_Color.png")
        case 3:
            cell.roomImage.image = UIImage(named: "003_Color.png")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}
