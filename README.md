# Ultimate Portfolio

- Xcode version: Version 14.0.1
- iOS Version: 16.0

## 2. Designing a great model

### Derived attribute（派生屬性）

`modificationDate`這項屬性需要取得每次修改的編輯時間，可以透過設定派生屬性，讓系統在每次訪問`modificationDate`時，自動幫你添加當前時間

添加方式：

1. 選取`modificationDate`這個屬性
2. 點開右邊的屬性面板，將「□ Derived」打勾
3. 在下面的Derivation欄位填入「`now()`」


### Singleton（單例）

單例是一種設計模式，他讓App在啟動時實例化只有一次，並且限制各種單位的存取，單例廣泛被Apple使用，例如`UIDevice`、`UIApplication`，然而單例不適合用在共享資料時，當很多人共同存取同一份資料，單例很難確保他的狀態是乾淨的，因此，需要使用另一顆Class控制資料：`DataController` 


`DataController`將會使用`ObservableObject`協定，這允許任何View都能創建並且監聽這個class實例


### Persistent store（持久儲存）

App的儲存分為兩部分：
- 硬碟儲存（Disk）：資料長久穩固的儲存在硬碟中，不會因為關閉App就不見
- 記憶體儲存（RAM）：資料暫存在記憶體當中，如果關掉App該資料會遺失

`viewContext`則是結合兩種儲存，稱為持久儲存的概念，一般來說資料儲存在硬碟中，但是當使用App時，會將一部分的資料移到記憶體當中，以期快速訪問他們

## First steps in UI

### CoreData的optional

當你打開CoreData的介面，點選某個Entity之中的Attribute，並且打開右側的屬性面板，你可以看到「■ Optional」這個核取方塊，並且他是預設被打勾了，這裡的optional意思跟Swift的optional（`?`）意思不同，CoreData的optional意思是說當儲存資料時，如果該屬性是空的，會不會幫你存？如果optional被打勾的話，即便是空值他也會保存，如果optional的打勾被拔掉，那麼如果該屬性儲存時是空值，資料儲存將會失敗
