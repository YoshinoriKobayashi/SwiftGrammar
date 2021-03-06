// 配列の部分的な置換
var s = ["春","夏","秋","冬"]
s[0...0] = ["初春","仲春","晩春"]
print(s)        // ["初春", "仲春", "晩春", "夏", "秋", "冬"]
s[1...3] =  ["花見","梅雨","夏休み"]
print(s)        // ["初春", "花見", "梅雨", "夏休み", "秋", "冬"]
s[3...4] = []
print(s)        // ["初春", "花見", "梅雨", "冬"]
s[...] = ["祭り"]
print(s)        // ["祭り"]

// 部分配列の型

// 配列のイニシャライザ

// 配列のプロパティとメソッド

// 配列の比較

// 可変化の引数が利用でいる関数
