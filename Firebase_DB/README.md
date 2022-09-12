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

### Firebase Realtime Datebase

---

1. 기존에 API 요청 -> DataModel에 Write -> DataModel에서 Read하는 과정을 아래 코드로 줄임
```
//MARK: - Firebase Realtime Database GET
        self.ref = Database.database().reference()
        
        self.ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            // Dictionary 타입으로 만들었으므로 [String: [String: Any]]로 표현
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                // 날 것의 JsonData를 받아오는 것
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                // 이전의 JsonData를 Dictionary형식으로 Decode시킨 데이터
                let cardList = Array(cardData.values)
                // 해당 Dictionary의 Value값 만 추출
                self.creditCardList = cardList.sorted { $0.rank < $1.rank }
                // 1위 부터 10위 까지 순차적으로 보여줄 것이기 때문에 위와 같이 sort과정을 거친다.
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                // UI 부분을 새로고침 하는 거니까 DispatchQueue로 사용
                
                
            } catch let error {
                print("Error json parsing \(error)")
            }
        }
        // 이 안에서 모델로 변경 후 바로 View에 넣어줌 (GET & Model InputData)
```
