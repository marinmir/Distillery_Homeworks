//
//  ViewController.swift
//  Statham Quotes
//
//  Created by Мирошниченко Марина on 16.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "Jason Statham"))
    @IBOutlet private var quoteLabel: UILabel!

    //Вынесем цитаты в отдельный файл для улучшения читабельности кода.
    let quotes: [String] = {
        guard let path = Bundle.main.path(forResource: "Quotes", ofType: nil),
              let text = try? String(contentsOfFile: path, encoding: .utf8)
        else {
            return []
        }
        
        return text.split(separator: "\n").map { String($0) }
    }()

    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

// MARK: - Pivate
private extension ViewController {

    func setup() {
        //Если массив quotes окажется пустым приложение упадет если использвать quotes[0]
        quoteLabel?.text = quotes.first

        //scaleAspectFit пропорционально уменьшит картинку до размеров view в котором оно находится.
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 328.0),
            //view.safeAreaLayoutGuide.topAnchor: привязываем не к верху экрана а к нижней части NavigationBar вот статья на эту тему https://medium.com/yandex-maps-mobile/iphone-x-%D0%B8-%D1%82%D0%B0%D0%B9%D0%BD%D1%8B-safearea-1d2e76d15840
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44.0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22.0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22.0)
        ])
    }

    @IBAction func onOneMoreButton() {
        guard !quotes.isEmpty else {
            return
        }

        //Int.random кажется проще чем то что ты использовала до этого
        let index = Int.random(in: 0..<quotes.count)
        quoteLabel?.text = quotes[index]
    }

}
