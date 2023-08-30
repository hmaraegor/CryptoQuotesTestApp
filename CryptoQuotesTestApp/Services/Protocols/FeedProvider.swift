import Foundation

protocol FeedProvider: AnyObject {
    func getData(completionHandler: @escaping (Result<FeedModel, NetworkError>) -> ())
}
