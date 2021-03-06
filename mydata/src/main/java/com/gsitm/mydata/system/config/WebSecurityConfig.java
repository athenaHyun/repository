package com.gsitm.mydata.system.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.kakaocert.api.KakaocertService;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource);
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
        
        
        auth.inMemoryAuthentication()
        .withUser("user")
        .password("{noop}pass")
        .roles("USER");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/oauth/2.0/authorize", "/oauth/2.0/token").permitAll()
                // ----------- Springfox Swagger ?????? ?????? ?????? ?????? ------------------
                .antMatchers("/v2/api-docs/**").permitAll()
                .antMatchers("/swagger-ui/**").permitAll()
                .antMatchers("/swagger-resources/**").permitAll()
                // ----------------------------------------------------------------
                .antMatchers("/api*").permitAll()
                .antMatchers("/api*/**").permitAll()
                .antMatchers("/oauth*/**").permitAll()
                .antMatchers("/v1/insu/apis").permitAll()
                
                .antMatchers("/consentStep*").permitAll()
                
                // 2020.03.15 API URI ??????
                .antMatchers("/insuBasic*").permitAll()
                .antMatchers("/irp*").permitAll()		// ????????? IRP
                .antMatchers("/irp*/*").permitAll()		// ????????? IRP
                .antMatchers("/loans*").permitAll()		// ??????
                .antMatchers("/loans*/*").permitAll()	// ??????
                
                // 2020.03.15 ????????? ?????? ?????? URI ??????
                .antMatchers("/cusInform*").permitAll()
                .antMatchers("/requestVerifyAuth*").permitAll()
                .antMatchers("/getVerifyAuthState*").permitAll()
                .antMatchers("/verifyAuth*").permitAll()
                .antMatchers("/exception*").permitAll()
//                .antMatchers("/member/detail*").permitAll()
//                .antMatchers("/member/delete*").permitAll()
//                .antMatchers("/memberAddPop*").permitAll()
//                .antMatchers("/member/add*").permitAll()
//                .antMatchers("/member/chkId*").permitAll()
                .antMatchers("/member*/*").permitAll()
                
                
                // 2020.03.25 ???????????? URI ??????
                .antMatchers("/assetMngView*/*").permitAll()
                
                .anyRequest().authenticated()
                .and()
                .exceptionHandling()
                .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
    }
    
    @Override
    public void configure(WebSecurity web) throws Exception
    {
        // static ??????????????? ?????? ?????? ????????? ?????? ?????? ( = ???????????? )
    	web.ignoring().antMatchers("/common/**", "/css/**");
    }
}