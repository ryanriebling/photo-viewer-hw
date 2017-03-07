//
//  ImageManager.swift
//  ImagesFramework
//
//  Created by Ryan Riebling on 3/6/17.
//  Copyright © 2017 Ryan Riebling. All rights reserved.
//

import Foundation

public class ImageManager {

    public init() {}

    let imageNames = ["8bitChief", "chiefCartoon", "Halo_Master_Chief_Blue", "master_chief_chibi", "masterChef", "mastercheif_chibi2"]

    public func getImage(name: String, imageClosure: (_ image: UIImage?) -> ()) {
        if !imageNames.contains(name) {
            imageClosure(nil)
        }
        imageClosure(UIImage(named: name))
    }

    public func getAllImageNames() -> [String] {
        return imageNames
    }
}
