Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242B3403FD
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814679; cv=none; b=QuwD6Hn4IOmiwQZsYt129nzVI8l0oV4Mum/af3u1NrvnDOxclC7SafkLeV6QP64IFBMXm+ZW4obGwok6WKT+MXbUUcj66Lw7bHA31/TX88ontyEx8+T4oSV98mtg7DrCkTXt5IdX4uccxJ3xyjI3veldHh8MNsyHVq7IDDVVSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814679; c=relaxed/simple;
	bh=HLxQCCXxvKkwoegsbUnC3g4wlzqBB87zcGLg24R2AW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMHfWSRR0JkwmzHglvby1vY6t92Sf0k1TlQAAuOsWXfAL4Dh+nZkLLQtwQ3+N2yBUyt00rgR2EoIWaratCo+euFyISeop4hs5QIExtdrVqH3xKdsYJSpbbLswDGC1sh4j4677qZ5MMPvOP3Ur4auk7KPR7hw+YibjdGprFhKYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9i66YWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GL8jCPPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9i66YWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GL8jCPPd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHrsfS512354
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 20:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=; b=A9i66YWdpU6YBRKd
	Y/MBdL3leGrrJahi74KTM4KDUukQ+j5qURMvDHv/h26fAMH3YQ7DGji15TAnMGwL
	USEPfEP8AD8iQcYvd1iG1lfmSmz7UW+zAngX+q6y2E0CUnCSI7j/tqtfhJrqkhqe
	Bb7YKc+I5KSThSi349qRKDQodq8XXrVZwF8jlfC8noswCAbuAmfFSXFNt6pILgF2
	eX7GqmBqg+WDX9b4uCvVGCkgfKaMMi1FrJfZJo0n6j3P5s0uMfYxkHKqzunR9kjq
	QH8VKdbeCj2Uku3j8+w1XmjnU3du0rg0dmLmftvJ50lp7ioEz2fD83urICNDRRJs
	2WsO5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyr8uwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 20:31:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so576227137.2
        for <imx@lists.linux.dev>; Thu, 18 Jun 2026 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781814676; x=1782419476; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=GL8jCPPdI6mGtRVgC7UM1OUXCCfEnZg5puwCecRCJirWbUnG5R9uvbcPrrL5ZJJwPC
         x/vqhgwCjLNMNbfQUzWUXquhnqZnEdDWcDzc3/fFB+aoTxWPIsMpqbXQRMpyqI4RiGom
         N9jV+T4BpPxXganRgiYTrx0+4Yczo8j90v+nThzh/Kb+dPWUb1iopuayTAgrQk5PTCXl
         D36fgWosbjXZOxOZGF0v8oF1o4QDqGLpXX4Mp33kAmwdyT3mEfnxDmBAfOqU9L/L+Lq4
         N32Y6wSpFoa3w/cTzzK643ZPKeFqUsOc2dgxy9zDdh680XV0N7n1hoJ+B8jyawXDaZ9s
         y/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814676; x=1782419476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=czKabbm7XEvl8bpLQ4RQZdnCJ5m0C2YlqeX9Ir/G+hcwO1iVh0qOtCtcJ5pBr0pFyy
         VCMP6NXPENgxBthVLMJvF384Ub1UiE2E+G6YUrlICRwqU8cS++Alo5fNSgLhPJ9r45Dx
         LKgUrS0fw5bHPrt25SPSLmi0xslDYeJo5Yii/nlAs6vHlDUIC+dh+Kjx3UDzJstvlsUN
         nlxLaD9H7FXsCJ/BDfsXTdADznsq90YokNk2YPWalCM6RrnzEwu33vcxvEgb8uxw6i9x
         XDO6/ZmT37a+dj/KLWWjMWTL015oSvW+AHNxgUkTCir2SqmwZFfqkfECdMLR00/C+u7n
         /dDg==
X-Forwarded-Encrypted: i=1; AFNElJ/HEnXAM/+Qt5NeCGHQHZ0lleux4gQg3g9VO9A8VVN/2hpKDXQd3cnr99SL16w3+lzKTzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmLSefLjXc5ecs7f7swISZLUFP6bH0rkcnAKSPrh2IxC9ImJSo
	gSViAnUELftokg9/qL9aPqVTC9/D21vNa7yTXzG5yo81ERM1mQjiT8sz/IcWSXTgqPHW01Pfd6W
	QNca8CDm26JW/P8hbhrzGdkdqWrrL3+7dsnKUvCYgT78/p5QOpmWJjQo=
X-Gm-Gg: AfdE7cnMwN/BTzMSVTFffnJNNFRk4oJfi8B+yvDEaXZUWpMszGLEyMoKGWBprtuLRgD
	BLY+z6E19vL0sD8WUIyb4erwez0IAubg9SjxM+bMgkVVDG/ls2pnmLxtInXC2rpXsRPgwYLrlWe
	8Aodvlu8PWJDMjhtn7Vywj9q2pQcqrcxtmqo3kUK4RgBW6Edm8AzsY3gpWlcr8Sagn5lWpyOzJU
	5ONsW0aXd4bsdoNvJrqvbLdlNh6XOb5UdYAp62MUz7KENCvUTdlsG81us3F9g96Eqy8P9/wUUSj
	GhqPNHEW1twvwP3Lrn/v4walfF2UbgXwMwtVCT+sqIDET9zq4LuxWUE++Hg6eLTJXucI4R/jQ5d
	UkMRNvmZKGbUTVrntqfBQu1cVMw+96XxqZ1kBdL6q1Rvaz1zTNzKsfJww/PhPtfssrnTJf2WXP3
	N8OrxVY77ACa6CkWu5Yd2888R8ZVgI0CO7FvbtZLoByx2UB6ufCCc8QDBgskLJXJwKwfKpB9s2g
	jh0Xw==
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095692137.2.1781814676221;
        Thu, 18 Jun 2026 13:31:16 -0700 (PDT)
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095628137.2.1781814675743;
        Thu, 18 Jun 2026 13:31:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490b104sm2351966b.14.2026.06.18.13.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:31:14 -0700 (PDT)
Message-ID: <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:31:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a345595 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8 a=P-IC7800AAAA:8
 a=JfrnYn6hAAAA:8 a=5KGQkzpS6Bu23flkvY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: g6XJipLYLJSr4MnQk8lmP01wqewEQGxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfX3HhI8sVTfWnh
 jDvdnATQ/3j3uVuK1r1Ijm+9joD9gF+juZRV7fJRmdRwBZxgANNGRZdrYox5fGWs6ONsv3Wwso2
 kCwcaTZGLlLECT9vA4nPWiH6h8ijUH/xM+JMdzvlX660WKxI4w9QNm/EEqFjLsKOF+/pqnYxSjk
 1PBeGmuDQJlizgAs2xUDCrgwg3Q2d1Vdu+yNRAuLb8oiP/BBPddMZmE3EX1Dn0slYJsglXts3wz
 gDWC197DuIfClqL2utoixkl8nHTXU5az4U5ID6fylJNl2kEuWCuKV+MhSNPUXaZ8S8Gl83QL8e6
 eo/Syf530xa0Ssw8+XjiDmuyiuH/wQFxQ/A635WE8USxRAhv/347eE2jmF1d+bwn44/OjGjFMS2
 lWs0mfexeMbi/3O0fMq6L4QnUXX5jD3lzHgolubAf43Fb/fDKv5lSJurOdi2UPM1GpzvT2ky1oV
 qkXHqqoR+J6q8PtYNFQ==
X-Proofpoint-GUID: g6XJipLYLJSr4MnQk8lmP01wqewEQGxJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfX+9KeGRh91jYv
 TS0TtiHTET5SRfzo6UOtXxyU+ZTU3d7Y7RaE+qN1lOcKoKfY48XM/tQui7FFatScv9JS4OlEpcL
 ic/weUKeGjBNmfPxFpOIN7+o6l0ilxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180187

Hi,

On 18-Jun-26 17:56, Bjorn Andersson wrote:
> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> modules, but they are then not automatically loaded. Rework the SCMI
> device table alias support to make modpost consume the information from
> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> this information, if known. Also add a protocol-based alias to also
> trigger driver loading when only the SCMI protocol id is known.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

So I just gave this a test spin and unfortunately it does not work.

The problem with Fedora's kernel-config / setup is that the
request_module() from patch 2/2 runs from the initramfs, but
the scmi_cpufreq module is only available in the rootfs.

It does work if I explictly add the scmi_cpufreq module to
the initramfs, then it does get autoloaded.

We really need some place to put a uevent sysfs attr which then
gets replayed when udev is restarted from the rootfs and then
re-reads all the uevent files as part of its coldplug
enumeration.

I wonder if it is ok for a single uevent file to have
multiple MODALIAS= lines in there.

Regards,

Hans



> ---
> Changes in v2:
> - Use request_module_nowait()
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
> 
> To: Sudeep Holla <sudeep.holla@kernel.org>
> To: Cristian Marussi <cristian.marussi@arm.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Nicolas Schier <nsc@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jyoti Bhayana <jbhayana@google.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: arm-scmi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> 
> ---
> Bjorn Andersson (2):
>       module: add SCMI device table alias support
>       firmware: arm_scmi: request modules for discovered protocols
> 
>  drivers/clk/clk-scmi.c                         |  1 +
>  drivers/cpufreq/scmi-cpufreq.c                 |  1 +
>  drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
>  drivers/firmware/arm_scmi/driver.c             |  3 +++
>  drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
>  drivers/firmware/imx/sm-cpu.c                  |  1 +
>  drivers/firmware/imx/sm-lmm.c                  |  1 +
>  drivers/firmware/imx/sm-misc.c                 |  1 +
>  drivers/hwmon/scmi-hwmon.c                     |  1 +
>  drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
>  drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
>  drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
>  drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
>  drivers/powercap/arm_scmi_powercap.c           |  1 +
>  drivers/regulator/scmi-regulator.c             |  1 +
>  drivers/reset/reset-scmi.c                     |  1 +
>  drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
>  include/linux/mod_devicetable.h                | 12 ++++++++++++
>  include/linux/scmi_protocol.h                  |  5 +----
>  scripts/mod/devicetable-offsets.c              |  4 ++++
>  scripts/mod/file2alias.c                       | 13 +++++++++++++
>  21 files changed, 58 insertions(+), 14 deletions(-)
> ---
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
> change-id: 20260616-scmi-modalias-0f32421bd452
> 
> Best regards,
> --  
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 

