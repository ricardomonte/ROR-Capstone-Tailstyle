const counter = document.getElementById('votecount');

const updateCount = () => {
  const target = +counter.getAttribute('data-target');
  const count = +counter.innerText;
  const rand = Math.floor(Math.random() * (100 - 1 + 1)) + 1;
  if(count == target){
    count.innerText = target;     
  } else {
    counter.innerText = rand;
    setTimeout(updateCount, 5);
  } 
}

updateCount();



// const counter = document.getElementById('votecount');

// const updateCount = () => {
//   const target = +counter.getAttribute('data-target');
//   const count = +counter.innerText;
//   const rand = Math.floor(Math.random() * (100 - 1 + 1)) + 1;
//   if(count == target){
//     count.innerText = target;     
//   } else {
//     counter.innerText = rand;
//     setTimeout(updateCount, 5);
//   }
  
// }

// updateCount();
