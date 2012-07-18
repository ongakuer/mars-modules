postloop =  (post,tl,e) ->
    if post.title
        if post.title.length > tl 
            d_title = dian.tools.nohtmlTruncate(post.title,tl)
        else
            d_title = post.title

    else if post.song
        if post.song.length > tl 
            d_title = dian.tools.nohtmlTruncate(post.song,tl)
        else
            d_title = post.song

    else if post.description
        d_title = dian.tools.nohtmlTruncate(post.description,tl)

    else if post.content
        d_title = dian.tools.nohtmlTruncate(post.content,tl)

    else 
        d_title = post.type_name


    if e isnt ""  and e isnt undefined and e? 
        eachfirst = """<#{e}>"""
    else
        eachfirst = """"""

    eachmid = """<a href="#{post.url}" title="#{d_title}">#{d_title}</a>"""

    if e isnt ""  and e isnt undefined and e? 
        eachlast = """</#{e}>"""
    else
        eachlast = """"""

    return eachfirst + eachmid + eachlast


latest = ({layout:l,each:e,length:tl})->

        if l isnt "" and l isnt undefined and l? 
            layoutfirst = """<#{l}>"""
        else
            layoutfirst = """"""
    
        layoutmid = (postloop(post,tl,e) for post in dian.data.posts).join('')

        if l isnt "" and l isnt undefined and l? 
            layoutlast = """</#{l}>"""
        else
            layoutlast = """"""
    
        write(layoutfirst + layoutmid + layoutlast)
    
    
exports.latest = latest