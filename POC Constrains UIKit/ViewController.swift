//
//  ViewController.swift
//  POC Constrains UIKit
//
//  Created by Keyhan Mortezaeifar on 12/02/2024.
//

import UIKit

class ViewController: UIViewController, FurnitureView {
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: FurniturePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = FurniturePresenter()
        presenter.attachView(self)
        presenter.viewDidLoad()
    }
    
    func displayFurniture(imageName: String, description: String) {
        imageView.image = UIImage(named: imageName)
        imageDescription.text = description
    }

    @IBAction func tapToPrevious(_ sender: Any) {
        presenter.tapToPrevious()
    }
    
    @IBAction func tapToNext(_ sender: Any) {
        presenter.tapToNext()
    }
}

