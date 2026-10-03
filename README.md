# Composite-Beam-Stress-Analyzer
MATLAB script to calculate section properties, neutral axis, and maximum bending stresses for multi-material cross sections of basic geometric shapes using the Parallel Axis Theorem. Concepts relating to Statics and Mechanics of Deformable Bodies.

• Asks the user to input shape dimensions, Modulus of Elasticity, and distance from the bottom axis to the shape's center.

• Creates a transformed cross-section based on elastic modulus ratios 

        n(i) = E(i)/E_reference

• The script calculates the Neutral Axis and Area Moment of Inertia based on the Parallel Axis Theorem.

• The script computes top and bottom stresses for each material region and then provides the max tension and compression stresses throughout the entire cross section

• 2D subplots are implemented, showing both the real and transformed cross-section with the Neutral Axis overlaid.

----------------------------------------------------------------------------------------------------------------------------
Example of a Two-Material Composite Beam demonstrating how different material elasticities transform the cross-section
  - "Real Cross-Section" shows what the beam's cross-section looks like in real life
  - "Transformed Cross-Section" shows how the script sees the cross-section to make calculations properly
  - Overlay of the Neutral Axis is seen as the horizontal dashed line
  - Top shape had an Elasticity of 30 Msi
  - Bottom shape had an Elasticity of 10 Msi
  - 3:1 elasticity ratio transformed the base by 3

  - Bending Moment of 100,000 in-lbs outputs stresses consisting of:

           Rectangle 1
    
        Top Stress: -5769.23 psi
    
        Bottom Stress: -28846.15 psi

           Rectangle 2
    
        Top Stress: 51923.08 psi
    
        Bottom Stress: -17307.69 psi
    

        Maximum Tension: 51923.08 psi
    
        Maximum Compression: -28846.15 psi

<img width="650" height="500" alt="Figure_1" src="https://github.com/user-attachments/assets/36a63b47-241a-4a59-80fd-cc6f9e09d277" />


--------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Assumption**

 - Geometric components centered about a common axis
