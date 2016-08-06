$(document).ready(function(){
	$("#ipt_login_email").attr("disabled", "disabled");
	$("#ipt_login_password").attr("disabled", "disabled");
});


function refreshSwatch() {
	$SliderValue=$('#slider').slider( "value" );
	if($SliderValue==100){
		$('#slider').slider( "value", 92 );
		$("#ipt_login_email").removeAttr("disabled");
		$("#ipt_login_password").removeAttr("disabled");
		$("#slider").unbind();
	}
}
$(function() {
	$("#slider").slider({
		change: refreshSwatch
	});
	// 上面说的你要是直接使用官方的ui js 文件, 要加入以代码
	// $("#slider").html('<span class="glyphicon glyphicon-arrow-right"></span>');
});