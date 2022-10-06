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

</head>
<body>
	<form action="ckresult.jsp" method="post">
		<input type="hidden" value="" name="form" id="form1">
		<div class="form-group" id="form">
			<label class="col-form-label" for="editor"><span>*</span> 게시판</label>
			<textarea id="writeEditor" name="writeEditor" rows="20" cols="12"></textarea>
		</div>
		<input type="submit" value="등록">
	</form>
	<a href="javascript:getDataFromTheEditor();">콘솔(눌러야 값 등록됨 / 아직 안 합침)</a>
	<script>
class MyUploadAdapter {
    constructor( loader ) {
        // The file loader instance to use during the upload.
        this.loader = loader;
    }

    // Starts the upload process.
    upload() {
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
            this._initRequest();
        this._initListeners( resolve, reject, file );
        this._sendRequest( file );
    } ) );
    }

    // Aborts the upload process.
    abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }

    // Initializes the XMLHttpRequest object using the URL passed to the constructor.
    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();

        // Note that your request may look different. It is up to you and your editor
        // integration to choose the right communication channel. This example uses
        // a POST request with JSON as a data structure but your configuration
        // could be different.

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

    // Initializes XMLHttpRequest listeners.
    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `Couldn't upload file: ${ file.name }.`;

        xhr.addEventListener( 'error', () => reject( genericErrorText ) );
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response;

        // This example assumes the XHR server's "response" object will come with
        // an "error" which has its own "message" that can be passed to reject()
        // in the upload promise.
        //
        // Your integration may handle upload errors in a different way so make sure
        // it is done properly. The reject() function must be called when the upload fails.
        if ( !response || response.error ) {
            return reject( response && response.error ? response.error.message : genericErrorText );
        }

        // If the upload is successful, resolve the upload promise with an object containing
        // at least the "default" URL, pointing to the image on the server.
        // This URL will be used to display the image in the content. Learn more in the
        // UploadAdapter#upload documentation.
        resolve( {
            default: response.url
        } );
    } );

        // Upload progress when it is supported. The file loader has the #uploadTotal and #uploaded
        // properties which are used e.g. to display the upload progress bar in the editor
        // user interface.
        if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                loader.uploadTotal = evt.total;
                loader.uploaded = evt.loaded;
            }
        } );
        }
    }

    // Prepares the data and sends the request.
    _sendRequest( file ) {
        // Prepare the form data.
        const data = new FormData();

        data.append( 'upload', file, file.name );

        // Important note: This is the right place to implement security mechanisms
        // like authentication and CSRF protection. For instance, you can use
        // XMLHttpRequest.setRequestHeader() to set the request headers containing
        // the CSRF token generated earlier by your application.

        // Send the request.
        this.xhr.send( data );
    }
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
    	return new MyUploadAdapter( loader );
    };
}

let editor;

ClassicEditor
.create( document.querySelector( '#writeEditor' ) , {
	extraPlugins: [MyCustomUploadAdapterPlugin],
} )
	//.then(editor =>{
		//theEditor = editor;
		//console.log(editor.getData());
		//console.log(editor.sourceElement.nextSibling.children[2].children[0].childNodes);
		//console.log(editor.sourceElement.nextElementSibling.children[2].children[0].innerHTML);
		//console.log(editor.sourceElement.nextElementSibling.innerHTML);
		//document.getElementById('form1').value=editor.sourceElement.nextSibling.children[2].children[0].children[0].innerHTML;
		//console.log(document.getElementById('form1'));
//})
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
	const editorData = editor.getData();
	console.log(editorData);
	document.getElementById('form1').value=editorData;
	console.log(document.getElementById('form1'));
}
</script>


</body>
</html>
