Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271C1F12E7
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775162; cv=none; b=ZUKh0Fu7mSyCeT9g8cbTH/7N+9ldc5PQUpsxYimYBSb3UenKaDcyaQ8YhmVZX4UBVyxhNBCchNgoI5J/5h6A4pR+14/4bQ86OO7RRFN0DohH7C1iEtf9pt/i4Rbdy/RakkM2owDGZcM8l0LKZLWEv0W864W101r+6vXaKWSBWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775162; c=relaxed/simple;
	bh=39/o4k002+zvT8GpmdpsEwxxkrT+dek11qloLHAFarg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2Eh+69CKyvLg71b+QD6D3ja3jqh2tthG5xW6XOLRI48V/Fmdkssn1HIbr2QXzlwESuT/Vz+O18ZCmSkneW6FE6qGAG6V59ZXma96wXH5A377LTJlCH7+gJAvrcw5USHidHLquPhdnmCmGqCQmpVMx3l+3u0NGxcHbE5BF8jt7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJCU+O+0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJCU+O+0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so708025e9.2
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775158; x=1744379958; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7WQ85ZwzaG+oLmFcTwxrBQ9U7/3N21t4CiCD3HZPOo=;
        b=QJCU+O+0wRGg5z3FHQl1b6fn1yrjYmOeo7aF/dS732+NWcunZpUI+NO/3xKqFk3cYE
         orlg6Ghr8DQUeTlY4cTWMz6eS2NcvdVwJhxjXGFlJuueJS7Z9jAJMjer6u5vsqQgvTue
         sMCJ/YfyhxddwiP3vYGY3AD+vDuILH6eAnn5V8nJ817TAe5f/63kmD4RrBbCps3JTxCD
         gF7StPttwt61wVnQSEsga5VnUxTl+5mjOTfXzvLyieyN+7pAe2vW1iw+cv2/28M7rfyE
         L1CI1/eg5DZatfA3r/bYBBuwgSnpbXvJzkkdQLoxPYbEWrB0G+IdTZPqNgJVgUB9s3sa
         VlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775158; x=1744379958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7WQ85ZwzaG+oLmFcTwxrBQ9U7/3N21t4CiCD3HZPOo=;
        b=ukxzk+wuUUhZ9oGNdoJ+8WrtPlrqxdnRsvLCYBDKenhamE9+pwR1+mvRs2yI8SfW4q
         fjmNI/zAoAJHQOoEqlGdG+kHDAsVfo4n3Wc3JfBn2jcwrHFBI9WB78mYfPpcsw1/2MJL
         uJkwU++zsHY0RZUl7tQdu4s68CXTE8/5w+UlXKHKl2zhCXQLxdazpy3CmzSyTTtvM0cL
         FwoLokvdYASC6z8hAEM4SqPEJ86pa8VnwPuG9q3JXkikV4CIndcG2AboGr9Rv3dOK1fQ
         mDXfNo3Wwc+hB/PRfVfQulQ8W/22bVdhTz0iiNFONo5j6oDeG6z1g8s/7nOARtpwhj0z
         8zdw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXT6utai6zQa3HQ9H8DE6J5ExA79y19mjxBn7vjQKn+DDERzS8RrTIfN8mbugdUhbXLM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmt3b4vfkpvAPLH6EnA1omPYD9ZWkgeAsmtBJA6Ahs2TejwXvv
	srLVihOBALyYLsgp/jbfRbQ7i7BB7LJ/4gsy3V/jvoR37V+DQfcuYY7y5NLh
X-Gm-Gg: ASbGncsIp8DGudKsXaceCMaAlF5e1B1lCkDPHfgxh7qJfLw+dU09dSELw6MatuCUumU
	3QPjhT1NpNuya8rwlkAmTmSJdThapI1ko1ni8dx22RSoiHOVCDAmaDYZ/YItFIA/JTI8+3RBVqp
	WAPlDd1w/v2vmM0imGWyGLpwUzPgiDJyee0BzrkExfbRnMs+ZBYCclobKFUpjze7GvOqxqGgAqz
	FhFb/mtuWYHQ5idKV/aK2wUVUNENmMD1VNLG0a7D3Rikx9KSHFN9W3gAkYRmuMTQpBYmE7rhuRA
	oKY2a2dUre64LkLAisDA0nh1WF93r5oGz8GGVMr97fPIkxxM8mVkYtFreLB/Dbz6n9F7+eLhRg=
	=
X-Google-Smtp-Source: AGHT+IFMDjr8Pj3/DFumk8gQPXeQjRro++AUyJw2sQrTBIk2T7ULhdgksQGfttKQv2KG2mJ8OoPW5w==
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr26591995e9.2.1743775157969;
        Fri, 04 Apr 2025 06:59:17 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bb7bfsm45945005e9.17.2025.04.04.06.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 06:59:17 -0700 (PDT)
Message-ID: <793d6a31-e3f9-456d-98cb-1622c48e6f38@gmail.com>
Date: Fri, 4 Apr 2025 16:59:15 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] bus: add driver for IMX AIPSTZ bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
 <12639974.O9o76ZdvQC@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <12639974.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/3/2025 11:30 AM, Alexander Stein wrote:
> Hi,
>
> Am Dienstag, 1. April 2025, 17:44:01 CEST schrieb Laurentiu Mihalcea:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
>> configurations meant to restrict access to certain peripherals.
>> Some of the configurations include:
>>
>> 	1) Marking masters as trusted for R/W. Based on this
>> 	(and the configuration of the accessed peripheral), the bridge
>> 	may choose to abort the R/W transactions issued by certain
>> 	masters.
>>
>> 	2) Allowing/disallowing write accesses to peripherals.
>>
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
>>
>> Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
>> to a power domain and may lose their configuration when the domain is
>> powered off. This is why the configuration has to be restored when the
>> domain is powered on.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/bus/Kconfig      |  6 +++
>>  drivers/bus/Makefile     |  1 +
>>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 99 insertions(+)
>>  create mode 100644 drivers/bus/imx-aipstz.c
>>
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index ff669a8ccad9..fe7600283e70 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -87,6 +87,12 @@ config HISILICON_LPC
>>  	  Driver to enable I/O access to devices attached to the Low Pin
>>  	  Count bus on the HiSilicon Hip06/7 SoC.
>>  
>> +config IMX_AIPSTZ
>> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
>> +	depends on ARCH_MXC
>> +	help
>> +	  Enable support for IMX AIPSTZ bridge.
>> +
>>  config IMX_WEIM
>>  	bool "Freescale EIM DRIVER"
>>  	depends on ARCH_MXC || COMPILE_TEST
>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>> index cddd4984d6af..8e693fe8a03a 100644
>> --- a/drivers/bus/Makefile
>> +++ b/drivers/bus/Makefile
>> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
>>  
>>  obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
>>  obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
>> +obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
>>  obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
>>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
>>  obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
>> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
>> new file mode 100644
>> index 000000000000..44db40dae71b
>> --- /dev/null
>> +++ b/drivers/bus/imx-aipstz.c
>> @@ -0,0 +1,92 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +
>> +#define IMX_AIPSTZ_MPR0 0x0
>> +
>> +struct imx_aipstz_config {
>> +	u32 mpr0;
>> +};
>> +
>> +static void imx_aipstz_apply_default(void __iomem *base,
>> +				     const struct imx_aipstz_config *default_cfg)
>> +{
>> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
>> +}
>> +
>> +static int imx_aipstz_probe(struct platform_device *pdev)
>> +{
>> +	const struct imx_aipstz_config *default_cfg;
>> +	void __iomem *base;
>> +
>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>> +	if (IS_ERR(base))
>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>> +				     "failed to get/ioremap AC memory\n");
>> +
>> +	default_cfg = of_device_get_match_data(&pdev->dev);
> Shouldn't you use the configuration setup by trusted firmware (TF-A)?


not sure I see the value in doing that? the TF-A configuration will be overriden
anyways if an AC API is ever introduced in Linux. Also, for AIPSTZ5, you'd need to:

1) Make sure the AUDIOMIX domain is not power cycled before latching on to the
TF-A configuration otherwise you'll lose it.

2) Add an extra step in which you actually configure the bridge's AC from TF-A since
it's not ATM.

I'm not sure why you'd want to do that when you can just set the configuration directly
from Linux?


>
>> +
>> +	imx_aipstz_apply_default(base, default_cfg);
>> +
>> +	dev_set_drvdata(&pdev->dev, base);
>> +
>> +	pm_runtime_set_active(&pdev->dev);
>> +	devm_pm_runtime_enable(&pdev->dev);
>> +
>> +	return devm_of_platform_populate(&pdev->dev);
>> +}
>> +
>> +static int imx_aipstz_runtime_resume(struct device *dev)
>> +{
>> +	const struct imx_aipstz_config *default_cfg;
>> +	void __iomem *base;
>> +
>> +	base = dev_get_drvdata(dev);
>> +	default_cfg = of_device_get_match_data(dev);
>> +
>> +	/* restore potentially lost configuration during domain power-off */
>> +	imx_aipstz_apply_default(base, default_cfg);
> Shouldn't you store the configuration at suspend and restore that one
> instead of this fixed one?

you're only using the fixed configuration here and you're not modifying it anywhere
so no need to save it during suspend.

>
> What's going to happen if trusted firmware decides that Cortex-A53 domain
> is not allowed to access AIPSTZ?

then you'll get a bus fault and will have to model AIPSTZ as just AIPS via the devicetree
(like we do for AIPSTZ1-AIPSTZ4 right now)
