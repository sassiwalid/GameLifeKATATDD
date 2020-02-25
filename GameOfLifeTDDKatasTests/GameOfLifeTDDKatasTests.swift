//
//  GameOfLifeTDDKatasTests.swift
//  GameOfLifeTDDKatasTests
//
//  Created by walid sassi on 2/24/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import XCTest
@testable import GameOfLifeTDDKatas

class GameOfLifeTDDKatasTests: XCTestCase {
    var sut = Board()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func test_SingleCell_ShouldHave_Zero_Neighbours() {
        //given
        let cell = Cell(x: 0, y: 0, isLive: true)
        //when
        sut.addCell(cell)
        //then
        XCTAssert(sut.getNeighbours(cell).count == 0,"It should be equal to one")
    }
    func test_two_cells_next_to_Each_Other_should_be_neighbours() {
        //given
        let cell1 = Cell(x: 0, y: 0, isLive: true)
        let cell2 = Cell(x: 1, y: 1, isLive: true)
        //when
        sut.addCell(cell1)
        sut.addCell(cell2)
        //then
        XCTAssert(sut.getNeighbours(cell1).count == 1, "It should have cell2 as Neighbour")
        
    }
    func test_two_Far_cells_should_have_zero_neighbours() {
        //giventrue
        let cell1 = Cell(x: 0, y: 0, isLive: true)
        let cell2 = Cell(x: 100, y: 100, isLive: true)
        //when
        sut.addCell(cell1)
        sut.addCell(cell2)
        //then
        XCTAssert(sut.getNeighbours(cell1).count == 0, "It shouldidn't have cell2 as Neighbour")
    }
    func test_Died_Cell_WIth_Three_Live_neighbours_Should_Will_Be_Live () {
        //given
        var cellDied = Cell (x: 0, y: 0, isLive:false)
        let cellLive1 = Cell (x: 0, y: 1,isLive:true)
        let cellLive2 = Cell (x: 1, y: 0, isLive:true)
        let cellLive3 = Cell (x: 1, y: 1, isLive:true)
        sut.addCell(cellDied)
        sut.addCell(cellLive1)
        sut.addCell(cellLive2)
        sut.addCell(cellLive3)
        //when
        sut.changeState(&cellDied)
        //then
        XCTAssertTrue(cellDied.isLive!, "It should be live now")
    }
    func test_Live_Cell_Keep_Live_When_It_Has_Two_Neighbours_Lives () {
        var cellLive0 = Cell (x: 0, y: 0, isLive:true)
        let cellLive1 = Cell (x: 0, y: 1, isLive:false)
        let cellLive2 = Cell (x: 1, y: 0, isLive:true)
        let cellLive3 = Cell (x: 1, y: 1, isLive:true)
        sut.addCell(cellLive0)
        sut.addCell(cellLive1)
        sut.addCell(cellLive2)
        sut.addCell(cellLive3)
        //when
        sut.changeState(&cellLive0)
        XCTAssertTrue(cellLive0.isLive!, "It should keep live")
    }
    func test_Live_Cell_Must_Died_When_It_Has_More_Two_Neighbours_Lives () {
        var cellLive0 = Cell (x: 0, y: 0, isLive:true)
        let cellLive1 = Cell (x: 0, y: 1, isLive:false)
        let cellLive2 = Cell (x: 1, y: 0, isLive:true)
        let cellLive3 = Cell (x: 1, y: 1, isLive:true)
        sut.addCell(cellLive0)
        sut.addCell(cellLive1)
        sut.addCell(cellLive2)
        sut.addCell(cellLive3)
        //when
        sut.changeState(&cellLive0)
        XCTAssertTrue(cellLive0.isLive!, "It should keep live")
    }

}
