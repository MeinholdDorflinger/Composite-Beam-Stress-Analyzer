# Composite-Beam-Stress-Analyzer
MATLAB script to calculate section properties, neutral axis, and maximum bending stresses for multi-material cross sections of basic geometric shapes using the Parallel Axis Theorem. Concepts relating to Statics and Mechanics of Deformable Bodies.

• Asks the user to input shape dimensions, Modulus of Elasticity, and distance from bottom axis to the shape's center.

• Based on the Modulus of Elasticity, the script transforms the dimension values to compensate.

• The script calculates the Neutral Axis and Area Moment of Inertia based on the Parallel Axis Theorem.

• The script outputs the cross-section's top and bottom stresses.

• 2D subplots are implemented, showing both the real and transformed cross-section with the Neutral Axis overlaid.

----------------------------------------------------------------------------------------------------------------------------
Example of a simple 2-shaped beam demonstrating how different material elasticities transform the cross-section
  - "Real Cross-Section" shows what the beam's cross-section looks like in real life
  - "Transformed Cross-Section" shows how the script sees the cross-section to make calculations properly
  - Overlay of the Neutral Axis is seen as the horizontal dashed line
  - Top shape had an Elasticity of 30 megapascals
  - Bottom shape had an Elasticity of 10 megapascals
  - 3:1 elasticity ratio transformed the base by 3

  - Bending Moment of 100,000 in-lbs output stresses consisting of:

      Top Stress - 17,306.69 psi

      Bottom Stress - 28,846.15 psi 

<img width="650" height="500" alt="Figure_1" src="https://github.com/user-attachments/assets/36a63b47-241a-4a59-80fd-cc6f9e09d277" />
