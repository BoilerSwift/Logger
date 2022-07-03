//
//  Loggers.swift
//  Logger
//
//  Created by Hamlit Jason on 2022/07/03.
//

import Foundation

/// 로그를 위한 클래스 입니다.
public class Logger {
    /// 로거의 header 부분에 나타날 메시지입니다. 기본 값은 `Logger`입니다.
    public static var header: String = "Logger"
    
    /// 로거를 활성화시킬 모드입니다.
    public enum RunMode: Int, Hashable {
        /// 프로젝트의 Build configuration 이 `debug` 일 때 로거를 활성화합니다.
        case development
        /// 프로젝트이 Build configuration 이 `Release` 일 때 로거를 활성화합니다.
        case production
    }
    
    /// 로거에 주입할 커스텀 액션이 실행될 큐 입니다.
    /// ```swift
    /// Logger.queue.async {
    ///     // qos: background
    ///     print("로거에서 커스텀 액션을 실행시키는 큐입니다.")
    /// }
    /// ```
    public static var queue: DispatchQueue = DispatchQueue(label: "kr.common.logger.queue", qos: .background)
    
    /// 사용할 `RunMode` 케이스를 1개 이상 지정할 수 있습니다. 기본 값은 `[.devlopment]` 입니다.
    /// ```swift
    /// Logger.printableModes = [.development, .production]
    /// ```
    public static var printableModes: [RunMode] = [.development]
    
    /// `log` 와 함께 일반 로그 메세지를 출력하고 `action` 을 실행합니다.
    /// ```swift
    /// Logger.debug("Hello Logger") {
    ///     // qos: default
    ///     // 파이어베이스, 앱스플라이어 등의 추가적인 로거를 사용할 수 있습니다.
    /// }
    /// // 출력결과
    /// // [Logger] [2022년 5월 4일 수요일 오후 11:23:00 GMT+9]
    /// // ✅ Hello Logger
    /// ```
    public static func debug(_ log: Any?, action: (() -> Void)? = nil) {
        let time: String
        if #available(iOS 15.0, *) {
            time = Date().formatted(
                date: .complete,
                time: .complete
            )
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-EE hh:mm a"
            time = dateFormatter.string(from: Date())
        }
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[\(header)] [\(time)]\n✅ \(String(describing: log))")
#else
        Logger.queue.async(qos: .default) {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[\(header)] [\(time)]\n✅ \(String(describing: log))")
#endif
    }
    
    /// `log` 와 함께 에러메세지를 출력하고 `action` 을 실행합니다.
    /// ```swift
    /// Logger.error("Hello Logger") {
    ///     // qos: default
    ///     // 파이어베이스, 앱스플라이어 등의 추가적인 로거를 사용할 수 있습니다.
    /// }
    /// // 출력결과
    /// // [Logger] [2022년 5월 4일 수요일 오후 11:23:00 GMT+9]
    /// // 🚨 Hello Logger
    /// ```
    public static func error(_ log: String, action: (() -> Void)? = nil) {
        let time: String
        if #available(iOS 15.0, *) {
            time = Date().formatted(
                date: .complete,
                time: .complete
            )
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-EE hh:mm a"
            time = dateFormatter.string(from: Date())
        }
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[\(header)] [\(time)]\n🚨 \(log)")
#else
        Logger.queue.async(qos: .default) {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[\(header)] [\(time)]\n🚨 \(log))")
#endif
    }
    
    /// 에러가 존재할 때만 로그를 프린트하고 `action` 을 실행합니다..
    /// ```swift
    /// someCompletionHandlerWithError { error in
    ///     defer { Logger.error(error) }
    ///     if let error = error { return }
    /// }
    /// ```
    public static func error(_ error: Error?, action: (() -> Void)? = nil) {
        guard let error = error else { return }
        self.error(error.localizedDescription, action: action)
    }
    
    /// `log` 와 함께 일반 로그 메세지를 출력하고 `action` 을 실행합니다.
    /// ```swift
    /// Logger.event("사용자 터치 이벤트 서버에 기록") {
    ///     // qos: background
    ///     // 서버에 기록하는 행동을 수행할 수 있습니다.
    /// }
    /// // 출력결과
    /// // [Logger] [2022년 7월 3일 일요일 오전 11:13:00 GMT+9]
    /// // 📡 사용자 터치 이벤트 서버에 기록
    /// ```
    public static func event(_ log: Any?, action: (() -> Void)? = nil) {
        let time: String
        if #available(iOS 15.0, *) {
            time = Date().formatted(
                date: .complete,
                time: .complete
            )
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-EE hh:mm a"
            time = dateFormatter.string(from: Date())
        }
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[\(header)] [\(time)]\n📡 \(String(describing: log))")
#else
        Logger.queue.async {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[\(header)] [\(time)]\n📡 \(String(describing: log))")
#endif
    }
}
