package com.jobConnect.utility;



public class SecurityConfig {

//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//            .authorizeHttpRequests(authorize -> authorize
//                .requestMatchers("/").permitAll() // Allow everyone to access the home page
//                .requestMatchers("/admin/**").hasRole("ADMIN") // Only ADMIN can access /admin/**
//                .requestMatchers("/candidate/**").hasRole("CANDIDATE") // Only CANDIDATE can access /candidate/**
//                .requestMatchers("/recruiter/**").hasRole("RECRUITER") // Only RECRUITER can access /recruiter/**
//                .anyRequest().authenticated() // Any other request requires authentication
//            )
//            .formLogin(form -> form
//                .loginPage("/") // Specify the login page
//                .defaultSuccessUrl("/default") // Define where users are redirected after successful login
//                .permitAll()
//            )
//            .logout(logout -> logout
//                .logoutUrl("/logout")
//                .logoutSuccessUrl("/") // Redirect to home page after logout
//                .invalidateHttpSession(true)
//                .clearAuthentication(true)
//                .permitAll()
//            );
//
//        return http.build();
//    }
}