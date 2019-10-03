//
//  AppInfoViewController.swift
//  GimmikStore
//
//  Created by Aleksei Cherepanov on 01/10/2019.
//  Copyright © 2019 Viyana. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    /// Application info view controller view constants
    struct Size {
        static let padding: CGFloat = 8
        struct CloseButton {
            static let height: CGFloat = 30
        }
        struct Image {
            static let height: CGFloat = 200
            static let topPadding: CGFloat = 65
        }
        struct Name {
            static let sidePadding: CGFloat = 35
            static let topPadding: CGFloat = 10
        }
        struct SubStack {
            static let height: CGFloat = 70
        }
        struct Price {
            static let height: CGFloat = 40
            static let sidePadding: CGFloat = 35
            static let bottomPadding: CGFloat = 14
        }
    }
    
    // MARK: - View Controller views
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var seller: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .mandy
        return label
    }()
    
    lazy var genre: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .mandy
        return label
           
    }()
    
    lazy var type: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .mandy
        return label
    }()
    
    /// Seller, Genre and Type views container
    lazy var subStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [seller, genre, type])
        stack.spacing = 6
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var desc: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var price: CircularButton = {
        let button = CircularButton(type: .system)
        button.addTarget(self, action: #selector(onPriceButtonPressed(_:)), for: .touchUpInside)
        button.tintColor = .mandy
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .mandy
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Size.CloseButton.height/2
        return button
    }()
    
    let transition = ModalTransition()
    
    // MARK: - Content models
    
    let gimmik: Gimmik
    
    // MARK: - Life cycle
    
    init(gimmik: Gimmik) {
        self.gimmik = gimmik
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = transition
        modalPresentationStyle = .custom
        preferredContentSize = CGSize(width: 300, height: 500)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        applyConstaints()
        applyContent()
    }
    
    func configureView() {
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
    }
    
    func applyConstaints() {
        for v: UIView in [closeButton, image, name, price, desc, subStack] {
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: Size.CloseButton.height),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Size.padding),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Size.padding),
            
            image.heightAnchor.constraint(equalToConstant: Size.Image.height),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: Size.Image.topPadding),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: Size.Name.topPadding),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Size.Name.sidePadding),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: Size.padding),
            desc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Size.padding),
            desc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //desc.heightAnchor.constraint(equalToConstant: Size.Description.height),
            
            subStack.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: Size.padding),
            subStack.leadingAnchor.constraint(equalTo: desc.leadingAnchor),
            subStack.trailingAnchor.constraint(equalTo: desc.trailingAnchor),
            subStack.heightAnchor.constraint(equalToConstant: Size.SubStack.height),
            
            price.topAnchor.constraint(equalTo: subStack.bottomAnchor, constant: Size.padding),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Size.Price.sidePadding),
            price.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            price.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Size.Price.bottomPadding),
            price.heightAnchor.constraint(equalToConstant: Size.Price.height),
        ])
    }
    
    /// Setup views content
    func applyContent() {
        name.text = gimmik.getName()
        seller.text = gimmik.sellerName
        image.kf.setImage(with: URL(string: gimmik.getImageIcon() ?? ""))
        desc.text = gimmik.getDescription()
        type.text = gimmik.getKind()
        genre.text = gimmik.primaryGenreName
        price.setTitle(gimmik.getPrice(), for: .normal)
    }
    
    // MARK: - Callback methods
    
    @objc
    func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    func onPriceButtonPressed(_ sender: UIButton) {
    }
}
