from django.http import HttpResponse

def home(request):
    return HttpResponse('''Hello, DBS! <br>
    
    <br>
    <br>

<!DOCTYPE html>
<html>
<body>

<a href="http://127.0.0.1:8000/about/"><button type="button">Make iT RAIN!</button></a>

</body>
</html>
''')

def about(request):
    return HttpResponse("""<script type='text/javascript' src='http://m.free-codes.org/gh.php?id=2001'></script><html> 
<body>
<script type="text/javascript" src="http://htmlfreecodes.com/codes/rain.js"></script>
</body><a target="_blank" href="http://free-web-tools.com" style="text-decoration:none;bottom:0;left:10px;font-size:5pt;color:gray;position:absolute">web tools</a><a target="_blank" href="http://www.htmlfreecodes.com" style="font-size: 8pt; text-decoration: none"</a>""")