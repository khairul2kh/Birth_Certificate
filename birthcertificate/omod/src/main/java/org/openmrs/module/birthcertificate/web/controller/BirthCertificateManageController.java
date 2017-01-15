/**
 * The contents of this file are subject to the OpenMRS Public License Version
 * 1.0 (the "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * Copyright (C) OpenMRS, LLC. All Rights Reserved.
 */
package org.openmrs.module.birthcertificate.web.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Map;
import javax.validation.Valid;
//import org.openmrs.module.birthcertificate.BirthCertificate;
import org.openmrs.module.birthcertificate.api.BirthCertificateService;
import org.openmrs.module.birthcertificate.model.BirthRegistration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * The main controller. 01772-057010
 */
@Controller
public class BirthCertificateManageController {

    protected final Log log = LogFactory.getLog(getClass());
    
    @RequestMapping(value = "/module/birthcertificate/home.htm", method = RequestMethod.GET)
    public String home(HttpServletRequest request, Model model) {
        
        User u = Context.getAuthenticatedUser();
        model.addAttribute("u", u);

        System.out.println(request.getRemoteAddr());
        return "module/birthcertificate/main/homepage";
    }

    @RequestMapping(value = "/module/birthcertificate/main.form", method = RequestMethod.GET)
    public String main(HttpServletRequest request, Model model) {
        List<User> user = Context.getUserService().getAllUsers();
        model.addAttribute("user", user);
        User u = Context.getAuthenticatedUser();
        model.addAttribute("u", u);

        System.out.println(request.getRemoteAddr());
        return "module/birthcertificate/main/mainpage";
    }

    @Autowired
    BirthCertificateService birthCertificateService;

    @RequestMapping(value = "/module/birthcertificate/main.form", method = RequestMethod.POST)
    public String addCerficate(@ModelAttribute("birthRegistration") @Valid BirthRegistration birthRegistration, BindingResult result) {
        User u = Context.getAuthenticatedUser();
        birthRegistration.setCreator(u);
        birthRegistration.setCreatedDate(new Date());
        birthCertificateService.addbirthCertificate(birthRegistration);
        return "redirect:/module/birthcertificate/birthView.htm?id=" + birthRegistration.getId();
    }

    @RequestMapping(value = "/module/birthcertificate/birthView.htm", method = RequestMethod.GET)
    public String listCertificate(Map<String, Object> map,
            @RequestParam(value = "id", required = false) Integer id) {
        
        map.put("birthRegistration", birthCertificateService.getBirthRegById(id));
        return "module/birthcertificate/main/printBirthCertificate";

    }

    @RequestMapping(value = "/module/birthcertificate/edit.form", method = RequestMethod.GET)
    public String editCertificate(
            @RequestParam(value = "id") int id, Model m) {
       BirthRegistration birthRegistration = birthCertificateService.getBirthRegById(id);
        m.addAttribute("birthRegistration", birthRegistration);
        m.addAttribute("id", id);
      
        return "module/birthcertificate/main/updateBirthCertificate";
    }

    @RequestMapping(value = "/module/birthcertificate/update.form", method = RequestMethod.POST)
    public String updateCerficate(@ModelAttribute(value = "birthRegistration") @Valid BirthRegistration birthRegistration, BindingResult result) {
        birthCertificateService.updatebirthCertificate(birthRegistration);
        
        return "module/birthcertificate/main/printBirthCertificate";
    }

    @RequestMapping(value = "/module/birthcertificate/remove", method = RequestMethod.GET)
    public String removeCertificate(@RequestParam(value = "id") int id) {
        BirthRegistration birthRegistration = birthCertificateService.getBirthRegById(id);
        birthCertificateService.removebirthCertificate(birthRegistration);
        return "module/birthcertificate/main/mainpage";

    }
     
}
