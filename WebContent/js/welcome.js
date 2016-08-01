var WINDOW_WIDTH=1366;
var WINDOW_HEIGHT=768;

$(function(){

    WINDOW_HEIGHT=document.body.clientHeight;
    WINDOW_WIDTH=document.body.clientWidth;

    var canvas=$("#canvas")[0];
    var context=canvas.getContext("2d");

    canvas.width=WINDOW_WIDTH;
    canvas.height=WINDOW_HEIGHT;
    //context.fillStyle="black";
    //context.fillRect(0,0,canvas.width,canvas.height);

    var skyStyle=context.createLinearGradient(0,0,0,canvas.height);
    skyStyle.addColorStop(0.0,'black');
    skyStyle.addColorStop(1.0,'#035');
    context.fillStyle=skyStyle;
    context.fillRect(0,0,canvas.width,canvas.height);


    for(var i=0;i<150;i++){
        var r=Math.random()*5+5;
        var x=Math.random()*canvas.width;
        var y=Math.random()*canvas.height*0.65;
        var a=Math.random()*360;
        drawStar(context,x,y,r,a);
    }

    fillMoon(context,2,Math.random()*1000,Math.random()*150+50,80,30);

    drawLand(context);

    context.save();
    context.beginPath();
    context.font="bold 30px Arial";
    context.strokeStyle="#e8554e";
    //context.strokeText("------明天会更好",950,550);
    context.closePath();
    context.restore();
})


function drawLand(cxt){
    cxt.save();
    cxt.beginPath();
    cxt.moveTo(0,600);
    cxt.bezierCurveTo(440,500,1060,WINDOW_HEIGHT+100,WINDOW_WIDTH,600);
    cxt.lineTo(WINDOW_WIDTH,WINDOW_HEIGHT);
    cxt.lineTo(0,WINDOW_HEIGHT);
    cxt.closePath();

    var landStyle=cxt.createLinearGradient(0,WINDOW_HEIGHT,0,0);
    landStyle.addColorStop(0.0,"#030");
    landStyle.addColorStop(1.0,"#580");
    cxt.fillStyle=landStyle;
    cxt.fill();
    cxt.restore();
}

function fillMoon(cxt,d,x,y,R,rot,fillColor){
    cxt.save();
    cxt.translate(x,y);
    cxt.rotate(rot*Math.PI/180);
    cxt.scale(R,R);
    pathMoon(cxt,d);
    cxt.fillStyle=fillColor||"#fb5";
    cxt.fill();
    cxt.restore();
}

function pathMoon(cxt,d){
    cxt.beginPath();
    cxt.arc(0,0,1,0.5*Math.PI,1.5*Math.PI,true);
    cxt.moveTo(0,-1);
    cxt.arcTo(d,0,0,1,dis(0,-1,d,0)/d);
    cxt.closePath();
}

function dis(x1,y1,x2,y2){
    return Math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
}

function drawStar(cxt,x,y,R,rot){

    cxt.save();

    cxt.translate(x,y);
    cxt.rotate(rot/180*Math.PI);
    cxt.scale(R,R);

    starPath(cxt);

    cxt.fillStyle="#fb3";
    cxt.fill();

    cxt.restore();
}

function starPath(cxt){
    cxt.beginPath();
    for(var i=0;i<5;i++){
        cxt.lineTo(Math.cos((18+i*72)/180*Math.PI),
            -Math.sin((18+i*72)/180*Math.PI));
        cxt.lineTo(Math.cos((54+i*72)/180*Math.PI)*0.5,
            -Math.sin((54+i*72)/180*Math.PI)*0.5);
    }

    cxt.closePath();
}


var words = new Array();
words[0] = "天才就是无止境刻苦勤奋的能力。——卡莱尔";
words[1] = "形成天才的决定因素应该是勤奋。——郭沫若";
words[2] = "开创伟大事业的是天才，完成伟大事业的是辛苦。";
words[3] = "聪明出于勤奋，天才在于积累。——华罗庚";
words[4] = "勤能补拙是良训，一分辛劳一分才。——华罗庚";
words[5] = "天才出于勤奋。——高尔基";
words[6] = "人才进行工作，而天才则进行创造。 ——舒曼";
words[7] = "天才就是最强有力的牛，他们一刻不停地一天工作十八小时。——勒南";
words[8] = "天才就是百分之九十九的汗水加百分之一的灵感。——爱迪生";
words[9] = "哪里有天才，我是把别人喝咖啡的工夫都用在工作上的。 ——鲁迅";
words[10]= "天才不是别的，而是辛劳和勤奋。——比丰";
words[11]= "勤奋者废寝忘食，懒惰人总没有时间。";
words[12]= "智慧源于勤奋，伟大出自平凡。";
words[13]="我在科学方面所作出的任何成绩，都只是由于长期思索、忍耐和勤奋而获得的。——达尔文";
words[14]="在天才和勤奋两者之间，我毫不迟疑地选择勤奋，她是几乎世界上一切成就的催产婆。——爱因斯坦";
words[15]="天才的作品是用眼泪灌溉的。——巴尔扎克";
words[16]="天才与美女，都注定要放出灿烂的光芒引人注目，惹人妒羡，招人毁谤的。——巴尔扎克";
words[17]="天才不过是不断的思索，凡是有脑子的人，都有天才。——莫泊桑";
words[18]="划分天才和勤勉之别的界线迄今尚未能确定，以后也没法确定。——贝多芬";
words[19]="没有加倍的勤奋，就既没有才能，也没有天才。——门捷列夫";
var rand1 = Math.floor(Math.random()*words.length);
var word1 = words[rand1];
var rand2 = Math.floor(Math.random()*words.length);
var word2 = words[rand2];

var colors = new Array();
colors[0] = "#e8554e";
colors[1] = "#f3f3f3";
colors[2] = "#16a085";
colors[3] = "#3498db";
var crand1 = Math.floor(Math.random()*colors.length);
var color1 = colors[crand1];
var crand2 = Math.floor(Math.random()*colors.length);
var color2 = colors[crand2];
$(function() {
	$('.welcome_marquee1').css("color",color1);
	$('.welcome_marquee2').css("color",color2);
})