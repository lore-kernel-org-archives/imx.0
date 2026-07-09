Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3A27E1DC
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603355; cv=none; b=DCLQ29rQRaLod5w6r4yfdmhavrEbLJfd4gfDl3ZhBvPqz4fFnsFOLm3At2JQAvXDDUqD+JkToHmeCZOsYb76hliM4HWQrve6igDH3T01WyEdQTEKhSxVg+WWKxR7x1aQWNc8Y0r8gyMpxZJqMr276L+l7FyoZC374Gp+TNorZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603355; c=relaxed/simple;
	bh=HC/c+F4jWg20zvROZJFbcu4k56/NIbt+aeplVr2m0sE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DfInnlO375MKP4WmJg+R/HAlVUXbTFGhOrmepp9nlTh1Y4mvZf8xAvZgDOKpS5U561EAXNFktzeIG0Sx35FSp/9L/OA7duXNrn+10mtB8O04JB0Djc8HceRuU5OtswZz4fXXJsWXWrEXUbPJP6sv1N/1S54VQULtAZY4tKR7FQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZXyUgE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Se0InJdR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZXyUgE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Se0InJdR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNL5N1575603
	for <imx@lists.linux.dev>; Thu, 9 Jul 2026 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=; b=HZXyUgE1qC2tTxRp
	aKFjpzhADqnvoEYITa97oc8yIkKnR+u1JIv4X7kGA/xylW8TlrprK1/2n8gdizjn
	SqH6jPS1A9ReZFi16fvqt33+8ne6u2f/p2fdCB2rCf69CfO4WPiN4AFhWCw4SMEy
	cJsCeKJSH821riMGaTH/p4VLM5HXOpFQ+eVb/sjejyChlxAvmpk4sdu12Vcc6dvF
	gFvgbcnYNwDO6PfzaVWqKHj723a2NHziHTrsWt4uyDE20o2iHI2zRSAgeKtsWPNa
	kcQpyQq1kwEn2+gkIMVOtBitJZjAkvamN9Jg/p3DsQwSblzKleKve345xTfFeE2B
	2sGVjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcd38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Jul 2026 13:22:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1ada6c43so14015651cf.3
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603352; x=1784208152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=Se0InJdRD4r/O/t0v4ahOxiC0SX8/bB7ijdMuLkrW8/NB0zE/GKGav5+jIqAsA5kuI
         Z05Cn6Qco2Zix2TtZl5WeEBVvmhTAHqHR8m8T8sBD29Ovpy090R9IUGFpARe0kJfqoNv
         F3AqP+5/HsZr50+D9RjJNlBG04utJcKbIEi/An/JWbkiOANeVqa+OTngQUasWAfLbcQO
         2m/xJazEUSvUCEQsW7xYykNaX5onfXv5+tUK/HJ2caZbbAns1CTWcQ3ie3hkqWcpEjbu
         ahSp7tgyyQ/vXW0AgU4YDnJCHJwXes2qCatqESugpmD8qn6/ZHl4ddf/0eOwCvnfbNLG
         0LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603352; x=1784208152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=jxad2G9aTvWjTRVcLsEjMdzpHGJuXpiD6Ah/eO/wrD9seXsfLEuvZx8mUFWcpNOeEZ
         6T0YUjgH8+QcnjhgwaEoDfZmSaBUKG27bPk28dQk9bcuLka1OQMrtnB1X3LbXs5p/opF
         nkHMozrpU9nOYJ1eVEOGIen7NE5WqwL6inau+k5uRfOcUyvxhHtJenBaXa1AecISi7Ck
         vXg6JbD3PgQKo4Zujry0ccswaXTNFGQZ+/ocM1LigBSnFP90AMq3OmCG5ULJoYyd492f
         DYuRdsRSFHtCfAjscExTvrH5RPAn4X/ECZxKrDQDMx/yjceNZToY/uccYOCC3oNsaw8z
         57SA==
X-Forwarded-Encrypted: i=1; AHgh+RqpbtxfzElftNrOfa0M7laxBSjmI0hk0gYzF8Zhiow6K0qk1WAlcJWJbRDCbEiYkCnC5mM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yygf4H7X6rLhpw5R5jRghJRxdlR9C2WTIwNJ2RL8HmJjGfxpz+9
	+7W4cFid7TEMvFT8w+ykoEifBv38fPGVJ9LfsIj/BiRHP3RDrH7PEvW5iOyj29NOKxzmIcsN4M8
	luvLimsmT91VcValpLSv9gL7Thf6vl5HrkZh5JJmcnYWDK0guEPTNVVo=
X-Gm-Gg: AfdE7clrorbXowgFHWM7AfzRu9GQktQ4GBNqwYBnmy6JdawiHB/z6ywgYxid+LwsGPT
	jV5DDpTKONO4Vplh8aU1zblbcDWU+ivIEo8QMeosESBgfleIXFxe5m/EOzapTYDkZVQWUhHj9mC
	9+14lLxXySZopA/2/xdo8iPBZK5FkdGxJ7S9lD3fhBtsTEjCs3glvvL29vj9dwru8lX+gJfBr4T
	PiGXQC5OexorpuOhjENsxTSAgs9zEAER5CUXDebJvp2+LEdPF1qMHsuXYVTSVoRws0GbpMCoYTG
	/55perVVxVq5cyYEMXQbxcxbsgIPUCI6hYI+LXaw1+npy5Pe2OmpFuKJKsN3lRM74td4MJ3o3RQ
	Ix0c4uz34IR6LTw7e0NdNzRHpzX6UQjWZPE0xaSpQeS5fnh/uqyjlppZWodIqvakoWI1CLD8a1a
	6ct1GlSd2AR2WzWddqZutaZ9hw+pNJlb9k9ktQ3u3Sj/Xf+M/D8R5UIaP/6/wnE1xlasvTTV8CO
	r3psg==
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78889481cf.69.1783603351884;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78888871cf.69.1783603351343;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm388139066b.29.2026.07.09.06.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:22:30 -0700 (PDT)
Message-ID: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:22:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX1JbZe+ZS4fDa
 D7c2MDMi1/zZOdVQBN3nzmsy+J80UqGi5m5xn3Irx0AuxUTPlkhR1Woi8QIF8HyxIf9g8CWmyhb
 4rGYayDZNGRhSJtLObyFLVJprn38iL8yrBrGfpbRIA/8gp9bZzXrnoBalN9Sqa+RnGaU0asDGPT
 tYfWn4S3txXsqA/Uef13u1yV6LpwZ8p9SHaqhnuP5FmRT0k/xsixJVUGtiLweR7iBuV/WkTBZuS
 9ayCdG4jLdrYHAVdiWVcgBWmd4djrG7nCrg+q97UuGkpeoTuyyqAgey9HfbKWJlujMnTDnDQ8HO
 IUobsNUawAMvECIsb9GjjZQ16DWcI2YImmJkkB/NkugULQ8KfFyAlwizjZXqscSB+xkInr5aA5l
 QXjP9okpDJqJdSH6bV0URxPeGMsmx7Rm6aeF9oVRueOLwE/YvENrXublvkaqf58aMTgBioO7C5V
 62Zz96kqzUBLsfx7ETw==
X-Proofpoint-GUID: ovZtwAlg90FXNRoLrbLk8tXqGcZZn-u0
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa098 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fQniT2RDnAzmI7G1ES4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ovZtwAlg90FXNRoLrbLk8tXqGcZZn-u0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX6o1ixrW+lLmB
 MUfopFBGv9g9z6rLDH4ptZDjaSeVl22cJOF2JEStn2y8QRC+vATuleF6S/dzlJ8m1EJ79N2+vsD
 TpBMs2r5twG8NF1VgLa4aGxMCrmjKl8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130

Hi,

On 9-Jul-26 12:10, Sudeep Holla wrote:
> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>> modules, but they are then not automatically loaded. Rework the SCMI
>>> device table alias support to make modpost consume the information from
>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>> this information, if known. Also add a protocol-based alias to also
>>> trigger driver loading when only the SCMI protocol id is known.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> So I just gave this a test spin and unfortunately it does not work.
>>
>> The problem with Fedora's kernel-config / setup is that the
>> request_module() from patch 2/2 runs from the initramfs, but
>> the scmi_cpufreq module is only available in the rootfs.
>>
>> It does work if I explictly add the scmi_cpufreq module to
>> the initramfs, then it does get autoloaded.
>>
>> We really need some place to put a uevent sysfs attr which then
>> gets replayed when udev is restarted from the rootfs and then
>> re-reads all the uevent files as part of its coldplug
>> enumeration.
>>
> 
> I don't have much knowledge on uevent to provide any suggestions/help.
> But isn't this a generic requirement ? I mean you could have modules
> install on the rootfs and not all of them are packed in initramfs ?
> Just wondering if that works for other modules, we can examine how
> do they work and what are we missing ?

scmi is special because the actual devices under /sys/bus/scmi/devices
only get created when the module with the driver is loaded because
of some funtion/id mapping requiring info from the driver.

Patch 2/2 tries to work around this by loading all scmi drivers matching
the scmi protocol which is known at bus enumeration time, but this only
works if the actual scmi driver is in the initramfs because this done
through directly calling modprobe() from the kernel which does not
get "replayed" when switching to the real rootfs.

And no /sys/bus/scmi/devices/xxx device means no
/sys/bus/scmi/devices/xxx/modalias nor /sys/bus/scmi/devices/xxx/uevent
which udev uses for coldplug (hotplug event replay) when switching to
the real root.

The cleanest way to fix this from a how things are supposed to work
according to the generic kernel device-model design is to get rid of
the creation of the devices being delayed. Which may mean moving some
static mapping tables from the driver into the scmi core. I'm not
familiar enough with the scmi bus code to be sure.

Regards,

Hans


> 


