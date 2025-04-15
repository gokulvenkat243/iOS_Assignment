//
//  ProductDetailsViewController.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class ProductDetailViewController: UIViewController, GetActionToHearchButton, GetActionToAddCartButton {

    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()

    private lazy var headerView: ProductDetailsHeaderView = {
        let view: ProductDetailsHeaderView = ProductDetailsHeaderView(viewModel: viewModel, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()

    private lazy var bottomView: ProductDetailsBottomView = {
        let view: ProductDetailsBottomView = ProductDetailsBottomView(viewModel: viewModel, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()

    private var viewModel: HomeViewModel
    private var cartViewModel: CartViewModel

    init(viewModel: HomeViewModel, cartViewModel: CartViewModel) {
        self.viewModel = viewModel
        self.cartViewModel = cartViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.setupViews()
        self.applyConstraints()
        self.bindViewModel()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView, bottomView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func applyConstraints() {
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
            headerView.heightAnchor.constraint(equalToConstant: 450),

            bottomView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }

    private func bindViewModel() {
        self.viewModel.updateProductDetailsData = { [self] result in
            headerView.bindViewModel(data: result)
            bottomView.bindViewModel(data: result)
        }
    }

    private func cartItemAction() {
        guard let product = viewModel.productDetailsData else { return }
        if cartViewModel.isInCart(product) {
            cartViewModel.removeFromCart(product)
            showToast("Removed from Cart ❤️")
        } else {
            cartViewModel.addToCart(product)
            showToast("Added to Cart ❤️")
        }
        updateHeartIcon()
        print(product.image)
    }

    func tapAction() {
        self.cartItemAction()
    }

    func tapHeartButton() {
        self.cartItemAction()
    }

    func updateHeartIcon() {
        guard let item = viewModel.productDetailsData else { return }
        let isInCart = cartViewModel.isInCart(item)
        let icon = UIImage(systemName: isInCart ? "heart.fill" : "heart")
        headerView.setHeartIcon(icon)
    }

    func showToast(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            alert.dismiss(animated: true)
        }
    }
}
