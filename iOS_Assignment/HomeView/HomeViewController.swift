//
//  ViewController.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class HomeViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var headerView: HomeHeaderView = {
        let view: HomeHeaderView = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var footerView: HomeFooterView = {
        let view: HomeFooterView = HomeFooterView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()

    private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.setupUI()
        self.setupConstraints()
        viewModel.fetchHomeData()
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView, footerView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -70),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 260),
            
            footerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 550),
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
