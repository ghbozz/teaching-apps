import { Controller } from 'stimulus';

export default class extends Controller {
	static targets = ['btn'];

	connect() {
		this.element[this.identifier] = this;
		console.log('bye controller');
	}

	click(evt) {
		evt.preventDefault();
		document.querySelector('#hello').hello.sayHi();
	}
}
