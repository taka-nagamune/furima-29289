window.addEventListener('load', function(){
  const totalPrice = document.getElementById("item-price");
  totalPrice.addEventListener('input',function(){
    const inputPrice = document.getElementById("item-price").value;
    const salesCharge = inputPrice / 10;
    const profit = inputPrice - salesCharge;
    const textSalesCharge = document.getElementById("add-tax-price").textContent = salesCharge
    const textProfit = document.getElementById("profit").textContent = profit
  })
})