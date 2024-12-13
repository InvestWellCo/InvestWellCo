<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invest Well</title>
    <link rel="icon" href="https://github.com/InvestWellCo/InvestWellCo/blob/main/png.png?raw=true" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-image: url('https://i.postimg.cc/MHxCHvVN/cover-site.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: #048754;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #003a60;
            font-size: 28px;
            font-weight: bold;
        }
        .form-container input, .form-container select, .form-container textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #003a60;
            border-radius: 5px;
            font-size: 18px;
            box-sizing: border-box;
        }
.form-container button {
    width: 100%;
    padding: 12px;
    background-color: #003a60;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s;
}

.form-container button:disabled {
    background-color: #282827; /* اللون عند تعطيل الزر */
    cursor: not-allowed;
}

.form-container button:hover:not(:disabled) {
    background-color: #003a60; /* اللون عند الوقوف عليه */
}


        .logo {
            max-width: 150px;
            margin: 0 auto 20px auto;
            display: block;
        }
        .country-code {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .country-code select {
            width: 70%;
            border-radius: 5px;
            margin-right: 10px;
        }
        .country-code input[type="text"] {
            width: 30%;
            margin: 0;
            display: inline-block;
            text-align: center;
        }
        .phone-input {
            width: 100%;
            margin-top: 10px;
        }
        .inquiry-textarea {
            resize: none;
        }
        .language-toggle {
            position: absolute;
            top: 10px;
            left: 10px;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 18px;
        }
        .language-toggle img {
            width: 25px;
            height: 25px;
            margin-right: 5px;
        }
        #phone-error {
            color: #282827;
            display: none;
        }
    </style>
</head>
<body>
    <div class="language-toggle" onclick="toggleLanguage()">
        <img id="flag" src="https://flagcdn.com/w320/eg.png" alt="EG Flag">
        <span id="language-label">عربي</span>
    </div>

    <div class="form-container">
        <img src="https://github.com/InvestWellCo/InvestWellCo/blob/main/png.png?raw=true" alt="Company Logo" class="logo">
        <h2 id="form-title">Real Estate Inquiry</h2>
<form action="https://formspree.io/f/manyeqbn" method="POST" onsubmit="return validateForm()">
    <input type="text" id="name" name="name" placeholder="Name" required>
            <input type="email" id="email" name="email" placeholder="Email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" oninvalid="this.setCustomValidity('Invalid email format')" oninput="this.setCustomValidity('')">
            <span class="error-message" style="color: #282827; display: none;">Invalid email format</span>
            <div class="country-code">
                <select id="country" name="country" onchange="updatePhoneCode()" required>
                    <option value="EG" data-code="+20">🇪🇬</option>
                    <option value="SA" data-code="+966">🇸🇦</option>
                    <option value="AE" data-code="+971">🇦🇪</option>
                    <option value="KW" data-code="+965">🇰🇼</option>
                    <option value="QA" data-code="+974">🇶🇦</option>
                    <option value="OM" data-code="+968">🇴🇲</option>
                    <option value="BH" data-code="+973">🇧🇭</option>
                    <option value="JO" data-code="+962">🇯🇴</option>
                    <option value="LY" data-code="+218">🇱🇾</option>
                    <option value="DZ" data-code="+213">🇩🇿</option>
                    <option value="MA" data-code="+212">🇲🇦</option>
                    <option value="TN" data-code="+216">🇹🇳</option>
                    <option value="SY" data-code="+963">🇸🇾</option>
                    <option value="LB" data-code="+961">🇱🇧</option>
                    <option value="US" data-code="+1">🇺🇸</option>
                    <option value="GB" data-code="+44">🇬🇧</option>
                    <option value="DE" data-code="+49">🇩🇪</option>
                    <option value="FR" data-code="+33">🇫🇷</option>
                    <option value="IT" data-code="+39">🇮🇹</option>
                    <option value="ES" data-code="+34">🇪🇸</option>
                    <option value="CA" data-code="+1">🇨🇦</option>
                    <option value="AU" data-code="+61">🇦🇺</option>
                    <option value="OTHER" data-code="">🌍 بلد آخر</option>
                </select>
                <input type="text" id="country-code" name="country_code" value="+20" readonly>
            </div>
            <input type="tel" id="phone" name="phone" class="phone-input" placeholder="Phone Number" required pattern="[0-9]*" oninput="validatePhone()" onblur="validatePhone()">
            <span id="phone-error" style="color: #282827; display: none;">Invalid phone number format</span>

            <select id="contact-method" name="contact_method" required>
                <option value="default" disabled selected>Select Contact Method</option>
                <option value="phone">By Phone</option>
                <option value="whatsapp">By WhatsApp</option>
            </select>
            <textarea class="inquiry-textarea" id="inquiry" name="inquiry" placeholder="Your Inquiry" rows="4" required></textarea>
            <button type="submit" id="submit-btn" disabled>Submit</button>
        </form>
    </div>

    <script>
        let isEnglish = false;

        function toggleLanguage() {
            isEnglish = !isEnglish;
            const langElements = {
                "form-title": ["Real Estate Inquiry", "استفسار عقاري"],
                "name": ["Name", "الاسم"],
                "email": ["Email", "البريد الإلكتروني"],
                "phone": ["Phone Number", "رقم الهاتف"],
                "inquiry": ["Your Inquiry", "استفسارك"],
                "submit-btn": ["Submit", "إرسال"]
            };
for (let key in langElements) {
                if (key === "inquiry") {
                   document.getElementById(key).placeholder = isEnglish ? langElements[key][0] : langElements[key][1];
                } else {
                   document.getElementById(key).textContent = isEnglish ? langElements[key][0] : langElements[key][1];
               }
            }
            document.getElementById("form-title").textContent = isEnglish ? langElements["form-title"][0] : langElements["form-title"][1];
           document.getElementById("name").placeholder = isEnglish ? langElements["name"][0] : langElements["name"][1];
            document.getElementById("email").placeholder = isEnglish ? langElements["email"][0] : langElements["email"][1];
            document.getElementById("phone").placeholder = isEnglish ? langElements["phone"][0] : langElements["phone"][1];
            document.getElementById("inquiry").placeholder = isEnglish ? langElements["inquiry"][0] : langElements["inquiry"][1];
            document.getElementById("submit-btn").textContent = isEnglish ? langElements["submit-btn"][0] : langElements["submit-btn"][1];

                      document.getElementById("flag").src = isEnglish
                ? "https://flagcdn.com/w320/eg.png"
                : "https://flagcdn.com/w320/us.png";
            document.getElementById("language-label").innerText = isEnglish ? "عربي" : "English";

          const contactMethod = document.getElementById("contact-method");
           contactMethod.options[0].text = isEnglish ? "Select Contact Method" : "اختر طريقة التواصل";
            contactMethod.options[1].text = isEnglish ? "By Phone" : "بالهاتف";
            contactMethod.options[2].text = isEnglish ? "By WhatsApp" : "واتساب";

           const countrySelect = document.getElementById("country");
            countrySelect.options[countrySelect.options.length - 1].text = isEnglish ? "🌍 Other" : "🌍 بلد آخر"; 
        }

        function updatePhoneCode() {
            const countrySelect = document.getElementById('country');
            const countryCodeInput = document.getElementById('country-code');
            const selectedCode = countrySelect.options[countrySelect.selectedIndex].dataset.code;
           countryCodeInput.value = selectedCode;

          countryCodeInput.style.display = countrySelect.value === "OTHER" ? "none" : "inline-block";
       }

      window.onload = function() {
          updatePhoneCode();
          toggleLanguage();
            validateSubmitButton();
        };
  
////////////////
function validatePhone() {
    const phoneInput = document.getElementById("phone");
    const countrySelect = document.getElementById("country");
    const selectedCountry = countrySelect.value;
    const phoneValue = phoneInput.value;

    const phoneRules = {
    "EG": /^01[0-9]{9}$/,             // Egypt
    "SA": /^05[0-9]{8}$/,             // Saudi Arabia
    "AE": /^05[0-9]{8}$/,             // UAE
    "KW": /^5[0-9]{7}$/,              // Kuwait
    "QA": /^3[0-9]{7}$/,              // Qatar
    "OM": /^9[0-9]{7}$/,              // Oman
    "BH": /^3[0-9]{7}$/,              // Bahrain
    "JO": /^07[0-9]{8}$/,             // Jordan
    "LY": /^09[1-9][0-9]{7}$/,        // Libya
    "DZ": /^0[56][0-9]{8}$/,          // Algeria
    "MA": /^06[0-9]{8}$/,             // Morocco
    "TN": /^2[0-9]{7}$/,              // Tunisia
    "SY": /^09[1-9][0-9]{7}$/,        // Syria
    "LB": /^03|71[0-9]{6}$/,          // Lebanon
    "US": /^[2-9][0-9]{9}$/,          // United States
    "GB": /^07[0-9]{9}$/,             // United Kingdom
    "DE": /^01[5-7][0-9]{8}$/,        // Germany
    "FR": /^0[67][0-9]{8}$/,          // France
    "IT": /^3[0-9]{9}$/,              // Italy
    "ES": /^6[0-9]{8}$/,              // Spain
    "CA": /^[2-9][0-9]{9}$/,          // Canada
    "AU": /^04[0-9]{8}$/,             // Australia
    "OTHER": /^[0-9].+$/                    // Other countries (no specific format)
    };

    // التحقق من صحة الرقم دون عرض أي رسالة
    if (phoneRules[selectedCountry] && !phoneRules[selectedCountry].test(phoneValue)) {
        phoneInput.setCustomValidity("Invalid phone number format");
    } else {
        phoneInput.setCustomValidity("");
    }

    validateSubmitButton();
}

function validateSubmitButton() {
    const nameInput = document.getElementById("name");
    const emailInput = document.getElementById("email");
    const phoneInput = document.getElementById("phone");
    const contactMethod = document.getElementById("contact-method");
    const inquiryInput = document.getElementById("inquiry");
    const submitBtn = document.getElementById("submit-btn");

    // تحقق من ملء جميع الحقول المطلوبة
    if (
        nameInput.value &&
        emailInput.value &&
        phoneInput.value &&
        inquiryInput.value &&
        contactMethod.value !== "default"
    ) {
        submitBtn.disabled = false;
        submitBtn.style.backgroundColor = "#003a60"; // العودة للون الطبيعي
    } else {
        submitBtn.disabled = true;
        submitBtn.style.backgroundColor = "#282827"; // اللون عند التعطيل
    }
}
//////////////
const submitButton = document.getElementById("submit-btn");

submitButton.addEventListener("mouseover", () => {
    if (!submitButton.disabled) {
        submitButton.style.backgroundColor = "#012b46";
    }
});

submitButton.addEventListener("mouseout", () => {
    if (!submitButton.disabled) {
        submitButton.style.backgroundColor = "#003a60";
    }
});

// استدعاء الدالة عند أي تغيير في الحقول المطلوبة
document.getElementById("name").addEventListener("input", validateSubmitButton);
document.getElementById("email").addEventListener("input", validateSubmitButton);
document.getElementById("phone").addEventListener("input", validateSubmitButton);
document.getElementById("inquiry").addEventListener("input", validateSubmitButton);
document.getElementById("contact-method").addEventListener("change", validateSubmitButton);
window.onload = function() {
    updatePhoneCode();
    toggleLanguage();
    validateSubmitButton();
    
    const submitButton = document.getElementById("submit-btn");

    submitButton.addEventListener("mouseover", () => {
        if (!submitButton.disabled) {
            submitButton.style.backgroundColor = "#003a60";
        }
    });

    submitButton.addEventListener("mouseout", () => {
        if (!submitButton.disabled) {
            submitButton.style.backgroundColor = "#003a60";
        }
    });
};
///////////////
//window.onload = function() {
       //     if (window.location.href === "https://formspree.io/thanks") {
         //       window.location.href = "https://investwellco.github.io/InvestWellCo/thank-you.html";
        //    }
    //    };

    </script>
</body>
</html>
