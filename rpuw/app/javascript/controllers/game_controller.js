import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="game"
export default class extends Controller {
	static values = {
		gameId: Number,
		questionId: Number,
		participantId: Number,
	};

	connect() {
		this.csrfToken = document
			.querySelector('meta[name="csrf-token"]')
			.getAttribute('content');
	}

	async answer({ params }) {
		const formData = new FormData();
		formData.append('answer_id', params.answerId);
		formData.append('participant_id', this.participantIdValue);
		formData.append('question_id', this.questionIdValue);

		const options = {
			method: 'POST',
			headers: { Accept: 'application/json', 'X-CSRF-Token': this.csrfToken },
			body: formData,
		};

		const response = await fetch(`/games/${this.gameIdValue}/answer`, options);
		const json = await response.json();

		console.log(json);
	}
}
