/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.birthcertificate.web.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.openmrs.module.birthcertificate.api.BirthCertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
/**
 *
 * @author Manjarul
 */
@Controller
public class Ajax {
    
    @Autowired
    BirthCertificateService birthCertificateService;
    @RequestMapping(value = "/module/birthcertificate/serarchPatient.htm", method = RequestMethod.GET)
    public String serPat(HttpServletRequest request, 
            @RequestParam(value="serachKey", required = false) String searchKey, Model model) {
        
       //List<BirthRegistration> data=birthCertificateService
        System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP  "+searchKey);
         String hql = null;
        hql = "from BirthRegistration data where data.registrationNo LIKE '%"
                + searchKey
                + "%' "

                + "OR data.name LIKE '%" + searchKey + "%')";
                      
         model.addAttribute("data","data");
         return "module/birthcertificate/ajax/searchData";
    }
    
}
