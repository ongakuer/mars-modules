fancybox = ({ openEffect: oE,closeEffect: cE,titleType:tT,closeBtn: cB,helper: H,mouseWheel:mW,autoAdd:aD }) ->
    
    if mW isnt "" and mW isnt undefined and mW? and mW isnt false
        write("""
        <script type="text/javascript" src="http://x.libdd.com/farm1/a05baa/fde6509f/jquery.mousewheel-3.0.6.pack.js"></script>
        """)

    write("""
        <link rel="stylesheet" href="http://x.libdd.com/farm1/08871e/c2808235/0.css"><!--mian-->
        <script type="text/javascript" src="http://x.libdd.com/farm1/08871e/7d5f5020/fancy.js"></script>
    """)
    
    if H isnt "" and H isnt undefined and H? and H isnt false
        write("""
        <link rel="stylesheet" href="http://x.libdd.com/farm1/08871e/209d4eed/0.css"><!--helper-->
        <script type="text/javascript" src="http://x.libdd.com/farm1/08871e/95134743/jquery.fancybox-buttons.js"></script>
        """)

    write("""
        <script type="text/javascript">
            $(function(){
                $(".fancybox").fancybox({
    """)

    if oE isnt "" and oE isnt undefined and oE?        
        write("""openEffect : '#{oE}',""")
    else 
        write("""openEffect : 'elastic',""")

    if cE isnt "" and cE isnt undefined and cE?        
        write("""closeEffect : '#{cE}',""")
    else 
        write("""closeEffect : 'elastic',""")

    if cB isnt "" and cB isnt undefined and cB? and cB isnt false
        write("""closeBtn : true,""")
    else if cB is false
        write("""closeBtn : false,""")

    write("""helpers : { """)
    
    if tT isnt "" and tT isnt undefined and tT?

        if H isnt "" and H isnt undefined and H? and H isnt false

            write("""title : {type : '#{tT}'},""")
        else
            write("""title : {type : '#{tT}'}""")
    else

        if H isnt "" and H isnt undefined and H? and H isnt false

            write("""title : {type : 'float'},""")
        else
            write("""title : {type : 'float'}""")

    if H isnt "" and H isnt undefined and H? and H isnt false

        write("""buttons : {}""")                

    write("""}});""")  

    if aD isnt "" and aD isnt undefined and aD?
        write("""
                $('#{aD}'+' img').each(function(){
                    var $dd_text_img = $(this);
                    var $dd_text_img_span_a = $dd_text_img.parent('span').parent('a');
                    var $dd_text_img_a = $dd_text_img.parent('a');

                    if($dd_text_img_a.length < 1 && $dd_text_img_span_a.length < 1 ){
                        $dd_text_img_src = $dd_text_img.attr('src');
                        $dd_text_img.wrap('<a href='+$dd_text_img_src+'></a>');
                    } 

                });

                $('#{aD}'+' a').each(function(){
                    var $dd_a = $(this);
                    var $dd_a_href = $(this).attr('href');
                    var dd_pic = /(.*)+\.(jpg|jpeg|bmp|gif|png)$/i 
                    if (dd_pic.test($dd_a_href)){
                        $dd_a.addClass('fancybox').attr('rel','fancygroup');
                    }
                })

                """)

    write("""
          });
        </script>""")

exports.fancybox = fancybox