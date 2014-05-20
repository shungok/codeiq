# 実行方法
```
% cat tickets4unix.txt | ./codeiq_ticketgobble.rb
62 Afghanistan Angola Antarctica Austria Azerbaijan Barbados Belarus Botswana Burundi Canada China Cyprus Denmark Ecuador Eritrea Ethiopia Finland Georgia Germany Ghana Greece Guadeloupe Jordan Kiribati Liberia Libya Liechtenstein Macao Malawi Malaysia Martinique Montenegro Montserrat Myanmar Namibia Narnia Nepal Niger Oman Palau Poland Portugal Romania Rwanda Samoa Senegal Serbia Seychelles Singapore Slovakia Slovenia Somalia Sudan Sweden Switzerland Tajikistan Tokelau Turkey Uganda Ukraine Zambia Zimbabwe
```

# ポイント
より帰着日が早いチケットを優先して選択し、プランに追加する方法をとりました。

既に選択したチケットとまだ選択していないチケットを見極める為に、選択済みのチケットの帰着日を記憶し、その帰着日以降の出発日のチケットを選択するようにしています。

事前準備としてソートしてもしなくても動作します。

# 評価
5
