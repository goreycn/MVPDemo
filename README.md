# MVPDemo
关于MVP构架的文字说明, 自行百度.
这里只留下MVP使用例子.

`重点`, 要为V和P分别定义一个protocol.
然后在P的init方法里, 把V和M关联到P.

所以一套MVP,用到3个class,两个protocol
然后看代码, 一目了然.


#### Model
```swift
// Person.swift
struct Person {
    let firstName: String
    let lastName: String
}
```


#### View
```swift
// ViewController.swift

import UIKit

class ViewController: UIViewController, GreetingView {

    @IBOutlet weak var lbTitle: UILabel!
    var presenter: GreetingPresenter? = nil
    var model : Person? = nil
    
    @IBAction func onClick(_ sender: Any) {
        self.presenter?.showGreeting()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
   		 
   		 // Presenter的初始化, 会把View 和 Model联系起来
        model = Person(firstName: "Grubby", lastName: "Gao")
        presenter = GreetingPresenter(view: self, person: self.model!)
    }

    // 回调:P更新V时,会调用此方法
    func setGreeting(greeting: String) {
        self.lbTitle.text = greeting
    }

}

```

#### Presenter
```swift
// GreetingView.swift

import Foundation

// 给View使用
protocol GreetingView {
    func setGreeting(greeting: String)
}

// 给Presenter使用
protocol GreetingViewPresenter {
    init(view: GreetingView, person:Person)
    func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
    
    let view : GreetingView
    let person: Person
    
    // GreetingViewPresenter 代理
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        self.view.setGreeting(greeting: "你好, \(self.person.firstName) \(self.person)")
    }
}

```
