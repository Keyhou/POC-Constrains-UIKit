//
//  Presenter.swift
//  POC Constrains UIKit
//
//  Created by Keyhan Mortezaeifar on 14/02/2024.
//

import Foundation

protocol FurnitureView: AnyObject {
    func displayFurniture(imageName: String, description: String)
}

protocol FurniturePresenterProtocol {
    func attachView(_ view: FurnitureView)
    func viewDidLoad()
    func tapToPrevious()
    func tapToNext()
}

class FurniturePresenter: FurniturePresenterProtocol {
    weak var view: FurnitureView?
    var furnitureIndex = 0
    
    let meubles = [
        Furniture(imageName: "i1", details: "Fauteuil élégant accompagné de son repose pieds jaune orangé"),
        Furniture(imageName: "i2", details: "Ce luminaire est tout simplement parfait pour sublimer votre table a manger ou un salon"),
        Furniture(imageName: "i3", details: "Chaise blanche de style scandinave"),
        Furniture(imageName: "i4", details: "Sofa vert en velour de couleur vert.")
    ]
    
    func attachView(_ view: FurnitureView) {
        self.view = view
    }
    
    func viewDidLoad() {
        updateFurnitureDisplay()
    }
    
    func tapToPrevious() {
        if furnitureIndex == 0 {
            furnitureIndex = meubles.count - 1
        } else {
            furnitureIndex -= 1
        }
        updateFurnitureDisplay()
    }
    
    func tapToNext() {
        if furnitureIndex == meubles.count - 1 {
            furnitureIndex = 0
        } else {
            furnitureIndex += 1
        }
        updateFurnitureDisplay()
    }
    
    private func updateFurnitureDisplay() {
        let currentFurniture = meubles[furnitureIndex]
        view?.displayFurniture(imageName: currentFurniture.imageName, description: currentFurniture.details)
    }
}
