//
//  CategoryCollectionViewCell.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let imageBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 35
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 50/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .center
        label.text = "Helo"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        self.applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            imageBackgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            imageBackgroundView.widthAnchor.constraint(equalToConstant: 70),
            
            iconImageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ])
    }
    
    func configure(data: ProductData) {
        titleLabel.text = data.category
        iconImageView.loadImage(imageUrl: data.image)
    }
}
