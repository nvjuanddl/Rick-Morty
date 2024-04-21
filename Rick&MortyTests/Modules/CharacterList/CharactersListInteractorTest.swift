//
//  CharactersListInteractorTest.swift
//  Rick&MortyTests
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import XCTest
import Combine
@testable import Rick_Morty

final class CharactersListInteractorTest: XCTestCase {
    
    private var networkerMock: NetworkerMock!
    private var sut: CharactersListInteractorInterface!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        networkerMock = NetworkerMock()
        sut = CharactersListInteractor(networker: networkerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        networkerMock = nil
        sut = nil
    }
    
    func testGetCharactersListSuccess() {
        let expectation = self.expectation(description: "CharactersList")
        networkerMock.canResponseSuccess = true
        networkerMock.data = "CharactersList".loadJson()
        sut.getCharactersList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Unexpected completion: \(error)")
                    expectation.fulfill()
                }
            }, receiveValue: { urls in
                XCTAssert(!urls.isEmpty)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetCharactersListFailed() {
        let expectation = self.expectation(description: "CharactersList")
        networkerMock.canResponseSuccess = false
        sut.getCharactersList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTAssert(!error.localizedDescription.isEmpty)
                    expectation.fulfill()
                }
            }, receiveValue: { urls in
                XCTFail("Unexpected completion: \(urls)")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
