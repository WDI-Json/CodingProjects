import { useForm } from 'react-hook-form'
import { yupResolver } from '@hookform/resolvers/yup'
import * as yup from 'yup'
import styles from "../App.module.css";

export const Form = () => {
    const schema = yup.object().shape({
        fullName: yup.string().required("Your Full Name is Required"),
        email: yup.string().email().required("A valid email is required"),
        age: yup.number().positive().integer().required(),
        password: yup.string().min(4).max(20).required(),
        confirmPassword: yup.string()
            .oneOf([yup.ref("password"), null], "Passwords don't match!")
            .required()
    })
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm({
        resolver: yupResolver(schema),
    })

    const onSubmit = (data) => {
        console.log(data)
    }
    return (
        <form onSubmit={handleSubmit(onSubmit)}>
            <input type="text" placeholder="Full name" {...register("fullName")} />
            <p className={styles.error}>{errors.fullName?.message}</p>
            <input type="text" placeholder="Email" {...register("email")} />
            <p className={styles.error}>{errors?.email?.message}</p>
            <input type="number" placeholder="Age" {...register("age")} />
            <p className={styles.error}>{errors?.age?.message}</p>
            <input type="password" placeholder="Password" {...register("password")} />
            <p className={styles.error}>{errors?.password?.message}</p>
            <input type="password" placeholder="Confirm Password" {...register("confirmPassword")} />
            <p className={styles.error}>{errors?.confirmPassword?.message}</p>
            <input type="submit" />
        </form>
    )
}