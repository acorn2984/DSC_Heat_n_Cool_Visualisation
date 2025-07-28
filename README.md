# DSC Heat & Cool Visualisation

A MATLAB tool for visualising and analyzing Differential Scanning Calorimetry (DSC) data, specifically designed for isothermal analysis and temperature-dependent heat flow measurements.

## Features

- **Automated Data Loading**: Reads DSC data files in text format with intelligent parsing
- **Dual Plot Visualisation**: 
  - Heat flow vs. time (isothermal analysis)
  - Heat flow vs. sample temperature
- **Data Validation**: Robust error handling and data integrity checks
- **Statistical Analysis**: Provides comprehensive data statistics including mean, min, max, and standard deviation
- **Export Functionality**: Save plots as PNG files for presentations and reports
- **User-Friendly Interface**: Interactive prompts for file selection and plot saving

## Requirements

- MATLAB R2016b or later
- No additional toolboxes required

## Installation

1. Clone this repository:
```bash
git clone https://github.com/acorn2984/DSC_Heat_n_Cool_Visualisation.git
```

2. Navigate to the project directory:
```bash
cd DSC_Heat_n_Cool_Visualisation
```

3. Run the script in MATLAB:
```matlab
run('dsc_plotter.m')
```

## Usage

1. **Prepare Your Data**: Ensure your DSC data file is in the expected format (see Data Format section below)

2. **Run the Script**: Execute the MATLAB script and follow the interactive prompts

3. **Enter Filename**: Provide the data file name (with or without .txt extension)

4. **View Results**: The script will generate:
   - Time-series plot of heat flow
   - Temperature-dependent heat flow plot (if temperature data available)
   - Statistical summary in the command window

5. **Save Plots** (Optional): Choose to save the generated plots as PNG files

## Data Format

The script expects text files with the following column structure:
```
Index  Time(s)  HeatFlow(W/g)  Ts(°C)  Tr(°C)
1      0.0      -0.001234      25.0    25.0
2      1.0      -0.001456      25.1    25.0
...
```

- **Index**: Sequential data point number
- **Time(s)**: Time in seconds
- **HeatFlow(W/g)**: Heat flow in watts per gram
- **Ts(°C)**: Sample temperature in Celsius
- **Tr(°C)**: Reference temperature in Celsius

## Output

### Plots Generated:
1. **Isothermal Analysis Plot**: Heat flow vs. time (minutes)
2. **Temperature Analysis Plot**: Heat flow vs. sample temperature (25-210°C range)

### Statistical Summary:
- Total measurement time
- Heat flow statistics (average, minimum, maximum, standard deviation)
- Temperature range (if available)
- Data point count and validation results

## Example Output

```
DSC Data Plotter
================
Enter the data file name (without extension): sample_data
Reading data from: sample_data.txt
Data starts at line 15
Parsing 1200 data lines...
Successfully loaded 1200 data points
Time range: 0.00 to 1200.00 seconds
Heat flow range: -0.012345 to 0.008765 W/g

--- Data Summary ---
Total measurement time: 1200.0 seconds (20.00 minutes)
Heat flow statistics:
  Average: -0.002134 W/g
  Minimum: -0.012345 W/g
  Maximum: 0.008765 W/g
  Standard deviation: 0.003456 W/g
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 acorn2984

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Citation

If you use this software in your research, please cite it as:

```bibtex
@software{dsc_heat_cool_visualization,
  author       = {acorn2984},
  title        = {DSC Heat \& Cool Visualization},
  year         = {2024},
  publisher    = {GitHub},
  journal      = {GitHub repository},
  howpublished = {\url{https://github.com/acorn2984/DSC_Heat_n_Cool_Visualisation}},
  url          = {https://github.com/acorn2984/DSC_Heat_n_Cool_Visualisation}
}
```

## Troubleshooting

### Common Issues:

1. **File Not Found Error**: 
   - Ensure the data file is in the same directory as the script
   - Check the filename spelling and extension

2. **No Data Found Error**:
   - Verify your data file follows the expected format
   - Check that numerical data starts after any header lines

3. **Parsing Errors**:
   - Ensure data columns are space or tab-separated
   - Remove any non-numeric characters from data rows

4. **Plot Display Issues**:
   - Ensure MATLAB has sufficient memory for large datasets
   - Try reducing the dataset size if memory issues occur

## Support

For questions, issues, or suggestions, please open an issue on the [GitHub repository](https://github.com/acorn2984/DSC_Heat_n_Cool_Visualisation/issues).

## Acknowledgments

- Developed for differential scanning calorimetry data analysis in materials science research
- Designed with user-friendly interfaces for both novice and experienced MATLAB users
