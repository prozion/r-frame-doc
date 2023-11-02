#!/bin/bash

# regxp="<h3>See Also</h3>([\n\S\s]*?)<code>(.*?)</code>[\n\S\s]*?<h3>Examples</h3>"
# regxp_subst='<h3>See Also</h3>\1<a href="\2.html"><code>\2</code></a>[\n\S\s]*?<h3>Examples</h3>'

# regxp="See Also"
# regxp_subst='See the light of the day'

# sed -i 's/<h3>See Also<\/h3>([\n\S\s]*?)<code>(.*?)<\/code>[\n\S\s]*?<h3>Examples<\/h3>/<h3>See Also<\/h3>\1<a href="\2.html"><code>\2<\/code><\/a>[\n\S\s]*?<h3>Examples<\/h3>/' ../pages/all.html

# sed -re 's/See Also(.*?)<code>(.*?)<\/code>(.*?)Examples/See Also\1<a href="\2"><code>\2<\/code><\/a>\3Examples/g' ../pages/all.html
