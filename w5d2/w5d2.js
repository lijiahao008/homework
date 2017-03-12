// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping1();
//
// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping2();
//
// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// // mysteryScoping3();
//
// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// // mysteryScoping4();
//
// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

// mysteryScoping5();

function madLib(verb, adjective, noun){
  return (`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`);
}

 console.log(madLib('make', 'best', 'guac'));

 function isSubstring(searchString, subString){
   if (searchString.search(subString) === 0){
    return true;
    }else {
      return false;
    }
   ;
 }

 console.log(isSubstring("time to program", "time"));
 console.log(isSubstring("Jump for joy", "joys"));

 function fizzBuzz(array){
   result = []
   for (var i = 0; i < array.length; i++) {
     if (array[i] % 3 === 0 && array[i] % 5 === 0){
     }else if (array[i] % 3 === 0) {
       result.push(array[i]);
     }else if (array[i] % 5 === 0) {
       result.push(array[i]);
     }
   }
   return result
 }

 console.log(fizzBuzz([3,5,6,15]));

 function isPrime(num) {
   if (num < 2) {
     return false;
   }
   for (var i = 2; i < num; i++) {
     if (num % i === 0){
       return false;
     }
     return true;
   }
 }

 console.log(isPrime(7));

 function sumOfNPrimes(n){
   var result = 0;
   var i = 2;
   while (){ }
 }
