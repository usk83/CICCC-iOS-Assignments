//
//  SnackTableViewController.swift
//  Snacks
//
//  Created by Yusuke on 2020/05/13.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class SnackImageView: UIImageView {
    var snack: Snack?

    override init(image: UIImage?) {
        super.init(image: image)
    }

    convenience init(snack: Snack) {
        self.init(image: UIImage(named: snack.imageName))
        self.snack = snack
        self.isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Snack: CustomStringConvertible {
    case oreos, pizzaPockets, popTarts, popsicle, ramen
    var description: String {
        switch self {
        case .oreos: return "Oreos"
        case .pizzaPockets: return "Pizza Pockets"
        case .popTarts: return "Pop Tarts"
        case .popsicle: return "Popsicle"
        case .ramen: return "Ramen"
        }
    }
    var imageName: String {
        switch self {
        case .oreos: return "oreos"
        case .pizzaPockets: return "pizza_pockets"
        case .popTarts: return "pop_tarts"
        case .popsicle: return "popsicle"
        case .ramen: return "ramen"
        }
    }
    static let allItems: [Snack] = [.oreos, .pizzaPockets, .popTarts, .popsicle, .ramen]
}

fileprivate let defaultGreyColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)

class SnackTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let cellId = "cell"
    var snacks: [Snack] = []

    let navBar: UIView = {
        let nb = UIView()
        nb.translatesAutoresizingMaskIntoConstraints = false
        nb.backgroundColor = defaultGreyColor
        nb.layer.zPosition = 1
        return nb
    }()

    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "SNACKS"
        return tl
    }()

    let addButton: UIButton = {
        let ab = UIButton(type: .system)
        ab.translatesAutoresizingMaskIntoConstraints = false
        ab.setTitle("＋", for: .normal)
        ab.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        return ab
    }()

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.spacing = 4.0
        sv.isHidden = true
        return sv
    }()

    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    var titleLabelCenterYAnchor: NSLayoutConstraint!
    var navBarHeightAnchor: NSLayoutConstraint!
    var navBarIsOpened = false

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.addTarget(self, action: #selector(openNavBar), for: .touchUpInside)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        view.addSubview(navBar)
        navBar.addSubview(titleLabel)
        titleLabelCenterYAnchor = titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor)
        navBar.addSubview(addButton)
        for snack in Snack.allItems {
            let snackImage = SnackImageView(snack: snack)
            snackImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addSnack)))
            stackView.addArrangedSubview(snackImage)
        }
        navBar.addSubview(stackView)
        view.addSubview(tableView)

        navBarHeightAnchor = navBar.heightAnchor.constraint(equalTo: topLayoutGuide.heightAnchor, constant: 44)

        NSLayoutConstraint.activate([
            navBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBarHeightAnchor,
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            titleLabelCenterYAnchor,
            addButton.centerYAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 22),
            addButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -4),
            stackView.widthAnchor.constraint(equalTo: navBar.widthAnchor, multiplier: 0.9),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            stackView.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

    @objc func openNavBar() {
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: [], animations: {
            if self.navBarIsOpened {
                self.navBarHeightAnchor.constant = 44
                self.titleLabel.text = "SNACKS"
                self.titleLabelCenterYAnchor.constant = 0.0
                self.addButton.transform = .identity
            } else {
                self.navBarHeightAnchor.constant = 200
                self.titleLabel.text = "Add a SNACK"
                self.titleLabelCenterYAnchor.constant = -40.0
                let rotationTransform = CGAffineTransform(rotationAngle: .pi / 4)
                self.addButton.transform = rotationTransform
            }
            self.navBarIsOpened = !self.navBarIsOpened
            self.stackView.isHidden = !self.navBarIsOpened
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    @objc func addSnack(_ recognizer: UITapGestureRecognizer) {
        guard let sender = recognizer.view as? SnackImageView, let snack = sender.snack else { return }
        snacks.append(snack)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }

    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = String(describing: snacks[snacks.count - 1 - indexPath.row])
        return cell
     }
}
