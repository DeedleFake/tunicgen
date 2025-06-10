import Alpine from 'alpinejs'

import Word from './word.js'

Alpine.store('words', {
	words: [new Word()],

	add() {
		this.words.push(new Word())
	},

	remove(index) {
		this.words.splice(index, 1)
	},
})

window.Alpine = Alpine
Alpine.start()
