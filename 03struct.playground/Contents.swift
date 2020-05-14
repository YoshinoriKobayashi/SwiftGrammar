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

// イニシャライザ（初期値）
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
