// 構造体
/*
 ・値型のデータ
 ・代入や関数呼び出しでデータの実態がコピーされ新しいインスタンスが作成される
 ・複数箇所から同じ実体を参照するときはクラスを使う
 */

// 構造体内の変数をプロパティと呼ぶ
// メンバはメソッド、プロパティを含めた総称
struct SimpleDate {
    var year: Int   // 年
    var month: Int  // 月
    var day: Int    // 日
}

// 既定イニシャライザ　宣言時に設定
struct SimpleDate2 {
    var year:Int = 2010
    var month:Int = 7
    var day = 28
}
var d = SimpleDate2()
print(d.year)
d.day = 29 // 代入も可能

/* ---------------------------
        全項目イニシャライザ 
-----------------------------*/
// 個々のプロパティの値を指定してインスタンスを生成するイニシャライザ
// 各プロパティ名を引数のキーワードとして書き連ねる

// 構造体で初期値を指定していない場合は、使うときに指定を強制する
struct AnotherDate {
    var month,day:Int
    var year = 1998
}
var move = AnotherDate(month: 5, day: 6, year: 1998) // 初期値を指定しないとエラーになる
var camp = AnotherDate(month: 8, day: 8) // year は初期値が設定されているので省略できる。

// 構造体は定数に代入したら変更できない
let event = SimpleDate(year: 2000, month: 9, day: 1998)
// event.year = 10 これはエラー、構造体が値型のため。クラスはできる参照型のため

// 定数プロパティ
// 定数はあとから値が変更できないので、初期化を強制
struct Time {
    let in24h: Bool = false  // 24時制 or 12時制
    var hour = 0,min = 0
}
var t1 = Time()
// var t2 = Time(in24h:true,hour:7,min:0) エラーになる。定数は変更できない
var t2 = Time(hour: 7, min: 0) 

/* まとめ
 ・引数キーワードは、プロパティが定義されている順に強制される
 ・初期値がないプロパティは、イニシャライザで必ず指定
 ・初期値があるプロパティは、イニシャライザで指定しなくていい
 ・初期値がある定数プロパティは、イニシャライザで指定できない
 */

/* ---------------------------
    カスタムイニシャライザ
-----------------------------*/
struct SimpleDate3 {
    var year,month,day:Int
    // init キーワードを指定して初期化する
    init() {
        self.year = 2095  // self も使えるが、省略できる
        month = 10;day = 31
    }
}
var m = SimpleDate3()   // 生成時にカスタムイニシャライザ init が動く
print(m.year)

/*--------------------------------------------------
メソッド
 ---------------------------------------------------*/

// ▼メソッド定義を持つ構造体Time型
struct Time2 {                // 時間と分のみを持つTime型
    let hour, min : Int      // 定数で時刻を保持。全項目イニシャライザを使う
    func advanced(min:Int) -> Time {        //　分を加算
        var m = self.min + min
        var h = self.hour
        if m >= 60 {
            h = (h + m / 60) % 24
            m %= 60
        }
        return Time(hour:h,min:m)   // 新しいインスタンスを返す
    }
    func toString() -> String {     // 時刻を文字列として返す
        let h = hour < 10 ? "\(hour)":"\(hour)"
        let m = min < 10 ? "0\(min)":"\(min)"
        return h + ":" + m
    }
}
let t1 = Time(hour:22,min:45)       // 全項目イニシャライザ
let t2 = t1.advanced(min:140)       // メソッド

