const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputPrice = priceInput.value;
    const tax = Math.floor(inputPrice * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax;
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputPrice - tax;
  });
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);