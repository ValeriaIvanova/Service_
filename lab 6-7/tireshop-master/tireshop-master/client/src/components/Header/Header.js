import React, { useState } from 'react';
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { setRole } from "../../redux/actions/user";

const Header = () => {
    const [collapse, setCollapse] = useState(false)
    const dispatch = useDispatch()

    const {role} = useSelector(state => state.user)

    const collapseHandler = () => {
        setCollapse(!collapse)
    }

    return (
        <nav className="navbar navbar-dark bg-dark">
            <Link className="navbar-brand" to={'/'} style={{paddingTop: 0}}>TireShop</Link>
            <ul className="navbar-nav mr-auto flex-row justify-content-between">
                <div className="d-flex justify-content-around">
                    <li className="nav-item active">
                        <Link className="nav-link" to="/">Catalog <span className="sr-only">(current)</span></Link>
                    </li>
                    <li className="nav-item" style={{marginLeft: 15}}>
                        <Link className="nav-link disabled" to="/">Cart</Link>
                    </li>
                </div>
                <li onClick={collapseHandler} className="nav-item dropdown" style={{marginLeft: 15}}>
                    <div className="nav-link dropdown-toggle" id="navbarDropdown" role="button"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Select role
                    </div>
                    <div className={`dropdown-menu ${collapse ? 'position-absolute d-block' : 'd-none'}`}
                         aria-labelledby="navbarDropdown">
                        <button onClick={() => {dispatch(setRole(0))}} className="dropdown-item">Пользователь</button>
                        <div className="dropdown-divider"></div>
                        <button onClick={() => {dispatch(setRole(1))}} className="dropdown-item">Администратор</button>
                    </div>
                </li>
                <li>
                    {role === 1 && <Link className="nav-link" to="/admin" style={{marginLeft: 15}}>Admin panel</Link>}
                </li>
            </ul>
        </nav>
    );
};

export default Header;
