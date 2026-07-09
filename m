Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4378345CA8
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606044; cv=none; b=gOMwemErHs7QeawEr6Qgry4U8zvJo9SdyKM8CQiQ5vLNXvCSDpWjKObe/16mk/ZRIXS96evclGO1/Pc4nJiRGuSouwXuRLGmB42Hnyte2rWrZnTFSPZZaG02QXZqtA9tswZ9D5JvYb2HprUknqa/WInCIaqI8WY6bgOpUxoZiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606044; c=relaxed/simple;
	bh=/bYHC6ljg2WQE3J+hhPWQjPMOcrXeK0n87YNg5RX++E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jBFrEPI/YxUxLZmks2iJMeY4hroSkVhI2c5oRLhWiBxgOLeikEZNXKAyIRDtfDsieJdkBr1h+YjlGn5WmsNtbqtJCTodh4rSrc4SWar2/BLadJ86UObJj5JzBfo+cDEQb5xNxTopGLn+fTReFXRxewbxi1+HkTn/0kjXCaQcfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9VjSNvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlZCHejH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9VjSNvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlZCHejH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw5DF1970748
	for <imx@lists.linux.dev>; Thu, 9 Jul 2026 14:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=; b=R9VjSNvCHGYmCikI
	POz42573KX+Iw8RgVFzKweFwM4uIUVDrleq2QM4u4N63wFSC6y4eafKE9g+j6oJa
	wexGDy5oP/PmZX42bkzmF/XrlxpSS6BX7oIEQZGzCw7j6s4+GtJc0iA1pbPshNHH
	cf5CkhjCw1KEKiXHeOGvqq8Aj1T1lvSY5wZ/8MunyUee7rcn8OuxeqGMjBHWuwtU
	C/DUKHRVGdTyUAlWCTSh1TThGgE0dx7ILNfY7enxMbLzoJiknXW7dZ72gHeDUbrd
	9D7nHt+t+WqUrbC1OrumUCyLK+4XIsL3yVhUniz4wDq5znTasz4NYtkq9CNCHNSO
	VEq2oA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg48j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Jul 2026 14:07:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef18406878so12550296d6.2
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606041; x=1784210841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=GlZCHejH4CICKG3nWS9QirKmv4LbGSCk4iKLmBAU8J9sXGzp+tH9aovgbZlqMIgHRg
         E/ndjjepYa4qCwzqhgkdtsxynjHjfZoWLtXMdy3+vpl2ZuKHbLplRYgIO2G9NaFr6x4F
         Ts2OvDd3Rh5qzyohJVfFQrTpKZHBd86DLrq8+9V45qmAxd48zER2SxXhDGLnPOzpwRKs
         AzrJ86voLTOgVU2lvMPwedtT84/bElMDOoOrTSvIVCQDff0qxPWM6K/s4/ywRefjoCmj
         sG9RQltlYQ99cs/uQ08X5cLgCumcAjcYG1Hs4zNTVjQpqbF1El30UoyL1u6tyTLMPePn
         h4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606041; x=1784210841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=H8sF3hzU5MJhraPcvf6FNnbqzgnaj2kU/t/cVEokla5bHHcIB5c5jiFQVtLkh57ZK3
         8UnfbYZ4945K9NuJSWsY6bC5jQ35x60NYIe9rX19kM8SA6wBArj22kinZ1/AJthn7oB8
         jhT6brrsXyLbTNcQN8utcHatiMDVpXrKfwVkTj+84s92RJsqUh63lQt4knMLWiU8/6iv
         VItDdo9MILQSDq06E+rRQ8DDYVgVPO2MPKNE8e4Q8UdY5GZ69vpZ+jkXz2yJrhdRL1VF
         Y3loX5CtMwWzxHX7B9iQEMIO19y2fTLBrQa3ph5lfJoizq2run3M6S7+lqkiTxTtxONu
         2Bnw==
X-Forwarded-Encrypted: i=1; AHgh+Rru5CFWiKlNNreOofha1FdXuj5RG6TJT4fCyWIDGj+oU0GiS3KzP31j/i9O8vuQ24CubY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdz3/VUgws6DaGXFlHjQ6hSfxX8durlOqM7E4Uzurwc+e8BOF6
	n6Ymc+FvnYRTdyp9S30DH/ZympjY92i0capbOP8ZEuMxQCJplmCRfkIq1nBg56YVubBLxSSKHkV
	TbKWgthBLyck0l9xZCkU1mTN6b48Cg+yK9/wvYNCu2I0r/5Ee7w0sy24=
X-Gm-Gg: AfdE7cn6gnAtEY6BvWHlJy4G64mwrHfgj3yySM27s4H+U/Q43fTdfFdrFFT3DOxyw/o
	vZR+4Q5igegm1oeCVnFWzo7b49AJDcpa1UqIR4jSIDr03+8SVLwDHcQ9wn0DWwn5H4SVYZZSTFR
	SMqyrfZw95sNi6qPdBXpLdH5DhlppZIC5sqj5VC4kY3crqUl2oLm7O+PsuuNc63c6vpRO43m6hP
	Hs+w7nR6XQfyS12vsRAQ/ETRmmXRqDeiUT7DaY6RkM8TuWMPYnWGrvzhGBxtyK6cporZwmDuNGs
	as9zbBfCR1Kyo0VU3NeMZtewX0PZ+0oOuWAuC3sov3UAN7d9DB3CM1VDKtsGNP8FklfcLjsK2jP
	nELSdLaLWmdwXtszYe3GxhreC7ZhEoj8fwc1e4M3KGmcMaaBmmCMm7D6PxHjim370TBiNE0c+q9
	mQsY1Si5baGMiRk1X9RCu0zHWfJ+fMSy0+BiS42DW2EosL4XxxL0B5SnBygvtTa8VHYBY+P0as7
	k4Mag==
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76152651cf.47.1783606040469;
        Thu, 09 Jul 2026 07:07:20 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151081cf.47.1783606039359;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm301861766b.49.2026.07.09.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Message-ID: <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:07:17 +0200
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
To: Brian Masney <bmasney@redhat.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
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
Content-Language: en-US, nl
In-Reply-To: <ak-h8oPcL69fCUg2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfXz0pNFOM+mxJk
 PixHnad03+6qMPyamddJ4Nfif8aVkfHcARrL26TlCzaHnWdpUFJTQ+hNA72GrfRhdtybMwxeyuP
 uDm4GhduW7ngCH8PTwMLrEWsGeOi7ha8dBJvkQxFibTe+dcXZrAi493ZHr8Ya4gOsyAg9gswjNR
 Cm4uIm9Ojib4S9/la6Ie5PttHWjFV2VC6uuMCLEbCXgPWhaPKem2lF4wnxedDbdB4TjQt+smDSm
 YWI/6CQRlwxd1+yng3Jiph35MS373MJtFqIIQmKm9aXFUo3ixB5LWFK6k17i1ECX/Rk2+aJDMac
 RlgCtmHu/gFzea2unf8CCx8XA0tDOT+gQGIVrcXCh8pS7BYrR6eKDKXcki0ioQZP40rgizS0dH1
 wa1eW2koj6LLTmTmJKpcuLju+6sLmYF3pxOQbQs0BegS4l2Wh2vbFLsWxWEKEtoQ9hR1Qn0XNwn
 GYZj+hErfe6ukna9bWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX5VxwncbEB//y
 3UzyzqRshRAfLXkf2nkIl6T69+N44QZY4+gTCKD8r1NKGySy/PSs88zJMRq4I72wNAGntda3F0A
 lzYljnO2sTHCP9CFvmv44U6kG/UU7Js=
X-Proofpoint-GUID: gepIUzin7yUJfD7GTC8_3eOQtbV4vaqJ
X-Proofpoint-ORIG-GUID: gepIUzin7yUJfD7GTC8_3eOQtbV4vaqJ
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fab19 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=F1v2bmbY3Q6w0W2l7n4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090137

Hi Brian,

On 9-Jul-26 15:28, Brian Masney wrote:
> Hi Hans,
> 
> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>> device table alias support to make modpost consume the information from
>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>> this information, if known. Also add a protocol-based alias to also
>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>
>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>
>>>> The problem with Fedora's kernel-config / setup is that the
>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>
>>>> It does work if I explictly add the scmi_cpufreq module to
>>>> the initramfs, then it does get autoloaded.
>>>>
>>>> We really need some place to put a uevent sysfs attr which then
>>>> gets replayed when udev is restarted from the rootfs and then
>>>> re-reads all the uevent files as part of its coldplug
>>>> enumeration.
>>>>
>>>
>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>> But isn't this a generic requirement ? I mean you could have modules
>>> install on the rootfs and not all of them are packed in initramfs ?
>>> Just wondering if that works for other modules, we can examine how
>>> do they work and what are we missing ?
>>
>> scmi is special because the actual devices under /sys/bus/scmi/devices
>> only get created when the module with the driver is loaded because
>> of some funtion/id mapping requiring info from the driver.
>>
>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>> the scmi protocol which is known at bus enumeration time, but this only
>> works if the actual scmi driver is in the initramfs because this done
>> through directly calling modprobe() from the kernel which does not
>> get "replayed" when switching to the real rootfs.
> 
> Should the SCMI drivers be added to the dracut module here?
> 
> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
> 
> A few years ago we had to add the interconnect drivers to the list for
> Fedora.

That would be one solution. I first want to understand the problem better
though. The scmi bus not creating the devices until the kmod with the driver
has loaded is weird. I wonder if we can just move a small part of the drivers
(some mapping table) into the bus code and then just have this work as it
does on regular busses. I hope to be able to make some time to look into
this soonish.

Regards,

Hans

