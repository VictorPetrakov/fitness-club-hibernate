package com.victorp.web.servlet;

import com.victorp.model.Client;
import com.victorp.model.User;
import com.victorp.model.Workout;
import com.victorp.model.WorkoutPersonal;
import com.victorp.services.CreateWorkoutService;
import com.victorp.services.impl.CreateWorkoutServiceImpl;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateWorkoutPersonal", urlPatterns = "/createWorkoutPersonal")
public class CreateWorkoutPersonalServlet extends HttpServlet {

    public static final String LOGIN_PARAM = "loginClient";
    public static final String NAME_WORKOUT = "nameGroup";
    private static final String DATE_TIME = "time";

    private final CreateWorkoutService createWorkoutService = CreateWorkoutServiceImpl.getInstance();

    final WorkoutPersonal workoutPersonal = new WorkoutPersonal();
    final Workout workout = new Workout();
    final Client client = new Client();
    final User user = new User();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        final String loginClient = req.getParameter(LOGIN_PARAM);
        final String nameWorkout = req.getParameter(NAME_WORKOUT);
        final String trainingTime = req.getParameter(DATE_TIME);

        Workout foundWorkout;
        Client foundClient;
        User foundUser;
        try {
            workoutPersonal.setClient(createWorkoutService.getByLogin(loginClient));
            workoutPersonal.setWorkout(createWorkoutService.getByName(nameWorkout));
            workoutPersonal.setTrainingTime(trainingTime);

            foundWorkout = createWorkoutService.getByName(nameWorkout);
            workout.setTrainer(foundWorkout.getTrainer());
            workout.setNameWorkout(foundWorkout.getNameWorkout());
            workout.setWorkoutPersonalList(foundWorkout.getWorkoutPersonalList());
            workout.setId(foundWorkout.getId());
            workout.addWorkoutPersonal(workoutPersonal);

            foundClient = createWorkoutService.getByLogin(loginClient);
            client.setId(foundClient.getId());
            client.setLogin(foundClient.getLogin());
            client.setClientIdentifier(foundClient.getClientIdentifier());
            client.setUser(foundClient.getUser());
            client.setWorkoutPersonal(workoutPersonal);
            client.setNameGroup(nameWorkout);

            foundUser = createWorkoutService.getUserByLogin(loginClient);
            user.setId(foundUser.getId());
            user.setLogin(foundUser.getLogin());
            user.setPassword(foundUser.getPassword());
            user.setFirstName(foundUser.getFirstName());
            user.setLastName(foundUser.getLastName());
            user.setEmail(foundUser.getEmail());
            user.setBirthdate(foundUser.getBirthdate());
            user.setGroup(nameWorkout);
            user.setClient(foundUser.getClient());
            user.setUserRole(foundUser.getUserRole());

        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            createWorkoutService.createWorkoutPersonal(workoutPersonal, workout, client, user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.setContentType("text/html;charset=UTF-8");
        final RequestDispatcher dispatcher = req.getRequestDispatcher("trainerPage.jsp");
        dispatcher.include(req, resp);


    }
}
