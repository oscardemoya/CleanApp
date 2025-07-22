import Testing
@testable import Presentation

@Test func loginForm_withEmptyFields_thenCanNotSubmit() async throws {
    let form = LoginFormModel(username: "", password: "")
    #expect(!form.canSubmit)
}

@Test func loginForm_withUsernameEmptyAndPasswordNotEmpty_thenCanNotSubmit() async throws {
    let form = LoginFormModel(username: "", password: "password")
    #expect(!form.canSubmit)
}

@Test func loginForm_withUsernameNotEmptyAndPasswordEmpty_thenCanNotSubmit() async throws {
    let form = LoginFormModel(username: "username", password: "")
    #expect(!form.canSubmit)
}

@Test func loginForm_withNoEmptyFields_thenCanSubmit() async throws {
    let form = LoginFormModel(username: "username", password: "password")
    #expect(form.canSubmit)
}
