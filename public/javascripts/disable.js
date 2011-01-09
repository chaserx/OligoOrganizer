//from http://jonhartmann-com.secure9.ezhostingserver.com/index.cfm/2009/6/11/Preventing-Multiple-Submissions-with-Prototype-and-jQuery
function preventMultipleSubmission (event) {
    var button = $(Event.element(event));
        button.onsubmit.disable()
}            

document.observe('dom:loaded', function () {
    $$('[type=submit]').invoke('observe', 'click', preventMultipleSubmission.bindAsEventListener());
});