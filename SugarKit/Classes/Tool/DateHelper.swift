//
//  DateHelper.swift
//
//  Created by 游龙 G on 2024/6/13.
//

import Foundation


// MARK: -  DateFormatType
/// 自定义 dateFormat 类型
public enum DateFormatType: String {
    
    /// "yyyyMMdd"
    case DATE_DEFAULT = "yyyyMMdd"
    
    /// "yyyy-MM-dd'T'HH:mm:ssZ"
    case DATE_TIME_ZONE = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    /// "yyyy-MM-dd hh:mm:ss"
    case DATE_TIME = "yyyy-MM-dd hh:mm:ss"
    
    /// "yyyy-MM-dd hh:mm:ss.SSS"
    case DATE_TIME_MS = "yyyy-MM-dd hh:mm:ss.SSS"
    
    /// "yyyy-MM-dd"
    case DATE = "yyyy-MM-dd"
    
    /// "MM-dd"
    case DATE_MONTH_DAY = "MM-dd"
    
    /// "HH:mm:ss"
    case TIME = "HH:mm:ss"
    
    /// "yyyyMMddHHmmss"
    case DATE_TIME_FILE = "yyyyMMddHHmmss"
}


// MARK: -  enum WeekDay: String

/// enum WeekDay - 周几
///
/// - Sunday: 周日
/// - Monday: 周一
/// - Tuesday: 周二
/// - Wendnesday: 周三
/// - Thursday: 周四
/// - Friday: 周五
/// - Saturday: 周六
public enum WeekDay: String {
    case Sunday = "周日"
    case Monday = "周一"
    case Tuesday = "周二"
    case Wednesday = "周三"
    case Thursday = "周四"
    case Friday = "周五"
    case Saturday = "周六"
    
    
    // weekDay 与 number
    
    /// 【.Sunday - 1】
    func getWeekDayNumber() -> Int {
        var week = 1
        switch self {
        case .Sunday:
            break
        case .Monday:
            week = 2
        case .Tuesday:
            week = 3
        case .Wednesday:
            week = 4
        case .Thursday:
            week = 5
        case .Friday:
            week = 6
        case .Saturday:
            week = 7
        }
        return week
    }
    
//    /// 【.Monday - 1】
//    func getWeekDayOrdinalNumber() -> Int {
//        var week = 1
//        switch self {
//        case .Monday:
//            break
//        case .Tuesday:
//            week = 2
//        case .Wendnesday:
//            week = 3
//        case .Thursday:
//            week = 4
//        case .Friday:
//            week = 5
//        case .Saturday:
//            week = 6
//        case .Sunday:
//            week = 7
//        }
//        return week
//    }
   
    
    // str 与 number
    
    /// 【1 - 周日】
    static func GetWeekDayStr(week: Int) -> String {
        var str = Sunday.rawValue
        switch week {
        case 1:
            break
        case 2:
            str = Monday.rawValue
        case 3:
            str = Tuesday.rawValue
        case 4:
            str = Wednesday.rawValue
        case 5:
            str = Thursday.rawValue
        case 6:
            str = Friday.rawValue
        case 7:
            str = Saturday.rawValue
        default:
            break
        }
        return str
    }
    
    /// 【周日 - 1】
    static func GetWeekDayNumber(_ weekStr: String) -> Int {
        var week = 1
        switch weekStr {
        case Sunday.rawValue:
            break
        case Monday.rawValue:
            week = 2
        case Tuesday.rawValue:
            week = 3
        case Wednesday.rawValue:
            week = 4
        case Thursday.rawValue:
            week = 5
        case Friday.rawValue:
            week = 6
        case Saturday.rawValue:
            week = 7
        default:
            break
        }
        return week
    }
    
//    /// 【1 - 周一】
//    static func GetWeekDayOrdinalStr(week: Int) -> String {
//        var str = Monday.rawValue
//        switch week {
//        case 1:
//            break
//        case 2:
//            str = Tuesday.rawValue
//        case 3:
//            str = Wendnesday.rawValue
//        case 4:
//            str = Thursday.rawValue
//        case 5:
//            str = Friday.rawValue
//        case 6:
//            str = Saturday.rawValue
//        case 7:
//            str = Sunday.rawValue
//        default:
//            break
//        }
//        return str
//    }
//
//    /// 【周一 - 1】
//    static func GetWeekDayOrdinalNumber(_ weekStr: String) -> Int {
//        var week = 1
//        switch weekStr {
//        case Monday.rawValue:
//            break
//        case Tuesday.rawValue:
//            week = 2
//        case Wendnesday.rawValue:
//            week = 3
//        case Thursday.rawValue:
//            week = 4
//        case Friday.rawValue:
//            week = 5
//        case Saturday.rawValue:
//            week = 6
//        case Sunday.rawValue:
//            week = 7
//        default:
//            break
//        }
//        return week
//    }
    
    static func convertEEE_EN_to_CN(en: String, isLong: Bool = false) -> String {
        var cn = "----"
        switch en {
        case "Monday":
            cn = isLong ? "星期一" : "周一"
        case "Tuesday":
            cn = isLong ? "星期二" : "周二"
        case "Wednesday":
            cn = isLong ? "星期三" : "周三"
        case "Thursday":
            cn = isLong ? "星期四" : "周四"
        case "Friday":
            cn = isLong ? "星期五" : "周五"
        case "Saturday":
            cn = isLong ? "星期六" : "周六"
        case "Sunday":
            cn = isLong ? "星期日" : "周日"
        default:
            break
        }
        return cn
    }
}


// MARK: -  enum WeekDayLong: String

/// enum WeekDayLong - 星期几
///
/// - SundayLong: 星期日
/// - MondayLong: 星期一
/// - TuesdayLong: 星期二
/// - WendnesdayLong: 星期三
/// - ThursdayLong: 星期四
/// - FridayLong: 星期五
/// - SaturdayLong: 星期六
public enum WeekDayLong: String {
    case SundayLong = "星期日"
    case MondayLong = "星期一"
    case TuesdayLong = "星期二"
    case WednesdayLong = "星期三"
    case ThursdayLong = "星期四"
    case FridayLong = "星期五"
    case SaturdayLong = "星期六"
    
    
    
    // weekDay 与 number
    
    /// 【.Sunday - 1】
    func getLongWeekDayNumber() -> Int {
        var week = 1
        switch self {
        case .SundayLong:
            break
        case .MondayLong:
            week = 2
        case .TuesdayLong:
            week = 3
        case .WednesdayLong:
            week = 4
        case .ThursdayLong:
            week = 5
        case .FridayLong:
            week = 6
        case .SaturdayLong:
            week = 7
        }
        return week
    }
    
//    /// 【星期一 - 1】
//    func getLongWeekDayOrdinalNumber() -> Int {
//        var week = 1
//        switch self {
//        case .MondayLong:
//            break
//        case .TuesdayLong:
//            week = 2
//        case .WendnesdayLong:
//            week = 3
//        case .ThursdayLong:
//            week = 4
//        case .FridayLong:
//            week = 5
//        case .SaturdayLong:
//            week = 6
//        case .SundayLong:
//            week = 7
//        }
//        return week
//    }
    
    
    
    // str 与 number
    
    /// 【1 - 星期日】
    static func GetLongWeekDayStr(week: Int) -> String {
        var str = SundayLong.rawValue
        switch week {
        case 1:
            break
        case 2:
            str = MondayLong.rawValue
        case 3:
            str = TuesdayLong.rawValue
        case 4:
            str = WednesdayLong.rawValue
        case 5:
            str = ThursdayLong.rawValue
        case 6:
            str = FridayLong.rawValue
        case 7:
            str = SaturdayLong.rawValue
        default:
            break
        }
        return str
    }
    
    /// 【星期日 - 1】
    static func GetLongWeekDayNumber(_ weekStr: String) -> Int {
        var week = 1
        switch weekStr {
        case SundayLong.rawValue:
            break
        case MondayLong.rawValue:
            week = 2
        case TuesdayLong.rawValue:
            week = 3
        case WednesdayLong.rawValue:
            week = 4
        case ThursdayLong.rawValue:
            week = 5
        case FridayLong.rawValue:
            week = 6
        case SaturdayLong.rawValue:
            week = 7
        default:
            break
        }
        return week
    }
    
//    /// 【1 - 星期一】
//    static func GetLongWeekDayOrdinalStr(week: Int) -> String {
//        var str = MondayLong.rawValue
//        switch week {
//        case 1:
//            break
//        case 2:
//            str = TuesdayLong.rawValue
//        case 3:
//            str = WendnesdayLong.rawValue
//        case 4:
//            str = ThursdayLong.rawValue
//        case 5:
//            str = FridayLong.rawValue
//        case 6:
//            str = SaturdayLong.rawValue
//        case 7:
//            str = SundayLong.rawValue
//        default:
//            break
//        }
//        return str
//    }
//
//    /// 【星期一 - 1】
//    static func GetLongWeekDayOrdinalNumber(_ weekStr: String) -> Int {
//        var week = 1
//        switch weekStr {
//        case MondayLong.rawValue:
//            break
//        case TuesdayLong.rawValue:
//            week = 2
//        case WendnesdayLong.rawValue:
//            week = 3
//        case ThursdayLong.rawValue:
//            week = 4
//        case FridayLong.rawValue:
//            week = 5
//        case SaturdayLong.rawValue:
//            week = 6
//        case SundayLong.rawValue:
//            week = 7
//        default:
//            break
//        }
//        return week
//    }
}


// MARK: -  DateHelper
/// class DateHelper 日期帮助类
@objcMembers public class DateHelper: NSObject {
    
    /// 当前日期（今天）‘日期’ 的字符串 "yyyy-MM-dd"
    class var currentDateStr: String {
        getDateStr("yyyy-MM-dd")
    }
    
    /// 当前日期（今天）‘日期时间’ 的字符串 "yyyy-MM-dd HH:mm:ss"
    class var currentDateTimeStr: String {
        getDateStr("yyyy-MM-dd HH:mm:ss")
    }
    
    /// 当前日期（今天）‘日期时间精确到纳秒’ 的字符串 "yyyy-MM-dd HH:mm:ss.SSS"
    class var currentDateTimeNaStr: String {
        getDateStr("yyyy-MM-dd HH:mm:ss.SSS")
    }
    
    /// 当前日期（今天）‘时间’ 的字符串 "hh:mm:ss"
    class var currentTimeStr: String {
        getDateStr("HH:mm:ss")
    }
    
    /// 当前日期（今天）‘日期时间-文件名’ 的字符串 "yyyyMMddHHmmss"
    class var currentFileNameStr: String {
        getDateStr("yyyyMMddHHmmss")
    }
    
    /// 当前日期（今天）‘时间’ 的字符串 "hh:mm:ss.sss"
    class var currentLogTimeStr: String {
        getDateStr("HH:mm:ss.sss")
    }
    
    private class func getDateStr(_ dateFmt: String) -> String {
        toDateStr(from: Date(), format: dateFmt)
    }
    
    class func toDateStr(from date: Date, format: String) -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = format
        return fmt.string(from: date)
    }
    
    /// 将一个准日期字符串根据给定格式转换为Date日期类型 (给定 时间字符串 要与 format 一致！！！) format默认为 yyyyMMdd
    class func toDate(_ dateStr: String, formatType: DateFormatType = .DATE_DEFAULT) -> Date? {
        if dateStr == "" { return nil }
        let format_ = formatType
        
        let fmt = getFmt(format_)
        guard let date = fmt.date(from: dateStr) else {
            return nil
        }
        return date
        
//        let interval = TimeZone.current.secondsFromGMT(for: date)
//        return date.addingTimeInterval(TimeInterval(interval))
        
        
////        return------
//
//        var str = ""
//        var arr: [Substring] = [Substring]()
//        if dateStr.contains(".") || dateStr.contains("-")
//        {
//            format_ = .DATE
//
//            if dateStr.contains(".") {
//                arr = dateStr.split(separator: ".")
//            }else {
//                arr = dateStr.split(separator: "-")
//            }
//
//            if arr.count == 0 || arr.count >= 4 {
//                return nil
//            }
//            if arr.count == 2 {
//                arr.insert(Substring(getYearStr()), at: 0)
//            }
//
//            for item in arr {
//                var ss = item
//                if item.count == 1 {
//                    ss.insert("0", at: ss.startIndex)
//                }
//                str.append(String(ss) + "-")
//            }
//            str = str.prefix(toReverseIndex: 1)
//        }
//        else {
//            str = dateStr
//        }
//
//        let fmt = getFmt(format_)
//        guard let date = fmt.date(from: str) else {
//            return nil
//        }
//
//        let interval = TimeZone.current.secondsFromGMT(for: date)
//        return date.addingTimeInterval(TimeInterval(interval))
    }
    
    /// 将一个准日期字符串转换为给定格式的日期字符串
    class func toFormatDateStr(_ dateStr: String, format: DateFormatType, toFormat: DateFormatType) -> String? {
        if (dateStr == "") { return nil }
        guard let date = getFmt(format).date(from: dateStr)
            else {
                return nil
        }
        let str = getFmt(toFormat).string(from: date)
        return str

        
//        guard let date = toDate(dateStr, formatType: format) else {
//            return nil
//        }
//        return getFmt(toFormat).string(from: date)
    }
    
    /// 将一个日期转换为指定格式的日期
    class func toFormatDate(_ date: Date, /*format: DateFormatType,*/ toFormat: DateFormatType = .DATE_DEFAULT) -> Date {
        let fmt = getFmt(toFormat)
        let dateStr = fmt.string(from: date)
        let adate = fmt.date(from: dateStr)!
        return adate
    }
    
    
    
    /// 返回今天日期的 ‘年’ 字符串 【2018】
    class func getYearStr() -> String {
        let arr = currentDateStr.split(separator: "-")
        return String(arr[0])
    }
    
    /// 返回今天日期的 ‘月’ 字符串 【01】
    class func getMonthStr() -> String {
        let arr = currentDateStr.split(separator: "-")
        return String(arr[1])
    }
    
    /// 返回今天日期的 ‘日’ 字符串 【01】
    class func getDayStr() -> String {
        let arr = currentDateStr.split(separator: "-")
        return String(arr[2])
    }
    
    /// 返回今天日期的 ‘小时’ 字符串 【06】
    class func getHourStr() -> String {
        let arr = currentTimeStr.split(separator: ":")
        return String(arr[0])
    }
    
    /// 返回今天日期的 ‘分钟’ 字符串 【18】
    class func getMinuteStr() -> String {
        let arr = currentTimeStr.split(separator: ":")
        return String(arr[1])
    }
    
    /// 返回今天日期的 ‘秒钟’ 字符串 【28】
    class func getSecondStr() -> String {
        let arr = currentTimeStr.split(separator: ":")
        return String(arr[2])
    }
    
    /// 返回今天日期的 weekDay 数字，从周日算作第一天 - 【周日-1，周一-2，周二-3，周三-4，周四-5，周五-6，周六-7】
    class var weekDay: Int { getWeekDayNumber() }
    
    /// 返回给定某天日期的 weekDay 数字。
    ///
    /// 周日作为第一天：【周日-1，周一-2，周二-3，周三-4，周四-5，周五-6，周六-7】
    /// 周一作为第一天：【周一-1，周二-2，周三-3，周四-4，周五-5，周六-6，周日-7】
    /// - Parameters:
    ///   - aDate: 给定日期
    ///   - isFirstDayUseMonday: 是否周一作为第一天（默认false，即周日为第一天）
    class func getWeekDayNumber(_ aDate: Date = Date(), isFirstDayUseMonday: Bool = false) -> Int {
        //var calendar = Calendar(identifier: .republicOfChina)
        let timeZone = TimeZone(identifier: "Asia/Shanghai")
        currentCalendar.timeZone = timeZone!
        
        let weekCom: Calendar.Component = Calendar.Component.weekday
        let components: DateComponents = currentCalendar.dateComponents(Set(arrayLiteral: weekCom), from: aDate)
        let weekInt = components.weekday!
//        print("weekDayNumber = \(weekInt)")
        // 周二 - 3
        // 周日 - 1
        
        var result = weekInt
        if isFirstDayUseMonday { //周一作为第一天，【周一-1，周二-2，周三-3，周四-4，周五-5，周六-6，周日-7】
            result = (result == 1) ? 7 : result - 1
        }
        print("weekNumber =", result)
        return result
    }
    
    /// 返回某个日期的 ‘周’ 字符串 【周一】
    class func getWeekStr(_ aDate: Date = Date()) -> String {
        // 周二  weekday -> 3
        // 周二  weekdayOrdinal -> 2
//        let weekInt: Int = Calendar(identifier: Calendar.Identifier.republicOfChina).component(Calendar.Component.weekdayOrdinal, from: aDate)
//        return WeekDay.GetWeekDayOrdinalStr(week: weekInt)

        
        let weekInt = getWeekDayNumber(aDate)
        let weekDay = WeekDay.GetWeekDayStr(week: weekInt)
        return weekDay
    }
    
    /// 返回某个日期的 ‘星期’ 字符串 【星期一】
    class func getWeekLongStr(_ aDate: Date = Date()) -> String {
//        let weekInt: Int = currentCalendar.component(.weekdayOrdinal, from: aDate)
        let weekInt = getWeekDayNumber(aDate)
        return WeekDayLong.GetLongWeekDayStr(week: weekInt)
    }
    
    class func getWeekStr(fromNumber: Int, isFirstDayUseMonday: Bool = false) -> String {
        var week = ""
        let number = fromNumber % 7
        if isFirstDayUseMonday { //【周一-1，周二-2，周三-3，周四-4，周五-5，周六-6，周日-7】
            switch number {
            case 0:
                week = "周日"
            case 1:
                week = "周一"
            case 2:
                week = "周二"
            case 3:
                week = "周三"
            case 4:
                week = "周四"
            case 5:
                week = "周五"
            case 6:
                week = "周六"
            default:
                break
            }
        } else {
            switch number { //【周日-1，周一-2，周二-3，周三-4，周四-5，周五-6，周六-7】
            case 0:
                week = "周六"
            case 1:
                week = "周日"
            case 2:
                week = "周一"
            case 3:
                week = "周二"
            case 4:
                week = "周三"
            case 5:
                week = "周四"
            case 6:
                week = "周五"
            default:
                break
            }
        }
        
        return week
    }
    
    class func getWeekLongStr(fromNumber: Int, isFirstDayUseMonday: Bool = false) -> String {
        var week = ""
        let number = fromNumber % 7
        if isFirstDayUseMonday { //【周一-1，周二-2，周三-3，周四-4，周五-5，周六-6，周日-7】
            switch number {
            case 0:
                week = "星期日"
            case 1:
                week = "星期一"
            case 2:
                week = "星期二"
            case 3:
                week = "星期三"
            case 4:
                week = "星期四"
            case 5:
                week = "星期五"
            case 6:
                week = "星期六"
            default:
                break
            }
        } else {
            switch number { //【周日-1，周一-2，周二-3，周三-4，周四-5，周五-6，周六-7】
            case 0:
                week = "星期六"
            case 1:
                week = "星期日"
            case 2:
                week = "星期一"
            case 3:
                week = "星期二"
            case 4:
                week = "星期三"
            case 5:
                week = "星期四"
            case 6:
                week = "星期五"
            default:
                break
            }
        }
        
        return week
    }
    
    
    
    /// 给定两个日期，把日期范围根据 周一~周日 拆分成组
    class func getWeekGroup(fromDate: Date, toDate: Date) -> [Date] {
        var from: Date, to: Date
        if fromDate == toDate {
            return []
        } else if fromDate < toDate {
            from = fromDate
            to = toDate
        } else {
            from = toDate
            to = fromDate
        }
        
        var arr = [Date]()
        let number = getWeekDayNumber(to, isFirstDayUseMonday: true)
        // number = 2, 周二
        
        var lastSunday = to
        // 首先把最后一天添加上
        arr.append(to) //.toString("yyyyMMdd"))
        
        if number < 7 { //周一~周六
            lastSunday = DateHelper.addDays(value: -number, toDate: to)
            arr.append(lastSunday) //.toString("yyyyMMdd")) //把最近的上一次周日添加上
        }
        
        // 循环添加上一个周日
        while lastSunday >= from {
            lastSunday = DateHelper.addDays(value: -7, toDate: lastSunday)
            arr.append(lastSunday) //.toString("yyyyMMdd")) //把最近的上一次周日添加上
        }
        
        print(arr)
        return arr
    }
    
    
    /// 获取给定日期所在月的第一天
    class func getFirstDay(ofMonth aDate: Date = Date()) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.year, .month]),
             from: aDate)
        let startOfMonth = calendar.date(from: components)!
        return startOfMonth
    }
    
    /// 获取给定日期所在月的最后一天
    class func getLastDay(ofMonth aDate: Date = Date()) -> Date {
        print("aDate =", aDate)
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.month = 1
        components.day = -1
        
        let endOfMonth =  calendar.date(byAdding: components, to: getFirstDay(ofMonth: aDate))!
        return endOfMonth
    }
    
}// class DateHelper



// MARK: -  getDateFormatter
public extension DateHelper {
    
    static func getFmt() -> DateFormatter {
        return DateFormatter()
    }
    
    static  func getFmt(_ dateFormatType: DateFormatType) -> DateFormatter {
        getFmt(dateFormatType.rawValue)
    }
    
    static  func getFmt(_ dateFormat: String) -> DateFormatter {
        let fmt = DateFormatter()
        fmt.dateFormat = dateFormat
        
        return fmt
    }
    
    static var currentCalendar: Calendar = Calendar.current

}// extension DateHelper



// MARK: -  calculate
public extension DateHelper {
    
    /// 一个日期跟今天相差的天数
    class func getDays(aDaySinceToday aDate: Date) -> Int {
        return getDays(aDate: aDate, sinceOtherDate: Date())
    }
    
    /// 两个日期相差的天数
    class func getDays(aDate: Date, sinceOtherDate other: Date) -> Int {
        let aDate_: Date = DateHelper.toFormatDate(aDate)
        let otherDate_: Date = DateHelper.toFormatDate(other)
        
//        gxprint("\n aDate_     = \(aDate_.toString("yyyy-MM-dd")), \n otherDate_ = \(otherDate_.toString("yyyy-MM-dd"))")
        
        let interval = aDate_.timeIntervalSince(otherDate_)
        if interval == 0 { return 0 }
        
        let diff_Double: Double = interval / 3600.0 / 24.0
        let days = Int(diff_Double)
        let days_mod = diff_Double - Double(days)
        
        let diff: Int = (days_mod == 0) ? days : (days + 1)
        return diff
    }
    
//    /// 两个日期相差的天数
//    class func getDiffDays(aDate: Date, sinceOtherDate other: Date) -> Int {
////        return Calendar(identifier: Calendar.Identifier.republicOfChina).dateComponents(Set<Calendar.Component>([.day]), from: other, to: aDate).day! //有问题：这样显示的是格林尼治时间，应该修改让其显示东八区时间。
//        return getDays(aDate: aDate, format: <#T##DateFormatType#>, sinceOtherDate: <#T##Date#>, otherFormat: <#T##DateFormatType#>)(aDate: aDate, sinceOtherDate: other)
//    }
    
    
    
    /// 将日期加上指定的年数
    class func addYears(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .year, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的月数
    class func addMonth(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .month, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的天数
    class func addDays(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .day, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的小时数
    class func addHours(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .hour, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的分钟数
    class func addMinutes(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .minute, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的秒数
    class func addSeconds(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .second, value: value, to: aDate)!
    }
    
    /// 将日期加上指定的毫秒数
    class func addMilliSeconds(value: Int, toDate aDate: Date) -> Date {
        var senconds: TimeInterval = aDate.timeIntervalSince1970
        senconds += Double(value)
        
        return Date(timeIntervalSince1970: senconds)
    }
    
    /// 将日期加上指定的周(星期)数
    class func addWeekdays(value: Int, toDate aDate: Date) -> Date {
        return currentCalendar.date(byAdding: .weekday, value: value, to: aDate)!
    }
    

    
    /// 判断是否闰年
    ///
    /// 1.能被400整除是闰年
    /// 2.能被4整除同时不能被100整除则是闰年
    class func isLeapYear(_ date: Date) -> Bool {
        let year = currentCalendar.component(.year, from: date)
        return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
    }
    
    
    
}// extension calculate



public extension DateHelper {
    
    static func isSameMinute(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.minute, from: aDate)
        let b = currentCalendar.component(.minute, from: another)
        return a == b
    }
    
    static func isSameHour(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.hour, from: aDate)
        let b = currentCalendar.component(.hour, from: another)
        return a == b
    }
    
    static func isSameDay(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.day, from: aDate)
        let b = currentCalendar.component(.day, from: another)
        return a == b
    }
    
    static func isSameWeek(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.weekday, from: aDate)
        let b = currentCalendar.component(.weekday, from: another)
        return a == b
    }
    
    static func isSameWeekOfMonth(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.weekOfMonth, from: aDate)
        let b = currentCalendar.component(.weekOfMonth, from: another)
        return a == b
    }
    
    
    static func isSameWeekOfYear(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.weekOfYear, from: aDate)
        let b = currentCalendar.component(.weekOfYear, from: another)
        return a == b
    }
    static func isSameMonth(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.month, from: aDate)
        let b = currentCalendar.component(.month, from: another)
        return a == b
    }
    
    static func isSameYear(aDate: Date, another: Date) -> Bool {
        let a = currentCalendar.component(.year, from: aDate)
        let b = currentCalendar.component(.year, from: another)
        return a == b
    }
}



public extension Date {
    
    func isTheSameMinute(another: Date) -> Bool {
        let a = Calendar.current.component(.minute, from: self)
        let b = Calendar.current.component(.minute, from: another)
        return a == b
    }
    
    func isTheSameHour(another: Date) -> Bool {
        let a = Calendar.current.component(.hour, from: self)
        let b = Calendar.current.component(.hour, from: another)
        return a == b
    }
    
    func isTheSameDay(another: Date) -> Bool {
        let a = Calendar.current.component(.day, from: self)
        let b = Calendar.current.component(.day, from: another)
        return a == b
    }
    
    func isTheSameWeek(another: Date) -> Bool {
        let a = Calendar.current.component(.weekday, from: self)
        let b = Calendar.current.component(.weekday, from: another)
        return a == b
    }
    
    func isTheSameWeekOfMonth(another: Date) -> Bool {
        let a = Calendar.current.component(.weekOfMonth, from: self)
        let b = Calendar.current.component(.weekOfMonth, from: another)
        return a == b
    }
    
    
    func isTheSameWeekOfYear(another: Date) -> Bool {
        let a = Calendar.current.component(.weekOfYear, from: self)
        let b = Calendar.current.component(.weekOfYear, from: another)
        return a == b
    }
    func isTheSameMonth(another: Date) -> Bool {
        let a = Calendar.current.component(.month, from: self)
        let b = Calendar.current.component(.month, from: another)
        return a == b
    }
    
    func isTheSameYear(another: Date) -> Bool {
        let a = Calendar.current.component(.year, from: self)
        let b = Calendar.current.component(.year, from: another)
        return a == b
    }
}




public extension DateHelper {
    
    class func daysInMonth(for date: Date) -> Int {
        let calendar = Calendar.current  
        let components = calendar.dateComponents([.year, .month], from: date)  
        let year = components.year ?? 0  
        let month = components.month ?? 0  
        
        // 创建一个表示该月第一天的日期  
        let firstDayOfMonth = calendar.date(from: DateComponents(year: year, month: month, day: 1))!  
        
        // 计算该月的天数  
        let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth)!  
        return range.count 
    }
    
    class func getCurrentDateComponents() -> DateComponents {        
        let secondsFromGMT = TimeZone.current.secondsFromGMT()
//        let timeZone = TimeZone(secondsFromGMT: secondsFromGMT) ?? TimeZone.current
//        let dateFmt = DateFormatter()
//        dateFmt.dateFormat = "yyyy-MM-dd-EE"
//        dateFmt.timeZone = timeZone
//        
//        let dateStr = dateFmt.string(from: Date())
//        print(dateStr)
        
        var calendar = Calendar.current
//        calendar.timeZone = timeZone
        let currentDate = Date() //Date(timeIntervalSince1970: Date().timeIntervalSince1970 + TimeInterval(secondsFromGMT))
        let cmps = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: currentDate)
        return cmps
    }
    
    class func getDateComponents(by aDate: Date) -> DateComponents {
        let cmps = Calendar.current.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: aDate)
        return cmps
    }
    
    class func getDateComponents(byAdding aComponents: Calendar.Component, value: Int, to date: Date = Date()) -> DateComponents {
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: aComponents, value: value, to: date) ?? date
        let newCmps = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: newDate)
        return newCmps
    }
    
    class func getDateComponents(byAdding aComponents: Calendar.Component, 
                           value: Int, 
                           fromYear year: Int, 
                           fromMonth month: Int, 
                           fromDay day: Int) -> DateComponents {
        let date = Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
        return getDateComponents(byAdding: .month, value: value, to: date)
    }
    
    
}

public extension DateHelper {
    // 获取本月日期列表，按照周日~周一排列
    class func getCurrentDayListForWeek() -> [(year: Int, month: Int, day: Int, week: Int)] {
        let currentCmps = DateHelper.getCurrentDateComponents()
        return getDayListForWeek(byYear: currentCmps.year!, month: currentCmps.month!)
    }
    
    // 获取日期列表，按照周日~周一排列
    class func getDayListForWeek(byYear: Int, month: Int) -> [(year: Int, month: Int, day: Int, week: Int)] {
        var list: [(year: Int, month: Int, day: Int, week: Int)] = []
        let firstCmps = DateHelper.getDateComponents(byAdding: .month, value: 0, fromYear: byYear, fromMonth: month, fromDay: 1)
        let weekday = firstCmps.weekday ?? 0
        // 插入空白
        for _ in 0..<weekday-1 {
            list.append((firstCmps.year!, firstCmps.month!, -1, -1))
        }
        for i in 0..<DateHelper.daysInMonth(for: Date()) {
            list.append((firstCmps.year!, firstCmps.month!, i+1, firstCmps.weekday!))
        }
        return list
    }
    
}
