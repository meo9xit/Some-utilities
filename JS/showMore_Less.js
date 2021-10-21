jQuery(function(){

var minimized_elements = $('p.minimize');
var maxLines = 20;

minimized_elements.each(function(){    
    // var textArr = $(this).text().split(/\n/); // Not supported in IE < 9
    var textArr = $(this).html().replace(/\n?<br>/gi,"<br>").split(/<br>/);
    var countLines = textArr.length;

    if (countLines > maxLines) {
        text_less = textArr.slice(0, maxLines).join("<br>");
        text_more = textArr.slice(maxLines, countLines).join("<br>");
    }
    else return;

    $(this).html(
        text_less + '<span>... </span><a href="#" class="more">More</a>'+
        '<span style="display:none;">'+ text_more +' <a href="#" class="less">Less</a></span>'
    );
}); 

$('a.more', minimized_elements).click(function(event){
    event.preventDefault();
    $(this).hide().prev().hide();
    $(this).next().show();        
});

$('a.less', minimized_elements).click(function(event){
    event.preventDefault();
    $(this).parent().hide().prev().show().prev().show();    
});

});