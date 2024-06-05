window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue =  Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxValue.toLocaleString();
    
    const addProfitDom = document.getElementById("profit")
    const profitValue = inputValue - taxValue;
    addProfitDom.innerHTML = profitValue.toLocaleString();
  });
});