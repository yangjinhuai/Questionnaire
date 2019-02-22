$(function() 
{
	$('#headnav li').click(
			function() 
			{
				var _id = $(this).index();
				// 主导航与左侧导航关联
				$(this).addClass('current-menu').siblings().removeClass('current-menu');
				$('#leftmenu').find('.leftmenu-item').eq(_id).css('display','block').siblings('.leftmenu-item').css('display','none');
			}             );

	$('#link_1').click(function() 
	{
		if (false == $('#leftmenu').is(':visible')) 
		{
			$('#leftmenu').css('display', 'block');
			$(this).children('a').text('隐藏菜单');
		} 
		else 
		{
			$('#leftmenu').css('display', 'none');
			$(this).children('a').text('显示菜单');
		}
	});

	var d = true;
	$('#leftmenu dl dt').click(function() 
	{
		$(this).siblings('dd').slideToggle('fast');
		if (d == true) 
		{
			$(this).css('background-position', 'right -40px');
			d = false;
		}
		else 
		{
			$(this).css('background-position', 'right 12px');
			d = true;
		}
	});
	
	//左侧菜单切换
    $('#leftmenu dl dd ul li a').click(function()
    {
        var _link = $(this).attr('_link');    
        $('#main').attr('src', _link);
        $(this).addClass('current-menuleft').parent().siblings().children().removeClass('current-menuleft');
        $(this).parents('dl').siblings().find('dd ul li a').removeClass('current-menuleft');
    });
});