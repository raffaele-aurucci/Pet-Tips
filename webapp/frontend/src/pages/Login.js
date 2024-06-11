import {useState} from 'react'
import {useLogin} from "../hooks/useLogin";
import {Navigate, useNavigate} from "react-router-dom";

// file of form
const Login = () => {
    const [email, setEmail] = useState()
    const [password, setPassword] = useState()
    const {login, error, isLoading} = useLogin()

    const handleSubmit = async (e) => {
        e.preventDefault()
        await login(email, password)
    }

    const formStyle = {
        backgroundColor: '#e3f2fd',
        marginTop: '20px',
        padding: '20px',
        borderRadius: '10px'
    }

    const labelStyle = {
        fontSize: '1.2em',
    }

    return (
        <div className="container">
            <div className="row justify-content-center">
                 <div className="col-md-12" style={{ textAlign: "center" }}>
                    <h1 className="display-4" style={{ margin: "0 auto" }}>Login</h1>
                </div>
                <div className="col-md-6">
                    <form onSubmit={handleSubmit} className="row g-3" style={formStyle}>
                        <div className="col-md-12">
                            {error && <div className={error} class="alert alert-danger" role="alert">{error}</div>}
                            <label htmlFor="inputEmail4" className="form-label" style={labelStyle}>Email</label>
                            <input
                                type="email"
                                className="form-control"
                                id="inputEmail4"
                                onChange={(e)=>{setEmail(e.target.value)}}
                                value={email}
                            />
                        </div>
                    <div className="col-md-12">
                        <label htmlFor="inputPassword4" className="form-label" style={labelStyle}>Password</label>
                        <input
                            type="password"
                            className="form-control"
                            id="inputPassword4"
                            onChange={(e)=>{setPassword(e.target.value)}}
                            value={password}
                        />
                    </div>
                    <div className="col-12 d-flex justify-content-center">
                        <button type="submit" className="btn btn-primary text-center" disabled={isLoading} style={labelStyle}>Login</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

    )
}

export default Login