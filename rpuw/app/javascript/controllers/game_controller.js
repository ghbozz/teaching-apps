import { Controller } from '@hotwired/stimulus';
import { post } from '@rails/request.js';
export default class extends Controller {
	static values = {
		gameId: Number,
		participantId: Number,
	};

	connect() {
		this.csrfToken = document
			.querySelector('meta[name="csrf-token"]')
			.getAttribute('content');
	}

	answer({ params }) {
		const formData = new FormData();
		formData.append('answer_id', params.answerId);
		formData.append('participant_id', this.participantIdValue);
		formData.append('question_id', params.questionId);

		const options = {
			body: formData,
			responseKind: 'turbo-stream',
		};

		post(`/games/${this.gameIdValue}/answer`, options);
	}
}
