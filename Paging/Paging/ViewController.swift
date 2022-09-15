//
//  ViewController.swift
//  Paging
//
//  Created by 이주송 on 2022/09/15.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }

    func registerCell() {
        self.tableView.register(UINib(nibName: "examCellTableViewCell", bundle: nil), forCellReuseIdentifier: "examCellTableViewCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "examCellTableViewCell", for: indexPath) as? examCellTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}
