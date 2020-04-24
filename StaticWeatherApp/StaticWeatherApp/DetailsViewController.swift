//
//  DetailsViewController.swift
//  StaticWeatherApp
//
//  Created by Yusuke on 2020/04/22.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing

        [
            ("Country", String(city.country.flagEmoji)),
            ("City", city.name),
            ("Temperature", String(format: "%.1f", city.temp)),
            ("Summary", city.summary),
            ("Precipitation", String(format: "%.1f", city.precipitation)),
        ].forEach { (title, content) in
            stackView.addArrangedSubview(UILabel(text: title, textAlignment: .center, textSize: 18, textWeight: .bold))
            stackView.addArrangedSubview(UILabel(text: content, textAlignment: .center, textSize: 21))
        }

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
