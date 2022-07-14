//
//  NetworkService.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 08.07.2022.
//

import Foundation

final class NetworkService{

    lazy var mySession = URLSession(configuration: configuration)
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        return config
    }()
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        return constructor
    }()
    
    func getFriends(completion: @escaping (Result<[UserItems],Error>) -> Void) {
            var constructor = self.urlConstructor
        constructor.path = "/method/friends.get"
        constructor.queryItems = [
            URLQueryItem(name: "access_token",
                         value: "\(UserDefaults.standard.value(forKey: "vkToken") ?? "")"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "fields", value: "photo_100")
        ]
    guard
        let url = constructor.url
    else { return }
            let task = self.mySession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            do {
                let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                completion(.success(userResponse.users.items))
                print(userResponse)
            } catch {
                completion(.failure(error))
            }
        }
            task.resume()
        }
    
    func getGroups(completion: @escaping (Swift.Result<[GroupsItems],Error>) -> Void) {
    urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token",
                         value: "\(UserDefaults.standard.value(forKey: "vkToken") ?? "")"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "photo_100")
        ]
    guard
        let url = urlConstructor.url
    else { return }
        let task = mySession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            do {
                let groupsResponse = try JSONDecoder().decode(GroupsResponse.self, from: data)
                completion(.success(groupsResponse.groups.items))
                print(groupsResponse)
            } catch {
                completion(.failure(error))
            }
        }
            task.resume()
        }

    func getPhotos(ownerID: Int?, completion: @escaping (Swift.Result<[PhotosItems],Error>) -> Void) {
        var constructor = self.urlConstructor
    constructor.path = "/method/photos.get"
    constructor.queryItems = [
        URLQueryItem(name: "access_token",
                     value: "\(UserDefaults.standard.value(forKey: "vkToken") ?? "")"),
        URLQueryItem(name: "owner_id", value: "\(ownerID!)"),
        URLQueryItem(name: "v", value: "5.131"),
        URLQueryItem(name: "rev", value: "1"),
        URLQueryItem(name: "album_id", value: "profile")
    ]
guard
    let url = constructor.url
else { return }
        let task = self.mySession.dataTask(with: url) { data, response, error in
        if let response = response as? HTTPURLResponse {
            print(response.statusCode)
        }
        guard
            error == nil,
            let data = data
        else { return }
        do {
            let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: data)
            completion(.success(photosResponse.photos.items))
        } catch {
            completion(.failure(error))
        }
    }
        task.resume()
    }
    
//    func getSearchGroups(searchText: String, completion: @escaping (Swift.Result<[GroupsItems],Error>) -> Void) {
//    urlConstructor.path = "/method/groups.search"
//        urlConstructor.queryItems = [
//            URLQueryItem(name: "access_token",
//                         value: "\(UserDefaults.standard.value(forKey: "vkToken") ?? "")"),
//            URLQueryItem(name: "v", value: "5.131"),
//            URLQueryItem(name: "sort", value: "6"),
//            URLQueryItem(name: "count", value: "20"),
//            URLQueryItem(name: "q", value: searchText)
//        ]
//    guard
//        let url = urlConstructor.url
//    else { return }
//        let task = mySession.dataTask(with: url) { data, response, error in
//            if let response = response as? HTTPURLResponse {
//                print(response.statusCode)
//            }
//            guard
//                error == nil,
//                let data = data
//            else { return }
//            do {
//                let groupsResponse = try JSONDecoder().decode(GroupsResponse.self, from: data)
//                completion(.success(groupsResponse.groups.items))
//                print(groupsResponse)
//            } catch {
//                completion(.failure(error))
//            }
//        }
//            task.resume()
//        }
//    
//    func urlConstructorForNews() {
//        
//    }
    
//    func getNews(completion: @escaping ([NewsItems]) -> Void, onError: @escaping (Error) -> Void) {
//
//            urlConstructor.path = "/method/newsfeed.get"
//                urlConstructor.queryItems = [
//                    URLQueryItem(name: "access_token", value: UserSession.instance.token),
//                    URLQueryItem(name: "v", value: "5.131"),
//                    URLQueryItem(name: "filters", value: "post"),
//                    URLQueryItem(name: "max_photos", value: "9"),
//                    URLQueryItem(name: "count", value: "10")
//                ]
//        guard let url = urlConstructor.url else { return }
//        let task = mySession.dataTask(with: url) { data, response, error in
//
//            if error != nil {
//                onError(AppError.errorTask)
//            }
//
//            guard let data = data else {
//                onError(AppError.noDataProvided)
//                return
//            }
//            guard var news = try? JSONDecoder().decode(NewsResponse.self, from: data).news.items else {
//                onError(AppError.failedToDecode)
//                return
//            }
//            guard let profiles = try? JSONDecoder().decode(NewsResponse.self, from: data).news.profiles else {
//                onError(AppError.failedToDecode)
//                print("Error profiles")
//                return
//            }
//            guard let groups = try? JSONDecoder().decode(NewsResponse.self, from: data).news.groups else {
//                onError(AppError.failedToDecode)
//                print("Error groups")
//                return
//            }
//            for i in 0..<news.count {
//                if news[i].sourceID < 0{
//                    let group = groups.first(where: { $0.id == -news[i].sourceID })
//                    news[i].avatarURL = group?.photo
//                    news[i].creatorName = group?.name
//                } else {
//                    let profile = profiles.first(where: { $0.id == news[i].sourceID })
//                    news[i].avatarURL = profile?.photo
//                    news[i].creatorName = (profile?.firstName ?? "") + (profile?.lastName ?? "")
//                }
//            }
//            DispatchQueue.main.async {
//                completion(news)
//            }
//        }
//        task.resume()
//        }
//
//    func getNews(_ items: News) -> Promise<[NewsItems]> {
//        return Promise<[NewsItems]> { resolver in
//            var news = items.items
//            let groups = items.groups
//            let profiles = items.profiles
//
//            for i in 0..<news.count {
//                if news[i].sourceID < 0 {
//                    let group = groups.first(where: { $0.id == -news[i].sourceID })
//                    news[i].avatarURL = group?.photo
//                    news[i].creatorName = group?.name
//                } else {
//                    let profile = profiles.first(where: { $0.id == news[i].sourceID })
//                    news[i].avatarURL = profile?.photo
//                    news[i].creatorName = (profile?.firstName ?? "") + " " + (profile?.lastName ?? "")
//                }
//            }
//            resolver.fulfill(news)
//        }
//    }
}
