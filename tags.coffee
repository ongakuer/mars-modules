_ = require "dd://modules/underscore/1.3.3/underscore"

defaultTpl = '<a href="<%=tag.url%>" title="<%=tag.name%>"><%=tag.name%></a>'

tags = ({ template:tagTpl,layout:l,num:n}) ->
    Tpl = _.template( tagTpl || defaultTpl )
    html = []

    if n isnt "" and n isnt undefined and n?
        dian.system_options.tags.number = n

    if l isnt "" and l isnt undefined and l? 
            layoutfirst = """<#{l}>"""
        else
            layoutfirst = ""

    _.each dian.data.tags, (tag) -> 

        html.push(Tpl({tag:tag}))

    layoutmid = html.join('')

    if l isnt "" and l isnt undefined and l? 
            layoutlast = """</#{l}>"""
        else
            layoutlast = ""

    if dian.data.tags.length isnt 0
        write(layoutfirst + layoutmid + layoutlast)

exports.tags = tags