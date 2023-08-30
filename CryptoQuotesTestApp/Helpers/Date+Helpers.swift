import Foundation

public extension Date {
    func timeStamp() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        
        let strHour = hour < 10 ? "0\(hour)" : "\(hour)"
        let strMinute = minute < 10 ? "0\(minute)" : "\(minute)"
        let strSecond = second < 10 ? "0\(second)" : "\(second)"

        return strHour + ":" + strMinute + ":" + strSecond
    }

    static func getTimeStampFrom(stringDate: String?) -> String {
        guard let stringDate = stringDate else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateTime = formatter.date(from: stringDate)
        guard let dateTime = dateTime else { return "" }
        return dateTime.timeStamp()
    }
}
