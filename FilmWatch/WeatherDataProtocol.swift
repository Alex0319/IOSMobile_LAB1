//
//  WeatherProtocol.swift
//  FilmWatch
//
//  Created by Admin on 06.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

protocol WeatherDataProtocol {
    func reloadAfter()
    func showError(errorString: String)    
}
