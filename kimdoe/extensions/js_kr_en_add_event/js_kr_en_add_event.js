function kr_en_add_event()
{
    document.addEventListener('keydown', (event) => {
        if(event.keyCode == 21 || event.keyCode == 17)
        {
            gml_Script_gmcallback_kr_en_pressed();
        }
    });
}