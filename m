Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E138837A
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608565; cv=none; b=ptDxyfM1LVUN41p7ALHx9ZJ076Y/EDrag6fo+br708qBtsjIBtYdoTMzWj9Ujpl9NejEGHAX/aoFVk8KY7bpV6Nf/e2FKGFz09wEeCxhBTl2OFtNYlvSDApL9sCzRD6ynq7ofr0du9hFO5Auvb2cKWdDQ2e1gHCu7oPSJ/xguRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608565; c=relaxed/simple;
	bh=Fx8I98chejCgVIaPDpoTZOG6PQad1id268swqWnYKRA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pI3/bhlV17T/FnQ2aZf51RDplVgtoGnDDTyudTj4enUL2amlNvSD3Ps0isoWMQ0YZ01AQWf6QoSp6r82DPgpSVx9utgQkJPPZPjlsFpb3bilwzYbP2hlhi52TmScbpgLJ8Y3KMMr8MVCT7ngDF9r7DjFDwtCSF8qw3j3MXeLW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJmsKPRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ul+tqH67; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJmsKPRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ul+tqH67"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DvwRa2002034
	for <imx@lists.linux.dev>; Thu, 9 Jul 2026 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=; b=FJmsKPRYWJSKZ2cg
	r0nRuF2nXN0A8sapXCce2Yd8vnfwzxlt5yWFjrcu4Xk1i2pio7GMuhAY3pkUs5zI
	gc1pKui090o/rmxwA3jONAlV8tO9W59GuFg32i/BAZvFafi4SiJOROikNZf17Cs+
	Epw9vvX0cXKEPW1ITAPgJwzP8ASOvpS5LprdQVUHtV7KU34wpKCPd44wDerBO/jA
	qzaIsy9NHhoMPPUGJUX6YUaDbB4qw5iZ6sXPauupxMdbudzj87k1Ne6hc4KVyi7w
	tr6RaxU8TJ5ndw1XsNt8xzVf1boakbvTsZlUf1SQn6vdYK3w+xyWFYk3RZePGNfF
	dSU82Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3t7ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Jul 2026 14:49:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec91dc265so188774185a.2
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608561; x=1784213361; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=Ul+tqH67PTu+yoEoFaMNRVWFl7HGTbcmSrFjn5YlMa8zbf7GfVOvGfdPbXsiSqbR/P
         vQHCqO4imh/ZptlHTtSeRQoHM3EyPiZk4J7W3lWw339cQPm8uOxhUuOcmF48PmyeWYx7
         rwHiOMEWi8cIqe2Dh0K+guy2UlFCQQE0hVe66NCLpCBuzR7V/XiLRX2mR/0l/MKwXiUp
         q/D/pUD0+7yU1FW3BtfXCQV37R1E6DFQD+Z1E7wkB4RrjX1omarp6qY+zXeRgMSW2vCD
         3Qf05OlZGCLsvWvgWsG4Nj4dhqG5nyrjlLH6EjVR1T10gBS0463XXkgovijr0IiaFQDj
         LYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608561; x=1784213361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=iMELbUu7XGs+EzDKA8FU7B/oS59Tlvg5WSZbvPLSBi8pOdoUZFOomzlgtLcGDpJGMB
         Ma+vwVkBU2Zq7cVVzkF1VZGNOT2HpzhGLvhIwLD/m7M1J1XHSdt9njjoW4eBfQA3f8KY
         AO8qVHpkenNDHnblalnuS7ly365SmlWXgioJv9OTrUc7+qmMrnBm+/aACrXe83CV9V12
         cERYBVVwXF4qq73E8iVnQ0cckd6dsPLwop4s/dNYvqQTtAnCV6xfMpYw7jBtw7UyRBgt
         uYvYVDVTe6NpFMlaR9gZC8uPWXFH+GPYiEcNCycJU/tTaM3HLOCk908+PFXW5wYU1oex
         w2tw==
X-Forwarded-Encrypted: i=1; AHgh+RpNcnalHbeulG/7OAJhJ7LyW8obGDiN4ruiZpKgD8kRNhc0HqWTf1xlcQ8wEzBJTBUb7Dw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAOJvQmTQbAEQybFt48/l+481Wh1lbTz0AOl3lRpxbOhBCKQU2
	rJ082J/+76srP1d4eNGcdJVdPcmM0+gpX1ybraYBtmwUXzQQ4xjUThF5+jnK9um7JJBc0oUKH7S
	JksQ/UX4hbYgPDW8V6LDk8ulU1GrZBVgByBA++vAD2Gbd2qHWBdKcILo=
X-Gm-Gg: AfdE7cnoWWreqLiNd/pv3E9L8QdurPc3sAhpWW78kY3Hul/M94DwGeViNUQsviXuhl+
	n032GCHmGd13vJSgN1W7kdSJ2yWxnhrQxz0IjoRdpDtLSTl7NjQj1aOMjFHMOvmz2J2Jd0bt5I0
	Tu/talsNOc+HXgUz5+ABnNzRqkfeKurU1gcg8UcIP21Ar03IXhTlNTzhEB6PA958mYDl8EdxtUP
	fd2ZRLiG8xtwCdioi5ZuFzvsFymD0RyVBwbQTSAtHAHqt7vmVMiZdQJqwMu+tpPq07XUkFZUrH8
	cpkQAEYyLqj3uKfyQGFclvwMAFfrvOMH9Hu2L9ZkzDKrVhDAPsLFSloJoYyIoOfFhTQJgNHE9x5
	/GElZnyUpC7jRFdBZjBxVerGYvqahiLXUrqp0/HO9cAXp/1m+feyFt87zMO8sbC3R3DPXpOixgN
	kC8jFOnKJjPEYeRku6fQcOM2Z1PEWVXmClY1XDBfyfIuLmFL7q7OoY0GUthzlFuDVJ1AJw7e8wq
	vgYEw==
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79491971cf.21.1783608561377;
        Thu, 09 Jul 2026 07:49:21 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79491351cf.21.1783608560738;
        Thu, 09 Jul 2026 07:49:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm9342636a12.3.2026.07.09.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:49:19 -0700 (PDT)
Message-ID: <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:49:18 +0200
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
Cc: Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
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
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vTxJUpPo4GdryRZQUVcMgSGWGlNaXdDm
X-Proofpoint-GUID: vTxJUpPo4GdryRZQUVcMgSGWGlNaXdDm
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fb4f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=LBz1ya_SPPO7fqYsHhAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX83GnJqpvCnSh
 XoWfgeKVgM/63gbH2OQlpg4CsLwsPYD1BlXgvsRVk8PbpEW0sGOAZk94eT4E3Cb5s5/J99+YlMA
 Erni9BA4j3Lvqc3T407mzEt8Z9g6lpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX8I4pG2TtQ/HQ
 5QKMYWhow5jGN6PuImk396PosgMwptowUv+guE7kAYvIKqpmMBkxUWJVQiP+KsvornDZYRsoBmN
 URZOqI4m4mcu5hEWqxqpOYABf5VXGEKA+5I4A5vCtQCyt+wHpVG1QfwR/b2pLmC9U92d1woAAb3
 UAt0sp7j43mT8p5PeIJsEmFlp2scUxl7u26UjDi7dFZEkJD5AYX9a0wkh1IQfhDlSvEKK+Zs3+p
 Z8IzqL5GFdk6/noh84rTKlga9KwjC/3Kc1OuxoMwaXcNAh4XfFMHnxJB5sxu1opdEqLmuTaWC+u
 X2nvnUTC0mPyLPNd22r1RZO7MB9TDGfP/KyJ8GxChvqzTdrdQxNY8fZhQ7XjDEHOm2hwp0OL883
 6JFmhaZVt+SOFuzNr4GQT/JniCpX8tcbzUk9mMT9rwrSe6BG7J+Om0HMBWUoSfKRhs8g46w92F0
 yuCtWv4miRmNjtpKdkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090146

Hi,

On 9-Jul-26 16:37, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9-Jul-26 16:21, Sudeep Holla wrote:
> [...]
>>>
>>> I need to recall why we moved from static list of devices to dynamic.
>>> One reason I can think right now is the vendor protocols and their drivers
>>> But in general it was an attempt to help multiple drivers bind to different
>>> scmi_devices that have same protocol ID. E.g. the performance protocol
>>> can be used by cpufreq and devfreq/performance genpd drivers.
>>
>> Note it is ok to have multiple drivers bind to the same modalias,
>> depending on the reason why there are multiple drivers either one
>> should detect that it is not compatible and exit probe() with -ENODEV
>> or there should be some other mechanism to make sure only one driver
>> loads.
>>
>> E.g. duplicate USB device-ids happen (they shouldn't but they do) and
>> then the drivers typically figure out if they are talking to the device
>> which they were written for, or the other device with the same USB-ids
>> and then one of the 2 drivers exits with -ENODEV.
>>
> 
> Understood. Sorry I tried to explain with examples assuming you may not
> be aware of the details, but now reading your response, you have better
> examples.
> 
>>>> I wonder if we can just move a small part of the drivers
>>>> (some mapping table) into the bus code and then just have this work as it
>>>> does on regular busses. I hope to be able to make some time to look into
>>>> this soonish.
>>>>
>>>
>>> I started with that few years ago and we then moved to this dynamic
>>> device creation. But I agree if it is deviation from the norms(which I
>>> wasn't aware of at the time), we can remove it.
>>
>> Looking at the issue this is causing for automatic module loading if we
>> can get back to the bus enumeration code always creating a device without
>> waiting for the driver kmod to load then that would be good IMHO.
>>
> 
> Sure if it fixes the issue for you. Cristian can point out anything I
> might have missed to consider as he is the one who reworked it and made
> it dynamic device creation which at the time sounded nice option to
> solve the issue. We weren't aware that it could cause such issues 🙁.

Note that before patch 1/2 of this series we did not have working
module-autoloading for SCMI modules at all. With that said yes it would
be nice to get this working.

Can you provide a patch for this to try ?

Regards,

Hans


