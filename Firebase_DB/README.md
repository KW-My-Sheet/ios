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

# Firebase Realtime Datebase

---

### 1.[GET] 기존에 API 요청 -> DataModel에 Write -> DataModel에서 Read하는 과정을 아래 코드로 줄임
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

### 2. [POST & PATCH] 데이터 추가

```
extension CardListViewController {
.
.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
.
.
//MARK: - Firebase Realtime Database POST / PATCH
        // Option 1
        let cardID = creditCardList[indexPath.row].id
//        ref.child("Item\(cardID)/isSelected").setValue(true)
        // Key가 Item0, 1, 2 ... 인 경우 Post로 선택된 cardID를 넣는 과정
        
        // Option 2
        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
            guard let self = self,
                  let value = snapshot.value as? [String: [String:Any]],
                  let key = value.keys.first else { return }
            
            self.ref.child("\(key)/isSelected").setValue(true)
        }
        // Key안의 Key(Item0.id, Item1.id)를 검색하여 그 Key안에 값을 저장하는 것
.
.
    }
.
.
}
``` 

### 3. [POST & PATCH] 데이터 삭제
```
extension CardListViewController {
.
.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Option 1
            let cardID = creditCardList[indexPath.row].id
            ref.child("Item\(cardID)").removeValue()
            
            // Option 2
//            ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
//                guard let self = self,
//                      let value = snapshot.value as? [String: [String:Any]],
//                      let key = value.keys.first else { return }
//
//                self.ref.child(key).removeValue()
//            }
            
        }
    }
.
.
}
```




### 4. [Kingfisher]String 타입의 이미지 주소를 URL 타입으로 변경한 후 이를 Image View에 띄우기 
```
extension CardListViewController {
.
.
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCellTableViewCell", for: indexPath) as? CardListCellTableViewCell else { return UITableViewCell() }
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        // [Kingfisher] String을 URL 타입으로 변경
        
        cell.cardImageView.kf.setImage(with: imageURL)
        // [Kingfisher] URL타입의 데이터를 바로 이미지로 만들어줌
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = creditCardList[indexPath.row].name
        

        return cell
    }
.
.
```

### 5. [Lottie] 동적인 이미지 불러오는 오픈소스
-> money.json에 Lottie 데이터가 있어야함 
```
import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    var promotionDetail: PromotionDetail?
    
    @IBOutlet weak var moneyLottie: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "money")
        self.moneyLottie.contentMode = .scaleAspectFit
        self.moneyLottie.addSubview(animationView)
        animationView.frame = self.moneyLottie.bounds
        animationView.loopMode = .loop
        animationView.play()
        
        guard let detail = promotionDetail else { return }
        self.titleLabel.text = """
            \(detail.companyName)카드 쓰면
            \(detail.amount)만원 드려요
            """
        self.periodLabel.text = detail.period
        self.conditionLabel.text = detail.condition
        self.benefitConditionLabel.text = detail.benefitCondition
        self.benefitDetailLabel.text = detail.benefitDetail
        self.benefitDateLabel.text = detail.benefitDate
    }
}
```

### 6. A->B View로 데이터 전달하기
```
extension CardListViewController {
.
.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        print(creditCardList[indexPath.row])
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        // Delegate 없이 데이터 뒤로 보내는 패턴(Push)
    }
.
.
}
```
