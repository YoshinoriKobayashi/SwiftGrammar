import Foundation

// プロトコル
// Swift は、具体的な実装から離れて、型が持つべきメソッドやプロパティなどの
// 宣言をまとめる仕組みを持っており。これをプロトコルという。

// Swiftではクラスではなく、プロトコルを中心にソフトウェア設計、
// プログラミングをすすめることが可能→プロトコル指向

protocol RandomGenerator {
  var randomValue: Int { get }
  func shuffle()
}

// ・プロパティの宣言には var のみが指定でき、 let は指定できない
// ・定数を想定している場合でも var を使う
// ・get や set で当該プロパティが読み込み専用か代入も可能かを指定
// ・定数を想定している場合、 let は使えませんが、 var で { get } と指定することで、
// 「変更できない」という意味合いの指定をすることができる


// プロトコルに適合するクラス
// クラス、構造体、列挙型の名前の後に:を置き、その後に続けてプロトコルを記述することで、
// プロトコルの取り決めにしたがっていることを示す。
// 取り決めに従うことを「適応」あるいは「準拠」(conform）という
class Dice : RandomGenerator {
    var randomValue: Int {
        return _value
    }
    func shuffle() {
        _value = Int(arc4random_uniform(6)) + 1
        
    }
    private var _value: Int = Int(arc4random_uniform(6)) + 1
}

// -------------------------------------
// プロトコルの宣言
protocol Human {
    // プロパティ宣言
    // get,set：読み込み、書き出し可能か
    // ここでは var のみだけで、実装で定数なら let を使うこともある
    // タイププロパティの場合は static を記述
    var name: String? { get }        //　名前
    
    // メソッド宣言：メソッド名、引数、戻り値の型のみ
    // タイプメソッドの場合は static を記述
    func sayHello(to:Human)         // 人に挨拶する。
}
struct Mob : Human {
    let name: String? = nil     // プロパティを定義して実装
    init() {}                   // イニシャライザは何もしない
    func sayHello(to: Human) {
        print("protocol")
    }
    func cheer() {
        print("頑張れ")            // Human には存在しないメソッド
    }
}

// プロトコルは型として使える
func printNames(list:[Human]) {
    for p in list {
        print((p.name ?? "名無し") + "さん")
        p.cheer()
    }
}
