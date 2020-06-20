# test
You need to install virtualenv, use this command    `pip install virtualenv`
Run this command sequentially :
- virtualenv venv -p python3
- source  venv/bin/activate
- pip install -r requirement.txt

If you want to use headless browser run this command
`robot -v VIRTUAL_DISPLAY:true tests/`
or
use normal chrome browser
`robot tests/`

please note : You have to have chromedriver on your machine

Thanks
Regards
