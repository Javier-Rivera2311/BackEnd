/* The code is creating a router object using the `Router` class from the `express` module. It then
defines two routes: */
import { Router } from 'express';

import { getUsuarios, setUsuario, changePassword, login,updateUser, getUserData, createRoutine, getRoutines, getRoutineExercises, addExerciseToRoutine,getUserId} from '../controllers/user.js';

const router = Router();

router.route('/ingresar')
    .post(setUsuario);

router.route('/mostrar')
    .get(getUsuarios);

router.route('/login')
    .post(login);

router.route('/changePassword')
    .post(changePassword);

router.route('/updateUser')
    .post(updateUser);

router.route('/getUserData')
    .get(getUserData);

router.route('/createRoutine')
    .post(createRoutine);

    router.route('/getRoutines')
    .get(getRoutines);

router.route('/getRoutineExercises')
    .get(getRoutineExercises);

router.route('/addExerciseToRoutine')
    .post(addExerciseToRoutine);

router.route('/getUserId')
    .post(getUserId);

export default router;






