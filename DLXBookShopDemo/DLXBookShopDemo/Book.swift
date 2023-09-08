//
//  Book.swift
//  DLXBookShopDemo
//
//  Created by lingxiao on 2023/9/8.
//

import Foundation

struct RootData: Decodable {
    let root: [Book]
}

struct Book: Decodable {
    let title: String
    let cover: String
    let edition: String
    let url: String
    
    var thumb: String {
      return cover + "_t"
    }
}

extension Book {
    static func all() -> [Book] {
        let filename = "Books.plist"
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("couldn't load resources")
        }
        
        
        let data: Data

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("couldn't load data")
        }
        
       
        do {
            let dictArr = try PropertyListSerialization.propertyList(from: data, format: nil) as! Array<Dictionary<String, String>>
            
            return dictArr.map { dict in
                Book(title: dict["title"]!, cover: dict["cover"]!, edition: dict["edition"]!, url: dict["url"]!)
            }
        } catch let err {
            print("error == ", err)
            fatalError("Couldn't parse")
        }
        
        

        /*
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([Book].self, from: data)
            return result
        } catch let err {
            print("error == ", err)
            fatalError("Couldn't parse")
        }
         */
    }
}
