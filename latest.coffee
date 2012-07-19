_ = require "dd://modules/underscore/1.3.3/underscore"

defaultTpl = """
<a href="<%= post.d_title %>" title="<%= post.d_title %>"><%= post.d_title %></a>
"""

latest = ({layout:l,title_length:tl,template:tpl})->

        Tpl = _.template(tpl or defaultTpl)
        html = []

        if l isnt "" and l isnt undefined and l? 
            layoutfirst = """<#{l}>"""
        else
            layoutfirst = ""

        _.each dian.data.posts, (post,tl) -> 

            if post.title
                if post.title.length > tl 
                    post.d_title = dian.tools.nohtmlTruncate(post.title,tl)
                else
                    post.d_title = post.title

            else if post.song
                if post.song.length > tl 
                    post.d_title = dian.tools.nohtmlTruncate(post.song,tl)
                else
                    post.d_title = post.song

            else if post.description
                post.d_title = dian.tools.nohtmlTruncate(post.description,tl)

            else if post.content
                post.d_title = dian.tools.nohtmlTruncate(post.content,tl)

            else
                post.d_title = post.type_name


            if post.text 
                post.d_content = post.content
            else
                post.d_content = post.description


            html.push(Tpl({post:post}))
        
        layoutmid = html.join('')

        if l isnt "" and l isnt undefined and l? 
            layoutlast = """</#{l}>"""
        else
            layoutlast = ""

        write(layoutfirst + layoutmid + layoutlast)
    
exports.latest = latest