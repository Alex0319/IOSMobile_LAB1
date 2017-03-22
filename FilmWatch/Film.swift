//
//  Film.swift
//  FilmWatch
//
//  Created by Admin on 05.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

struct Film {
    
    var title: String
    var poster: UIImage?
    var description: String
    
    init(title: String, photoPath: String, description:String) {
        self.title = title
        self.poster=UIImage(named: photoPath)
        self.description = description
    }
}
