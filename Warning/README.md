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

# APNS 설정하기(Only AppDelegate)

1. 테스트용 - 와이파이 동일한거 써야함
2. Push Noti. Background Mode(Back Fetch, Remote Noti.) 체크 해놔야함
3. Release Mode는 크게 상관 X 
4. 서버에서 자리 없음을 알림 -> APNs는 이를 인식하여 Device에 전송 -> Push Notification 
-> 이때 토큰 발급 및 APNs에서 받은 토큰으로 Device에 알림을 주는 걸 Firebase가 대신해줌

# 열람실 자리 확인하기
1. 보호되지 않은 url은 Xcode에서 실행되지 않는다. 
-> 전체 HTTP 를 허용하는 메소드를 info.plist에 적어주어야 한다. (Info.plist → Open As → Source Code)
```
<key>NSAppTransportSecurity</key>
    <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    </dict>
``` 

# UI 구성하기
1. [iOS UIKit in Swift 4] UIBarButtonItem 사용하기 - [ref.](https://calmone.tistory.com/entry/iOS-UIKit-in-Swift-4-UIBarButtonItem-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)

2. StoryBoard / Swift 파일 구분
- 코드의 가독성을 위해 StoryBoard 파일에는 UIComponent 배치와 AutoLayout만 잡아주고, 기타 속성은 Code로 작성


+ 구독 기능 추가 
```
Messaging.messaging().subscribe(toTopic: "KWCL") { error in
    print("Subscribed to topic")
}
```
-> 토큰 발급에 상관없이 해당 Topic을 갖고 있는 모든 기기에 테스트 메세지가 전달

+ API 이용해서 푸시알림
1. Back Ground에서도 알림 감
2. [POST] 기기별 토큰 값을 Body로 넣어줘야함(+메세지도) 해당 앱을 설치할 때마다 재 생성됨
3. 24시간 마다 재 생성되는 Authrization Refresh 토큰을 반영해줘야함.



참고자료
- [iOS Swift] FCM(Firebase Cloud Messaging), Push 메시지 설정해보기 - [ref.](https://medium.com/@jang.wangsu/ios-swift-fcm-firebase-cloud-messaging-push-%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%84%A4%EC%A0%95%ED%95%B4%EB%B3%B4%EA%B8%B0-852a9af23b96)
- [iOS - swift] 서버 푸시 (remote notification), APNs (Apple Push Notification service) - [ref.](https://ios-development.tistory.com/264)
- Push Notification Not Working iOS Using FCM - [ref.](https://stackoverflow.com/questions/66152574/push-notification-not-working-ios-using-fcm)
- (ios/swift) 파이어베이스 푸시 알림 (firebase push) 환경 적용 방법 - [ref.](https://kkh0977.tistory.com/1399)
- OAuth 2.0 Playground - [ref.](https://developers.google.com/oauthplayground/?code=4/0ARtbsJqOe8GBsH-Xr1DjTxXUmUuu4G5XoT0h4TY_SN2VPKyT3T_3dvwmYZcLnUPj4GjRiw&scope=https://www.googleapis.com/auth/cloud-platform)
- FCM Push Notification(HTTP v1) with OAuth 2.0 Playground / Postman / Terminal - Part2 - [ref.](https://soulduse.tistory.com/95)
- [iOS] 내 앱에 Google AdMob iOS 연동하기 - [ref.](https://terry-some.tistory.com/106)
- [iOS] Swift로 WebView 구현하는 방법 - [ref.](https://useworld.github.io/iOS/webview/)
