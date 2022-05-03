import { Controller } from 'stimulus';
import $ from 'jquery';
import 'select2/dist/css/select2.min.css';
import 'select2';

export default class extends Controller {
	static values = { options: Object };

	connect() {
		$(this.element).select2(this.optionsValue);
	}
}
