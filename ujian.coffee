ujianType0 =(n,t0pos,t0icon,t0color,u) ->
    start = """<script type="text/javascript" src="http://v1.ujian.cc/code/ujian.js?type=slide"""

    if n isnt ""  and n isnt undefined and n? 
        num = """&num=#{n}"""
    else 
        num = """"""

    if t0pos isnt ""  and t0pos isnt undefined and t0pos? 
        pos = """&pos=#{t0pos}"""
    else 
        pos = """""" 

    if t0color isnt ""  and t0color isnt undefined and t0color? 
        btn = """&btn=#{t0color}"""
    else 
        btn = """""" 


    if t0icon isnt ""  and t0icon isnt undefined and t0icon? 
        icon = """&icon=#{t0icon}"""
    else 
        icon = """""" 


    if u isnt ""  and u isnt undefined and u? 
        uid = """&uid=#{u}"""
    else 
        uid = """""" 

    end =""""></script> """

    write( start + num + pos + btn + icon + uid + end )

ujianType1 = (n,t1mode,u) -> 

    hookstart= """<div class="ujian-hook"></div><script type="text/javascript">var ujian_config = {"""

    if n isnt "" and n isnt undefined and n? 
        num = """num:#{n},"""
    else 
        num = """"""


    if t1mode isnt "" and t1mode isnt undefined and t1mode? 
        mode = """showType:#{t1mode}"""
    else 
        mode = """"""

    hookend = """};</script>"""


    start = """
<script type="text/javascript" src="http://v1.ujian.cc/code/ujian.js"""

    if u isnt "" and u isnt undefined and u? 
        uid = """?uid=#{u}"""
    else 
        uid = """"""

    end = """"></script>"""

    write( hookstart + num + mode + hookend + start + uid + end )

ujian = ({type:t,num:n,type0_pos:t0pos,type0_icon:t0icon,type0_color:t0color,type1_mode:t1mode,uid:u }) ->

    if t is 0
        ujianType0(n,t0pos,t0icon,t0color,u)
    else if t is 1
        ujianType1(n,t1mode,u)
    
exports.ujian = ujian