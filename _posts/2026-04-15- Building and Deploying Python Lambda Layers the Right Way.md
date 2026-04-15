---
title: Building and Deploying Python Lambda Layers the Right Way
author: Mahinsha Ramyathilake
external_link: https://www.linkedin.com/pulse/building-deploying-python-lambda-layers-right-way-ramyathilake-jzgoc/?trackingId=3zoGlQbLR5inD4UoHkdx8A%3D%3D
linkedin: https://www.linkedin.com/in/mahinsha-ramyathilake-7b0525191/?lipi=urn%3Ali%3Apage%3Ad_flagship3_pulse_read%3BwQ0pPVINS1eZsLtb8L8X5g%3D%3D
description: If you've ever deployed a Python Lambda function and gotten a "ModuleNotFoundError" in production despite the package working perfectly on your machine you've run into one of the most common Lambda pain points- dependency packaging.Lambda runs on Amazon Linux in the cloud, not your local OS. Packages with native C extensions compiled on Windows or macOS simply won't work. And once you add size constraints, folder structure requirements, and multi-function reuse into the mix, it's clear that packaging dependencies for Lambda needs a deliberate approach.This guide walks you through the entire workflow from pip install to attaching the layer to your function and explains the reasoning behind each step so you're not just copy-pasting commands blindly.

---
___



                 

