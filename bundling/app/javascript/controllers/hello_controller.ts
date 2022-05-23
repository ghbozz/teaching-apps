import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(): void {
    interface Person {
      name: string;
      age: number;
      email: string;
    }

    const person: Person = {
      name: 'John',
      age: 30,
      email: 'john@gmail.com'
    }

    console.log(person);
  }

  click(): void {
    console.log('clicked');
  }
}
