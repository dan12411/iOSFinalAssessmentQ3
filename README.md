# iOSFinalAssessmentQ3

[![Travis branch](https://img.shields.io/badge/bulid-passing-brightgreen.svg)]()

題目：

1. 撰寫一個程式發 GET 到 https://httpbin.org/get, 接收回傳資料並把 origin 的值用 NSLog 印出來。

2. 撰寫一個程式發 POST 到 https://httpsbin.org/post, post 的 body 是 JSON 格式: {"time" : "2016-07-15" 12:00:00}, "2016-07-15 12:00:00" 替換為送出 POST 的時間，並且用 NSDateFormatter 產生出上述的格式，把收到回傳時的時間，跟 time 值作出比較，算出 request 花的時間，用 NSLog 以"花了xx秒"的格式印出來。

---

實作過程：

1. 參考之前上課get/post Sheetsu API資料的程式碼，修改url，並改用NSLog印出GET的資料

2-1. 將httpMethod改成POST

2-2. 產生current time，並且格式為"yyyy-MM-dd HH:mm:ss"

2-3. 把產生的current time，轉為JSON格式

2-4. 利用URLSession.shared.dataTask將JSON data上傳

2-5. 用responseTime..timeIntervalSince，計算出反應時間差值

2-6. NSLog把結果印出來

---

參考資料：

1. 參考之前上課get/post Sheetsu API資料的程式碼，修改url，並改用NSLog印出GET的資料

2. [How to make HTTP Post request with JSON body in Swift](http://stackoverflow.com/questions/31937686/how-to-make-http-post-request-with-json-body-in-swift)

3. [How to work with dates and times in Swift, part two: Calculations with dates [Updated for Swift 2]](http://www.globalnerdy.com/2015/01/29/how-to-work-with-dates-and-times-in-swift-part-two-calculations-with-dates/)
