//
//  ViewController.swift
//  ExReusable
//
//  Created by Jake.K on 2021/12/09.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
  
  private let dataSource = [1, 2, 3, 4, 5, 6, 7, 8].map { String($0) }
  
  private let tableView = UITableView().then {
    $0.separatorStyle = .none
    $0.bounces = false
//    $0.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
    $0.register(cellType: MyTableViewCell.self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    tableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    dataSource.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as MyTableViewCell
    cell.setupLabel(title: dataSource[indexPath.row])
    return cell
  }
}
