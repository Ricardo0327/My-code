python使用sublime text编写和终端输入输出  
在sublime text 中，选择Tools->Build System->New Build System,删除原有的内容，输入下面的内容  
{  
      "cmd": ["/usr/local/bin/python3", "-u", "$file"],  
}  
我将其保存为python3.sublime-build  
我将编写好的程序放在desktop/pythonwork下  

```
MacBook-Pro-2:~ lianhonghui$ cd desktop/pythonwork  
MacBook-Pro-2:pythonwork lianhonghui$ ls  
7.1parrot.py  
MacBook-Pro-2:pythonwork lianhonghui$ python 7.1parrot.py. 
Tell me something,and I will repeat it back to you: 2  
2
```
	python code
```
message = input("Tell me something,and I will repeat it back to you: ")
print(message)
```


