# Week 3 – Discrete-Time Signals in MATLAB

This project shows how to generate basic discrete-time signals in MATLAB using the **stem()** function.  
All plots are saved automatically in a folder named **figures**.

---

## Files
- **discrete_signals.m** – MATLAB script that creates and saves all plots  
- **figures/** – Folder that stores output images  

---

## Signals Generated
1. **Unit Impulse (δ[n])** – 1 at n=0, else 0  
2. **Unit Step (u[n])** – 1 for n≥0, else 0  
3. **Unit Ramp (r[n])** – r[n] = n·u[n]  
4. **Exponential (x[n])** – x[n] = αⁿ with α=0.85 (two-sided decay)  
5. **Signum (sgn[n])** – −1 for n<0, 0 for n=0, +1 for n>0  
6. **Sinc Function (h[n])** – h[n] = sin(ωc·n)/(π·n), with ωc = 0.4π  

---

## How to Run
1. Open MATLAB.  
2. Run:
   ```matlab
   discrete_signals
3. Two figures will appear:

Figure 1 → Impulse, Step, Ramp, Exponential, and Signum

Figure 2 → Sinc function

4. Plots are also saved in the figures/ folder.
