<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="wd" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">

  <head>
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      href="https://fonts.googleapis.com/css?family=Bitter:400,700&display=swap&subset=latin-ext"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./css/main.css" />
    <link
      rel="stylesheet"
      href="https://meyerweb.com/eric/tools/css/reset/reset.css"
    />
    <title>WooriDoori - 메인페이지</title>
<!--
    
TemplateMo 558 Klassy Cafe

https://templatemo.com/tm-558-klassy-cafe

-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
	

<style type="text/css">
.actionimg {
	width: 20px;
	height: 20px;
	color: black;
}
.actionimg:hover{
	filter: opacity(0.2) drop-shadow(0 0 0 red);
}
.social-icons > li{
	color:white;
}
.section > *{
	font-family: 'Jua';
}
.jua{
	font-family: 'Jua';
	color: black;
}
.tab-item{
	display:flex;
	align-content: space-between;
}
.left-list{
	width:100%;
}
.right-list{
	width:100%;
}
.col-lg-12{
	display:flex;
	justify-content: space-around;
}
.tabs-content{
	margin: auto;
}
.mainboardsize{
	font-family: 'Jua';
	min-width: 300px;
}
.mimg{
	min-height: 338px;
}

#logobox{
	margin: auto;
}

@media (max-width: 1200px) and (min-width: 700px){
	#logobox{
		width: 200px;
		height: auto;
	}
}

/*popup*/
.popup_layer {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4); }
/*팝업 박스*/
.popup_box{position: relative;top:50%;left:50%; overflow: auto; height: auto; width:375px;transform:translate(-50%, -50%);z-index:1002;box-sizing:border-box;background:#fff;box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-webkit-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-moz-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);}
/*컨텐츠 영역*/
.popup_box .popup_cont {line-height:1.4rem;font-size:20px; font-family: 'Jua'; }
.popup_box .popup_cont h2 {padding:15px 0;color:#333;margin:0;}
.popup_box .popup_cont p{ border-top: 1px solid #666;padding-top: 30px;}
/*버튼영역*/
.popup_box .popup_btn {display:table;table-layout: fixed;width:100%;height:70px;background:#ECECEC;word-break: break-word;}
.popup_box .popup_btn a {position: relative; display: table-cell; height:70px;  font-size:17px;text-align:center;vertical-align:middle;text-decoration:none; background:#ECECEC;}
.popup_box .popup_btn a:before{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(-45deg); -webkit-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg);}
.popup_box .popup_btn a:after{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(45deg); -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg);}
.popup_box .popup_btn a.close_day {background:#5d5d5d;}
.popup_box .popup_btn a.close_day:before, .popup_box .popup_btn a.close_day:after{display:none;}
/*오버레이 뒷배경*/
.popup_overlay{position:fixed;top:0px;right:0;left:0;bottom:0;z-index:1001;;background:rgba(0,0,0,0.5);}
/*popup*/

</style>
    </head>
    
    <body>
<c:if test="${udata == null || udata.wdmvip == 0}">
<div class="popup_layer" id="popup_layer" style="display: none;">
  <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <img alt="광고이미지" src="img/spon.jpg" style="width: 375px; height: auto;">
          <center>
	          <span>(광고) 국내여행은 TechTrip</span>
          </center>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn" style="float: bottom;">
          <a href="javascript:closePop();">닫기</a>
      </div>
  </div>
</div>
</c:if>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="main.do" class="logo">
                            <img src="assets/images/wdmainlogo.png" align="klassy cafe html template">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="#offers" >blog</a></li>
                            <li class="scroll-to-section"><a href="#chefs">OnedayClass</a></li>
                            <li class="scroll-to-section"><a href="#activity">Activity</a></li>
                           	<c:if test="${udata != null}">
                           	<li class="scroll-to-section"><a href="javascript:winopen()">chat</a></li>
                           	</c:if>
                       		<c:if test="${udata == null}">
                            <li><a href="loginaction.do">
    	                         	<img class="actionimg" alt="로그인" src="img/login2.png" title="로그인 페이지로 이동">
	                             </a>
                             </li>
                             <li><a href="joinfirst.jsp">
    	                         	<img class="actionimg" alt="회원가입" src="img/join2.png" title="회원가입 페이지로 이동">
	                             </a>
                             </li>
                       		</c:if>
                       		<c:if test="${udata != null}">
                       		<li><a href="mypage.do">
    	                         	<img class="actionimg" alt="마이페이지" src="img/user2.png" title="마이페이지로 이동">
	                             </a>
                             </li>
                             <li><a href="logout.do">
    	                         	<img class="actionimg" alt="로그아웃" src="img/logout2.png" title="로그아웃">
	                             </a>
                             </li>
                       		</c:if>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
   

    <!-- ***** Main Banner Area Start ***** -->
    <div id="top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-content">
                        <div class="inner-content">
                        	<div id="logobox">
                        		<center>
		                        <img src="assets/images/wdwhlogo.png">
                        		</center>
                        	</div>
                            <!-- 뮤직플레이어 시작 -->
                            <div class="wrapper" id="app">
						      <div class="player">
						        <div class="player__top">
						          
						          <div class="player-controls">
						            
						            <div class="player-controls__item" @click="prevTrack">
						              <svg class="icon">
						                <use xlink:href="#icon-prev"></use>
						              </svg>
						            </div>
						            <div class="player-controls__item -xl js-play" @click="play">
						              <svg class="icon" id="iconmain">
						                <use xlink:href="#icon-pause" v-if="isTimerPlaying"></use>
						                <use xlink:href="#icon-play" v-else></use>
						              </svg>
						            </div>
						            <div class="player-controls__item" @click="nextTrack">
						              <svg class="icon">
						                <use xlink:href="#icon-next"></use>
						              </svg>
						            </div>
						          </div>
						        </div>
						        <div class="musicprogress" ref="progress">
						          <div class="progress__top">
						            <!-- 
						            <div class="progress__duration">{{ duration }}</div>
						             -->
						          </div>
						          <div class="progress__bar">
						            <div class="progress__current" style="{ width : barWidth }"></div>
						          </div>
						          <span class="progress__time">{{ currentTime }}</span>
						          <span class="progress__duration">{{ duration }}</span>
						        </div>
						        <div v-cloak></div>
						      </div>
						      
						    </div>
						
						    <svg xmlns="http://www.w3.org/2000/svg" hidden xmlns:xlink="http://www.w3.org/1999/xlink">
						      <defs>
						        <symbol id="icon-pause" viewBox="0 0 32 32">
						          <title>icon-pause</title>
						          <path d="M16 0.32c-8.64 0-15.68 7.040-15.68 15.68s7.040 15.68 15.68 15.68 15.68-7.040 15.68-15.68-7.040-15.68-15.68-15.68zM16 29.216c-7.296 0-13.216-5.92-13.216-13.216s5.92-13.216 13.216-13.216 13.216 5.92 13.216 13.216-5.92 13.216-13.216 13.216z"></path>
						          <path d="M16 32c-8.832 0-16-7.168-16-16s7.168-16 16-16 16 7.168 16 16-7.168 16-16 16zM16 0.672c-8.448 0-15.328 6.88-15.328 15.328s6.88 15.328 15.328 15.328c8.448 0 15.328-6.88 15.328-15.328s-6.88-15.328-15.328-15.328zM16 29.568c-7.488 0-13.568-6.080-13.568-13.568s6.080-13.568 13.568-13.568c7.488 0 13.568 6.080 13.568 13.568s-6.080 13.568-13.568 13.568zM16 3.104c-7.104 0-12.896 5.792-12.896 12.896s5.792 12.896 12.896 12.896c7.104 0 12.896-5.792 12.896-12.896s-5.792-12.896-12.896-12.896z"></path>
						          <path d="M12.16 22.336v0c-0.896 0-1.6-0.704-1.6-1.6v-9.472c0-0.896 0.704-1.6 1.6-1.6v0c0.896 0 1.6 0.704 1.6 1.6v9.504c0 0.864-0.704 1.568-1.6 1.568z"></path>
						          <path d="M19.84 22.336v0c-0.896 0-1.6-0.704-1.6-1.6v-9.472c0-0.896 0.704-1.6 1.6-1.6v0c0.896 0 1.6 0.704 1.6 1.6v9.504c0 0.864-0.704 1.568-1.6 1.568z"></path>
						        </symbol>
						        <symbol id="icon-play" viewBox="0 0 32 32">
						          <title>icon-play</title>
						          <path d="M21.216 15.168l-7.616-5.088c-0.672-0.416-1.504 0.032-1.504 0.832v10.176c0 0.8 0.896 1.248 1.504 0.832l7.616-5.088c0.576-0.416 0.576-1.248 0-1.664z"></path>
						          <path d="M13.056 22.4c-0.224 0-0.416-0.064-0.608-0.16-0.448-0.224-0.704-0.672-0.704-1.152v-10.176c0-0.48 0.256-0.928 0.672-1.152s0.928-0.224 1.344 0.064l7.616 5.088c0.384 0.256 0.608 0.672 0.608 1.088s-0.224 0.864-0.608 1.088l-7.616 5.088c-0.192 0.16-0.448 0.224-0.704 0.224zM13.056 10.272c-0.096 0-0.224 0.032-0.32 0.064-0.224 0.128-0.352 0.32-0.352 0.576v10.176c0 0.256 0.128 0.48 0.352 0.576 0.224 0.128 0.448 0.096 0.64-0.032l7.616-5.088c0.192-0.128 0.288-0.32 0.288-0.544s-0.096-0.416-0.288-0.544l-7.584-5.088c-0.096-0.064-0.224-0.096-0.352-0.096z"></path>
						          <path d="M16 0.32c-8.64 0-15.68 7.040-15.68 15.68s7.040 15.68 15.68 15.68 15.68-7.040 15.68-15.68-7.040-15.68-15.68-15.68zM16 29.216c-7.296 0-13.216-5.92-13.216-13.216s5.92-13.216 13.216-13.216 13.216 5.92 13.216 13.216-5.92 13.216-13.216 13.216z"></path>
						          <path d="M16 32c-8.832 0-16-7.168-16-16s7.168-16 16-16 16 7.168 16 16-7.168 16-16 16zM16 0.672c-8.448 0-15.328 6.88-15.328 15.328s6.88 15.328 15.328 15.328c8.448 0 15.328-6.88 15.328-15.328s-6.88-15.328-15.328-15.328zM16 29.568c-7.488 0-13.568-6.080-13.568-13.568s6.080-13.568 13.568-13.568c7.488 0 13.568 6.080 13.568 13.568s-6.080 13.568-13.568 13.568zM16 3.104c-7.104 0-12.896 5.792-12.896 12.896s5.792 12.896 12.896 12.896c7.104 0 12.896-5.792 12.896-12.896s-5.792-12.896-12.896-12.896z"></path>
						        </symbol>
						        <symbol id="icon-next" viewBox="0 0 32 32">
						          <title>next</title>
						          <path d="M2.304 18.304h14.688l-4.608 4.576c-0.864 0.864-0.864 2.336 0 3.232 0.864 0.864 2.336 0.864 3.232 0l8.448-8.48c0.864-0.864 0.864-2.336 0-3.232l-8.448-8.448c-0.448-0.448-1.056-0.672-1.632-0.672s-1.184 0.224-1.632 0.672c-0.864 0.864-0.864 2.336 0 3.232l4.64 4.576h-14.688c-1.248 0-2.304 0.992-2.304 2.272s1.024 2.272 2.304 2.272z"></path>
						          <path d="M29.696 26.752c1.248 0 2.304-1.024 2.304-2.304v-16.928c0-1.248-1.024-2.304-2.304-2.304s-2.304 1.024-2.304 2.304v16.928c0.064 1.28 1.056 2.304 2.304 2.304z"></path>
						        </symbol>
						        <symbol id="icon-prev" viewBox="0 0 32 32">
						          <title>prev</title>
						          <path d="M29.696 13.696h-14.688l4.576-4.576c0.864-0.864 0.864-2.336 0-3.232-0.864-0.864-2.336-0.864-3.232 0l-8.448 8.48c-0.864 0.864-0.864 2.336 0 3.232l8.448 8.448c0.448 0.448 1.056 0.672 1.632 0.672s1.184-0.224 1.632-0.672c0.864-0.864 0.864-2.336 0-3.232l-4.608-4.576h14.688c1.248 0 2.304-1.024 2.304-2.304s-1.024-2.24-2.304-2.24z"></path>
						          <path d="M2.304 5.248c-1.248 0-2.304 1.024-2.304 2.304v16.928c0 1.248 1.024 2.304 2.304 2.304s2.304-1.024 2.304-2.304v-16.928c-0.064-1.28-1.056-2.304-2.304-2.304z"></path>
						        </symbol>
						      </defs>
						    </svg>
						    <!-- 뮤직플레이어 종료 -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="main-banner header-text">
                        <div class="Modern-Slider">
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/main1.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/main2.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/main3.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/main4.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/main5.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Menu Area Starts ***** -->
    <section class="section" id="offers">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4 text-center">
                    <div class="section-heading">
                        <h6>-- blog --</h6>
                        <h2>게시글 확인하기</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row" id="tabs">
                        
                        <div class="col-lg-12">
                            <section class='tabs-content'>
                                <article id='tabs-1'>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="left-list">
                                                	<!-- 좋아요순 리스트 3개 -->
                                                	
                                                    <c:forEach var="v" items="${bldatas}">
                                                    <div class="col-lg-12">
                                                        <div class="tab-item">
                                                            <img src="img/like${v.wdbrandom}.png" alt="">
                                                            <div class="mainboardsize">
                                                            <h4>제목 : ${v.wdbtitle}</h4>
                                                            <p>작성자 : ${v.wdbwriter} <br>좋아요 : ${v.wdblike}</p>
                                                            </div>
                                                            <div class="price">
                                                            	<a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
                                                                <h6>이동</h6>
                                                            	</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                	</c:forEach>
                                                    <!-- 좋아요순 리스트 3개 끝 -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="right-list">
                                                	<!-- 최신 리스트 3개 -->
                                                    <c:forEach var="v" items="${brdatas}">
                                                    <div class="col-lg-12">
                                                        <div class="tab-item">
                                                            <img src="img/newblog.png" alt="신규블로그">
                                                            <div class="mainboardsize">
                                                            <h4>제목 : ${v.wdbtitle}</h4>
                                                            <p>작성자 : ${v.wdbwriter} <br>좋아요 : ${v.wdblike}</p>
                                                            </div>
                                                            <div class="price">
                                                            	<a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
                                                                <h6>이동</h6>
                                                            	</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                	</c:forEach>
                                                	<!-- 최신 리스트 3개 끝 -->
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <center>
	                                <a href="board.do" class="jua">
										<div>더보기 ></div>
									</a>
                                </center>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Chefs Area Ends ***** -->

    <!-- ***** Menu Area Starts ***** -->
    <section class="section" id="chefs">
        <div class="container">
        	<div class="row">
                <div class="col-lg-4 offset-lg-4 text-center">
                    <div class="section-heading">
                        <h6>- Oneday Menu -</h6>
                        <h2>원데이클래스 확인하기</h2>
                    </div>
                </div>
            </div>
            <!-- 
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>Oneday Menu</h6>
                        <h2>원데이클래스 확인하기</h2>
                    </div>
                </div>
            </div>
             -->
        </div>
        <div class="menu-item-carousel">
            <div class="col-lg-12">
                <div class="owl-menu-item owl-carousel">
                	<!-- 반복이 필요한 부분 -->
                	<!-- 데이터는 onedayselectAll자료 필요함 -->
                	<c:forEach var="v" items="${odatas}">
                	<a href="selectOneWdoneday.do?wdopk=${v.wdopk}">
                    <div class="item onedayitem">
                        <div class='card' style="background-image: url(img/crawling/${v.wdomainimg})">
                            <div class="price"><h6>${v.wdopk}</h6></div>
                        </div>
						<div>
							<h5>${v.wdoname}</h5>
							<span class="onedayp">- ${v.wdoregion} -</span>
						</div>
                    </div>
                	</a>
                	</c:forEach>
                    <!-- 반복이 필요한 부분 -->
                </div>
            </div>
        </div>
    </section>
	<center>
		<a href="oneday.do" class="jua">
			<div>더보기 ></div>
		</a>
	</center>
    <!-- ***** Menu Area Ends ***** -->

    <!-- ***** Chefs Area Starts ***** -->
    <section class="section activity" id="chefs">
        <div class="container"  id="activity">
            <div class="row">
                <div class="col-lg-4 offset-lg-4 text-center">
                    <div class="section-heading">
                        <h6>- activity -</h6>
                        <h2>여러 활동을 진행해보세요</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="chef-item">
                        <a href="javascript:winopen3()">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li>내 MBTI 유형을 확인해 보아요</li>
                            </ul>
                            <img src="img/mbti.jpg" alt="엠비티아이" class="mimg">
                        </div>
                        <div class="down-content">
                            <h4>MBTI 검사</h4>
                            <span></span>
                        </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="chef-item">
                    	<a href="javascript:winopen2()">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li>디데이 계산을 통해 일정을 관리해요</li>
                            </ul>
                            <img src="img/dday.jpg" alt="디데이계산기" class="mimg">
                        </div>
                        <div class="down-content">
                            <h4>D+day 계산기</h4>
                            <span></span>
                        </div>
                    	</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="chef-item">
                    	<a href="javascript:winopen4()">
                        <div class="thumb">
                            <div class="overlay"></div>
                            <ul class="social-icons">
                                <li>각자의 연애능력을 확인해보아요</li>
                            </ul>
                            <img src="img/couple.jpg" alt="커플능력테스트" class="mimg">
                        </div>
                        <div class="down-content">
                            <h4>연애능력 테스트</h4>
                            <span></span>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Chefs Area Ends ***** -->
   
    <!-- ***** Footer Start ***** -->
    <wd:footer/>
    <!-- ***** Footer End ***** -->

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script src="./scripts/script.js"></script>
    <script>
    $( document ).ready(function() {
    	document.getElementById("popup_layer").style.display = "block";
    });


    //팝업 닫기
    function closePop() {
        document.getElementById("popup_layer").style.display = "none";
    }
        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });
	function winopen(){
		window.open("opensocket.do?id=${udata.wdmid}", "","width=330, height=430");
	}
	function winopen2(){
		window.open("dDayCar.do", "","width=375, height=230");
	}
	function winopen3(){
		window.open("https://www.16personalities.com/ko", "","");
	}
	function winopen4(){
		window.open("https://www.banggooso.com/gl/1002/", "","");
	}
    </script>
  </body>
</html>