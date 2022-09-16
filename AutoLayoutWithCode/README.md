<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="13142" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12042"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner"/>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
    </objects>
</document>

# AutoLayout Code로 구성하기

1. View 선언하여 상단 뷰에 넣기
```
// MARK: - First View
let myFirstView = UIView()
myFirstView.translatesAutoresizingMaskIntoConstraints = false
// 필수 !
myFirstView.backgroundColor = .systemPink
self.view.addSubview(myFirstView)
// View(최상단 뷰)의 하위 뷰에 추가할 것이다.
```

2. X축 Y축 잡아주기
```
// x축, y축의 위치 , 뷰의 크기(가로 및 세로)
myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true // x축 위치
myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true // y축 위치
```

3. 가로 세로 설정하기
```
myFirstView.widthAnchor.constraint(equalToConstant: 100).isActive = true
myFirstView.heightAnchor.constraint(equalToConstant: 100).isActive = true
```

4. NSLayoutConstraint.active 이용해서 .isActive = true 간소화시키기
```
NSLayoutConstraint.activate([
    mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
    mySecondView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
    mySecondView.widthAnchor.constraint(equalToConstant: 60),
    mySecondView.heightAnchor.constraint(equalToConstant: 60)
])
```
5. Attribute / Size Inspector 나눠서 각각 변수, 함수로 설정하기 
```
//MARK: - Attribute Inspector
var myFirstView : UIView = {
    let view = UIView()
    view.backgroundColor = .black
    view.layer.cornerRadius = 5
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true // corner radius 전용
    return view
}() 
```

```
//MARK: - Size Inspector
    func autoLayout() {
        // MARK: - First View
        self.view.addSubview(myFirstView)
        NSLayoutConstraint.activate([
            myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // x축 위치
            myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200), // y축 위치
            myFirstView.widthAnchor.constraint(equalToConstant: 100),
            myFirstView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // MARK: - Second View
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
            mySecondView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            mySecondView.widthAnchor.constraint(equalToConstant: 60),
            mySecondView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
```

[git] github에 잘못 올라간 폴더 및 파일 삭제하기 - [ref.](https://bskyvision.com/entry/github%EC%97%90-%EC%9E%98%EB%AA%BB-%EC%98%AC%EB%9D%BC%EA%B0%84-%ED%8F%B4%EB%8D%94-%EB%B0%8F-%ED%8C%8C%EC%9D%BC-%EC%82%AD%EC%A0%9C%ED%95%98%EA%B8%B0)
