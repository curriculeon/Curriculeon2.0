# Beat Maker

## Getting Started

###### Creating your html file and give it the basic template
You can begin by going to the code pen link that has the editor you will begin to work on


* [First Button](	ttps://codepen.io/Rihzan/pen/LKxJvd)

```html 
<!DOCTYPE html>
<html>
<head>
	<meta charaset="UTF-8">
	<title> JS Beat Maker </title>
</head>
<body>
</body>
</html>

```

## Making a beat

##### Making one key
To begin you're going to make a single beat button in the body

```html
		<div data-key="81" class="beat-button"> 
			<kbd>Q</kbd>
		</div>
```	
the `data-key` attribute here is a big part of how you will be connecting your keys to beat button and sounds

* <a href="https://www.keycode.info">keycode.info </a> will give you data-key values for every letter on the keyboard

##### Adding Audio to your key

Next you are going to want to add an associating audio sound

```html
<audio data-key="81" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/377560/closed.WAV">
</audio>
```
Notice the same data key value it matches our button we previously created.

##### Playing audio on keypress

######Now in order for you to be able to hear anything when that key is pressed youre going to have to add some javascript.

Under your audio tag your going to want to start with your `<script>` tag.

```javascript 
<script>
 function playSound(e) {
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
    const button = document.querySelector(`div[data-key="${e.keyCode}"]`);
    if (!audio) return;

    button.classList.add('playing');
    audio.currentTime = 0;
    audio.play();
  }
  window.addEventListener('keydown', playSound);
</script>
```

* In short what this does is :
	* lets the window listen for the even `keydown`
	* passes associated `keydown` value from event to the `playSound` function thats called.
	* checks if theres an audio and button with the same data-key value as the keypress that was passed along
	* adds class `playing` to the button so it can undergo css changes


##### Styling your button
your probably looking at your application saying "thats not a button!" Dont worry thats what we're getting to next.

You can start by adding a new css file to your project `styles.css` and adding the following css.

```css
.beat-button {
  height: 7.3em;
  box-shadow: 3px 3px 0px 0px darkred;
  width: calc(70% * (1/3));
  border: .4rem solid black;
  background: rgba(0,0,0,0.4);
  margin-left: 0.5em;
  margin-top: 0.5em;
  flex-grow: 1;
  z-index: 10;
  display: flex;
  border-radius: 3px;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  color: #444;
  transition: all .07s ease;
}

```

Now of course your css isnt going to work until you link it in your index. so you're going to want to add the following under your `<head>` tag

```html
<link rel="stylesheet" href="style.css">
```

##### Adding "Animation" to your buttons

Next your going to want to know what buttons are making sound just like an actual beat making machine. So first things first we're going to go right back to the `styles.css` file.

we're going to add the following class to change the color of your button and make it slightly bigger when pressed: 

```css
.playing {
  transform: scale(.95);
  background: rgba(50,205,50,1);
  box-shadow: 0 0 1rem #ffffff;
}
```
After adding the css class you will notice that theres some change in your button! Thats right you have now animated your button to change colors all from the javascript you entered earlier. `button.addClassList('playing');`

Now we got the change but how do we go back? Easy Peazy.

Next We have to go back to the `<script>` tag and under we're going to add the following function right under your `playSound` function

```javascript
function removeTransition(e) {
    if (e.propertyName !== 'transform') return;
    e.target.classList.remove('playing');
}
```
and then as well add the following

```javascript
const buttons = Array.from(document.querySelectorAll('.beat-button'));
  buttons.forEach(button => button.addEventListener('transitionend', removeTransition));
```
In short what this does is: 

* Makes an Array of all buttons you've created
* Then creates a listener to wait for all the events to end and then removes the `"playing"` class(if present).

And there you have it a functional single beat button!!

## Making The Beat Machine

Now that you have one button your probably saying to yourself "This isnt a machine!". Well thats what we're getting to next.

First things you're going to need to know is that Each machine you can look at as a container that holds your buttons together. That being said in your html you are going to want to add the following code

```html
<div class="machine">
	<div class="beat-buttons">
	</div>
</div>
```

We're going to take this code and wrap it **Around** the `beat-button` and now your code there should look like this: 

```html
<div class="machine">
	<div class="beat-buttons">
        <div data-key="81" class="beat-button">
            <kbd>Q</kbd>
        </div>
    </div>
</div>
```
And that is how you make your "container" for your buttons. Now go ahead and add more buttons like the first step and more audio files and you have your machine! But Wait..... Thats not a machine!, its just a line of buttons! Thats because you Didnt add CSS!

#### Adding Css to make the machine
We made the machine and named the div class `beat-buttons`

~~~css
  .machine {
    padding: 1em;
    position: relative;
    width: 53em;
    height: 35em;
    border: 5px solid;
    display: flex;
    top: 30%;
    left: 23%;
    background: rgb(112,112,112);
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 7px 7px lightgrey;
    text-shadow: 0 0 0.5rem black;
    transition: box-shadow 0.1s;
  }
  .beat-buttons {
    position: absolute;
    top: 40%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    height: 22%;
    width: 30em;
    display: flex;
    flex-wrap: wrap;
    padding: 0px 15.5em 2.5em 0;
  }
~~~

And ***WA LA*** you are Complete. you can even add your own style to make it more your own 
Some more sounds: 
  
><https://s3.amazonaws.com/freecodecamp/drums/Heater-1.mp3>

<https://s3.amazonaws.com/freecodecamp/drums/Dsc_Oh.mp3>

<https://s3.amazonaws.com/freecodecamp/drums/Kick_n_Hat.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335238/audio/nipon_cymbal_1.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335237/audio/nipon_cymbal_2.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335238/audio/taiko_2.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335237/audio/med_taiko.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335238/audio/shime_hi.mp3>

<https://res.cloudinary.com/cd0hgkqgk/video/upload/v1538335238/audio/shime_hi_2.mp3>

<https://s3.us-east-2.amazonaws.com/fcc-projects-jms/Drum+Machine/Conga.m4a>

<https://s3.us-east-2.amazonaws.com/fcc-projects-jms/Drum+Machine/Crash.m4a>

<https://s3.us-east-2.amazonaws.com/fcc-projects-jms/Drum+Machine/Cymbal+Hit.m4a>

<https://s3.us-east-2.amazonaws.com/fcc-projects-jms/Drum+Machine/Scratch.m4a>

"https://s3-us-west-2.amazonaws.com/s.cdpn.io/377560/PAD1.wav"

