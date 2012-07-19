_ = require "dd://modules/underscore/1.3.3/underscore"

defaultTpl = """
<a href="<%= url %>" title="<%= title %>"><%= title %></a>
"""

latest = ({layout:l,length:tl,template:tpl})->

        Tpl = _.template(tpl or defaultTpl)
        html = []

        if l isnt "" and l isnt undefined and l? 
            layoutfirst = """<#{l}>"""
        else
            layoutfirst = ""

        _.each dian.data.posts, (post) -> 

            if post.title
                if post.title.length > tl 
                    post.title = dian.tools.nohtmlTruncate(post.title,tl)
                else
                    post.title = post.title

            else if post.song
                if post.song.length > tl 
                    post.title = dian.tools.nohtmlTruncate(post.song,tl)
                else
                    post.title = post.song

            else if post.description
                post.title = dian.tools.nohtmlTruncate(post.description,tl)

            else if post.content
                post.title = dian.tools.nohtmlTruncate(post.content,tl)

            else 
                post.title = post.type_name


            html.push(Tpl({url: post.url, title: post.title}))
        
        layoutmid = html.join('')

        if l isnt "" and l isnt undefined and l? 
            layoutlast = """</#{l}>"""
        else
            layoutlast = ""

        write(layoutfirst + layoutmid + layoutlast)
    
exports.latest = latest