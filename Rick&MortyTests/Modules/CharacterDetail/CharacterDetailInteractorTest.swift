//
//  CharacterDetailInteractorTest.swift
//  Rick&MortyTests
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import XCTest
import Combine
@testable import Rick_Morty

final class CharacterDetailInteractorTest: XCTestCase {
    
    private var networkerMock: NetworkerMock!
    private var sut: CharacterDetailInteractorInterface!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        networkerMock = NetworkerMock()
        sut = CharacterDetailInteractor(networker: networkerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        networkerMock = nil
        sut = nil
    }
    
    func testGetEpisodeDetailSuccess() {
        let expectation = self.expectation(description: "EpisodeDetail")
        networkerMock.canResponseSuccess = true
        networkerMock.data = "EpisodeDetail".loadJson()
        sut.getEpisodesList(with: ["https://rickandmortyapi.com/api/episode/1"])
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
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testGetEpisodeDetailFailed() {
        let expectation = self.expectation(description: "EpisodeDetail")
        networkerMock.canResponseSuccess = false
        sut.getEpisodesList(with: ["https://rickandmortyapi.com/api/episode/1"])
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
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
