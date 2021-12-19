String classification(double result){
  if (result<18.5)return 'Under Weight';
  if (result >= 18.5 && result <= 24.9)return 'Normal Weight';
  if (result >24.9 && result <= 29.9)return 'Over Weight';
  if (result >29.9 && result <=  34.9)return 'Obesity Class 1';
  if (result > 34.9 && result <= 39.9)return 'Obesity Class 2';
  if (result > 39.9) return 'Obesity Class 3';
  else{
    return 'wrong';
  }
}