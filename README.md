# Logger

`Logger`는 더 직관적인 디버그 환경을 제공하기 위한 도구입니다.

`debug`, `error` 👉 [🏂](https://github.com/jaesung-0o0)
`event` 👉 [🐻‍❄️](https://github.com/lgvv)

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

```swift
  let items: [ReferenceItem] = [
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)  
  ]

  let vc = UIHostingController(rootView: ReferenceView(items: items))
  // navigationController?.pushViewController(vc, animated: true)
  vc.modalPresentationStyle = .fullScreen
  self.present(vc, animated: true, completion: nil)
```

```
