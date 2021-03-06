<%--
  Created by IntelliJ IDEA.
  User: Master
  Date: 2017/9/15
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>jeDate日期控件</title>
    <script src="<%=path %>/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/public/jedate/jquery.jedate.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>/public/jedate/skin/jedate.css">
    <style>
        .bodys{ padding:50px 0 0 50px;}
        .datainp{ width:200px; height:30px; border:1px #A5D2EC solid;}
        .datep{ margin-bottom:40px; line-height:24px; margin-right:15px;}
        .wicon{background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAQCAYAAADj5tSrAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAwNi8xNS8xNGnF/oAAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAAAoElEQVQ4jWPceOnNfwYqAz9dYRQ+E7UtwAaGjyUsDAyYYUgJ2HT5LXZLcEmSCnA6duOlN///////H0bDALl8dPH/////Z8FuNW6Qtvw2nL3lyjsGBgYGhlmRqnj1kGwJuqHIlhJlCXq8EOITEsdqCXLEbbr8FisfFkTo+vBZRFZwERNEFFkCiw90nxJtCalxQmzegltCzVyP1RJq5HZ8AABuNZr0628DMwAAAABJRU5ErkJggg=="); background-repeat:no-repeat; background-position:right center;}
    </style>
</head>

<body class="bodys">
<div style="width:100%; margin-bottom:50px; overflow:hidden;">

    <ul>
        <li class="datep"><a href="http://www.jayui.com/jedate/">详细日期控件API</a></li>
        <li class="datep" style="width:700px;">jeDate除了包含初始化日期加减N、日期标注点、输入框可以直接输入时间、设定年月（YYYY-MM）、日期范围限制、开始日期设定、自定义日期格式、时间戳转换、当天的前后若干天返回、时分秒选择、智能响应、自动纠错、节日识别，操作等常规功能外，根据不同的日期格式，显示不同内容，还拥有更多趋近完美的解决方案。<br/><span style="color: green">您可以免费将她用于任何个人项目。但是不能去除头部信息。</span>  QQ群：516754269</li>

        <!--<input type="checkbox" formatval="YYYY-MM-DD" onclick="thatcheckbox(this)">-->

        <li class="datep">
            <input class="datainp wicon" id="inpstart" type="text" placeholder="开始日期" value=""  readonly>
            <input class="datainp wicon" id="inpend" type="text" placeholder="结束日期"   readonly>
        </li>
        <li class="datep"><input class="datainp wicon" id="date01" type="text" placeholder="YYYY-MM-DD hh:mm:ss" value=""  readonly></li>
        <li class="datep"><input class="datainp wicon" id="date02" type="text" placeholder="YYYY-MM-DD hh:mm" value=""  readonly></li>
        <li class="datep"><input class="datainp wicon" id="date022" type="text" placeholder="YYYY-MM-DD hh" value=""  readonly></li>
        <li class="datep"><input class="datainp wicon" id="date03" type="text" placeholder="YYYY-MM-DD"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="date04" type="text" placeholder="YYYY-MM"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="dateyyyy" type="text" placeholder="YYYY"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="date05" type="text" placeholder="hh:mm:ss"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="dateymdh" type="text" placeholder="YYYY-MM-DD hh"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="datehz" type="text" placeholder="hh"  readonly></li>
        <li class="datep"><input class="datainp wicon" id="test"  type="text" placeholder="hh" onclick="testShow(this)"  readonly></li>
        <li class="datep"><input class="datainp" id="inyyyy" type="text" placeholder="YYYY年" onclick="$.jeDate('#inyyyy',{insTrigger:false,isTime:true,format:'YYYY年'})" value=""  readonly></li>
        <li class="datep"><input class="datainp wicon" id="optsdate" type="text" placeholder="开始日期" value=""  readonly></li>


        <li>
            <span style="color: red">jeDate从3.5版本开始改为jquery版本的日期控件</span><br/><br/>
            <span style="color: red">此为部分个例展示，更多请看</span> <a href="http://www.jayui.com/jedate/">详细日期控件API</a>。<br/><br/>
            <input class="datainp wicon" id="datefix" type="text" placeholder="YYYY-MM-DD"  readonly><br/><br/><br/>
            <div id="refix"></div><br/><br/>
        </li>
    </ul>

</div>

<script type="text/javascript">
    $("#datefix").jeDate({
        //isinitVal:true,
        //festival:true,
        //ishmsVal:false,
        fixedCell:"refix",
        //isClear:false,
        //isok:false,
        hmsSetVal:{hh:00,mm:00,ss:00},
        //isvalid:["3,4,8,10",true],
        initAddVal:{MM:"+3",DD:"+2"},
        minDate: '2016-06-16',
        maxDate: '2025-06-16',
        format:"YYYY-MM-DD hh:mm:ss",
        //format:"hh:mm",
        zIndex:3000,
        choosefun:function (elem,val,date) {
            console.log(val)
            console.log(date)
            //alert(date)
        },
        okfun:function (elem,val,date) {
            console.log(val)
            console.log(date)
            //alert(date)
        }
    })
    //var dt = new Date(),
    //    sm = dt.setMonth(13),
    //    gm =  dt.getFullYear()
    console.log($.timeStampDate("2017-11-16 10:35:22",false))
    console.log($.timeStampDate("1513391722",true))
    //console.log(gm)

    var cancel ={
        minDate:'2015-06-16',
        maxDate:'2017-12-16'
    }
    var opts = $.extend({
        type:"je",
        minDate:undefined,
        maxDate:undefined
    },cancel);
    if (opts.type == "je") {
        $("#optsdate").jeDate({
            isinitVal: true,
            festival: true,
            trigger: "click mouseenter focus",
            isTime:false,
            ishmsVal: false,
            minDate: opts.minDate,
            maxDate: opts.maxDate,
            format: "YYYY-MM-DD hh:mm",
            zIndex: 3000,
            okfun:function (elem,val) {
                alert(elem)
            }
        })
    }

    //实现日期选择联动
    var start = {
        format: 'YYYY-MM-DD',
        minDate: '2014-06-16 23:59:59', //设定最小日期为当前日期
        //festival:true,
        maxDate: $.nowDate({DD:0}), //最大日期
        choosefun: function(elem,datas){
            end.minDate = datas; //开始日选好后，重置结束日的最小日期
            endDates();
        },
        okfun:function (elem,datas) {
            alert(datas)
        }
    };
    var end = {
        format: 'YYYY年MM月DD日',
        minDate: $.nowDate({DD:0}), //设定最小日期为当前日期
        //festival:true,
        maxDate: '2099-06-16 23:59:59', //最大日期
        choosefun: function(elem,datas){
            start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
        }
    };
    function endDates() {
        end.trigger = false;
        $("#inpend").jeDate(end);
    }
    $("#inpstart").jeDate(start);
    $("#inpend").jeDate(end);



    $("#date01").jeDate({
        isinitVal:true,
        //festival:true,
        ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM-DD hh:mm:ss",
        zIndex:3000,
    })
    $("#date02").jeDate({
        isinitVal:true,
        //festival:true,
        ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM-DD hh:mm",
        zIndex:3000,
    });
    $("#date022").jeDate({
        isinitVal:true,
        //festival:true,
        ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM-DD hh:zz",
        zIndex:3000,
    })
    $("#date03").jeDate({
        isinitVal:true,
        //festival:true,
        ishmsVal:false,
        minDate: '2016-06-16',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM-DD",
        zIndex:3000,
    })
    $("#date04").jeDate({
        isinitVal:true,
        //festival:true,
        ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM",
        zIndex:3000,
    })
    $("#date05").jeDate({
        isinitVal:true,
        //festival:true,
        //ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"hh:mm:ss",
        zIndex:3000,
    })
    $("#dateyyyy").jeDate({
        isinitVal:true,
        //festival:true,
        //ishmsVal:false,

        determine:false,
        format:"YYYY年",
        zIndex:3000,
    })
    $("#dateymdh").jeDate({
        isinitVal:true,
        //festival:true,
        //ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"YYYY-MM-DD hh:zz",
        zIndex:3000,
    })
    $("#datehz").jeDate({
        isinitVal:true,
        //festival:true,
        //ishmsVal:false,
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"hh:zz",
        zIndex:3000,
    })
    function testShow(elem){
        $.jeDate(elem,{
            trigger:false,
            isinitVal:true,
            //festival:true,
            //ishmsVal:false,
            minDate: '2016-06-16 23:59:59',
            maxDate: $.nowDate({DD:0}),
            format:"hh",
            zIndex:3000,
        })
    }

</script>

</body>
</html>

