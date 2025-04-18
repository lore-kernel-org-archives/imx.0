Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FEB2528EA
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970759; cv=none; b=n86ZtlokCplMv6u35MQ1BVNGefp4y031achnO49+MFaxSPbrosBBFlh2H4vlQWJPayjDIvBYmgPXhKQr4HRhDC+ivzcB0WkjBD0rY1OYG9d7ZiDxZ0jyDcTo2XbuAtBz77JqN3pBHuRn0IuPZv44CgLR3RUNxnTip/Oi5deQVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970759; c=relaxed/simple;
	bh=f2niFzj2+T4w38MzzaQOnsBrvuhWF82yvxdzktB/quw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU8WIkeUI4FiwTpfJvsJafkbhBoAQQUYt90HTmEeyKGgJoBPjt/g4f8mnLtupMbFIIdG7lLDxD0/iYReNljQfThRFID5PcClRr8hUIGbKTQg54HcVq16VbKpQQKTIjK3ZiT3e45TsQQKIhPH2PvbH0F6X2MQEfOSULP3J/jsAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfw7SO0N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfw7SO0N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12326405e9.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744970755; x=1745575555; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTlk+jYHZEiHwrDu7oq1VdZKiF0Z5rQ01+MOkfIYifY=;
        b=yfw7SO0NB5uaypUfDv2AG9jwiG4+m7oTj3QZEjnC+5cy10AxQAl7mwTQBhFHMgNOkt
         I/sAT6gdYGdu7d8juUJbDiyUPulWuqtqhayKUfdF6g5fGdfHQxsqVu6D6Qq9VE/kq3Qv
         cBxXBePVri2gHSpc6wIJViB+9q12SYSZyj7jaAAF4tUUL624teCKf68eQ6+H2x3Wh9Yd
         Kdr+SthHDG2pmf02f4gRUdmIhuWAP9734tJwHiBFd65vILQMHTbG5z6HwCzYFikQyvIE
         OtIlUVqVVVDxp6xesY1pVQTLnQi3jHAGTJGPSNBuaYTFWCb26h6phWZikxS+inf4UDtx
         WY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744970755; x=1745575555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTlk+jYHZEiHwrDu7oq1VdZKiF0Z5rQ01+MOkfIYifY=;
        b=QGBTSIcndEem8OaC4CSoHfuF/Nl93yfEvDxKxnrVNYqet9lqPG27BCui8KzLqT6IPS
         bSp4yJ4brfYC28tCs/YB0dWw1klrD2h6sEQ/7nsz9nEzoYdndF5W8eZaq1KHZOMziZXb
         sfWbpoBg8saYL7jg9XLArwMV/kuQD0qS393milRc4OxUWwAQ1BEqmww3I0SQrvVih/uj
         1V+ZudeGH3yr/VdkxHMUbpJ9TmZ5mmFqPz0FeYiZ8LdJoLr01DowiRzjqijUffELtQjB
         RviU0ES4gqgd3gXS/UFdYY6NfPwCoU9lAVCDboARfAELocOOYrSTmyTpsXUjKmBb2Bzi
         AuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXspTGXUArEZNuVPQervt+dw7SmrCa1ONEjQlog5pOhE74+owZeq8sLuhdEEh9ed21QkoQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9SSvUSBj6RttUiaJXixtwsVG9YgylsjTCpeadOFZ18jUI2DYk
	ss+3SFIXxPCs0Bq32zUw86VzRxV/HJwud3n0z3x2WHzvlt4ih6aPwLRszQix4eo=
X-Gm-Gg: ASbGnctFVk7STFqEJ3QbK9RAxDhDncdcZP3A4NdGI7/VnP0wloIauj8dboWTG2OKVJC
	6psP64hRMnx5s6NMZPeqgt0bZ9HPVGoMehwMG+AR1wGqD8O56FrDXgdU1hqk5cNmj4637BWoelr
	3U+Bo8ROTJiTT5hz7jop5i0TsJXaUoAVwiFDY8x8HkJ41V7l9CxLeoD9gMna/G8347Wk/fKug8w
	YuZZkvfqvGgB68DPlpZpGKR5NZkSjcUY/YDUMhL6OZxmSAoTTkEXBafEyPfPLIeoS82YyTpqgap
	chL1t1p+7RsC+WiruSpMQhlzHBlvQACtwKCs9tYFkXuvYuiS9gxXjjY+azDo4JdHo2CESFKjkOV
	08Fk=
X-Google-Smtp-Source: AGHT+IE32VVV4WI0syEHCfftDy3qQR8UsE5hWgnvTO3T4+yc+FIYsXr0vx8CYH0HyyE7uZXj039ibg==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr20867675e9.15.1744970754834;
        Fri, 18 Apr 2025 03:05:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd5fsm16485565e9.22.2025.04.18.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:05:54 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:05:52 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RESEND v6 2/2] thermal: imx91: Add support for i.MX91
 thermal monitoring unit
Message-ID: <aAIkAF_AHta8_vuS@mai.linaro.org>
References: <20250407-imx91tmu-v6-0-e48c2aa3ae44@nxp.com>
 <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>

On Mon, Apr 07, 2025 at 04:05:40PM -0400, Frank Li wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Introduce support for the i.MX91 thermal monitoring unit, which features a
> single sensor for the CPU. The register layout differs from other chips,
> necessitating the creation of a dedicated file for this.
> 
> This sensor provides a resolution of 1/64°C (6-bit fraction). For actual
> accuracy, refer to the datasheet, as it varies depending on the chip grade.
> Provide an interrupt for end of measurement and threshold violation and
> Contain temperature threshold comparators, in normal and secure address
> space, with direction and threshold programmability.
> 
> Datasheet Link: https://www.nxp.com/docs/en/data-sheet/IMX91CEC.pdf
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v5 to v6
> - remove Macro's review tag
> - remove mutex lock
> - use set_trips callback
> 
> Change from v4 to v5
> - add irq support
> - use period mode
> - Marco, if need drop review tag, let me know
> 
> Change from v3 to v4
> - Add Macro's review tag
> - Use devm_add_action()
> - Move pm_runtim_put before thermal_of_zone_register()
> 
> change from v2 to v3
> - add IMX91_TMU_ prefix for register define
> - remove unused register define
> - fix missed pm_runtime_put() at error path in imx91_tmu_get_temp()
> - use dev variable in probe function
> - use pm_runtime_set_active() in probe
> - move START to imx91_tmu_get_temp()
> - use DEFINE_RUNTIME_DEV_PM_OPS()
> - keep set reset value because there are not sw "reset" bit in controller,
> uboot may change and enable tmu.
> 
> change from v1 to v2
> - use low case for hexvalue
> - combine struct imx91_tmu and tmu_sensor
> - simplify imx91_tmu_start() and imx91_tmu_enable()
> - use s16 for imx91_tmu_get_temp(), which may negative value
> - use reverse christmas tree style
> - use run time pm
> - use oneshot to sample temp
> - register thermal zone after hardware init
> ---
>  drivers/thermal/Kconfig         |  10 +
>  drivers/thermal/Makefile        |   1 +
>  drivers/thermal/imx91_thermal.c | 398 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index d3f9686e26e71..78a05d1030882 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -296,6 +296,16 @@ config IMX8MM_THERMAL
>  	  cpufreq is used as the cooling device to throttle CPUs when the passive
>  	  trip is crossed.
>  
> +config IMX91_THERMAL
> +	tristate "Temperature sensor driver for NXP i.MX91 SoC"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Include one sensor and six comparators. Each of them compares the
> +	  temperature value (from the sensor) against the programmable
> +	  threshold values. The direction of the comparison is configurable
> +	  (greater / lesser than).
> +
>  config K3_THERMAL
>  	tristate "Texas Instruments K3 thermal support"
>  	depends on ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 9abf43a74f2bb..08da241e6a598 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_ARMADA_THERMAL)	+= armada_thermal.o
>  obj-$(CONFIG_IMX_THERMAL)	+= imx_thermal.o
>  obj-$(CONFIG_IMX_SC_THERMAL)	+= imx_sc_thermal.o
>  obj-$(CONFIG_IMX8MM_THERMAL)	+= imx8mm_thermal.o
> +obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
>  obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
>  obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
>  obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_thermal.c
> new file mode 100644
> index 0000000000000..e8deb0b07dc98
> --- /dev/null
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/thermal.h>
> +#include <linux/units.h>
> +
> +#define REG_SET					0x4
> +#define REG_CLR					0x8
> +#define REG_TOG					0xc
> +
> +#define IMX91_TMU_CTRL0				0x0
> +#define   IMX91_TMU_CTRL0_THR1_IE		BIT(9)
> +#define   IMX91_TMU_CTRL0_THR1_MASK		GENMASK(3, 2)
> +#define   IMX91_TMU_CTRL0_CLR_FLT1		BIT(21)
> +
> +#define IMX91_TMU_THR_MODE_LE			0
> +#define IMX91_TMU_THR_MODE_GE			1
> +
> +#define IMX91_TMU_STAT0				0x10
> +#define   IMX91_TMU_STAT0_THR1_IF		BIT(9)
> +#define   IMX91_TMU_STAT0_THR1_STAT		BIT(13)
> +#define   IMX91_TMU_STAT0_DRDY0_IF_MASK		BIT(16)
> +
> +#define IMX91_TMU_DATA0				0x20
> +
> +#define IMX91_TMU_CTRL1				0x200
> +#define IMX91_TMU_CTRL1_EN			BIT(31)
> +#define IMX91_TMU_CTRL1_START			BIT(30)
> +#define IMX91_TMU_CTRL1_STOP			BIT(29)
> +#define IMX91_TMU_CTRL1_RES_MASK		GENMASK(19, 18)
> +#define IMX91_TMU_CTRL1_MEAS_MODE_MASK		GENMASK(25, 24)
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_SINGLE	0
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_CONTINUES	1
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_PERIODIC	2
> +
> +#define IMX91_TMU_THR_CTRL01			0x30
> +#define   IMX91_TMU_THR_CTRL01_THR1_MASK	GENMASK(31, 16)
> +
> +#define IMX91_TMU_REF_DIV			0x280
> +#define IMX91_TMU_DIV_EN			BIT(31)
> +#define IMX91_TMU_DIV_MASK			GENMASK(23, 16)
> +#define IMX91_TMU_DIV_MAX			255
> +
> +#define IMX91_TMU_PUD_ST_CTRL			0x2b0
> +#define IMX91_TMU_PUDL_MASK			GENMASK(23, 16)
> +
> +#define IMX91_TMU_TRIM1				0x2e0
> +#define IMX91_TMU_TRIM2				0x2f0
> +
> +#define IMX91_TMU_TEMP_LOW_LIMIT		-40000
> +#define IMX91_TMU_TEMP_HIGH_LIMIT		125000
> +
> +#define IMX91_TMU_DEFAULT_TRIM1_CONFIG		0xb561bc2d
> +#define IMX91_TMU_DEFAULT_TRIM2_CONFIG		0x65d4
> +
> +#define IMX91_TMU_PERIOD_CTRL			0x270
> +#define   IMX91_TMU_PERIOD_CTRL_MEAS_MASK	GENMASK(23, 0)
> +
> +#define IMX91_TMP_FRAC				64
> +
> +struct imx91_tmu {
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct device *dev;
> +	struct thermal_zone_device *tzd;
> +	int high;
> +	bool enable;
> +};
> +
> +static void imx91_tmu_start(struct imx91_tmu *tmu, bool start)
> +{
> +	u32 val = start ? IMX91_TMU_CTRL1_START : IMX91_TMU_CTRL1_STOP;
> +
> +	writel_relaxed(val, tmu->base + IMX91_TMU_CTRL1 + REG_SET);
> +}
> +
> +static void imx91_tmu_enable(struct imx91_tmu *tmu, bool enable)
> +{
> +	u32 reg = IMX91_TMU_CTRL1;
> +
> +	reg += enable ? REG_SET : REG_CLR;
> +
> +	writel_relaxed(IMX91_TMU_CTRL1_EN, tmu->base + reg);
> +}
> +
> +static int imx91_tmu_to_mcelsius(int x)
> +{
> +	return x * MILLIDEGREE_PER_DEGREE / IMX91_TMP_FRAC;
> +}
> +
> +static int imx91_tmu_from_mcelsius(int x)
> +{
> +	return x * IMX91_TMP_FRAC / MILLIDEGREE_PER_DEGREE;
> +}
> +
> +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	s16 data;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;

Why using pm_runtime* all over the place ?

It would make sense to have in the probe/remove functions (or in the set_mode -
enabled / disabled), suspend / resume but the other place it does not make
sense IMO. If the sensor is enabled by the set_mode function and then
pm_runtime_get() is called, then the ref is taken during all the time the
sensor is in use, so others pm_runtime_get / pm_runtime_put will be helpless,
no ?


> +	/* DATA0 is 16bit signed number */
> +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> +	*temp = imx91_tmu_to_mcelsius(data);
> +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> +		ret = -EAGAIN;

When the measured temperature can be out of limits ?

> +	if (*temp <= tmu->high && tmu->enable) {

I suggest to provide a change in the thermal core to return -EAGAIN if the
thermal zone is not enabled when calling thermal_zone_get_temp() and get rid of the tmu->enable

> +		writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +	}

For my understanding what are for these REG_CLR and REG_SET in this function?

> +	pm_runtime_put(tmu->dev);
> +
> +	return ret;
> +}
> +
> +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	int val;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> +		return -EINVAL;
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +	/* Comparator1 for temperature threshold */
> +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> +
> +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +
> +	tmu->high = high;

Why is 'high' needed?

> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +	pm_runtime_put(tmu->dev);
> +
> +	return 0;
> +}
> +
> +static int imx91_init_from_nvmem_cells(struct imx91_tmu *tmu)
> +{
> +	struct device *dev = tmu->dev;
> +	u32 trim1, trim2;
> +	int ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "trim1", &trim1);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "trim2", &trim2);
> +	if (ret)
> +		return ret;
> +
> +	if (trim1 == 0 || trim2 == 0)
> +		return -EINVAL;
> +
> +	writel_relaxed(trim1, tmu->base + IMX91_TMU_TRIM1);
> +	writel_relaxed(trim2, tmu->base + IMX91_TMU_TRIM2);
> +
> +	return 0;
> +}
> +
> +static void imx91_tmu_action_remove(void *data)
> +{
> +	struct imx91_tmu *tmu = data;
> +
> +	/* disable tmu */
> +	imx91_tmu_enable(tmu, false);
> +}
> +
> +static irqreturn_t imx91_tmu_alarm_irq_thread(int irq, void *dev)
> +{
> +	struct imx91_tmu *tmu = dev;
> +	int val;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	thermal_zone_device_update(tmu->tzd, THERMAL_EVENT_UNSPECIFIED);

Ack the IRQ before calling thermal_zone_device_update()

> +	val = readl_relaxed(tmu->base + IMX91_TMU_STAT0);

One blank line to let the code breath

> +	/* Have to use CLR register to clean up w1c bits */
> +	writel_relaxed(val, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +	pm_runtime_put(tmu->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int imx91_tmu_change_mode(struct thermal_zone_device *tz, enum thermal_device_mode mode)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	int ret;
> +
> +	if (mode == THERMAL_DEVICE_ENABLED) {
> +		ret = pm_runtime_get(tmu->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		imx91_tmu_start(tmu, true);
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +		tmu->enable = true;
> +	} else {
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +		imx91_tmu_start(tmu, false);
> +		pm_runtime_put(tmu->dev);
> +		tmu->enable = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct thermal_zone_device_ops tmu_tz_ops = {
> +	.get_temp = imx91_tmu_get_temp,
> +	.change_mode = imx91_tmu_change_mode,
> +	.set_trips = imx91_tmu_set_trips,
> +};
> +

[ ... ]
