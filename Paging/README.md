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

# Paging 

###UITableView Paging 처리 하기 - [ref.](https://swieeft.github.io/2020/07/20/PagingTableView.html)

테이블 뷰를 처리하는 방법은 간단합니다. 데이터를 받아 와서 기존 데이터에 계속 Append 시켜주기만 하면 됩니다.

기본 개념은 위와 같고 거기에 부수적으로 동작을 제어하는 몇몇 코드만 추가하면 간단하게 페이징 처리를 할 수 있습니다.


