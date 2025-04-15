//
//  SelectAllTableViewCell.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import UIKit

class SelectAllCell: UITableViewCell {

    private let checkbox = UIImageView()
    private let titleLabel = UILabel()
    private let shareButton = UIButton()
    private let editButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        selectionStyle = .none

        checkbox.image = UIImage(systemName: "checkmark.circle.fill")
        checkbox.tintColor = UIColor(red: 0.69, green: 1.0, blue: 0.93, alpha: 1.0)

        titleLabel.text = "Select all"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)

        [checkbox, titleLabel, shareButton, editButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            checkbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 22),
            checkbox.heightAnchor.constraint(equalToConstant: 22),

            titleLabel.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 8),

            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            editButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            shareButton.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
            shareButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
