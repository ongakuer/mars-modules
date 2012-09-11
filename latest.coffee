_ = require "dd://modules/underscore/1.3.3/underscore"
moment = require("dd://modules/moment/1.5.0/moment")

defaultTpl = """
<a href="<%=post.url%>" title="<%= dian.tools.nohtmlTruncate(post.d_title,20) %>"><%= dian.tools.nohtmlTruncate(post.d_title,20) %></a>
"""

latest = ({template:tpl,layout:l,thumb:tbsize,nothumb:nothumb})->

        Tpl = _.template(tpl or defaultTpl)
        html = []

        if l isnt "" and l isnt undefined and l? 
            layoutfirst = """<#{l}>"""
        else
            layoutfirst = ""

        _.each dian.data.posts, (post) -> 

            if post.title
                post.d_title = post.title
            
            else if post.song
                post.d_title = post.song
                
            else if post.description
                post.d_title = post.description

            else if post.content
                post.d_title = post.content
            else
                post.d_title = post.type_name

            if post.text 
                post.d_content = post.content
            else
                post.d_content = post.description

            ##怎么感觉笨笨的样子。。。
            if !_.isEmpty(post.thumbnail)
                if tbsize is "250"
                    post.d_thumb = post.thumbnail['250'].src
                else if tbsize is "500"
                    post.d_thumb = post.thumbnail['500'].src
                else if tbsize is "800"
                    post.d_thumb = post.thumbnail['800'].src
                else if tbsize is "1280"
                    post.d_thumb = post.thumbnail['1280'].src
                else if tbsize is "square_250"
                    post.d_thumb = post.thumbnail.square_250.src
                else if tbsize is "square_100"
                    post.d_thumb = post.thumbnail.square_100.src
                else
                    post.d_thumb = nothumb or "http://x.libdd.com/farm1/08871e/be67d5dc/250.jpg"

            else if post.photo

                if tbsize is "250"
                    post.d_thumb = post.photos[0]['250'].src
                else if tbsize is "500"
                    post.d_thumb = post.photos[0]['500'].src
                else if tbsize is "800"
                    post.d_thumb = post.photos[0]['800'].src
                else if tbsize is "1280"
                    post.d_thumb = post.photos[0]['1280'].src
                else if tbsize is "square_250"
                    post.d_thumb = post.photos[0].square_250.src
                else if tbsize is "square_100"
                    post.d_thumb = post.photos[0].square_100.src
                else
                    post.d_thumb = nothumb or "http://x.libdd.com/farm1/08871e/be67d5dc/250.jpg"

            else if post.audio
                if tbsize is "250" or tbsize is "square_250"
                    post.d_thumb = post.covers.square_250
                else if tbsize is "square_100"
                    post.d_thumb = post.covers.square_100
                else if tbsize is "500" or tbsize is "800" or tbsize is "1280"
                    post.d_thumb = post.covers['1280']
                else
                    post.d_thumb = nothumb or "http://x.libdd.com/farm1/08871e/be67d5dc/250.jpg"
            else if post.video
                post.d_thumb = post.cover;
            else 
                post.d_thumb = nothumb or "http://x.libdd.com/farm1/08871e/be67d5dc/250.jpg"
       

            html.push(Tpl({post:post,moment:moment,_:_}))
        
        layoutmid = html.join('')

        if l isnt "" and l isnt undefined and l? 
            layoutlast = """</#{l}>"""
        else
            layoutlast = ""

        write(layoutfirst + layoutmid + layoutlast)
    
exports.latest = latest