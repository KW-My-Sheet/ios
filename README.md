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

# KW 마이시트
> 광운대학교 중앙도서관 자리 예약 서비스

착석된 자리에 한하여, 열람실 자리를 예약할 수 있습니다. 자리가 비워지면 푸시알림이 전송됩니다.

## 설치 방법

iOS:

```sh
앱스토어 검색 "KW 마이시트"
```

## 사용 예제

스크린 샷과 코드 예제를 통해 사용 방법을 자세히 설명합니다.

_더 많은 예제와 사용법은 [Wiki][wiki]를 참고하세요._

```sh
make install
npm test
```

## 업데이트 내역

* 1.0.6
    * 모든 열람실 다중예약 기능을 추가하였습니다.
    * 앱 미리보기 이미지가 수정되었습니다.
    * 설정 내 '개발 및 피드백' 에셋이 변경되었습니다.
* 1.0.5
    * 예약버튼 디자인이 변경되었습니다.
    * 네트워크 속도가 향상되었습니다.
* 1.0.4
    * 첫 출시
* 1.0.1
    * 작업 진행 중

## 정보

MIT 라이센스를 준수하며 ``LICENSE``에서 자세한 정보를 확인할 수 있습니다.

[https://github.com/jusong23](https://github.com/jusong23)

## 기여 방법

1. (<https://github.com/KW-My-Sheet/ios>)을 Fork합니다.
2. (`git checkout -b feature/fooBar`) 명령어로 새 Branch를 만드세요.
3. (`git commit -am 'Add some fooBar'`) 명령어로 Commit하세요.
4. (`git push origin feature/fooBar`) 명령어로 Branch에 Push하세요. 
5. Pull Request를 보내주세요.

## 참고자료

- [iOS Swift] FCM(Firebase Cloud Messaging), Push 메시지 설정해보기 - [ref.](https://medium.com/@jang.wangsu/ios-swift-fcm-firebase-cloud-messaging-push-%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%84%A4%EC%A0%95%ED%95%B4%EB%B3%B4%EA%B8%B0-852a9af23b96)
- [iOS - swift] 서버 푸시 (remote notification), APNs (Apple Push Notification service) - [ref.](https://ios-development.tistory.com/264)
- Push Notification Not Working iOS Using FCM - [ref.](https://stackoverflow.com/questions/66152574/push-notification-not-working-ios-using-fcm)
- (ios/swift) 파이어베이스 푸시 알림 (firebase push) 환경 적용 방법 - [ref.](https://kkh0977.tistory.com/1399)
- OAuth 2.0 Playground - [ref.](https://developers.google.com/oauthplayground/?code=4/0ARtbsJqOe8GBsH-Xr1DjTxXUmUuu4G5XoT0h4TY_SN2VPKyT3T_3dvwmYZcLnUPj4GjRiw&scope=https://www.googleapis.com/auth/cloud-platform)
- FCM Push Notification(HTTP v1) with OAuth 2.0 Playground / Postman / Terminal - Part2 - [ref.](https://soulduse.tistory.com/95)
- [iOS] 내 앱에 Google AdMob iOS 연동하기 - [ref.](https://terry-some.tistory.com/106)
