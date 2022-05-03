import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
	static targets = ['modal'];
	// static classes = ['class'];
	// static values = { name: Type };

	initialize() {}

	connect() {}

	open(evt) {
		this.modalTarget.classList.remove('hidden');
		this.modalTarget.classList.add('flex');
	}
}
