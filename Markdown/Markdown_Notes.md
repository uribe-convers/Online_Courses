#Markdown

##Headers: 
#Word
there are six headers, one smaller than the other. Use the appropriate number of # to select the header you want, e.g., 
###Word 
will make "word" a header three.  
You can't make headers bold but you can make some words italic


##Italics:  
_word_  

##Bold:  
**word**  

##Using both:  
**_word_**  
This can be done across multiple words.
	
##To write code:
`words for code`  

Blocks of code are fenced by three back-ticks (```)
	
```
python  
s = "Python syntax highlighting"  
print s
```

You can also run code in different languages, for example, using the package "rmarkdown" in R, I can type something like:

```{bash}

ls -lh *

```

And the report will have a list in human format of the contents of the working directory. However, this formatting, i.e., the language in {} will not render well outside of R. To just show the chuck of code, use the format above (no {}).


##Horizontal rule (line):  
---

##Strikethrough:  
  
~~text~~	

##Highlight: 
==word==    
  
_this might not work on every program_
  
	
##Inline Links:

Inline links are written with the text in square brakets and the link itself in parenthesis. There can be an option text right after the link within "" and inside the parenthesis, e.g.,  
[GitHub!](www.github.com "Optional Text!")  
Links can have bolded words and italics  
Links can be headers too
	
##Reference links: 
For these links, you use a placeholder (reference tag) for the url, which is then defined at the bottom of a Markdown document. The reference tag can be a number. The placeholder is defined by writing it in square brakets followed by a colon (:), followed by the link. For example:  

Here's [a link to something else][another place].  
Here's [yet another link][another-link].  
And now back to [the first link][another place].  

[another place]: www.github.com
[another-link]: www.google.com	

The reference tags disapear during the rendering. The advantage of reference links is that they only need to be updated once in the document.

##Images:  
They use the same syntax as links but are prefaced by an exclamation point (!).  
There are two ways to write image links, inline and reference. 
	
###Inline:  
Start with an !, then square brakets for the alternative text, and finally parenthesis with the link to the  image.  
![Cat in Suit](http://d39kbiy71leyho.cloudfront.net/wp-content/uploads/2016/05/09170020/cats-politics-TN.jpg)
	
###Reference:
	
Same as a reference link but the first square brakets are prefaced by a !
	
![Cat in Suit][reference tag]
	
[reference tag]: http://d39kbiy71leyho.cloudfront.net/wp-content/uploads/2016/05/09170020/cats-politics-TN.jpg
	
##Block quotes: 
Like the snippets on magazines!  
Preface the line of text with a greater than caret ">"
	
>En un lugar de la Mancha del que no quiero acordarme...

Block quotes can span multiple paragraph. The only thing to do here is put a caret on each line, even the empty one!
	
>Cuando la vi me enamoré
>
>me enamoré como por vez primera
	
Block quotes can contain any other Markdown element, i.e., bold, italics, images, and links
	
##Lists:  
  
There are two lists, unordered (bullet points) and ordered (numbers)  
Unordered lists start with an asterisk (*) and each item on its on line
	
* Item1
* Item2 
	
Ordered lists: 
	
1. Item
2. Item
	
Lists accept other Markdown elements
	
Nested lists are also possible, just put an additional space in front of the asterisk you are indenting:
	
* Item
 * Sub-Item
 * Sub-Item2
	 
To add text under an item in a list, the text must start on its own line under the bullet point and be indented by at least a space.  
This text can have any other Markdown element, including block quotes and other lists!
	
* Step 1: Cut the lemons  
 	Try to cut the lemons as thin as you can  

* Step 2: Say "Hi!"  
	Use any language you know
	
##Paragraphs 
Hard breaks are returns (control + enter) but to get soft breaks (like in poetry) use two spaced (  ) after the line you want to break
	
text text  
kjkhkbckneklc  
kwbekweckueck.
	
	
##Tables:  
Columns are separated by a pipe (|) and the first row (the header) need to be separated by a line with at least three hyphens (-)

First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

**Add colons to separator lines to specify alignment**

First Header | Second Header | Third Header
:----------- | :-----------: | -----------:
Left         | Center        | Right
Left         | Center        | Right
	









	
	