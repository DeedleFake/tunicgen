let words = 0

class Word {
	constructor() {
		this.id = words
		words++
	}

	toString() {
		return `word(${this.id})`
	}
}

export default Word
