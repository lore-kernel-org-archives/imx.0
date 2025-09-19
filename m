Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF91931A7FF
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297086; cv=none; b=fJ++bbkg5o41PTmaERWaTDyqGSCfs7lT81uDTIMxFSO9j2TFxT6B6WghcYUOBT3B5F16zAmpNpJlNcJgVwQLVi7Z9kHlr9LtGRel6NstsxXCLakqqw8bZTiZrSwYFBiKqgtBVt7iaJKre4JxlWAV69mwVT5M7w4htqwdNJDKugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297086; c=relaxed/simple;
	bh=TK+FiTveEwrbiejIKycFmZ6vZ/ypwSUiSrrtTb1yXb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvPQ8ZufURAfIJTYQd0LPv0oFX4+BMCZ4+nl/92xPI6muKSZLVmh8b3715dWPBQo9s1gYddUwcJLAwpNv0bTPyUES7/4G19gLPd2g5uNf3Fa+ZNr6kxS9XV6HsFmErWDUUDXw1TaGeYVtTj3K9vo1Wi623L0GFIQ3yjALbvkAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsx/KtG5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsx/KtG5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so14664885e9.1
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297082; x=1758901882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mk5UbU1vmdkhvVI9gXoWyB4lbjlenJW2I4nrsVx97aE=;
        b=nsx/KtG5UY0BUUJ3D2/gVw/h83EASfZx+MF90OFzRLyyCbGllwNR/DhnA058BtVyCZ
         A7zwBTu/PC6fDFbSPDjY0uMGG7zd9UlZc2xrGGQt33xi3rFPkBupX+gayErh5KuT5Dkk
         ZjW4QvOC95BBhRA6x0pdbGq46qVLLNYlWHQ4rhSj7FZe6SzyysthUrbojzezjvxnQbJW
         4iiLtb2B17E5LwLbApwFz1yJefrK7+WAlyrTp4X7EOOdgnCUDlRDl82lfkV8lVooD35v
         NlWnLLG/OpctYUNETJFX/Q09HsZYZpWkEZGa5CMzpx3lzONPH0OhmDkZUoEZnFY+WuK4
         Clfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297082; x=1758901882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mk5UbU1vmdkhvVI9gXoWyB4lbjlenJW2I4nrsVx97aE=;
        b=VsOLGWZHXY6T0QCn1gd5iOOJkr0f1VcMQEzQQVMBi9C7ARwpPOMsbqgvTvQ4iscE8E
         3fTLxGCbkczh/+sPkqbU4GD4C/cc3ETji5PhbbVJdeodYdjQURygw6P1+W/bhGJ+35cO
         BlGdMvnnlXgTDhUs6iL1gv6l9DuGCeoSCPuQI5VfQK/UrPpiGtqeQyEYP8RjMYHGfMee
         f+UoDEqhNKTtAjGZq/IcchDT21ZrX1P8/jQlZeVGKuPJe7/HDd6OREnUwbgu5wkH97DJ
         Eb5uLnLFAfNkID6LnKe/wbDKjP49dO8gpLIoIg+C260vyHU289QIMaMAiLYXPYqHsYPG
         Vpgg==
X-Forwarded-Encrypted: i=1; AJvYcCWZOgQzFBkRWFJ+tlz1X9Fs3LBYEdlG5oUvT1/9iQ8siNjiP9RFwVQe+yuDxDmUaLLFxYE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLwXuOsRyCuwL07JbJxoS7uXQJKF/xdytf5VTQs9++6cwX+o0o
	vdk/ePk2c+USiI+E1LHi3Ke9GPSMaNatxd8CjNY5bfo1I+h0KunTWPGJy9BOagPXMRQ=
X-Gm-Gg: ASbGncvvKFTYq6wjNcUOO3i8m5Z3dTYGsWpedwszQcjFKz2Sh3codg+V75Cv2/h84az
	Zt7oFRKcoEIj+dNIliwEKiFJXt0mzBMLHac+XPeM9td/P55QieSXVKIc1cnUdB4ixFhq3BtjvDT
	I51+LIQXmEqaTKTXZQ3NSzKVRolpWwupuZPohZP9MFf5Y/r1d2P3D5JyyJjIzxAJbCdy4kU3VMx
	HMxw122cMHrjd5AN+miZK+YP+MaGb7GONyUvqWJv/FUtTSxYQMV/UHzXsOVQb1f5J/aQlLS2eqN
	7c4HjSTHEb1T3J9wjgrwMBlcf58Jtk1oqvMzpYRD0tuZdOg4uLHdceKiuUSnZ8Kg4gr8Tf7hUEs
	V9pweYyB8shFImFNdWvi3q/VCiqvmtVfdHN8pXE6C75oNsVDy1XA7upJ9jD6NqFsgOVy//jPnA+
	dV1g==
X-Google-Smtp-Source: AGHT+IEottwmKNmGH3CS9GghPYQKwlqbFMuq8pbSqNH1dciybusPD40QQuLbFVR/u9qMf8tPOI+eLA==
X-Received: by 2002:a05:600c:350d:b0:45f:2843:e779 with SMTP id 5b1f17b1804b1-467ee3057d8mr35673815e9.8.1758297082008;
        Fri, 19 Sep 2025 08:51:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-469bd07268csm13103315e9.14.2025.09.19.08.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:51:21 -0700 (PDT)
Message-ID: <d9392dbc-806a-41df-8992-28c3d6132309@linaro.org>
Date: Fri, 19 Sep 2025 17:51:20 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] thermal: qoriq: add i.MX93 tmu support
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alice Guo <alice.guo@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com>
 <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/08/2025 08:23, Jacky Bai wrote:
> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
> from the ID register is the same the one used on some of the QorIQ
> platform, but the config has some slight differance. Add i.MX93 compatible
> string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   - v4 changes:
>    - no
> 
>   - v3 changes:
>    - use the drv data struct for match data and refine the code
>    - update the copyright
> 
>   - v2 changes:
>    - use the compatible match data to identify the i.MX93 TMU variant
> ---
>   drivers/thermal/qoriq_thermal.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
> index 01b58be0dcc64d14ca5e4bba654eed8f15e827fc..b2e634547271dcf512c714907baa162921d2d527 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   //
>   // Copyright 2016 Freescale Semiconductor, Inc.
> +// Copyright 2025 NXP
>   
>   #include <linux/clk.h>
>   #include <linux/err.h>
> @@ -24,6 +25,7 @@
>   #define TMTMIR_DEFAULT	0x0000000f
>   #define TIER_DISABLE	0x0
>   #define TEUMR0_V2		0x51009c00
> +#define TEUMR0_V21		0x55000c00
>   #define TMSARA_V2		0xe
>   #define TMU_VER1		0x1
>   #define TMU_VER2		0x2
> @@ -66,6 +68,8 @@
>   						   */
>   #define REGS_V2_TEUMR(n)	(0xf00 + 4 * (n))
>   
> +#define GET_TEUMR0(drvdata)	(drvdata && drvdata->teumr0 ? drvdata->teumr0 : TEUMR0_V2)

This is not adequate for code which will evolve. Please don't use this 
macro.

>   /*
>    * Thermal zone data
>    */
> @@ -73,12 +77,17 @@ struct qoriq_sensor {
>   	int				id;
>   };
>   
> +struct tmu_drvdata {
> +	u32 teumr0;
> +};
> +
>   struct qoriq_tmu_data {
>   	int ver;
>   	u32 ttrcr[NUM_TTRCR_MAX];
>   	struct regmap *regmap;
>   	struct clk *clk;
>   	struct qoriq_sensor	sensor[SITES_MAX];
> +	const struct tmu_drvdata *drvdata;

The drvdata pointer is not usually used.

	u32 model;

>   };
>   
>   static struct qoriq_tmu_data *qoriq_sensor_to_data(struct qoriq_sensor *s)
> @@ -234,7 +243,7 @@ static void qoriq_tmu_init_device(struct qoriq_tmu_data *data)
>   		regmap_write(data->regmap, REGS_TMTMIR, TMTMIR_DEFAULT);
>   	} else {
>   		regmap_write(data->regmap, REGS_V2_TMTMIR, TMTMIR_DEFAULT);
> -		regmap_write(data->regmap, REGS_V2_TEUMR(0), TEUMR0_V2);
> +		regmap_write(data->regmap, REGS_V2_TEUMR(0), GET_TEUMR0(data->drvdata));

		
	regmap_write(data->regmap, REGS_V2_TEUMR(0), data->model);
>   	}
>   
>   	/* Disable monitoring */
> @@ -319,6 +328,8 @@ static int qoriq_tmu_probe(struct platform_device *pdev)
>   
>   	data->ver = (ver >> 8) & 0xff;
>   
> +	data->drvdata = of_device_get_match_data(&pdev->dev);
> +
>   	qoriq_tmu_init_device(data);	/* TMU initialization */
>   
>   	ret = qoriq_tmu_calibration(dev, data);	/* TMU calibration */
> @@ -376,9 +387,14 @@ static int qoriq_tmu_resume(struct device *dev)
>   static DEFINE_SIMPLE_DEV_PM_OPS(qoriq_tmu_pm_ops,
>   				qoriq_tmu_suspend, qoriq_tmu_resume);
>   
> +static const struct tmu_drvdata imx93_data = {
> +	.teumr0 = TEUMR0_V21,
> +};
> +

Do the change for everyone

static const struct tmu_drvdata imx8mq_data = {
	.model = TEUMR0_V2,
};

static const struct tmu_drvdata qoriq_data = {
	.model = TEUMR0_V2,
};

>   static const struct of_device_id qoriq_tmu_match[] = {
>   	{ .compatible = "fsl,qoriq-tmu", },
>   	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,imx93-tmu", .data = &imx93_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, qoriq_tmu_match);

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
