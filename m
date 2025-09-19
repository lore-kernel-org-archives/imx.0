Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A0262FFC
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300170; cv=none; b=czBjz/4cfMC0QN5/eAL4ZZDZYuunXt6ZmXaKw6YwwQaHeNBoy06b712KQL4/gYvYpYuKYhKFsAMZm5jG0jOFuiINWHR69wKgzw1bF73t/ZgmKFwjJtiGZ83B18w9a8TBrhRoSPkJ2aouMtaFo5V5Qksencab+fjpeVj2UHyqNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300170; c=relaxed/simple;
	bh=IVmeYFEt5n78kowyzbALJ2qR43obCrrnzs3YepyioWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZLk0PpLxFetH3F1XQ4Zb2u3EKEyXT6tKJeTyM7587NH+hh7o9T+AqQ7OHgrHpbAq+SHfj2akpE2G+qlJqD3SzVCnI5tj/RZOxLkrtprpnGyq/RNmfU2CV3433ozHUTx8pcujHPmp5Qe9SMm/J3m2tRjC4mxFFH3Z5o3MyTmr+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCqevV08; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCqevV08"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so1200504f8f.2
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758300167; x=1758904967; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkHj6yxNHqV86xD9f9rRMp4RmegxtrG2NNsn/fkhknU=;
        b=hCqevV08WCZWy1N04x6397XoKLGyCPbbNw2JppXCB0dANcynhXwfO2jOOME4ESeJPY
         W/UBqotoC0wEXiqHNcVFPs9gktk3zklarxjELpiPV+4L3l3C1dK5OV18VERylfD1p5Jy
         PagqkZCs8AMPK/5NHBEZA3e4LX0ZyF3YuaikQrdP6uwoxe2+p9+vdDhUbPGJoHjbYxuL
         9WzIwboyyN9F2uSt3WEuVfun5JfFkmL0p8cLjOGJtoVuNu1+wK39G7QbU2kriasbUQps
         UBAvdtO1krDeTYUZ06lbQWc165cwuxH9KW1R9tC01qlEKEkqmAp3aIY8ZFdhJP4jtWPG
         TVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300167; x=1758904967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkHj6yxNHqV86xD9f9rRMp4RmegxtrG2NNsn/fkhknU=;
        b=Z0mAxnTDdnCnVzWAo3CiPfsCBkZjcXbdqrBjTUCa2VGSyjIdYuX2Jb+4ycx+W0eS67
         y5q23Uc6FP//MBegRM7z1wjELucnnZgM3RW7wDxjAgbYbQDvMZ68L32C2jgHmByCEw8M
         sFSb++kJSKChk/843NKuyYKOKTyIAO2Icz0Tu03WtD4zoO2Q4VQLbl3aau72fSAgtS/K
         c0hNZkSMqshqFI8MskrDRRBu/OP2GT9fXCSOgFovPO2kDr9RVB1OxmqH8CeXfboFEeEZ
         3owjYees8liQMeHcPJN/+Ke5QeTncGdo2kpL1QYYKTmPqzIiO9fSufH6mnHEyUCfu51M
         S52g==
X-Forwarded-Encrypted: i=1; AJvYcCXmLIrTWvD9J3Az0602bSbwhT/P2G7v+hs1IRigmgHySN6gKbJ04g4FcRZDiqZhiJdbjqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMfWr8Va9a5AnEMSmz8Me3jt0uYTpU9TSK7JctQy/sjBkFccer
	sn591uqrAanPR010uyBRTdaC0a5wvwql+n2krxvZk57lPTTty9sgOWrx1MEjaQ+QTuM=
X-Gm-Gg: ASbGncu7XC1Qsdj8F+kCi5iNhPzU9fWBR0cJlvIT7dVXIy9blnlKxb7h8/PQBhynFC+
	MwdOD6hnmLE5oAS+KGw6jOvMdmbjTZ5n0StMK3o6YYpECiCQVtvaz9zn0Xa/71Yggohe98QXME9
	TiECez+kcMNaPd4awDcR5wx9oNHKpJ7rAFD3IK5zVI1zC+mnXY0Bj1sDzWzdYxraohCyqo8OYFZ
	0oQItWu/UaJj7E/ZEpEe6yGWHRQw23mEoZG2zTQ/QfLHPv5D7vgQQUfxoh8PLbD7j9BaMeFq9Im
	QN8D1NQ5+BPzpdU9dnsBmuiU6Ihe9COE+2BT4W+30MPmP4t9X537I1+lmi4ZTcRyzuj8U1ZOhi+
	Zzx29Pv1fPFBIUxv/VDGngRgZ+Y/d92bPLCu5uhUecuxgUjA4no7oj32EIj7oGsi2mW0sR5JXkZ
	N9ccn4qBt/vgKO
X-Google-Smtp-Source: AGHT+IFhUncdh/63zODwAY6Eoa8z9GQAGmPnzhNb7b4Y3hgpiTCynPlk24Zvc+GNdq/F+x3+CVBVbA==
X-Received: by 2002:a05:6000:1aca:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3ee855812a7mr3683227f8f.53.1758300166902;
        Fri, 19 Sep 2025 09:42:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f1549285c9sm1799412f8f.52.2025.09.19.09.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:42:46 -0700 (PDT)
Message-ID: <ffa6fcdd-2b0d-4493-a8b1-961e51d41e6f@linaro.org>
Date: Fri, 19 Sep 2025 18:42:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] thermal: qoriq: add i.MX93 tmu support
To: Frank Li <Frank.li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Alice Guo <alice.guo@nxp.com>
References: <20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com>
 <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
 <d9392dbc-806a-41df-8992-28c3d6132309@linaro.org>
 <aM2D+q/XCI38M9sp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aM2D+q/XCI38M9sp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/09/2025 18:25, Frank Li wrote:
> On Fri, Sep 19, 2025 at 05:51:20PM +0200, Daniel Lezcano wrote:
>> On 21/08/2025 08:23, Jacky Bai wrote:
>>> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
>>> from the ID register is the same the one used on some of the QorIQ
>>> platform, but the config has some slight differance. Add i.MX93 compatible
>>> string and corresponding code for it.
>>>
>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
>>>    - v4 changes:
>>>     - no
>>>
>>>    - v3 changes:
>>>     - use the drv data struct for match data and refine the code
>>>     - update the copyright
>>>
>>>    - v2 changes:
>>>     - use the compatible match data to identify the i.MX93 TMU variant
>>> ---
>>>    drivers/thermal/qoriq_thermal.c | 18 +++++++++++++++++-
>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
>>> index 01b58be0dcc64d14ca5e4bba654eed8f15e827fc..b2e634547271dcf512c714907baa162921d2d527 100644
>>> --- a/drivers/thermal/qoriq_thermal.c
>>> +++ b/drivers/thermal/qoriq_thermal.c
>>> @@ -1,6 +1,7 @@
>>>    // SPDX-License-Identifier: GPL-2.0
>>>    //
>>>    // Copyright 2016 Freescale Semiconductor, Inc.
>>> +// Copyright 2025 NXP
>>>    #include <linux/clk.h>
>>>    #include <linux/err.h>
>>> @@ -24,6 +25,7 @@
>>>    #define TMTMIR_DEFAULT	0x0000000f
>>>    #define TIER_DISABLE	0x0
>>>    #define TEUMR0_V2		0x51009c00
>>> +#define TEUMR0_V21		0x55000c00
>>>    #define TMSARA_V2		0xe
>>>    #define TMU_VER1		0x1
>>>    #define TMU_VER2		0x2
>>> @@ -66,6 +68,8 @@
>>>    						   */
>>>    #define REGS_V2_TEUMR(n)	(0xf00 + 4 * (n))
>>> +#define GET_TEUMR0(drvdata)	(drvdata && drvdata->teumr0 ? drvdata->teumr0 : TEUMR0_V2)
>>
>> This is not adequate for code which will evolve. Please don't use this
>> macro.
>>
>>>    /*
>>>     * Thermal zone data
>>>     */
>>> @@ -73,12 +77,17 @@ struct qoriq_sensor {
>>>    	int				id;
>>>    };
>>> +struct tmu_drvdata {
>>> +	u32 teumr0;
>>> +};
>>> +
>>>    struct qoriq_tmu_data {
>>>    	int ver;
>>>    	u32 ttrcr[NUM_TTRCR_MAX];
>>>    	struct regmap *regmap;
>>>    	struct clk *clk;
>>>    	struct qoriq_sensor	sensor[SITES_MAX];
>>> +	const struct tmu_drvdata *drvdata;
>>
>> The drvdata pointer is not usually used.
>>
>> 	u32 model;
> 
> I think it is not true.  Copy model here is not extendable if need add
> new field in drvdata in future, especially need ops callback for differece
> variances.
> 
> Just list two examples:
> 
> https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/controller/dwc/pci-imx6.c#L173
> https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/controller/dwc/pcie-qcom.c#L286

Yeah may be I'm doing a confusion with a previous comment I had related 
to this approach




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
