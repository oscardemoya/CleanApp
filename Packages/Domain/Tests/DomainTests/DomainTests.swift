import XCTest
@testable import Domain

final class DomainTests: XCTestCase {
    struct PaginationParametersMock: PaginationParameters {
        var offset: Int
        var limit: Int
    }
    
    func testFetchPostsUseCase_whenSuccessfullyFetchesPostsFromPage_shouldReturnAListOfPosts() async throws {
        // given
        let repository = PostsRepositorySuccessMock()
        let useCase = FetchPostsUseCase(repository: repository)
        
        // when
        let page = PaginationParametersMock(offset: 20, limit: 10)
        let requestValue = FetchPostsUseCase.RequestValue(page: page)
        let posts = try await useCase.execute(requestValue: requestValue)
        
        // then
        XCTAssertGreaterThan(posts.posts.count, 0)
    }
    
    func testFetchPostsUseCase_whenFailsFetchingPostsFromPage_thenAnErrorIsThrown() async throws {
        // given
        let repository = PostsRepositoryFailureMock()
        let useCase = FetchPostsUseCase(repository: repository)
        
        // when
        let page = PaginationParametersMock(offset: 20, limit: 10)
        let requestValue = FetchPostsUseCase.RequestValue(page: page)
        
        // then
        await XCTAssertThrowsError(_ = try await useCase.execute(requestValue: requestValue))
    }
    
    func testFetchPostsUseCase_whenFetchesAnInvalidPage_shouldReturnAnEmptyList() async throws {
        // given
        let repository = PostsRepositoryEmptyMock()
        let useCase = FetchPostsUseCase(repository: repository)
        
        // when
        let page = PaginationParametersMock(offset: 1000, limit: 10)
        let requestValue = FetchPostsUseCase.RequestValue(page: page)
        let posts = try await useCase.execute(requestValue: requestValue)
        
        // then
        XCTAssertEqual(posts.posts.count, 0)
    }
}
