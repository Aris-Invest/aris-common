import Foundation

private let apiFormatStyle = Date.ISO8601FormatStyle()
    .year()
    .day()
    .month()
    .dateSeparator(.dash)

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
        self.formatted(apiFormatStyle)
    }
}

public extension String {
    /// Tries to onvert a string in the format YYYY-MM-DD to an actual date
    var asISO8601Date: Date? {
        try? Date(self, strategy: apiFormatStyle)
    }
}
