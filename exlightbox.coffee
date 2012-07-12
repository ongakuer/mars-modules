lightboxtext = """
    <link rel="stylesheet" type="text/css" href="http://x.libdd.com/farm1/08871e/7dc7c9f1/lightbox.css" media="all">

    <script src="http://x.libdd.com/farm1/08871e/e95bc807/lightbox.js" type="text/javascript"></script>

    <script>
        $(function(){
            $('.lightbox').lightbox();
        })
    </script>
    """

exlightbox = ->
    write (lightboxtext)

exports.exlightbox=exlightbox