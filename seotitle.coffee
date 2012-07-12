tagtitle = (s) -> write(dian.data.global.tag_name + s + dian.data.global.name ) 

tagtitles = (l,s) -> write( dian.data.global.tag_name+l+"第"+dian.data.pagination.current_number+"页"+s+dian.data.global.name )

listtitle = -> write(dian.data.global.name) 

listtitles = (l) -> write(dian.data.global.name+l+"第"+dian.data.pagination.current_number+"页")

pagetitle = -> 
    page.title if page.current for page in dian.data.pages

posttitle = (l) -> 
    if dian.data.posts[0].title
        dian.data.posts[0].title
    else if dian.data.posts[0].song
        dian.data.posts[0].song
    else if dian.data.posts[0].description
        dian.tools.nohtmlTruncate(dian.data.posts[0].description,l)
    else if dian.data.posts[0].content
        dian.tools.nohtmlTruncate(dian.data.posts[0].content,l)
    else
        dian.data.posts[0].type_name 

title = (line,separate,length,notfound) ->

    if dian.request.action
        listtitle()
    else if dian.data.view.notFound
        write(notfound+separate+dian.data.global.name)
    else if dian.data.view.tag 
        if dian.data.pagination.current_number is 1  and dian.data.posts[0]? 
            tagtitle(separate) 
        else if dian.data.posts[0]?
            tagtitles(line,separate)
        else 
            write("没有找到"+'"'+dian.data.global.tag_name+'"'+separate+dian.data.global.name)
    else if dian.data.view.page and !dian.data.view.notFound
        write( pagetitle() + separate + dian.data.global.name )
    else if dian.data.view.post and !dian.data.view.notFound
        write( posttitle(length) + separate + dian.data.global.name )
    else if dian.data.view.list
        if dian.data.pagination.current_number? and dian.data.pagination.current_number isnt 1 then listtitles(line) else listtitle()

exports.title = title