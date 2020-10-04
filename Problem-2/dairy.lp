\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  125 xcows_C1 + 135 xcows_C2 + 125 xcows_C3 + 115 xcows_C4 + 105 xcows_C5
   + 95 xcows_C6 + 85 xcows_C7 + 95 xcows_C8 + 105 xcows_C9 + 110 xcows_C10
   + 115 xcows_C11 + 120 xcows_C12 + 0.334 excess_C1 + 0.344 excess_C2
   + 0.37 excess_C3 + 0.366 excess_C4 + 0.352 excess_C5 + 0.328 excess_C6
   + 0.326 excess_C7 + 0.318 excess_C8 + 0.322 excess_C9 + 0.324 excess_C10
   + 0.33 excess_C11 + 0.35 excess_C12 + 1.67 shortage_C1
   + 1.72 shortage_C2 + 1.85 shortage_C3 + 1.83 shortage_C4
   + 1.76 shortage_C5 + 1.64 shortage_C6 + 1.63 shortage_C7
   + 1.59 shortage_C8 + 1.61 shortage_C9 + 1.62 shortage_C10
   + 1.65 shortage_C11 + 1.75 shortage_C12
Subject To
 milk_d_1: 62 xcows_C1 + 77.5 xcows_C2 + 93 xcows_C3 + 85.25 xcows_C4
   + 77.5 xcows_C5 + 62 xcows_C6 + 46.5 xcows_C7 + 31 xcows_C8
   + 15.5 xcows_C9 + 7.75 xcows_C10 + 31 xcows_C11 + 46.5 xcows_C12
   - excess_C1 + shortage_C1 = 25000
 milk_d_2: 42 xcows_C1 + 56 xcows_C2 + 70 xcows_C3 + 84 xcows_C4
   + 77 xcows_C5 + 70 xcows_C6 + 56 xcows_C7 + 42 xcows_C8 + 28 xcows_C9
   + 14 xcows_C10 + 7 xcows_C11 + 28 xcows_C12 - excess_C2 + shortage_C2
   = 27500
 milk_d_3: 31 xcows_C1 + 46.5 xcows_C2 + 62 xcows_C3 + 77.5 xcows_C4
   + 93 xcows_C5 + 85.25 xcows_C6 + 77.5 xcows_C7 + 62 xcows_C8
   + 46.5 xcows_C9 + 31 xcows_C10 + 15.5 xcows_C11 + 7.75 xcows_C12
   - excess_C3 + shortage_C3 = 30000
 milk_d_4: 7.5 xcows_C1 + 30 xcows_C2 + 45 xcows_C3 + 60 xcows_C4
   + 75 xcows_C5 + 90 xcows_C6 + 82.5 xcows_C7 + 75 xcows_C8 + 60 xcows_C9
   + 45 xcows_C10 + 30 xcows_C11 + 15 xcows_C12 - excess_C4 + shortage_C4
   = 27000
 milk_d_5: 15.5 xcows_C1 + 7.75 xcows_C2 + 31 xcows_C3 + 46.5 xcows_C4
   + 62 xcows_C5 + 77.5 xcows_C6 + 93 xcows_C7 + 85.25 xcows_C8
   + 77.5 xcows_C9 + 62 xcows_C10 + 46.5 xcows_C11 + 31 xcows_C12
   - excess_C5 + shortage_C5 = 26000
 milk_d_6: 30 xcows_C1 + 15 xcows_C2 + 7.5 xcows_C3 + 30 xcows_C4
   + 45 xcows_C5 + 60 xcows_C6 + 75 xcows_C7 + 90 xcows_C8 + 82.5 xcows_C9
   + 75 xcows_C10 + 60 xcows_C11 + 45 xcows_C12 - excess_C6 + shortage_C6
   = 23500
 milk_d_7: 46.5 xcows_C1 + 31 xcows_C2 + 15.5 xcows_C3 + 7.75 xcows_C4
   + 31 xcows_C5 + 46.5 xcows_C6 + 62 xcows_C7 + 77.5 xcows_C8
   + 93 xcows_C9 + 85.25 xcows_C10 + 77.5 xcows_C11 + 62 xcows_C12
   - excess_C7 + shortage_C7 = 22000
 milk_d_8: 62 xcows_C1 + 46.5 xcows_C2 + 31 xcows_C3 + 15.5 xcows_C4
   + 7.75 xcows_C5 + 31 xcows_C6 + 46.5 xcows_C7 + 62 xcows_C8
   + 77.5 xcows_C9 + 93 xcows_C10 + 85.25 xcows_C11 + 77.5 xcows_C12
   - excess_C8 + shortage_C8 = 21500
 milk_d_9: 75 xcows_C1 + 60 xcows_C2 + 45 xcows_C3 + 30 xcows_C4
   + 15 xcows_C5 + 7.5 xcows_C6 + 30 xcows_C7 + 45 xcows_C8 + 60 xcows_C9
   + 75 xcows_C10 + 90 xcows_C11 + 82.5 xcows_C12 - excess_C9 + shortage_C9
   = 22750
 milk_d_10: 85.25 xcows_C1 + 77.5 xcows_C2 + 62 xcows_C3 + 46.5 xcows_C4
   + 31 xcows_C5 + 15.5 xcows_C6 + 7.75 xcows_C7 + 31 xcows_C8
   + 46.5 xcows_C9 + 62 xcows_C10 + 77.5 xcows_C11 + 93 xcows_C12
   - excess_C10 + shortage_C10 = 23000
 milk_d_11: 90 xcows_C1 + 82.5 xcows_C2 + 75 xcows_C3 + 60 xcows_C4
   + 45 xcows_C5 + 30 xcows_C6 + 15 xcows_C7 + 7.5 xcows_C8 + 30 xcows_C9
   + 45 xcows_C10 + 60 xcows_C11 + 75 xcows_C12 - excess_C11 + shortage_C11
   = 25000
 milk_d_12: 77.5 xcows_C1 + 93 xcows_C2 + 85.25 xcows_C3 + 77.5 xcows_C4
   + 62 xcows_C5 + 46.5 xcows_C6 + 31 xcows_C7 + 15.5 xcows_C8
   + 7.75 xcows_C9 + 31 xcows_C10 + 46.5 xcows_C11 + 62 xcows_C12
   - excess_C12 + shortage_C12 = 27000
Bounds
End
