titleforamt=(post,tl) ->
    if post.title
        dian.tools.nohtml(post.title)
    else if post.song
        dian.tools.nohtml(post.song)
    else if post.description
        dian.tools.nohtmlTruncate(post.description, tl)
    else if post.content
        dian.tools.nohtmlTruncate(post.content, tl)        
    else 
        post.type_name

posturl = -> 
    (post.url for post in dian.data.posts).join('')

title = (tl) ->
    titleforamt(post,tl) for post in dian.data.posts

tags = ->
    (tagloop(post) for post in dian.data.posts).join('')

tagloop =(post) ->
    if post.tags.length > 0
        (tag.name for tag in post.tags).join(',')


wumii=({num:n,mode:m,title_length:tl}) ->
    write("""
        <script type="text/javascript" id="wumiiRelatedItems"></script>
        <script type="text/javascript">
            var wumiiPermaLink = "#{posturl()}"; 
            var wumiiTitle = "#{title(tl)}"; 
            var wumiiTags = "#{tags()}";
            var wumiiSitePrefix = "#{dian.data.global.url}";
            var wumiiParams = "&num=#{n}&mode=#{m}&pf=JAVASCRIPT";
        </script>

        <script type="text/javascript" src="http://widget.wumii.com/ext/relatedItemsWidget"></script>
        <a href="http://www.wumii.com/widget/relatedItems" style="border:0;">
            <img src="http://static.wumii.com/images/pixel.png" alt="无觅相关文章插件，快速提升流量" style="border:0;padding:0;margin:0;" />
        </a>
    """)

exports.wumii = wumii