Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399F33BBA7
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607467; cv=none; b=P8zJQrKX95hdX9Xfc0utqGjF8Rquh5t11nrs8oVRBg3pKxKCaajeOGqvxahmNNXVem0H+yONocdtAxXmDYmlMG+gXe79ZEtlzBnjSESt6vMPJtgPk0vf4wdMW+q3ntuMtaTGIu1xLN/ZUSsAa53JthPdkYBKVxnYGQ2prCf6IDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607467; c=relaxed/simple;
	bh=i9/EKS5uKSvES1Tz51c9OT6jblP9O4HysVJ1cI/QaN0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PEilV0OIDDNTU8PHAuoq1RpZMMfxFNDznGck02EfeBGse/TWkK0O4ZAeSFP+PVsXwtHmm45xzleH6KIg0TFumb39vgR2tjKNnEqRQtSBpVlox0TYS+OQVS2CCujF2X1gACEOywq5KCFPNrdyldG/fzO5ezSaP6pSr7KLmwZvzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irKXSLf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4V3soCV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irKXSLf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4V3soCV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw3lo1970676
	for <imx@lists.linux.dev>; Thu, 9 Jul 2026 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=; b=irKXSLf3JBrnMOim
	1gm/OU/wrhtN6T4fsUHL0TBQupKbTUNfWjdpnt5qyWJRrAG51K45kw4XDNhbDe/j
	6Bit7ZV7ZL1FkeN//hoJ/mg9H0xBBAUTScZuc0EkZEP15KSR2gMtfYoTUthvipm7
	MXXIMB9heJvoZIHuo+mcuV7/OCrtMvI9+Ov2LhsY0CQyyQtQGul7BbuM2/Nwzx8k
	cDCmUregGRj8u/LntYKAlJUCbp0fHc7oLEnHuhxwQ3DV6BXvaAJGbRLxfumL4sZF
	7M42umOhaQ3P4DS6RVXkq5F8wnWGYdbVFdU2/5930pMhJs256eA8IYPvCmN8iYQq
	050+hg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg8c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Jul 2026 14:31:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7c40512so201639137.1
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783607464; x=1784212264; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=;
        b=e4V3soCV4eMgQJq9mgC6qo6zSb8ha/AnMkRn6KKyatJA/lmwtDQnG6HTkEKDm2l3/g
         4Gxci/K8Hmfd6ti1JujCola7nZPBijYCsd93HY43KN9o8tZky8P+T94/o+ftxrZzCoGN
         2Rvfnflb4++PsxLqtwi8mFYpbqTZ6MYkxhSBJZGdRN95eMKGehoeo25pFmxE5nKSXHua
         nmcv7t2J48hxiLEZmgdP8eaSDFqShnCfWZ/m1EIoBZw0uEtlJiX2bUEYF4nrxfXjHXFb
         Kyep+ZfCFXDV4qb9k8iekYpPnemaBrgyP3hYrjZeQ4zhRUHk2aGazXpWJP91RJLafAXC
         dQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607464; x=1784212264;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=;
        b=Iz7O9h8HZOogCA7cB2zdHuNDq3CU/t5/hoLk2bL5PIOvA7XlMvATu5P5sw9Dg95GTZ
         NFlHaDmRPLGptecwwH35Gyq2CX1p39VCjOBQeKZidkqjk0JThnLsERkLIq+Y1oCy88S9
         vzb2PdhwwYUxXxMyi/JhaCFYV5qiW8PTXS3b9Hjun9N7puFrAU6plYMzmvx5QmXhVjvT
         Rh/sj4JyMwGS8BkRtob+0byac0yFU50igI8JfL14JRHaypqqHkeycKzcKyGDvbPfUvTS
         75XRB5Vf9l8R7IumV222sp6x8V0OF5ZH3oaKLVW/bkW93MOtMwTdDvg1nO8Go8doB/tT
         Pt7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqpre2zE/tKF63WMCCpkUAu5fTuCvccb/vFZrFG2DsRPVRw4g2c8wL0VPPq165y2rYKiH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxELXnvqZGDgTfNrqqa+unWkLZGBy1ZZ+wmk65Yzjj7cFHeceDx
	OhsCBWph+nmEP/oMJWOuDqAsILGUZod1ztD+/GNVSafqvyqxJaVUyTPuSRHEmSq135n8fhin1si
	5RRN/b40Uyo92sg3TvkeG/fOj3lRK+LzPhc4Op7FXO11IEkrugWF+Fr0=
X-Gm-Gg: AfdE7cnT8jzJPeP/SzL83p9k/XFGvJGY19H8h22jXiz26AH6vH1TsnDgLMlooCJgV17
	3DbcAQGU7fJkvj8Xecz1e73q7TuOL/Bxcsz1RypKASItAc0RmAAoVwqfHgn9duYcRsfr90dGKcI
	UL8NIcWUdy+yK47ItsubEx9POCJWpHMnTCSn5K1xN2dZom1xNf6zmGWT3TRly84wuvDzSW8pY4v
	aW28x2hQ/Mi9WhYqHaXpU/GUb250Wu8IGd5ZwRbHNmValZSucqhYyh6Dj5h8pJCXvPNlQa2s/ZO
	3/hK79BZdOAryt/sQd0/aG6YazDRjFzAaTkkqXazHWIzv1QMxhK/Bqy8ERyQ6UJRTIz/+AI4gpo
	GEVeRgC8xJ47ZSaWpCjXS32xuDzb1B3mEY5cShJvkhpA7PXM939wldK5wle5B079y8k1ScER3kH
	iV1i509zR6jw5DlkvImk41p6cxdvrGlWC2lXy2Wt9qAMGUlcytinajKjy8YJsqVfJXXdwhSGlxV
	ooomg==
X-Received: by 2002:a05:6102:549e:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-744dfbf6041mr4475553137.0.1783607463746;
        Thu, 09 Jul 2026 07:31:03 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-744dfbf6041mr4475388137.0.1783607462573;
        Thu, 09 Jul 2026 07:31:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm489092666b.0.2026.07.09.07.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:31:01 -0700 (PDT)
Message-ID: <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:31:00 +0200
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
Content-Language: en-US, nl
In-Reply-To: <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0MyBTYWx0ZWRfX3DkV53s/u0VC
 PzLIDgrNGUs8iPV3jr/itv7BTbp8dT4FxmRioh9pSKwU7npl0Na5lkcFCU59niVHuV4rev9MdDn
 yJwHsvZ9ZZNXlRcU91Rl9TBkvhxoew7AWND1C/urRWPA63qdyPVxJbVYT7wjxJoL4O/V3GKOPSu
 NMvAAySud+t2L99ckCAT1djiEB0dzPAMGujAfMAjgUdOSCsv94+C7Mg3fH2SrQIKKGj2BekukfD
 x2Jp/rCaI6LEbdYFsFrOSMx+LgiLVwCjdU5/CR/gPxhk96mb3R6/E35QFbbSmuiJzsKuqQPOv5/
 vaErrZY0urokh0i8NYg4RM/XKqLWlKqupq6p749zBf4cNLgo54xLmDZ8Cli4JreIaPzdOgQvAP5
 YkoVQyY+1oROnZ1R+fa5Ju2wHPVC5HGRXnYCfuWwUZuc0HFpBIKotRZpo/3MeDHt52jTusE44Iy
 6AUgdB+GXQ38mHi0Kgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0MyBTYWx0ZWRfX8vsVgIeZO/hz
 ETCLi43ilHqmOb+MO/shTc26Bn2l2xLrNM+oJYt5HDYmd5pCJuByEbk92jMLe/Qp9I5Ke/CqzUP
 1XRxYQIn8cfRdIzX1S44aRJLTXaELiw=
X-Proofpoint-GUID: E-dxrU4M7NQfPnAJiQSn2NQ2L3wxiDDb
X-Proofpoint-ORIG-GUID: E-dxrU4M7NQfPnAJiQSn2NQ2L3wxiDDb
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fb0a8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=OLQ1oTztZwe7u39PbcAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090143

Hi,

On 9-Jul-26 16:21, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:07:17PM +0200, Hans de Goede wrote:
>> Hi Brian,
>>
>> On 9-Jul-26 15:28, Brian Masney wrote:
>>> Hi Hans,
>>>
>>> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>>>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>>>> device table alias support to make modpost consume the information from
>>>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>>>> this information, if known. Also add a protocol-based alias to also
>>>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>>>
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>>
>>>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>>>
>>>>>> The problem with Fedora's kernel-config / setup is that the
>>>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>>>
>>>>>> It does work if I explictly add the scmi_cpufreq module to
>>>>>> the initramfs, then it does get autoloaded.
>>>>>>
>>>>>> We really need some place to put a uevent sysfs attr which then
>>>>>> gets replayed when udev is restarted from the rootfs and then
>>>>>> re-reads all the uevent files as part of its coldplug
>>>>>> enumeration.
>>>>>>
>>>>>
>>>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>>>> But isn't this a generic requirement ? I mean you could have modules
>>>>> install on the rootfs and not all of them are packed in initramfs ?
>>>>> Just wondering if that works for other modules, we can examine how
>>>>> do they work and what are we missing ?
>>>>
>>>> scmi is special because the actual devices under /sys/bus/scmi/devices
>>>> only get created when the module with the driver is loaded because
>>>> of some funtion/id mapping requiring info from the driver.
>>>>
>>>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>>>> the scmi protocol which is known at bus enumeration time, but this only
>>>> works if the actual scmi driver is in the initramfs because this done
>>>> through directly calling modprobe() from the kernel which does not
>>>> get "replayed" when switching to the real rootfs.
>>>
>>> Should the SCMI drivers be added to the dracut module here?
>>>
>>> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
>>>
>>> A few years ago we had to add the interconnect drivers to the list for
>>> Fedora.
>>
>> That would be one solution. I first want to understand the problem better
>> though. The scmi bus not creating the devices until the kmod with the driver
>> has loaded is weird.
> 
> I need to recall why we moved from static list of devices to dynamic.
> One reason I can think right now is the vendor protocols and their drivers
> But in general it was an attempt to help multiple drivers bind to different
> scmi_devices that have same protocol ID. E.g. the performance protocol
> can be used by cpufreq and devfreq/performance genpd drivers.

Note it is ok to have multiple drivers bind to the same modalias,
depending on the reason why there are multiple drivers either one
should detect that it is not compatible and exit probe() with -ENODEV
or there should be some other mechanism to make sure only one driver
loads.

E.g. duplicate USB device-ids happen (they shouldn't but they do) and
then the drivers typically figure out if they are talking to the device
which they were written for, or the other device with the same USB-ids
and then one of the 2 drivers exits with -ENODEV.

>> I wonder if we can just move a small part of the drivers
>> (some mapping table) into the bus code and then just have this work as it
>> does on regular busses. I hope to be able to make some time to look into
>> this soonish.
>>
> 
> I started with that few years ago and we then moved to this dynamic
> device creation. But I agree if it is deviation from the norms(which I
> wasn't aware of at the time), we can remove it.

Looking at the issue this is causing for automatic module loading if we
can get back to the bus enumeration code always creating a device without
waiting for the driver kmod to load then that would be good IMHO.

Regards,

Hans


