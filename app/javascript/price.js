const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputPrice = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputPrice * 0.1);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputPrice * 0.9);
  });
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);