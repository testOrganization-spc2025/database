import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Intro from './pages/Intro';
import Login from './pages/Login';
import Register from './pages/Register';
import Dashboard from './pages/Dashboard';
import './App.css';

function App() {
  return (
    <Router>
      <div className="app">
        <Navbar />
        <div className="app-container">
          <Routes>
            <Route path="/" element={<Intro />} />
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
            <Route path="/dashboard" element={<Dashboard />} />
            {/* 추가적인 라우트는 여기에 추가될 예정 */}
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
