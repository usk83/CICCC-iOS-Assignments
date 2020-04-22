//
//  ViewController.swift
//  AutoLayout
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()

    let orangeBox1: UIView = {
        let orange = UIView(frame: CGRect.zero)
        orange.translatesAutoresizingMaskIntoConstraints = false
        orange.backgroundColor = .orange
        return orange
    }()

    let orangeBox2: UIView = {
        let orange = UIView(frame: CGRect.zero)
        orange.translatesAutoresizingMaskIntoConstraints = false
        orange.backgroundColor = .orange
        return orange
    }()

    var orangeBoxStackView: UIStackView!

    let purpleBox: UIView = {
       let purple = UIView(frame: CGRect.zero)
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
        return purple
    }()

    let blueBox1: UIView = {
        let blue = UIView(frame: CGRect.zero)
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.backgroundColor = .blue
        return blue
    }()

    let blueBox2: UIView = {
        let blue = UIView(frame: CGRect.zero)
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.backgroundColor = .blue
        return blue
    }()

    let blueBox3: UIView = {
        let blue = UIView(frame: CGRect.zero)
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.backgroundColor = .blue
        return blue
    }()

    var blueBoxStackView: UIStackView!

    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()

    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()

    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()

    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
    }

    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true

        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true

        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually

        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])

        orangeBoxStackView = UIStackView(arrangedSubviews: [orangeBox1, orangeBox2])
        orangeBoxStackView.translatesAutoresizingMaskIntoConstraints = false
        orangeBoxStackView.axis = .horizontal
        orangeBoxStackView.spacing = 10
        orangeBoxStackView.isLayoutMarginsRelativeArrangement = true
        orangeBoxStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        mainView.addSubview(orangeBoxStackView)

        let orangeBoxStackViewBackground = UIView(frame: CGRect.zero)
        orangeBoxStackViewBackground.backgroundColor = .red
        orangeBoxStackViewBackground.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        orangeBoxStackView.insertSubview(orangeBoxStackViewBackground, at: 0)

        NSLayoutConstraint.activate([
            orangeBoxStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            orangeBoxStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            orangeBox1.heightAnchor.constraint(equalToConstant: 30),
            orangeBox1.widthAnchor.constraint(equalToConstant: 70),
            orangeBox2.heightAnchor.constraint(equalTo: orangeBox1.heightAnchor),
            orangeBox2.widthAnchor.constraint(equalToConstant: 50),
            ])

        mainView.addSubview(purpleBox)
        NSLayoutConstraint.activate([
            purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            purpleBox.heightAnchor.constraint(equalToConstant: 50),
            purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
            ])

        blueBoxStackView = UIStackView(arrangedSubviews: [blueBox1, blueBox2, blueBox3])
        blueBoxStackView.translatesAutoresizingMaskIntoConstraints = false
        blueBoxStackView.axis = .vertical
        blueBoxStackView.alignment = .center
        blueBoxStackView.distribution = .equalSpacing
        mainView.addSubview(blueBoxStackView)

        NSLayoutConstraint.activate([
            blueBoxStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7),
            blueBoxStackView.widthAnchor.constraint(equalToConstant: 50),
            blueBoxStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            blueBoxStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            blueBox1.heightAnchor.constraint(equalTo: blueBoxStackView.widthAnchor),
            blueBox1.widthAnchor.constraint(equalTo: blueBox1.heightAnchor),
            blueBox2.heightAnchor.constraint(equalTo: blueBox1.heightAnchor),
            blueBox2.widthAnchor.constraint(equalTo: blueBox2.heightAnchor),
            blueBox3.heightAnchor.constraint(equalTo: blueBox1.heightAnchor),
            blueBox3.widthAnchor.constraint(equalTo: blueBox3.heightAnchor),
            ])
    }

    @objc fileprivate func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc fileprivate func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc fileprivate func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}
