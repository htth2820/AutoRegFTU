#include <_HttpRequest.au3>
; Phải request đến Default.aspx?page=dangnhap mới đúng ViewState, nãy là chỉ đến Default.aspx
$source_login = _HttpRequest(4, 'http://ftugate.ftu.edu.vn/','','','','User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0|Upgrade-Insecure-Requests: 1')
 $cookie = _GetCookie($source_login[0])
; MsgBox(1,1,$cookie)
$source_login = _HttpRequest(4, 'http://ftugate.ftu.edu.vn/','',$cookie,'','User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0|Upgrade-Insecure-Requests: 1')
;FileDelete(@ScriptDir&'\test1.html')
;		FileWrite(@ScriptDir&'\test1.html',$source_login[0])
;		ShellExecute(@ScriptDir&'\test1.html')

$acc='1611110303'
$pass = 'ftu'
$in__VIEWSTATE = StringRegExp($source_login[1], 'name="__VIEWSTATE" id="__VIEWSTATE" value="(.*?)"', 1)
		$in__VIEWSTATEGENERATOR = StringRegExp($source_login[1], 'name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="(.*?)"', 1)
		$data_login = '__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=' & $in__VIEWSTATE[0] & '&__VIEWSTATEGENERATOR=' & $in__VIEWSTATEGENERATOR[0] & '&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa=' & $acc & '&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau=' & $pass &'&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap=Đăng Nhập'
						  ;'__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=/wEPD37yxDwdhNPPchnSu4J&__VIEWSTATEGENERATOR=CA0B0334&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa=1411110035&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau=ftu&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap=Đăng Nhập'
						  ;'__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=/wEPDT7g0VuLz+kFvwK392z8&__VIEWSTATEGENERATOR=CA0B0334&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa=1611110303&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau=ftu&ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap=Đăng Nhập'
		FileDelete(@ScriptDir&'\data.txt')
				FileWrite(@ScriptDir&'\data.txt',$data_login)
		ShellExecute(@ScriptDir&'\data.txt')
		$login = _HttpRequest(4, 'http://ftugate.ftu.edu.vn/default.aspx', $data_login, $cookie,'http://ftugate.ftu.edu.vn/','User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0|Origin: http://ftugate.ftu.edu.vn|Upgrade-Insecure-Requests: 1')
		;$login1 = _HttpRequest(4, 'http://ftugate.ftu.edu.vn/default.aspx?page=dangnhap', $data_login, $cookie, 'http://ftugate.ftu.edu.vn/', 'Upgrade-Insecure-Requests: 1')
;MsgBox(1,0,$login[0])
		FileDelete(@ScriptDir&'\test1.html')
		FileWrite(@ScriptDir&'\test1.html',$login[1])
		ShellExecute(@ScriptDir&'\test1.html')


		;'__EVENTARGUMENT=&__EVENTTARGET=&__VIEWSTATE=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L2gzPi4uLiA8c3BhbiBjbGFzcz0nTmdheVRpdGxlJz4oMDUvMDYvMjAyMCk8L3NwYW4+PC9hPh8EAoCABGRkAgkPZBYCZg8PFgYfCAsrBAEfAgXWBDxpbWcgc3JjPSdBcHBfVGhlbWVzL1N0YW5kYXJkL0ltYWdlcy9CdWxsOS5naWYnIGFsdD0nJy8+PGEgY2xhc3M9J1RleHRUaXRsZScgaHJlZj0nZGVmYXVsdC5hc3B4P3BhZ2U9Y2hpdGlldHRob25ndGluJmlkPTI1Jz48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNHB0OyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyI+PHN0cm9uZz5bPC9zdHJvbmc+PC9zcGFuPjxzdHJvbmcgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7IGZvbnQtc2l6ZTogMTguNjY2N3B4OyI+QuG7lCBTVU5HIEzhuqZOIDJdJm5ic3A7PC9zdHJvbmc+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTRwdDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPjxzdHJvbmc+xJDEgk5HIEvDnSBDSFVZ4buCTiBM4buKQ0ggVEhJLCBIT8ODTiBUSEksIFRISSBHSMOJUCBHSUFJIMSQT+G6oE4gMS0gSOG7jEMgS+G7siAyLzE5MjAgKMSQ4bq+TiAxOEggTkfDgFkgMDMvNi8yMDIwKTwvc3Ryb25nPjwvc3Bhbj4uLi4gPHNwYW4gY2xhc3M9J05nYXlUaXRsZSc+KDAyLzA2LzIwMjApPC9zcGFuPjwvYT4fBAKAgARkZAIKD2QWAmYPDxYGHwgLKwQBHwIF1QI8aW1nIHNyYz0nQXBwX1RoZW1lcy9TdGFuZGFyZC9JbWFnZXMvQnVsbDkuZ2lmJyBhbHQ9JycvPjxhIGNsYXNzPSdUZXh0VGl0bGUnIGhyZWY9J2RlZmF1bHQuYXNweD9wYWdlPWNoaXRpZXR0aG9uZ3RpbiZpZD0yNCc+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7IGZvbnQtc2l6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&__VIEWSTATEGENERATOR=CA0B0334&ctl00$ContentPlaceHolder1$ctl00$btnDangNhap=Đăng Nhập&ctl00$ContentPlaceHolder1$ctl00$txtMatKhau=trinhhangnga&ctl00$ContentPlaceHolder1$ctl00$txtTaiKhoa=1812210249'

;'__EVENTARGUMENT=&__EVENTTARGET=&__VIEWSTATE=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&__VIEWSTATEGENERATOR=CA0B0334&ctl00$ContentPlaceHolder1$ctl00$btnDangNhap=Đăng Nhập&ctl00$ContentPlaceHolder1$ctl00$txtMatKhau=trinhhangnga&ctl00$ContentPlaceHolder1$ctl00$txtTaiKhoa=1812210249'
