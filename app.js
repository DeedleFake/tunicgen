document.addEventListener('alpine:init', () => {
	Alpine.store('words', {
		words: [],

		add() {
			this.words.push(new Word())
		},

		remove(index) {
			this.words.splice(index, 1)
		},
	})
})

class Word {
}
