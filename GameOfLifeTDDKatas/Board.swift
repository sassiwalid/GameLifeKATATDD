//
//  Board.swift
//  GameOfLifeTDDKatas
//
//  Created by walid sassi on 2/24/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import Foundation
struct Board {
    var listOfCells = [Cell]()
    mutating func addCell(_ cell: Cell){
        listOfCells.append(cell)
    }
    func getNeighbours(_ cell:Cell)->[Cell]{
        var listNeighbours = [Cell]()
        if (listOfCells.count == 1){
            return [Cell]()
        }
        for element in listOfCells {
        //we check that the current element in 
        if (element != cell) {
            if abs(cell.x! - element.x!) <= 1 && abs(cell.y! - element.y!) <= 1 {
                listNeighbours.append(element)
            }
          }
        }
        return listNeighbours
    }
    func changeState(_ cell :inout Cell) {
        var numberOfLivedNumber = 0
        for neigbour in getNeighbours(cell){
            if neigbour.isLive == true {
                numberOfLivedNumber += 1
            }
        }
        if numberOfLivedNumber == 3 || numberOfLivedNumber == 2 {
            cell.isLive = true
        }else{
            cell.isLive = false
        }
    }
    
}
