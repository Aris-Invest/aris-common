import Foundation

let formatter = DateFormatter()

public extension Date {
    /// If today is in the weekend, returns last working day, otherwise returns beginning of today.
    static var lastWorkingDay: Date {
        var date = Calendar.current.startOfDay(for: Date())
        
        while Calendar.current.isDateInWeekend(date) {
            guard let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: date) else { break }
            date = previousDay
        }
        
        return date
    }
    
    var dayBefore: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    var dayAfter: Date? {
        Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
    
    var noon: Date? {
        Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)
    }

    /// If `self` is in the weekend, returns last Friday, otherwise returns now.
    func lastMarketOpen(isMarketOpen: Bool) -> Date {
        var date = self
        
        if !Calendar.current.isDateInWeekend(date) && !isMarketOpen {
            date = date.dayBefore?.noon ?? date
        }
        
        while Calendar.current.isDateInWeekend(date) {
            guard let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: date) else { break }
            date = previousDay.noon ?? date
        }
        
        return date
    }
    
    
    var apiFormatted: String {
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}

public extension String {
    /// Tries to onvert a string in the format yyyy-MM-dd to an actual date
    var asISO8601Date: Date? {
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
}
