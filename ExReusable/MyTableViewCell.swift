//
//  MyTableViewCell.swift
//  ExReusable
//
//  Created by Jake.K on 2021/12/09.
//

import UIKit
import Reusable
import SnapKit

final class MyTableViewCell: UITableViewCell, Reusable {
  // MARK: Constants
  private enum Metric {
    static let separatorHeight = 10.0
    static let gradientViewHeight = 200.0
  }
  
  // MARK: UI
  private let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 15)
  }
  
  // MARK: Initializers
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubviews()
    makeConstraints()
  }
  
  private func addSubviews() {
    self.contentView.addSubview(titleLabel)
  }
  
  private func makeConstraints() {
    self.titleLabel.snp.makeConstraints {
      $0.centerX.centerY.equalTo(self.contentView)
    }
  }
  
  func setupLabel(title: String) {
    titleLabel.text = title
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemeneted")
  }

}
