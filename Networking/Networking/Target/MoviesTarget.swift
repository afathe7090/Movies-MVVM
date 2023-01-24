//
//  MoviesTarget.swift
//  Networking
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import Moya
import CombineMoya
public enum MoviesService {
    case movies(Int)
}
extension MoviesService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org")!
    }
    public var path: String {
        return "/3/movie/popular"
    }
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Moya.Task {
        switch self {
        case .movies(let page):
            return .requestParameters(parameters: ["api_key" : "8eb6c777ec4afbd830c7340eca705fd1"
                                                   ,"page" : page]
                                      , encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
}
