//判断浏览器版本是否太低
//判断浏览器版本
	function getVendorPrefix() {
		// 使用body是为了避免在还需要传入元素
		var body = document.body || document.documentElement,
		style = body.style,
		vendor = ['webkit', 'khtml', 'moz', 'ms', 'o'],
		i = 0;
		
		while (i < vendor.length) {
			// 此处进行判断是否有对应的内核前缀
			if (typeof style[vendor[i] + 'Transition'] === 'string') {
				return vendor[i];
			}
			i++;
		}
	}
	if(typeof(getVendorPrefix())=="undefined"){
		alert("您的浏览器内核版本过低，请更换其他浏览器，如果使用的是多核浏览器，如360 请更换至 【极速模式】");
	}