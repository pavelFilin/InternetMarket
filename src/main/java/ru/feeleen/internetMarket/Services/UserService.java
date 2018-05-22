package ru.feeleen.internetMarket.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return userRepository.findByEmail(s);
    }

    public boolean changeFirstName(User user, String firstName) {
        User UserDTO = userRepository.findByEmail(user.getEmail());
        if (firstName!=null && !firstName.isEmpty() && firstName!=UserDTO.getFirstName()){
            user.setFirstName(firstName);
            userRepository.save(user);
            return true;
        }
        else {
            return false;
        }
    }

    public boolean changeSecondName(User user, String secondName) {
        User UserDTO = userRepository.findByEmail(user.getEmail());
        if (secondName!=null && !secondName.isEmpty() && secondName!=UserDTO.getSecondName()){
            user.setSecondName(secondName);
            userRepository.save(user);
            return true;
        }
        else {
            return false;
        }
    }

}
