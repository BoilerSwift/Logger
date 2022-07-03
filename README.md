# Logger

`Logger`는 더 직관적인 디버그 환경을 제공하기 위한 도구입니다.

### 제작자
[🏂](https://github.com/jaesung-0o0)  👉 `debug`, `error` <br>
[🐻‍❄️](https://github.com/lgvv)  👉 `event`

## OverView
<p align="center">
<img width="307" alt="HomeView" src="https://user-images.githubusercontent.com/56182112/176992190-943513c6-27bd-4fac-8f3a-d2dba4fe7f3f.png"><img width="307" alt="DetailView" src="https://user-images.githubusercontent.com/56182112/176992199-c33e27b4-b6be-4d10-afbb-f21662d7cccb.png">
</p>

### Supports
* iOS 9.0 or later
* macOS 12.0 or later
* tvOS 9.0 or later
* watchOS 2.0 or later

## 사용예시

* debug: 일반적인 디버그에 사용합니다.
* error: 에러에 사용합니다.
* event: 서버에 기록해야 하는 부분에 사용합니다.

``` swift
  import Logger
  
  // 사용할 `RunMode` 케이스를 1개 이상 지정할 수 있습니다. 기본 값은 `[.devlopment]` 입니다.
  // Logger.printableModes = [.development, .production]
  public static var printableModes: [RunMode] = [.development]
  
  
  // qos: background, 로거에서 커스텀 액션을 실행시키는 큐입니다.
  Logger.queue.async {
    // optional
  }
  
  // qos: default 에러에 대해서 String, Error을 적용할 수 있습니다.
  Logger.error("Hello Logger") {
    // optional
  }
  
  someCompletionHandlerWithError { error in
    defer { Logger.error(error) }
    if let error = error { return }
  }
  
  // qos: background, 서버에 기록하는 이벤트에 사용합니다.
  Logger.event("사용자 터치 이벤트 서버에 기록") {
    // required!
  }
  
```
