// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that adds properties of a given set of protocols to be injected by its init method. For example:
///
///     @Injectable<RemoteDataSourceConfig>
///     public struct DataSourceFactory {
///     }
///
/// produces:
///
///     public struct DataSourceFactory {
///         private let remoteDataSourceConfig: RemoteDataSourceConfig
///
///         public init(remoteDataSourceConfig: RemoteDataSourceConfig) {
///             self.remoteDataSourceConfig = remoteDataSourceConfig
///         }
///     }
///
@attached(member, names: arbitrary)
public macro Injectable<T>() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "InjectableMacro"
)

/// A macro that adda configuration property and its init method. For example:
///
///     @Configurable<RemoteDataSourceConfig>
///     final class DefaultAuthDataSource: AuthDataSource {
///     }
///
/// produces:
///
///     final class DefaultAuthDataSource: AuthDataSource {
///         let configuration: RemoteDataSourceConfig
///
///         public init(configuration: RemoteDataSourceConfig) {
///             self.configuration = configuration
///         }
///     }
///
@attached(member, names: arbitrary)
public macro Configurable<T>() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "ConfigurableMacro"
)

/// A macro that produces factory method of datasources for the clean architecture boilerplate.
/// If no concrete datasource implementation is specified it will return an instance of a datasource
/// named with the 'DefaultRemote' suffix. For example:
///
///     public struct DataSourceFactory {
///         let remoteDataSourceConfig: RemoteDataSourceConfig
///
///         #MakeDataSource<any AuthDataSource, RemoteDataSourceConfig>()
///     }
///
/// produces:
///
///     public struct DataSourceFactory {
///         let remoteDataSourceConfig: RemoteDataSourceConfig
///
///         func makeAuthDataSource() -> any AuthDataSource {
///             return DefaultAuthDataSource(configuration: remoteDataSourceConfig)
///         }
///     }
///
@freestanding(declaration, names: arbitrary)
public macro MakeDataSource<T, U>() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "MakeDataSourceMacro"
)

/// A macro that produces factory method of repositories for the clean architecture boilerplate.
/// If no concrete repository implementation is specified it will return an instance of a repository
/// named with the 'Default' suffix. For example:
///
///     struct RepositoryFactory {
///         private let dataSourceFactory: DataSourceFactory
///
///         public init(dataSourceFactory: DataSourceFactory) {
///             self.dataSourceFactory = dataSourceFactory
///         }
///
///         #MakeRepository<AuthRepository>()
///     }
///
/// produces:
///
///     struct RepositoryFactory {
///         private let dataSourceFactory: DataSourceFactory
///
///         public init(dataSourceFactory: DataSourceFactory) {
///             self.dataSourceFactory = dataSourceFactory
///         }
///
///         public func makeAuthRepository() -> AuthRepository {
///             let dataSource = dataSourceFactory.makeAuthDataSource()
///             DefaultAuthRepository(dataSource: dataSource)
///         }
///     }
///
@freestanding(declaration, names: arbitrary)
public macro MakeRepository<T>(_ type: Any.Type? = nil) = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "MakeRepositoryMacro"
)

/// A macro that produces factory method of use cases for the clean architecture boilerplate.
/// A list of repository protocols joined by '&' should be passed in the generic clause
/// and the name of the protocol of the use case must be pass as parameter. For example:
///
///     struct UseCaseFactory {
///         #MakeUseCase<AuthRepository & ProfileRepository, LoginUseCase>()
///     }
///
/// produces:
///
///     struct UseCaseFactory {
///         public static func makeLoginUseCase() -> LoginUseCase {
///             let authRepository = RepositoryFactory.makeAuthRepository()
///             let profileRepository = RepositoryFactory.makeProfileRepository()
///             return LoginUseCase(authRepository: authRepository, profileRepository: profileRepository)
///         }
///     }
///
@freestanding(declaration, names: arbitrary)
public macro MakeUseCase<T, U>() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "MakeUseCaseMacro"
)

/// A macro that produces an init for the use cases of a service class using the factory use case container.
/// Additionally, it creates a shared instance for this class. For example:
///
///     @AppService
///     final class ProfileService: @unchecked Sendable, ObservableObject {
///         private var fetchCurrentUserUseCase: FetchCurrentUserUseCase
///     }
///
/// produces:
///
///     final class ProfileService: @unchecked Sendable, ObservableObject {
///         private var fetchCurrentUserUseCase: FetchCurrentUserUseCase
///
///         static let shared = ProfileService()
///
///         private init() {
///             self.fetchCurrentUserUseCase = UseCaseFactory.makeFetchCurrentUserUseCase()
///         }
///     }
///
@attached(member, names: named(shared), named(init))
public macro AppService<T>() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "AppServiceMacro"
)

/// A macro that produces an init for the app services of a service container class and initializes
/// a property of UseCaseFactory. Additionally, it creates a view modifier, For example:
///
///     @ServiceContainer
///     final class ServiceContainer: ServiceProvider {
///         let authService: AuthService
///         let profileService: ProfileService
///     }
///
/// produces:
///
///     final class ServiceContainer: ServiceProvider {
///         let authService: AuthService
///         let profileService: ProfileService
///         let useCaseFactory = UseCaseFactory()
///
///         init(environment: AppEnvironment) {
///             self.authService = DefaultAuthService(useCaseFactory: useCaseFactory)
///             self.profileService = DefaultProfileService(useCaseFactory: useCaseFactory)
///         }
///     }
///
///     struct ServiceContainerModifier: ViewModifier {
///         let serviceContainer = ServiceContainer(environment: .current)
///
///         func body(content: Content) -> some View {
///         content
///             .environment(\\.authService, serviceContainer.authService)
///             .environment(\\.profileService, serviceContainer.profileService)
///         }
///     }
///
@attached(member, names: named(useCaseFactory), named(init))
@attached(peer, names: named(serviceContainer), named(ServiceContainerModifier))
public macro ServiceContainer() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "ServiceContainerMacro"
)

/// A macro that produces conversion methods for a data model to its corresponding domain entity.
/// Adds `asDomainEntity` computed property a default init and an `init(entity:)` initializer. For example:
///
///     @ModelConvertible
///     struct LoginCredentialsData {
///         @Convertible(key: "username")
///         let email: String
///         let password: String
///     }
///
/// produces:
///
///     struct LoginCredentialsData {
///         let email: String
///         let password: String
///
///         var asDomainEntity: LoginCredentials {
///             .init(
///                 username: email,
///                 password: password
///             )
///         }
///
///         init(email: String, password: String) {
///             self.email = email
///             self.password = password
///         }
///
///         init(entity: LoginCredentials) {
///             self.init(
///                 email: entity.username,
///                 password: entity.password
///             )
///         }
///     }
///
@attached(member, names: named(asDomainEntity), named(init), named(init(entity:)))
public macro ModelConvertible() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "ModelConvertibleMacro"
)

/// Marks a property for custom mapping between Data and Domain models
/// when used in a model marked with `@ModelConvertible`.
@attached(peer)
public macro Convertible(key: String) = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "ConvertibleMacro"
)

/// A macro that produces a default initializer for Domain models (Entities). For example:
///
///     @Entity
///     struct LoginCredentials {
///         let email: String
///         let password: String
///     }
///
/// produces:
///
///     struct LoginCredentials {
///         let email: String
///         let password: String
///
///         init(email: String, password: String) {
///             self.email = email
///             self.password = password
///         }
///     }
///
@attached(member, names: named(init))
public macro Entity() = #externalMacro(
    module: "CleanArchitectureMacros",
    type: "EntityMacro"
)
