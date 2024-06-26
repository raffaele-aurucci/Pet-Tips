import {createContext, useReducer, useEffect, useState} from "react";

export const AuthContext = createContext()

export const authReducer = (state, action) => {
    switch (action.type) {
        case 'LOGIN':
            return { user: action.payload}
        case 'LOGOUT':
            return { user: null}
        case 'UPDATE':
            let user = state.user
            user.user = action.payload
            return { user }
        default:
            return state
    }
}
export const AuthContextProvider = ({children}) => {
    const [state, dispatch] = useReducer(authReducer, {
        user: null
    })

    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const user = JSON.parse(localStorage.getItem('user'))

        console.log(user)

        if (user){
            dispatch({type: 'LOGIN', payload: user})
        }

        setLoading(false);

    }, [])

    console.log('AuthContext state: ', state)

    return (
        <AuthContext.Provider value={{...state, dispatch, loading}}>
            {children}
        </AuthContext.Provider>
    )
}
