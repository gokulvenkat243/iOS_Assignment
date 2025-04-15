//
//  CartViewController.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class CartViewController: UIViewController {

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

    private let headerView: CartHeaderView = {
        let headerView: CartHeaderView = CartHeaderView()
        headerView.layer.masksToBounds = true
        headerView.layer.cornerRadius = 20
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    private lazy var contentTableView: CartContentView = {
        let contentView: CartContentView = CartContentView(viewModel: cartViewModel)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let checkoutButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.backgroundColor = UIColor(red: 0.83, green: 0.92, blue: 0.38, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(nil, action: #selector(checkoutmButtonTapped), for: .touchUpInside)
        return button
    }()

    private let homeViewModel: HomeViewModel
    private let cartViewModel: CartViewModel

    init(homeViewModel: HomeViewModel, cartViewModel: CartViewModel) {
        self.homeViewModel = homeViewModel
        self.cartViewModel = cartViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayout()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

        print("🧪 CartViewModel address: \(Unmanaged.passUnretained(cartViewModel).toOpaque())")

    }

    private func setupViews() {
        view.addSubviews(scrollView, checkoutButton)
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView, contentTableView)
    }

    private func setupLayout() {

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -70),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 190),

            contentTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            contentTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentTableView.heightAnchor.constraint(equalToConstant: 700),

            checkoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            checkoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            checkoutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkoutButton.heightAnchor.constraint(equalToConstant: 50),
            checkoutButton.bottomAnchor.constraint(equalTo: contentTableView.bottomAnchor)
        ])
    }

    private func bindViewModel() {
        DispatchQueue.main.async { [self] in
            contentTableView.tableReloadData()
            print("🌀 Cart updated, reloading table view")
            print(cartViewModel.productsInCart.count)
        }
    }

    @objc private func checkoutmButtonTapped() {
        let alert = UIAlertController(title: "Thank You", message: "Your order has been placed!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
