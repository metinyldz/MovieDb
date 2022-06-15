//
//  Converter.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 23.12.2021.
//

import Foundation

struct Converter {
    
    static func convertDate(input: String, dateType: DateType) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: input) {
            return date.toString(dateType)
        }
        return "-"
    }
    
    static func getGenres(genreIds: [Int]?) -> String {
        guard let genreIds = genreIds else { return "" }
        
        var genreIndexs = [GenreResult]()
        
        for genreId in genreIds {
            genreIndexs.append(GenreModel.movieInstance.first(where: {$0.id == genreId})!)
        }
        
        return convertGenresToString(genreIndexs)
    }
    
    static func convertGenresToString(_ genres: [GenreResult]) -> String {
        var text = ""
        for genre in genres {
            if genres.last!.id == genre.id {
                text += genre.name ?? "-"
                break
            }
            text += "\(genre.name ?? "-"), "
        }
        return text
    }
    
    static func genreText(genres: [GenreResult]) -> String {
        var genresText = ""
        for genre in genres {
            if genres.last!.id == genre.id {
                genresText.append("\(genre.name ?? "")")
                break
            }
            genresText.append("\(genre.name ?? ""), ")
        }
        return genresText
    }
}

enum DateType:String {
    case time = "HH:mm"
    case date = "dd.MM.yyyy"
    case dateOracle = "MM.dd.yyyy"
    case dateTime = "dd.MM.yyyy HH:mm"
    case dateTimeLocale = "dd/MM/yyyy HH:mm ZZZ"
    case dateTimeFull = "dd.MM.yyyy HH:mm:ss"
    case search = "yyyy-MM-dd"
    case cardDate = "MM/yyyy"
    case month = "MM"
    case monthShortString = "MMM"
    case monthFullString = "MMMM"
    case hour = "HH"
    case year = "yyyy"
    case day = "dd"
    case long = "yyyy-MM-dd'T'HH:mm:ss"
    case caseDate = "MMMM dd, yyyy"
    case caseDateTime = "MMMM dd, yyyy HH:mm"
    case vaccine = "yyyy-MM-dd'T'HH:mm:ssZ"
    case vaccineSecond = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case vaccineDetail = "dd MMMM yyyy"
    case monthAndYear = "MMMM yyyy"
    case dayAndMonth = "dd MMMM"
    case minuteAndSecond = "mm:ss"
    case newFormatter = "MM-dd-yyyy HH:mm"
}

//MARK: string converter

extension String {
    
    //string to date converter
    func toDate(_ type:DateType = .dateTime) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.date(from: self) ?? Date()
    }
    
    //string to date converter
    func toLocalDate(_ type:DateType = .dateTime) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.date(from: self)!// ?? Date()
    }
}

//MARK: date converter

extension Date {
    
    //date to string converter
    func toString(_ type:DateType = .dateTime) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.string(from: self)
    }
    
    //date to string converter
    func toLocaleString(_ type:DateType = .dateTime) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.string(from: self)
    }
}

//MARK: double converter

extension Double {
    
    //decimal format
    func format(f: String = ".2") -> String {
        return String(format: "%\(f)f", self)
    }
}
