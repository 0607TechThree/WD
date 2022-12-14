<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - 블로그 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>
	
	
	
<style type="text/css">
#bdform{
	all : unset;
}
#writertitle{
	max-width: 780px;
	resize: none;
	font-size: 20px;
}
#submitbox{
	display:flex;
	justify-content: space-between;
	align-items: center;
}
</style>
</head>

<body class="is-preload">

	<!-- Wrapper-->
	<div id="wrapper">
		<center>
			<a href="main.do"><img id="logo" alt="로고"
				src="img/wdmainlogo.png"></a>
		</center>
		<br>
		<!-- Nav -->
		<nav id="nav">
			<a href="#" class="icon solid fa-envelope"><span>기본</span></a> <a
				href="#work" class="icon solid fa-folder"><span>상세 보기</span></a> <a
				href="board.do" class="icon solid fa-home"><span>목록보기</span></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro">
				<header>
					<h1 style="font-size: 30px;">제목 : ${boarddata.wdbtitle}</h1>
					<p>작성자 : ${boarddata.wdbwriter}</p>
					<p class="wdblikere">좋아요 : ${boarddata.wdblike}</p>
					<input type="hidden" id="wdblikere" value="${boarddata.wdblike}">
				</header>
				<a href="#work" class="jumplink pic"> <span
					class="arrow icon solid fa-chevron-right"><span>See
							my work</span></span> <img src="assets/images/pic0${boarddata.wdbrandom}.jpg"
					alt="" /></a>
			</article>

			<!-- Work -->
			<article id="work" class="panel">
				<form action="updateWdboard.do" method="post" id="bdform">
					<input type="hidden" name="wdbpk" value="${boarddata.wdbpk}">
					<header>
						<h2>
							<p style="font-size: 30px">게시글 제목</p>
							<textarea id="writertitle" name="wdbtitle">${boarddata.wdbtitle}</textarea>
						</h2>
					</header>
					<section style="margin-bottom: 1em;">
						<div class="form-group" id="form">
							<textarea id="writeEditor" name="wdbcontent" rows="20" cols="12">${boarddata.wdbcontent}</textarea>
						</div>
						<c:if test="${udata != null && udata.wdmid == boarddata.wdbwriter}">
						<c:if test="${boarddata.wdbopen == 0}">
						전체공개&nbsp;<input type="radio" name="wdbopen" checked="checked"
							value="0"> 커플공개&nbsp;<input type="radio" name="wdbopen"
							value="1"> <br>
						</c:if>
						<c:if test="${boarddata.wdbopen == 1}">
						전체공개&nbsp;<input type="radio" name="wdbopen"
							value="0"> 커플공개&nbsp;<input type="radio" name="wdbopen" checked="checked"
							value="1"> <br>
						</c:if>
						</c:if>
					</section>
					<div id="submitbox">
					<c:if test="${udata != null}">
					<c:if test="${likedata.wdcheck==null}">
						<img src="img/likeb.png" id="likeimg" width="60px" height="60px"
							class="likeimg">
					</c:if>
					<c:if test="${likedata.wdcheck==1}">
						<img src="img/likeaf.png" id="ulikeimg" width="60px" height="60px"
							class="likeimg">
					</c:if>
					<c:if test="${likedata.wdcheck==0}">
						<img src="img/likeb.png" id="ulikeimg" width="60px" height="60px"
							class="likeimg">
					</c:if>
						<c:if test="${boarddata.wdbwriter == udata.wdmid}">
							<div>
								<input type="submit" value="수정하기">
								<input type="button" value="삭제하기" onclick="javascript:deleteboard()">
							</div>
						</c:if>
					</c:if>
					<c:if test="${udata == null}">
						로그인 이후 좋아요 기능을 이용하실 수 있습니다!
					</c:if>
					</div>
				</form>
			</article>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
	var wdblikere = document.getElementById("wdblikere").value;
	$('#likeimg').on("click",function() {
	console.log(wdblikere);
		$.ajax({
			type : 'POST',
			url : 'insertwdlike.do',
			data : {
				wdbpk : '${boarddata.wdbpk}',
				wdmpk : '${udata.wdmpk}'
			},
			contextType : "application/json",
			success : function(result) {
				console.log("로그1 [" + result + "]");
				if (result == 1) {
					$('#likeimg').prop("src" , "img/likeaf.png");
					location.reload();
				}
			},
			error : function(request, status, error) {
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}
		});
	});
	$('#ulikeimg').on("click",function() {
	console.log(wdblikere);
		$.ajax({
			type : 'POST',
			url : 'updatewdlike.do',
			data : {
				wdbpk : '${boarddata.wdbpk}',
				wdmpk : '${udata.wdmpk}'
			},
			contextType : "application/json",
			success : function(result) {
				console.log("로그1 [" + result + "]");
				if (result == 1) {
					$('#ulikeimg').prop("src" , "img/likeaf.png");
					$('.wdblikere').text("좋아요 : "+(wdblikere+1));
					document.getElementById("wdblikere").value = wdblikere++;
				}else{
					$('#ulikeimg').prop("src" , "img/likeb.png");
					$('.wdblikere').text("좋아요 : "+(wdblikere-1));
					document.getElementById("wdblikere").value = wdblikere--;
				}
			},
			error : function(request, status, error) {
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}
		});
	});
class MyUploadAdapter {
    constructor( loader ) {
    	// 업로드하는 동안 사용할 파일 로더 인스턴스입니다.
        this.loader = loader;
    }

 	// 업로드 프로세스를 시작합니다.
    upload() {
        /*return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
            this._initRequest();
        this._initListeners( resolve, reject, file );
        this._sendRequest( file );
    } ) );*/
    var reader  = new FileReader();

    return new Promise( ( resolve, reject ) => {
        reader.addEventListener( 'load', () => {
            resolve( { default: reader.result } );
        });

        reader.addEventListener( 'error', err => {
            reject( err );
        });

        reader.addEventListener( 'abort', () => {
            reject();
        });                    

        this.loader.file.then( file => {
            reader.readAsDataURL( file );
        }); 
        console.log(reader);
    })
 	}

 	// 업로드 프로세스를 중단합니다.
    abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }

 	// 생성자에 전달된 URL을 사용하여 XMLHttpRequest 객체를 초기화합니다
    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();

     	// 요청이 다르게 보일 수 있습니다. 그것은 당신과 당신의 편집자에게 달려 있습니다
        // 올바른 통신 채널을 선택하기 위한 통합. 이 예에서는 다음을 사용합니다.
        // JSON을 데이터 구조로 사용하는 POST 요청이지만 구성
		// 다를 수 있습니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                //console.log(xhr.responseText);
               	// console.log(xhr);
                document.getElementById('writeEditor').innerHTML += xhr.responseText;
            }
        }
		//console.log(document.getElementById('form'));
		
        xhr.open( 'POST', 'http://localhost:8088/app/boarddetail.jsp', true );
        xhr.responseType = 'json';
        //xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    }

 	// XMLHttpRequest 리스너를 초기화합니다.
    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `Couldn't upload file: ${ file.name }.`;

        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response;

        // 이 예제는 XHR 서버의 "response" 객체가
        // reject()에 전달할 수 있는 자체 "메시지"가 있는 "오류"    
		// 업로드 약속에서.
        //
        // 통합에서 업로드 오류를 다른 방식으로 처리할 수 있으므로
        // 제대로 수행됩니다. 업로드가 실패하면 reject() 함수를 호출해야 합니다.
        if ( !response || response.error ) {
            return reject( response && response.error ? response.error.message : genericErrorText );
        }


     	// 업로드가 성공하면 다음을 포함하는 객체로 업로드 약속을 해결합니다.
        // 최소한 서버의 이미지를 가리키는 "기본" URL.    
		// 이 URL은 콘텐츠에 이미지를 표시하는 데 사용됩니다. 자세한 내용은      
		// UploadAdapter# 문서 업로드.
        resolve( {
            default: response.url
        } );
    } );


     	// 지원되는 경우 진행 상황을 업로드합니다. 파일 로더에는 #uploadTotal 및 #uploaded가 있습니다.      
		// 사용되는 속성 예. 편집기에 업로드 진행률 표시줄을 표시하려면        
		// 사용자 인터페이스.
        if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                loader.uploadTotal = evt.total;
                loader.uploaded = evt.loaded;
            }
        } );
        }
    }

 	// 데이터를 준비하고 요청을 보냅니다.
    _sendRequest( file ) {
    	// 폼 데이터를 준비합니다.
        const data = new FormData();
		fileData = file;
        data.append( 'upload', file, file.name );

     	// 중요 사항: 이것은 보안 메커니즘을 구현하기에 적합한 곳입니다.      
		// 인증 및 CSRF 보호와 같습니다. 예를 들어 다음을 사용할 수 있습니다.       
		// 다음을 포함하는 요청 헤더를 설정하는 XMLHttpRequest.setRequestHeader()      
		// 애플리케이션에서 이전에 생성한 CSRF 토큰.
        // 요청을 보냅니다.
        this.xhr.send( data );
    }
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
    	return new MyUploadAdapter( loader );
    };
}
let editor;
let fileData;

ClassicEditor
.create( document.querySelector( '#writeEditor' ) , {
	extraPlugins: [MyCustomUploadAdapterPlugin],
})

.then( newEditor => {
	editor=newEditor;
})
.then( editor => {
	window.editor = editor;
	/*
	editor.disableReadOnlyMode( '#writeEditor' );
	const toolbarElement = editor.ui.view.toolbar.element;
	*/
	//toolbarElement.style.display = 'none';
} )
.catch( error => {
	console.error( error );
} );

function deleteboard(){
	location.href="deleteWdboard.do?wdbpk=${boarddata.wdbpk}";
}
</script>
</body>
</html>