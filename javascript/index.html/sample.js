
const storeNames = (...names) => {
    let nameArray = [...names];
    console.log(nameArray);
    return nameArray;
};
console.log(storeNames('Ramu', 'Raju', 'Ravan'));