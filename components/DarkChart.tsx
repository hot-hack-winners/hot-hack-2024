import React, { useEffect } from 'react';
import { Bar } from 'react-chartjs-2';
import { Chart as ChartJS , ArcElement, Tooltip, Legend } from 'chart.js/auto';

const DarkChart = () => {
  const data = {
    labels: ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5'],
    datasets: [
      {
        label: 'Data',
        backgroundColor: 'rgba(75,192,192,0.2)',
        borderColor: 'rgba(75,192,192,1)',
        borderWidth: 1,
        hoverBackgroundColor: 'rgba(75,192,192,0.4)',
        hoverBorderColor: 'rgba(75,192,192,1)',
        data: [65, 59, 80, 81, 56],
      },
    ],
  };

  const options = {
    maintainAspectRatio: false,
    scales: {
      x: {
        grid: {
          color: 'rgba(255, 255, 255, 0.1)', // X-axis grid color
        },
      },
      y: {
        grid: {
          color: 'rgba(255, 255, 255, 0.1)', // Y-axis grid color
        },
      },
    },
  };
  useEffect(() => {
    ChartJS.register(ArcElement, Tooltip, Legend);
  },[])
  return (
    <div style={{ width: '80%', margin: 'auto' }}>
      <Bar data={data} options={options} />
    </div>
  );
};

export default DarkChart;