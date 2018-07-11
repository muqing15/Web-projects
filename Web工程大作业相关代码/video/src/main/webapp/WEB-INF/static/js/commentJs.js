$(document).ready(function(){
	$(".sendButton").click(

		function(){
            alert("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
			$.post("http://localhost:8080/comment",
                {content:$(".ipt-txt").val(),
				 videoid:$('#video-id').val()},
                function(data){
		if ($(".ipt-txt").val()!="") {
			$("#ff").after("<div class=\"item-comment\"><div class=\"area-comment-left\"><a class=\"thumb\" target=\"_blank\" href=\"#\"><img class=\"avatar\" src=\""+data.imgurl+"\"></a></div><div class=\"area-comment-right\"><div class=\"author-comment last\">\n<a class=\"name\" target=\"_blank\" href=\"#\">"+"用户名"+"</a>\n<span class=\"time_\">发表于 "+data.time+"</span>\n</div><div class=\"content-comment\">"+$(".ipt-txt").val()+"</div><div class=\"author-comment\"></div></div><div class=\"area-comment-divider\"></div></div>");
		}
        });
	});
});
