Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E72FC879
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970576; cv=none; b=csCfM8uYR/fsbwUjri34EGVKYbr1hJkZnjwysKgojTFyCTnHUQV0bLfGVl+Lkm/CBptPTWQP+fQx7Jt1ZFrjjI4wZEnN+TNI7PgtyR4KsEAa1QwmgZ3Jbgwb5KGzOJLtOKOO4DvFZYwB4kg94DwSAWPUVYJOD20MYd8zPe4mDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970576; c=relaxed/simple;
	bh=X7IGd3KK52vsYXMhrM/sak5eUWBh9m0RLIV6Uoj15+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSilDAnJAQFtCBxenYLImpuYXi+iiW48GOwXLJKNnY4R3AQcY1ELxjKA78zpB0m0vs4mvkh2zSX0HOrvf+IPUrXWBHPxgdJRNQzwVMmhpzvi62i39y+zNoRDNLZVT4A56awAkeobYjruWLwj8/jtc8IQ95GgS0KY3uEvERny/uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDocBlWN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDocBlWN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b50206773adso967149866b.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760970573; x=1761575373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=BDocBlWNIcve0rNqAPzYYwgrbKAcF1HQZPIYE7HLItn8r2BaL3kST/tANvJzrQyGji
         6GZnUEB50baZNtcbzpOjGd5bTfsYr6ZBgwOOjbvBO2ua/W/pqoV8nB6UuUzagSbk2OoS
         6v3gdAcxzyopO2QwQS/ihvgwDLYo/NyZvJy3ArvfcC6g+ZsOSFFU6kvoVMP3yEuC5DZQ
         VuFbJyk3M6092VLZzvU+RnXHs8ZWxzNNShHreWZfizdOmZfaHlBX0DP68ZIExzhdk77k
         w8N9xiONnQGP66r4wJ5Uw8nmww51AVwikQa6c92R8GZ0Te1wP0athfqukSUrXYOny4CX
         cUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970573; x=1761575373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JR/OKSNOnF+l4tQRJr2FhhTssgUWExohKzJa6PLCZs=;
        b=I0KpEyO2uVx3Qhr8RagVNuAt0zZ445pTV0nJVQrTfR4qrPk7lAJjk7+w/UvI6kGoNW
         h8a1IpX5C3bFBDb8B0aJWBxxpHseOTuR8Uq6UVrkmPkoh1H2qf7asoPVE/2OBge2234S
         8JAvoE2j7P5KswOhFCD7nb0EUZpX+g+RXeBlKl+HpgqGlDST6lOw71HB0bXMiA+JX2Zm
         0qqiiLM5GQTBOlPI+SBYx1jj928wt8b3NqImDgIfysTfZd1nG2vjIrORsoiCPdWpvluF
         3uwLWidt5TOkpLfW8frbfqKffjSv23e7LZyK6n/tAMpGLiqFvlbE4SMWrKYXE/eGNSfb
         pozg==
X-Forwarded-Encrypted: i=1; AJvYcCVhHOWjn8O/hCf0s4MBUw4IivgH/sN+HzHa5kExlXjAaAF4Nt5bgjujnwSwOBYPEVRt0qo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxSsmQ4K0teYUGI/3Z2ep4D47KvqM1qXUDfgmG0O0ySQ2Ym2W0
	tQBukxT3xRi1HRjvSfzekxSRbRmgJ1ZvBmjxBCkDpJgxaPy9p8jBVm0G
X-Gm-Gg: ASbGncsZV/PKQrF2MqDjiEsCTvN8AEHAeJQt8EeSLzckDO6VTDLKrQaLSW4Qcx0yOgu
	5NCXtq5pateh09OdQwme51PTXcPoj8dwOs6eHl9mP8e9U1laKYmwrKR2npJ1TGXzp59tlUdbYWq
	Wq7rve9+e873PfwUD56tv1kwdH9LuH43WlB+GnntVFNgq5zOUp7SjukMqtZz6mx4wVYL0l5Xx1u
	+LkpgC7Af7+scFO0UlX9v1vMtTdVZKuK0hHjXYgldWWYvhRk8o4HY3IsLlPQPeSiZfhOOZReFzW
	e6/kIGCuU2bPoGOz/694C5gX/5/AB1LFM55j43B16B38uFg6u6EJrmPSwE7+B4O6q0N+GyKtsjI
	Ma2b+wvtJfbUPw6B1Szy5V8t3x7bu6Q0t7rdHyAZlZF1dxuTP8FIvIKtsCZmOy97WGhWFo9zjS4
	mjBq+twIN5DqDUrt2UlDebhny36l4lWsZt
X-Google-Smtp-Source: AGHT+IG/fdWt7ok35oOxO1wrbFMUAezRTf+f2uzPz94aKfhnEmWUajzGD6PhgGurEGjl/Gai/41dbw==
X-Received: by 2002:a17:906:7315:b0:b3c:9bee:eb95 with SMTP id a640c23a62f3a-b645c9cd378mr1808744466b.3.1760970572663;
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm803404466b.18.2025.10.20.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:29:32 -0700 (PDT)
Message-ID: <64b28a11-337a-42ba-8765-d94b19070d66@gmail.com>
Date: Mon, 20 Oct 2025 07:29:28 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-8-laurentiumihalcea111@gmail.com>
 <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZdAQwdoOP3cqN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/2025 7:57 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:24AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Support i.MX8ULP's SIM LPAV by adding its reset map definition.
>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c370913107f5..b333d7c1442a 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -3,6 +3,7 @@
>>   * Copyright 2024 NXP
>>   */
>>
>> +#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
>>  #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>>
>>  #include <linux/auxiliary_bus.h>
>> @@ -17,6 +18,8 @@
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>
>> +#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
>> +
>>  struct imx8mp_reset_map {
>>  	unsigned int offset;
>>  	unsigned int mask;
>> @@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
>>  	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>>  };
>>
>> +static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(25),
> Register defination still perfer use macro. If not, let me know.

I see no value in adding defines for the masks (see patch 4 commit message)

in this particular scenario.


Is the assignment of the "mask" field for the "struct imx8mp_reset_map" item found

at index  IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST not enough to deduce that the

constant we're using is the mask for the DSP_DBG_RST bit?


>
> Frank
>> +		.shift = 25,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(16),
>> +		.shift = 16,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(13),
>> +		.shift = 13,
>> +		.active_low = false,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(5),
>> +		.shift = 5,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(4),
>> +		.shift = 4,
>> +		.active_low = true,
>> +	},
>> +	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
>> +		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
>> +		.mask = BIT(3),
>> +		.shift = 3,
>> +		.active_low = true,
>> +	},
>> +};
>> +
>> +static const struct imx8mp_reset_info imx8ulp_reset_info = {
>> +	.map = imx8ulp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	void __iomem *base;
>> @@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  		.name = "clk_imx8mp_audiomix.reset",
>>  		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>> +	{
>> +		.name = "clk_imx8ulp_sim_lpav.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
>> +	},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>> --
>> 2.43.0
>>
