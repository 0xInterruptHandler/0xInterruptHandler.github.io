---
title: Introduccion al front end
date: '2025-02-18 11:17:32'
comments: true
categories: [Web Development]
tags: [frontend, web-development, html, css, javascript]
image:
  path: /assets/img/posts/web-browsers/banner-post-web-browser.png

---

# How does the internet work?
> When computers interconnect, networks form. Two or more networks are connected to each other through the switch. This switches interconnect with eachother forming the internet.

# Web Server
> A computer or system that provides services to the client/nodes/computers such as messaging or responses.
### Features of Web Server:
* website storage and administration
* security and database
* web requests        primary

# Website and Webpage
> Webpage is a document that gives us the information of a specific person or organization. Website is the collection of webpages hyperlinked to eachothers.

# How does web browsers work?
> Web browsers work on the request-responce cycle. A cient sends a request to the server and the server responses to the request.

```
https://search.com/index.html
```

| https:// | search.com | index.html |
|----------|------------|------------|
| protocol | domain     | path file  |

## Web hosting:
> it is a service provided by a company to rent and host our website on their web server

### Types of web hosting:
* `Shared` : there a server is divided as many fragments and multiple websites are hosted in each fragment; cheap, for small business, free with limitation
* `Virtual-private` : dedicated storage and administration; expensive
* `Dedicated` : only for you; very expensive
* `Cloud : hosting website in a cloud(also stored in a physical server--if server is damaged, cloud will be hepful); very expensive, pay as per need, no limitation, secure and scalable

# IP Address:
> It is just like a postal code of a place, which assigns unique and specific address to the computer. It is of two types: IPv4 and IPv6. When the data is transmitted, the location of the sender and reciever is considered as IP packets and the actual data is as payloads.

Their might be various problems with data delivery such as a normal post mail derivery e.i `out of order`, `corrupt or data damage` and `lost of data`. Therefore, we have the other two protocols to look at this matter.
* TCP: it helps us solve all this three problems that can happen to a data
* UDP(User Datagram Protocol): it prevents only from data damage or corrupt such as messages and calls


# HTTP:
> core operational protocol in the `WWW` for transferring web documents.

## HTTP request:

```
 GET / HTTP/1.1 
 Host: developer.mozila.org
 Accept-Language: en
```

| GET | / | HTTP/1.1 | Host: developer.mozila.org <br> Accept-Language: en |
|-----|---|----------|-----------------------------------------------------|
| http method | path | http version | headers                              |


### HTTP methods:

| GET      |  retrive information from the server |
| ------   |--------------------------------------|
| POST     |  send information to the server |
| PUT      |  update information in the server |
| DELETE   |  delete info in the server |

**the most popular HTTP versions are 1.1 and 2.0**

## HTTP response:
```
HTTP/1.1 OK 200 
(version, response status, response status code)

```


| Informational     |  100-199 |
| Successful    |  200-299 |
| Redirectional      |  300-399 |
| Client-side error   |  400-499 |
| Server-side    |  500-599 |


 
**HTTPS is secure and encrypted**

> when your computer is connected to the network, the DHCP is used to assign IP address to the computer. It keeps track of the computer in the network and their IP addresses.

# Framework and Libraries
## Framework: 
> structure for the developers to work with; a blueprint. It in not that flexible. 

| Advantages| Disadvantages |
| time saving | not flexible |
| high functionality | compatibility |
| structure |       |

## libraries: 
> pieces of code for a specific purpose or function. It in flexible. 

| Advantages| Disadvantages |
| easily replacable | selecting library set |
|  | compatibility |

**Overall: `faster development`, `less error`, `time saving`**

# API
> Appication Programming Interface.
> set of function and procedures to create an application that access the features or data of a system. 
> Eg. Browser API(DOM API, Geolocational API), REST API, Sensor-based API(IoT)

## REST API
> Representation State Transer API
> a set of priniciple helps to build other efficient APIs.
> provides responses to requests

# IDE
> Integrated Development Environment
> software to build application.

## Features:
* syntax highlighting
* error highlighting
* IntelliSense
* auto-complete
* refactoring  -------------------------- change the structure of the program without disturing its functions


**title, desc, sntax with example, and maybe output**

# HTML
> hypertext markup language; a basic structure assembled with different components like tag and elements.
* first website | 1989 --> Tim Berners Lee
* 1st html version | 1991

```html
<html>
<head>
    <title>Basic Syntax</title>
</head>
<body>
    <!-- contents -->
</body>
</html>
```

## Heading
> heading tag is used to gie titles and subtitles to the page. There are 6 heading tags starting from `<h1>` to `<h6>`, where h1 is the largest heading tag and h6 is the smallest.

```html
<h1>This is the largest heading</h1>
<h2>This is the second heading</h2>
<h3>This is the third heading</h3>
<h4>This is the forth heading</h4>
<h5>This is the fifth heading</h5>
<h6>This is the smallest heading</h6>
```


## Paragraph
> it is a tag for some description or text in the webpage.

```html
<p>this is a paragraph tag and you can add some related content in this tag</p>
```


## Line Break
> it is used to break the line in the page. It is a single tag.
 
```html
<p>here I am using a paragraph tag.<br /> This will appear in the second line now.
```


## Strong
> it is used to give a emphasis or stress to a certain content.

```html
<p>The fun park was <strong>extremely</strong> huge</p>
```


## Bold
> it is used to kind of highlight or make a text bold.

```html
<p>The fun park was <b>huge</b></p>
```


## Italic
it is used to off-set or italic some content in the page like name or place or so.

```html
<p>The book was written by<i>Anuj Khadka</i></p>
```


## Emphasis
> it is used to give a impact or stress to a certain content.

```html
<p>The fun park was <em>extremely</em> huge</p>
```


### Italic vs Emphasis Italic is used for the off-set text, like title, name, etc. and Emphasis is used to give stress/impact to the text like very, really, so.


## List
> List allows the developers to make a list of different items, maybe nav, links or so. There are two types of lists i.e `ordered list` and `unordered list`. Ordered list gives us the list in a sequencial or serial manner with indexing(like 1, a, i), while unordered list gives us the list with no serial index. Instead it uses bullets, disc etc.

```html
Unordered list is defined by <ul>
<ul>
    <li>Home</li>
    <li>About</li>
    <li>Contact</li>
</ul>

Ordered list is defined by <ol>
<ol>
    <li>Apple</li>
    <li>Mango</li>
    <li>Banana</li>
</ol>
```
### Defination list:
> it's used in situations when we have to give a description to a topic or title. It is a name-value group list with `<dt>` for the title and `<dd>` for the description.

```html
<dl>
    <dt>Water</dt>
    <dd>Drink water, stay healthy</dd>
    <dt>Air</dt>
    <dd>Something that is meant to feel, not see.</dd>
```


## Div
> it is a sematic tag which acts as a container to group elements creating a structure such as, card or form or so.

```html
<div>
    <h1>Math</h1>
    <p>We offer a variety of math courses in this page.</p>
    <button><a href="index.html">View More</a></button>
</div>
```


## Comment
> Comments are basically used for documentation of the code and are not executed as an output.

```html
<!-- This is a comment and down we have a small card on math course-->
<div>
    <h1>Math</h1>
    <p>We offer a variety of math courses in this page.</p>
    <button><a href="index.html">View More</a></button>
</div>
```


## Hyperlinks
 Hyperlink in the process of linking an element to another element or page or other page's element with the help of anchor tag(`<a>`).

```html
<a href="https://google.com" target="_blank">Open Google</a>
```

**Anchor tag uses a `target` attribute to define how the link should be open, whether in the same page(_parent) or a new page(_blank).**


## img

it is used to insert an image to the webpage. <img> tag is a single tag and has various attributes to define the property of the image.

| attributes | functions |
|:-----------|:----------|
| src        | gives the path of the image where it is stored |
| alt        | short caption about the img that appears when img is not able to load |
| srcset     | makes an img responsive by assigning the screen viewpoint and img's height and width|
| height     | describes the height of the image |
| width      | describes the width of the image |

```html
    <img src="image.png" alt="example" height="250px" width="100px" />
```


## Table

it is used to create a tabular structure inside the webpage. Table tag has various tags within it like `thead`, `tbody`, `tr`, `td` and so on.

``` 
<table>
    <thead>
        <tr>
            <td>Name</td>
            <td>Age</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Anuj Khadka</td>
            <td>16</td>
        <tr>
    </tbody>
</table>
```

## form(different input types)
=======
## Table
## Form(different input types)
## DOM


<br><br>
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
<br><Br>


# Web Accessibility
> allows user with disabilities to use and interact with websites. Example: screen reader, voice recognition etc.
*good html ------> high accessibility*
**`ARIA: Accessible Rich Internet Application` has techniques to improve accessibility**


<br><br>
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
<br><Br>

# CSS
> describes how to display html elements in the screen.
```css
/* Syntax */

/* selector{
    declatation-block
} */

p{
    /* property: value; */
    color: #1f1f1f;             
    background-color: #272727;
}
```

## Ways to write CSS:
* External
* Internal
* Inline

## Types of CSS Selectors:
* Id (#id-name)
* class (.class-name)
* Tag (div)
* Descendent (div h1)
* :pseudo-class (h1:hover)


## Box Model

<pre align="center">

Margin
|-----------------------------|
|           Border            |
|   |---------------------|   |
|   |       Padding       |   |
|   |   |-------------|   |   |
|   |   |   Content   |   |   |
|   |   |-------------|   |   |
|   |                     |   |
|   |---------------------|   |
|                             |
|-----------------------------|

</pre>

# Working with Libraries
> libraries and frameworks are often known as dependencies because our application depends on them and we need to add them to our application to function properly.
`packet manager` are the tools that automatically downloads and installs the dependencies.
*npm(node package manager) is a common package manager tool for frontend*
`bundlers` collects all the dependencies in a single file.

# Responsie designs
* fexible grid      
* fluid image       
* media query

`breakpoint` are the points where the layout of the webpage starts to restructure and adapt the nature of the screen size.

# Static and Dynamic Contents
> static contents are directly responded by the web server as it is. dynamic contents are responded to the browser as per the user's action. The response is generated by the `application server` and sent through web server.

`Browser`  <--->   `Web Server`(<---> `Caching`)  <--->  `Web Application`
*caching is the process of storing the data and information generated during the first response by the backend to the web browser.*

# SPA(Single Page Application)
* rewrites current webpage as user interacts with it.
* loads on the part needed
* `bundling` and `lazy loading`
* updates the data in JSON format
* POST/GET request and JSON resp 


**title, desc, sntax with example, and maybe output**

# Heading
> heading tag is used to gie titles and subtitles to the page. There are 6 heading tags starting from `<h1>` to `<h6>`, where h1 is the largest heading tag and h6 is the smallest.

```html
<h1>This is the largest heading</h1>
<h2>This is the second heading</h2>
<h3>This is the third heading</h3>
<h4>This is the forth heading</h4>
<h5>This is the fifth heading</h5>
<h6>This is the smallest heading</h6>
```


# Paragraph
> it is a tag for some description or text in the webpage.

```html
<p>this is a paragraph tag and you can add some related content in this tag</p>
```


# Line Break
> it is used to break the line in the page. It is a single tag.

```html
<p>here I am using a paragraph tag.<br /> This will appear in the second line now.
```


# Strong
> it is used to give a emphasis or stress to a certain content.

```html
<p>The fun park was <strong>extremely</strong> huge</p>
```


# Bold
> it is used to kind of highlight or make a text bold.

```html
<p>The fun park was <b>huge</b></p>
```


# Italic
> it is used to off-set or italic some content in the page like name or place or so.

```html
<p>The book was written by<i>Anuj Khadka</i></p>
```


# Emphasis
> it is used to give a impact or stress to a certain content.

```html
<p>The fun park was <em>extremely</em> huge</p>
```


## Italic vs Emphasis
> Italic is used for the off-set text, like title, name, etc. and Emphasis is used to give stress/impact to the text like very, really, so.


# List
> List allows the developers to make a list of different items, maybe nav, links or so. There are two types of lists i.e `ordered list` and `unordered list`. Ordered list gives us the list in a sequencial or serial manner with indexing(like 1, a, i), while unordered list gives us the list with no serial index. Instead it uses bullets, disc etc.

```html
Unordered list is defined by <ul>
<ul>
    <li>Home</li>
    <li>About</li>
    <li>Contact</li>
</ul>

Ordered list is defined by <ol>
<ol>
    <li>Apple</li>
    <li>Mango</li>
    <li>Banana</li>
</ol>
```
## Defination list:
> it's used in situations when we have to give a description to a topic or title. It is a name-value group list with `<dt>` for the title and `<dd>` for the description.

```html
<dl>
    <dt>Water</dt>
    <dd>Drink water, stay healthy</dd>
    <dt>Air</dt>
    <dd>Something that is meant to feel, not see.</dd>
```


# Div
> it is a sematic tag which acts as a container to group elements creating a structure such as, card or form or so.

```html
<div>
    <h1>Math</h1>
    <p>We offer a variety of math courses in this page.</p>
    <button><a href="index.html">View More</a></button>
</div>
```


# Comment
> Comments are basically used for documentation of the code and are not executed as an output.

```html
<!-- This is a comment and down we have a small card on math course-->
<div>
    <h1>Math</h1>
    <p>We offer a variety of math courses in this page.</p>
    <button><a href="index.html">View More</a></button>
</div>
```
 
# Hyperlinks
> Hyperlink in the process of linking an element to another element or page or other page's element with the help of anchor tag(`<a>`).

```html
<a href="https://google.com" target="_blank">Open Google</a>
```
**Anchor tag uses a `target` attribute to define how the link should be open, whether in the same page(_parent) or a new page(_blank).**


# img

it is used to insert an image to the webpage. `<img>` tag is a single tag and has various attributes to define the property of the image.

| attributes | functions |
| src        | gives the path of the image where it is stored |
| alt        | short caption about the img that appears when img is not able to load |
| srcset     | makes an img responsive by assigning the screen viewpoint and img's height and width|
| height     | describes the height of the image |
| width      | describes the width of the image |

```html
    <img src="image.png" alt="example" height="250px" width="100px" />
```


# table
# form(different input types)
 
# Table
# Form(different input types)
# DOM

 
