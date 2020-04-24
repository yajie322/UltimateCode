$(document).ready(function(){
    //detect select file change
    $('#home_file_selector').on('change', function() {
        var selected = this.value;
	if(this.value==''){
		return;
	}
	var url = window.location.href + 'documents/' + selected;
	//alert(url);
	window.location.assign(url);
    });
});
