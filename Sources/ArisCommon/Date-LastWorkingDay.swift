import Foundation

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
    
    var apiFormatted: String {
        let strategy = Date.ISO8601FormatStyle()
            .year()
            .day()
            .month()
            .dateSeparator(.dash)
        
        return self.formatted(strategy)

    }
}
