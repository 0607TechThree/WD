<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
	<form action="imageUpload.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" value="" name="form" id="form1"> <input
			type="hidden" value="" name="fileData1" id="fileData1"> <input
			type="hidden" value="" name="fileName" id="fileName">
		<div class="form-group" id="form">
			<label class="col-form-label" for="editor"><span>*</span> 게시판</label>
			<textarea id="writeEditor" name="writeEditor" rows="20" cols="12"></textarea>
		</div>
		<input type="submit" value="등록">

	</form>
	<a href="javascript:getDataFromTheEditor();">콘솔(눌러야 값 등록됨 / 아직 안
		합침)</a>
	<img id="img">
	<script>
class MyUploadAdapter {
    constructor( loader ) {
    	// 업로드하는 동안 사용할 파일 로더 인스턴스입니다.
        this.loader = loader;
    }

 	// 업로드 프로세스를 시작합니다.
    upload() {
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
            this._initRequest();
        this._initListeners( resolve, reject, file );
        this._sendRequest( file );
    } ) );
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
		
        xhr.open( 'POST', 'http://localhost:8088/app/ckeditor.jsp', true );
        xhr.responseType = 'text';
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
} )

.then( newEditor => {
        editor = newEditor;
    } )

.then( editor => {
	window.editor = editor;

} )
.catch( error => {
	console.error( error );
} );

function getDataFromTheEditor(){
	const dataTransfer = new DataTransfer();

	const editorData = editor.getData();
	console.log(editorData);
	console.log(fileData); // 파일 정보
	console.log(fileData.name); // 파일 이름

	let reader = new FileReader();
    reader.readAsDataURL(fileData);
    reader.onloadend = e => {
    console.log(e.target.result)
    document.getElementById('fileData1').value=e.target.result; // 사진 base64 값
	//location.href="imageUpload.do?fileData="+e.target.result;
    };

    document.getElementById('fileName').value=fileData.name; // 사진 이름
	document.getElementById('form1').value=editorData; // 글 + 태그값
	console.log(document.getElementById('form1'));
	console.log(document.getElementById('fileName'));
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4&&xhr.status==200) {			
		}
	}

}

</script>


</body>
</html>
