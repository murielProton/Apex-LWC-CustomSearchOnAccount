import { LightningElement, track } from 'lwc';
// import server side apex class method 
import accountSearchBy from '@salesforce/apex/AccountSearchByController.accountSearchBy'
// import standard toast event 
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class SearchBy extends LightningElement {
    @track accountsRecord;
    searchValueName = '';
    searchValuePostalCode = '';

    // update searchValue var when input field value change
    searchKeywordName(event) {
        this.searchValueName = event.target.value;

    }
    searchKeywordPC(event){
    this.searchValuePostalCode = event.target.value;
    }
    // call apex method on button click 
    handleSearchKeyword() {
        //inputName inputPostalCode
        
        if (this.searchValue !== '') {
            accountSearchBy({
                inputName: this.searchValueName,
                inputPostalCode: this.searchValuePostalCode
                })
                .then(result => {
                    // set @track contacts variable with return contact list from server  
                    this.accountsRecord = result;
                })
                .catch(error => {
                   
                    const event = new ShowToastEvent({
                        title: 'Error',
                        variant: 'error',
                        message: error.body.message,
                    });
                    this.dispatchEvent(event);
                    // reset contacts var with null   
                    this.accountsRecord = null;
                });
        } else {
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
        }
    }
}