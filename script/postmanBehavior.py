# created by @rezahasetiaputra
import json
import requests
import ast

class postmanBehavior(object):
    HEADERS = None
    BODY = None
    is_from_input_body = None
    PARAM = None

    def __init__(self):
        self.HEADERS = {}
        self.BODY = {}
        self.is_from_input_body= False
        self.driver = None
        self.PARAM={}

    def input_parameter(self, key, value):
        self.PARAM[key]=value
        return  self.PARAM

    def input_header(self, key, value):
        self.HEADERS[key]=value
        print(self.HEADERS)
        return  self.HEADERS

    def input_body(self, key, value):
        self.BODY[key]=value
        self.is_from_input_body= True
        return  self.BODY

    def set_body(self,data):
        self.BODY = data
        self.is_from_input_body= False
        if data==None:
           self.BODY=None
        return  self.BODY

    def do_request_and_get_specific_header(self, method, url, header):
        self._create_json_body()
        response = requests.request(method=method,url=self._change_url(url),data=self.BODY,headers=self._create_headers())
        return    response.headers[header]

    def do_request_and_get_body(self, method, url):
        self._create_json_body()
        body={}
        response = requests.request(method=method,url=self._change_url(url),data=self.BODY,headers=self._create_headers())
        if  response.content:
            body = json.loads(response.content)
        return  body

    def do_request_and_get_status(self, method, url):
        self._create_json_body()
        response = requests.request(method=method,url=self._change_url(url),data=self.BODY,headers=self._create_headers())
        return  str(response.status_code)

    def do_request_and_get_specific_value_body(self, method, url, value):
        self._create_json_body()
        response = requests.request(method=method,url=self._change_url(url),data=self.BODY,headers=self._create_headers())
        data = json.loads(response.content)
        result = self._NestedDictValues(data,value)
        return   str(result)

    def _change_url(self , url):
        index=0
        changed_url =  url
        if self.PARAM:
            changed_url =  url+"?"
        for key in self.PARAM:
            if index == 0:
                changed_url = changed_url+key+"="+self.PARAM[key]
            else:
                changed_url = changed_url+"&"+key+"="+self.PARAM[key]
            index +=1
        return   changed_url

    def get_header(self):
        print(self.HEADERS)
        return  self.HEADERS

    def get_body(self):
        print(self.BODY)
        return  self.BODY

    def get_value_from_response(self ,response_dict ,*path_key ):
        return  str(self._get_nested(response_dict, *path_key))

    def _get_nested(self, dict , *args):
        try:
            if args and dict:
                element  = args[0]
            if isinstance(dict, list):
                value = dict[int(element)]
                return value if len(args) == 1 else self._get_nested(value, *args[1:])
            if element:
                value = dict.get(element)
                return value if len(args) == 1 else self._get_nested(value, *args[1:])
        except  ValueError:
            return  "the response maybe contains list , please use number instead"

    def _create_json_body(self):
        if self.is_from_input_body==True:
            self.BODY=json.dumps(self.BODY)

    def _create_headers(self):
        if not self.HEADERS:
            header=None
        else:
            header=self.HEADERS
        return      header
