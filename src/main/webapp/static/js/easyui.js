function confirm1(){
    $.messager.confirm('My Title', 'Are you confirm this?', function(r){
        if (r){
            alert('confirmed: '+r);
        }
    });
}