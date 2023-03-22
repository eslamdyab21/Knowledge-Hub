---
date: 2023-01-30
---

## Some general info
---
- Node.js is a JavaScript run time environment (not a language or a framework).
- Written in C++ 
- Essentially allows us to run **JavaScript code on the server side**

Node.js has a package manager to install 3rd party libraries called `NPM` (like pip in python)
</br>
</br>
## `NPM` (Node Package Manager)
---
- Install 3rd party packages (libraries, frameworks, tools, ....)
- Packages get stored in folder called `node_modules`
- All dependencies of those packages are stored in a `package.json` file

There are some `npm` commands used like:
- `npm init` generates a `package.json` file
- `npm install express` installs a package locally (in current project only)
- `npm install -g express`  installs a package globally

</br>
</br>
</br>

## Initialize project
---
Make sure we have node.js installed. 
```bash
❯ node --version
v19.0.1
```
</br>
initialize node project

```bash
❯ npm init

❯ ls
package.json
```
</br>

The `package.json` has the project info, and will manly have the dependencies info.
```json
{
	"name": "crash",
	"version": "1.0.0",
	"description": "node crash course",
	"main": "index.js",
	"scripts": {
	"test": "echo \"Error: no test specified\" && exit 1"
	},
	"author": "eslam dyab",
	"license": "ISC"
}
```
</br>
</br>
</br>

## Installing modules
---
```bash
❯ npm install uuid 

❯ cat package.json
{
	"name": "crash",
	"version": "1.0.0",
	"description": "node crash course",
	"main": "index.js",
	"scripts": {
	"test": "echo \"Error: no test specified\" && exit 1"
	},
	"author": "eslam dyab",
	"license": "ISC",
	"dependencies": {
		"uuid": "^9.0.0"
	}
}
```
- The `uuid` package gets added in the `package.json` as a dependency, and also gets added in the `node_modules` folder.
- We can install modules in developer mode by adding `-D`
```bash
❯ npm install -D nodemon

❯ cat package.json
{
	"name": "crash",
	"version": "1.0.0",
	"description": "node crash course",
	"main": "index.js",
	"scripts": {
	"test": "echo \"Error: no test specified\" && exit 1"
	},
	"author": "eslam dyab",
	"license": "ISC",
	
	"dependencies": {
		"uuid": "^9.0.0"
	},

	"devDependencies": {
		"nodemon": "^2.0.20"
	}
}
```
- You will notice that the `node_modules` folder gets quite huge after installing `nodemon`, that's because `nodemon` has many dependencies, around 32.
- When deploying to the server we don't include the `node_modules` folder, because the modules info we used are already in the `package.json` file, we can just `npm install` and it will recreate the `node_modules` folder.
</br>
</br>

## Importing our modules
---
We can start writing Javascript code in our `index.js` file, and hence we have `node.js` installed and it's a Javascript runtime environment we can execute the `index.js` directly in our machine without the need of a browser.
```bash
❯ cat index.js
console.log("Hello world!")

❯ node index.js
Hello world!
```
</br>

Most of the time we will be working with classes/modules, so let's see how we can import classes to the main `index.js`.
</br>

This is a `Person.js` file containing the Person class 👇 
```javascript
class Person{
	//constructor
	constructor(name, age){
		this.name = name
		this.age = age
	}
	
	//methods
	greeting(){
		console.log(`My name is ${this.name} and I am ${this.age} years old`)
	}
}
module.exports = Person
```
</br>

And this is the `index.js` file where we import the Person class 👇
```javascript
// importing Person module
const Person = require('./Person')

// creating person1 object
const person1 = new Person('John', 25)

// calling greeting method
person1.greeting()
```

```bash
❯ node index.js 
My name is John and I am 25 years old
```
</br>
</br>
</br>

## Some builtin modules
---
There are two attributes `__filename` and `__dirname` which are available for each js file we create, they give info about the file path. 
```javascript
console.log(__filename)
console.log(__dirname)
```

```bash
❯ node index.js 
/home/dyab/Documents/GP/tut/node-crash/index.js
/home/dyab/Documents/GP/tut/node-crash
```
</br>
</br>

### Path
```javascript
// importing Path module
const path = require('path')

// Base file name
console.log(path.basename(__filename))

// Directory name
console.log(path.dirname(__filename))

// File extension
console.log(path.extname(__filename))

// Path object
console.log(path.parse(__filename))

// Concatenate paths
console.log(path.join(__dirname, 'test', 'hello.html'));
```

```bash
❯ node index.js 
/home/dyab/Documents/GP/tut/node-crash/index.js
/home/dyab/Documents/GP/tut/node-crash
index.js
/home/dyab/Documents/GP/tut/node-crash
.js
{
  root: '/',
  dir: '/home/dyab/Documents/GP/tut/node-crash',
  base: 'index.js',
  ext: '.js',
  name: 'index'
}
/home/dyab/Documents/GP/tut/node-crash/test/hello.html
```
</br>
</br>
</br>

### File system

- Creating folder
```javascript
// importing path and fs modules
const fs = require('fs');
const path = require('path');


// Create folder
const folder_name = path.join(__dirname, '/test')

function callback_function(err){
	if(err) throw err
	console.log('Folder created')
}

fs.mkdir(folder_name, {}, callback_function);
```

```bash
❯ node index.js 
Folder created

❯ ls
index.js  node_modules  package.json  package-lock.json  Person.js  test
```
</br>
</br>

- Witting to a file
```javascript
// importing path and fs modules
const fs = require('fs');
const path = require('path');


// Create and write to file
const file_name = path.join(__dirname, '/test', 'hello.txt')
let text = 'Hello World!'

function callback_function(err){
	if (err) throw err;
	console.log('File written to...');
}

fs.writeFile(file_name, text,callback_function);
```

```bash
❯ node index.js 
File written to...

❯ ls test/
hello.txt

❯ cat test/hello.txt 
Hello World!
```
</br>
</br>

- Appending to a file
```javascript
// importing path and fs modules
const fs = require('fs');
const path = require('path');


// Create and write and append to file
const file_name = path.join(__dirname, '/test', 'hello.txt')
let text = 'Hello World!'

function callback_function(err){
	if (err) throw err;
	console.log('File written to...');
	
	fs.appendFile(file_name, ' appended text </>',
		err => {
			if (err) throw err;
			console.log('File written to...');
	})
}

fs.writeFile(file_name, text,callback_function);
```

```bash
❯ node index.js 
File written to...
File written to...

❯ ls test/
hello.txt

❯ cat test/hello.txt 
Hello World! appended text </>
```
</br>
</br>

- Reading a file
```javascript
// importing path and fs modules
const fs = require('fs');
const path = require('path');


// Read file
const file_name = path.join(__dirname, '/test', 'hello.txt')

function callback_function(err, data){
	if (err) throw err
	console.log(data)
}

fs.readFile(file_name, 'utf8', callback_function)
```

```bash
❯ node index.js 
Hello World!appended text </>
```
</br>
</br>
</br>

- Renaming a file
```javascript
// importing path and fs modules
const fs = require('fs');
const path = require('path');


// Rename file
const file_name_original = path.join(__dirname, '/test', 'hello.txt')
const file_name_new = path.join(__dirname, '/test', 'newname.txt')

function callback_function(err, data){
	if (err) throw err;
	console.log('file renamed');
} 

fs.rename(file_name_original, file_name_new, callback_function);
```

```bash
❯ node index.js 
file renamed

❯ ls test/
newname.txt
```



### OS
```javascript
// importing os module
const os = require('os');
  

// Platform
console.log('Platform:')
console.log( + os.platform() + '\n');

// CPU Arch
console.log('CPU Arch:')
console.log(os.arch() + '\n');
  
// CPU Core Info
console.log('CPU Core Info:')
console.log(os.cpus() + '\n');

  
// Free memory
console.log('Free memory:')
console.log(os.freemem() + '\n');

// Total memory
console.log('Total memory:')
console.log(os.totalmem() + '\n');

// Home dir
console.log('Home dir:')
console.log(os.homedir() + '\n');


// Uptime
console.log('Uptime:')
console.log(os.uptime() + '\n');
```

```bash
❯ node index.js 
Platform:
linux

CPU Arch:
x64

CPU Core Info:
[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]

Free memory:
12956491776

Total memory:
16669773824

Home dir:
/home/dyab

Uptime:
2674.5
```


### URL
```javascript
const url = require('url')
const myUrl = new URL('http://mywebsite.com/hello.html?id=100&status=active')


// Serialized URL
console.log('Serialized URL:')
console.log(myUrl.href);
console.log(myUrl.toString() + '\n');

// Host (root domain)
console.log('Host (root domain):')
console.log(myUrl.host + '\n');

// Hostname (does not get port)
console.log('Hostname (does not get port):')
console.log(myUrl.hostname + '\n');

// Pathname
console.log('Pathname:')
console.log(myUrl.pathname + '\n');

// Serialized query
console.log('Serialized query:')
console.log(myUrl.search + '\n');

// Params object
console.log('Params object:')
console.log(myUrl.searchParams + '\n');

// Add param
console.log('Add param:')
myUrl.searchParams.append('abc', '123');
console.log(myUrl.searchParams + '\n');

// Loop through params
console.log('Loop through params:')
console.log(myUrl.searchParams)
myUrl.searchParams.forEach((value, name) => console.log(`${name}: ${value}`) + '\n');
```

```bash
❯ node index.js 
Serialized URL:
http://mywebsite.com/hello.html?id=100&status=active
http://mywebsite.com/hello.html?id=100&status=active

Host (root domain):
mywebsite.com

Hostname (does not get port):
mywebsite.com

Pathname:
/hello.html

Serialized query:
?id=100&status=active

Params object:
id=100&status=active

Add param:
id=100&status=active&abc=123

Loop through params:
URLSearchParams { 'id' => '100', 'status' => 'active', 'abc' => '123' }
id: 100
status: active
abc: 123
```


### Events
```javascript
// Create class
class MyEmitter extends EventEmitter {}

// Init object
const myEmitter = new MyEmitter();
// Event listener
myEmitter.on('event', () => console.log('Event Fired!'));

// Init event
myEmitter.emit('event');
myEmitter.emit('event');
myEmitter.emit('event');
myEmitter.emit('event');
```

```bash
❯ node index.js 
Event Fired!
Event Fired!
Event Fired!
Event Fired!
```


- Events with class 
`Logger.js` class 👇
```javascript
// import events and uuid modules 
const EventEmitter = require('events')
const uuid = require('uuid') //gives 

  
class Logger extends EventEmitter{
	log(msg){
		// call event
		this.emit('message', {id:uuid.v4(), msg:msg})
	}
}

module.exports = Logger
```

`index.js` 👇
```javascript
// import Logger class

const Logger = require('./Logger')

// create instant of Logger class
const logger1 = new Logger

logger1.on('message', data => console.log('Called Listner', data))

// call log method in Logger class
logger1.log('Hello world')
logger1.log('Hi')
logger1.log('World')
```

```bash
❯ node index.js 
Called Listner { id: 'b7b7737b-ff94-4e42-bf34-31b0fc71cf3c', msg: 'Hello world' }
Called Listner { id: 'adcd0e2d-9d40-4d36-a387-228f18b808ea', msg: 'Hi' }
Called Listner { id: '5e393da8-dd10-4930-89b2-e7a1e4ad3e11', msg: 'World' }
```



### HTTP Minimal web server
