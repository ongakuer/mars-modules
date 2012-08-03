__=require('dd://modules/underscore/1.3.3/underscore')

nohtml = dian.tools.nohtml 

############
############ 单张图
pOne = (w,h,m,p,bw,bs,postarrt,c,i,num,st) ->
    post=dian.data.posts[postarrt]
    html=[]

    html.push(""" <div class="d_gallery_one" style="margin-top:#{m}px">""")

    if w <=500
        ps =500
    else if w <=800
        ps = 800
    else 
        ps = 1280

    ph = h 
    pw = w - p*2 - bw*2

    html.push("""<a href="#{post.photos[num]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_1" style="display:block;margin-right:#{m}px;padding:#{p}px;width:#{pw}px;""")
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[num].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;max-height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[num][ps].src}" """)
    if post.description? then html.push(""" alt="#{nohtml(post.photos[num].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto;"></div></a>""")

    html.push("""</a></div>""")
    html.join('')

############
############ 两张图并排
pTwo = (w,h,m,p,bw,bs,postarrt,c,i,n,st) ->
    post=dian.data.posts[postarrt]
    n2 = n+1
    html = []

    html.push("""<div class="d_gallery_two clearfix" style="margin-top:#{m}px;">""")

    if w <= 500
        oh1 = post.photos[n]["500"].height
        oh2 = post.photos[n2]["500"].height
        ow1 = post.photos[n]["500"].width
        ow2 = post.photos[n2]["500"].width
        
        ps = 500

    else if w <=800
        oh1 = post.photos[n]["500"].height
        oh2 = post.photos[n2]["500"].height
        ow1 = post.photos[n]["500"].width
        ow2 = post.photos[n2]["500"].width

        ps = 800

    else
        oh1 = post.photos[n]["500"].height
        oh2 = post.photos[n2]["500"].height
        ow1 = post.photos[n]["500"].width
        ow2 = post.photos[n2]["500"].width
        
        ps = 1280

    pw = w/2-p*2-bw*2-m/2
    ph1 = pw * oh1 / ow1
    ph2 = pw * oh2 / ow2

    if ph1 > ph2
        ph =  ph2 
    else  
        ph =  ph1 


    html.push("""<a href="#{post.photos[n]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_2_1" style="display:block;float:left;margin-right:#{m}px;padding:#{p}px; """)
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[n].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[n][ps].src}" """)
    if post.description? then html.push(""" alt="#{nohtml(post.photos[n].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto"></div></a>""")

    #######
    html.push("""<a href="#{post.photos[n2]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_2_2" style="display:block;float:right;padding:#{p}px; """)
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[n2].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[n2][ps].src}" """)
    if post.description? then html.push("""alt="#{nohtml(post.photos[n2].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto"></div></a>""")

    
    html.push("""</div>""")
    html.join('')

############
############ 三张图并排
pThree = (w,h,m,p,bw,bs,postarrt,c,i,n,st) ->
    post=dian.data.posts[postarrt]
    n2 = n+1
    n3 = n+2
    html = []
    html.push("""<div class="d_gallery_three clearfix" style="margin-top:#{m}px;">""")

    if w <= 500
        oh1 = post.photos[n]["500"].height
        oh2 = post.photos[n2]["500"].height
        oh3 = post.photos[n3]["500"].height

        ow1 = post.photos[n]["500"].width
        ow2 = post.photos[n2]["500"].width
        ow3 = post.photos[n3]["500"].width

        ph1 = (w/3-p*2-bw*2-2*m/3) * oh1 / ow1
        ph2 = (w/3-p*2-bw*2-2*m/3) * oh2 / ow2
        ph3 = (w/3-p*2-bw*2-2*m/3) * oh3 / ow3

        ph = __.min([ph1,ph2,ph3])

        ps = 500

    else if w <= 800
        oh1 = post.photos[n]["800"].height
        oh2 = post.photos[n2]["800"].height
        oh3 = post.photos[n3]["800"].height

        ow1 = post.photos[n]["800"].width
        ow2 = post.photos[n2]["800"].width
        ow3 = post.photos[n3]["800"].width

        ph1 = (w/3-p*2-bw*2-2*m/3) * oh1 / ow1
        ph2 = (w/3-p*2-bw*2-2*m/3) * oh2 / ow2
        ph3 = (w/3-p*2-bw*2-2*m/3) * oh3 / ow3

        ph = __.min([ph1,ph2,ph3])

        ps = 800

    else 
        oh1 = post.photos[n]["1280"].height
        oh2 = post.photos[n2]["1280"].height
        oh3 = post.photos[n3]["1280"].height

        ow1 = post.photos[n]["1280"].width
        ow2 = post.photos[n2]["1280"].width
        ow3 = post.photos[n3]["1280"].width

        ph1 = (w/3-p*2-bw*2-2*m/3) * oh1 / ow1
        ph2 = (w/3-p*2-bw*2-2*m/3) * oh2 / ow2
        ph3 = (w/3-p*2-bw*2-2*m/3) * oh3 / ow3

        ph = __.min([ph1,ph2,ph3])

        ps = 1280

    pw = w/3 - p*2 - bw*2 -2*m/3

    ######
    html.push("""<a href="#{post.photos[n]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_3_1" style="display:block;float:left;margin-right:#{m}px;padding:#{p}px; """)
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[n].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[n][ps].src}" """)
    if post.description? then html.push(""" alt="#{nohtml(post.photos[n].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto"></div></a>""")

    ######
    html.push("""<a href="#{post.photos[n2]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_3_2" style="display:block;float:left;margin-right:#{m}px;padding:#{p}px; """)
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[n2].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[n2][ps].src}" """)
    if post.description? then html.push(""" alt="#{nohtml(post.photos[n2].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto"></div></a>""")

    ######
    html.push("""<a href="#{post.photos[n3]["1280"].src}" rel=#{postarrt} class=" """)
    if c isnt "" and c isnt null and c? then html.push(c)
    html.push(""" d_photo_3_3" style="display:block;float:right;padding:#{p}px; """)
    if bw isnt "" and bw isnt null and bw? and bs isnt "" and bs isnt null and bs? then html.push("""border-width:#{bw}px;border-style:#{bs};""")
    if st and st isnt null and st? 
        if post.description? then html.push(""" " title="#{nohtml(post.photos[n3].description)}""") else  html.push(""" title=" """)
    html.push(""" "><div style="display:block;width:#{pw}px;height:#{ph}px;overflow:hidden;"> <img src="#{post.photos[n3][ps].src}" """)
    if post.description? then html.push(""" alt="#{nohtml(post.photos[n3].description)}" """) else  html.push(""" alt="" """)
    html.push("""width="#{pw}" style="display:block;min-width:#{pw}px;height:auto"></div></a>""")


    html.push("""</div>""")
    html.join('')

############
############ 循环计数
photoloop = (w,h,m,p,bw,bs,postarrt,c,st) -> 
    post=dian.data.posts[postarrt]
    layout = post.layout+"";
    layoutnum = layout.length - 1
    i = -1
    num = 0

    write("""<div class="d_gallery" style="overflow:hidden;margin-top:-#{m}px;width:#{w}px">""")
    wordloop = while i++ < layoutnum
        result = layout[i]

        if result is "1" 
           write(pOne(w,h,m,p,bw,bs,postarrt,c,i,num,st))
           num = num+1

        if result is "2" 
           write(pTwo(w,h,m,p,bw,bs,postarrt,c,i,num,st))
           num = num+2

        if result is "3" 
           write(pThree(w,h,m,p,bw,bs,postarrt,c,i,num,st))
           num = num+3

    write('</div>')

photos =({maxwidth:w,maxheight:h,margin:m,padding:p,border_width:bw,border_style:bs,post:postarrt,class:c,showtitle:st}) ->
        
        post=dian.data.posts[postarrt]
        if post.photo
            photoloop(w,h,m,p,bw,bs,postarrt,c,st)


exports.photos=photos