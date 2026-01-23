Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B757293C44
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184703; cv=none; b=qa6o4kpCUTWidPw9Az5LFFWqB5wbnGFMcbcU5D/TBB7dORap5yPdPhuq0ntPYSfaBFZC6m+ihyAL4N4X/gb2fwZw3PtD0Y9jlkf5XRE3a41+m7I5WqmiatM+b6EV+JxbOtAmnAFZCzKtfGl/S3y22zcqcaHfegTItynKxvAkgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184703; c=relaxed/simple;
	bh=ShDHrT3c+abDBBhxTloYbbftFyE3FCc4zYe9oXwoWjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1aMORv+yEMFrSBUUmCpiaWmZnoAM3opSAXku8O1waHmrCthbJG2jM+RBE5qotVM47Gbwh+KMn+osd3Bor+R5RbqW8SmG+bBS3pH7nuREi0DSbgzDdMwR2OQzcidbYp61nqC6Pmg0GiN4V8hPf65XDOV5nPA1GxJ833+1GDhhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpBPg/yP; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpBPg/yP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b1981ca515so2725304eec.1
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 08:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769184699; x=1769789499; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nv+D7/oDfhYCes3ePW/oYFM+Gz/3sVUZ2L90WrV7a0=;
        b=MpBPg/yPnqoTvuQcoLqeJDOK9cnsGg3toRJK5fKaPmsy0xYHbCC1oiRvm6AaYxw3Fu
         lMGDDsr1vLhoXrIlTUyj8CsTkR8UaCMf14n4bLkzVgLTGjR+boUQcqGCPRqok9WtdpGO
         FHzbS6XTlsMihgkTDZ9p/nArPOtMoR+apzVa3+k93qs4yNsk8GQzcb3qhlj1VxjIAgob
         7pFZuETz7s+UhrAFtQ1wlCVDj4pemx/MVRBYieKKtK1jH7X7IUd96ChfJyN1+n/I9UCg
         3lFx1mOMyzpis9/XbzPX0ez/YFcd7RXCjQMJXmt7D3NqFo9xo+Mm43s1OaE+g8dydnno
         4cOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184699; x=1769789499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Nv+D7/oDfhYCes3ePW/oYFM+Gz/3sVUZ2L90WrV7a0=;
        b=QUh1/pUG8FFVn8dbP/Bkz/j+OyqeD9FRNlSEAb7z3DI4vSJwH/6Z0Wg0v/AkWRjI3Q
         ZOpyRtNjo/rsg92+7xOxyXi/iAsFJlsECVYzYs/GZ6H+14z5YmsKT6TXczi+tW9dc5v5
         6rHY6zQ4L1fb/NoA1+pLxDPwPE0ZPE2GB5j21cQJo/TDSiKDexXZIL1QrJrky+1UtOpm
         McBFLpZE/t9ksWnCz4Sg49YuZsVw/K7c2L5jT0ulpcPW2Raf0DEvOADWpCVBnHYdt/rM
         meT4sQgGphLAfqm6ulDXffxI/6UaiFT/c110XIhZATWzVPW2uxF6CIjnjzSwfODj5DOe
         SQuA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ/htMWC/l9elX3jJoo7nS4+/SCoJyS0rf6dBoRZqgfypgkSyYu0BHfmuqS07gMuBorTk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLnf32dpeAa5dFTwAOs/IsNuFMXrZ2PHyndSK0rHQCKRk1+0Cy
	cyjtHrx08L014hPCvvdnisRs+eUrbMxibJY1mQDLp5ta5InPOfjjGFz8
X-Gm-Gg: AZuq6aK7T+ARuMIJc604q3Sbvog2DKRmyjYst795megw71zjWIrEJJAfWjwzzuhr5zG
	hOG3sSnVS6l6/Lrc0NOZqkIawpdMSRXnI4SUJ3V8xx7h7G/MJkijMVX1Rtuaj6zEtAT+C7eILEe
	nPLruwbRS7r5Kw8FJg6CnU+9Fbtkqoz7KzE8hPuQ7GrazJG5yZdxCyJbxWrh44ah9dErNZO3upZ
	ZbuCiW0x5MW8jAGCb6+TRP5TsAPCk5OB+7pLe1umI9ZSz9x+PnmFNc/Uik1A/PQlbowrw6Vb5gk
	nJuCtjx4kFF7s1fZtoYRoJtKcRgFdSi1VoIjzER2A5/+NHLkw9nLw+sTzFwlibQySziwgSf7afz
	hbirakvhP0xEisrgCPuhNJWp9t7Sj23nGqMv4bbTIYiw0UWWTO8i2opbvCPd4IoLoZnLxaTJrQ6
	mGDXAohG5PUvgcZcxn9PcGi6frjxOLBxaXKI2RYPpjWjEa7+8uRLnBq2H0+/qr
X-Received: by 2002:a05:7300:e613:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2b739bcd778mr1678782eec.39.1769184699220;
        Fri, 23 Jan 2026 08:11:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1bc8sm3455841eec.22.2026.01.23.08.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 08:11:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f8af59e1-29a0-4b32-929a-b30580dad62a@roeck-us.net>
Date: Fri, 23 Jan 2026 08:11:36 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: aaeon: Add watchdog driver for
 SRG-IMX8PL MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
 <20260123-dev-b4-aaeon-mcu-driver-v2-5-9f4c00bfb5cb@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-5-9f4c00bfb5cb@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/26 01:54, Thomas Perrot (Schneider Electric) wrote:
> Add watchdog driver for the Aaeon SRG-IMX8PL embedded controller.
> This driver provides system monitoring and recovery capabilities
> through the MCU's watchdog timer.
> 
> The watchdog supports start, stop, and ping operations with a maximum
> hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
> The driver assumes the watchdog is already running at probe time, as
> the MCU typically enables it by default.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>   MAINTAINERS                      |   1 +
>   drivers/watchdog/Kconfig         |  10 ++++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/aaeon_mcu_wdt.c | 110 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 122 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 28dd964cdf69bdcaec3eb82d6df851a2bad47415..66cc4a5dcbe0977e6baee6d3b5e6023dcc06847b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -193,6 +193,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
>   F:	drivers/gpio/gpio-aaeon-mcu.c
>   F:	drivers/mfd/aaeon-mcu.c
> +F:	drivers/watchdog/aaeon_mcu_wdt.c
>   F:	include/linux/mfd/aaeon-mcu.h
>   
>   AAEON UPBOARD FPGA MFD DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index d3b9df7d466b0b7215ee87b3040811d44ee53d2a..1bd4a7bee303e5e2508f540dc2c16e9e19ed18b0 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -168,6 +168,16 @@ config SOFT_WATCHDOG_PRETIMEOUT
>   	  watchdog. Be aware that governors might affect the watchdog because it
>   	  is purely software, e.g. the panic governor will stall it!
>   
> +config AAEON_MCU_WATCHDOG
> +	tristate "Aaeon MCU Watchdog"
> +	depends on MFD_AAEON_MCU
> +	select WATCHDOG_CORE
> +	help
> +	  Select this option to enable watchdog timer support for the Aaeon
> +	  SRG-IMX8PL onboard microcontroller (MCU). This driver provides
> +	  watchdog functionality through the MCU, allowing system monitoring
> +	  and automatic recovery from system hangs.
> +
>   config BD957XMUF_WATCHDOG
>   	tristate "ROHM BD9576MUF and BD9573MUF PMIC Watchdog"
>   	depends on MFD_ROHM_BD957XMUF
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index ba52099b125398a32f80dad23317e223cc4af028..2deec425d3eafb6b208e061fda9f216f4baa8ecc 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
>   # ALPHA Architecture
>   
>   # ARM Architecture
> +obj-$(CONFIG_AAEON_MCU_WATCHDOG) += aaeon_mcu_wdt.o
>   obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
>   obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
>   obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
> diff --git a/drivers/watchdog/aaeon_mcu_wdt.c b/drivers/watchdog/aaeon_mcu_wdt.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..99be3ce327f44063fce6ba77a7d4efcba34361df
> --- /dev/null
> +++ b/drivers/watchdog/aaeon_mcu_wdt.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU Watchdog driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define AAEON_MCU_CONTROL_WDT	0x63
> +#define AAEON_MCU_PING_WDT	0x73
> +
> +#define AAEON_MCU_WDT_TIMEOUT         240
> +#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
> +
> +struct aaeon_mcu_wdt {
> +	struct watchdog_device wdt;
> +	struct device *dev;
> +};
> +
> +static int aaeon_mcu_wdt_cmd(struct device *dev, u8 opcode, u8 arg)
> +{
> +	u8 cmd[3] = { opcode, arg, 0x00 };
> +	u8 rsp;
> +
> +	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), &rsp, sizeof(rsp));
> +}
> +
> +static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x01);
> +}
> +
> +static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x00);
> +}
> +
> +static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_PING_WDT, 0x00);
> +}
> +
> +static const struct watchdog_info aaeon_mcu_wdt_info = {
> +	.identity	= "Aaeon MCU Watchdog",
> +	.options	= WDIOF_KEEPALIVEPING
> +};
> +
> +static const struct watchdog_ops aaeon_mcu_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= aaeon_mcu_wdt_start,
> +	.stop		= aaeon_mcu_wdt_stop,
> +	.ping		= aaeon_mcu_wdt_ping,
> +};
> +
> +static int aaeon_mcu_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct watchdog_device *wdt;
> +	struct aaeon_mcu_wdt *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = dev->parent;
> +
> +	wdt = &data->wdt;
> +	wdt->parent = dev;
> +	wdt->info = &aaeon_mcu_wdt_info;
> +	wdt->ops = &aaeon_mcu_wdt_ops;
> +	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
> +	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;

If this is the only supported timeout, and the timeout can not be updated,
that should be explained in the code. That explanation will need to include
the reason why the timeout is being fixed to 240 seconds and can not be
updated, even in software. Without that, it just does not make sense
to have a fixed hardware timeout of 25 seconds and a fixed software timeout
of 240 seconds without means to change the latter.

> +
> +	watchdog_set_drvdata(wdt, data);
> +	platform_set_drvdata(pdev, data);
> +

platform_set_drvdata() seems unnecessary; I don't see where it is used.

> +	ret = aaeon_mcu_wdt_start(wdt);
> +	if (ret)
> +		return ret;
> +
> +	set_bit(WDOG_HW_RUNNING, &wdt->status);
> +

This is only acceptable if there is no means to detect if the watchdog is
running. If so, that warrants a comment in the code.

Thanks,
Guenter

> +	return devm_watchdog_register_device(dev, wdt);
> +}
> +
> +static struct platform_driver aaeon_mcu_wdt_driver = {
> +	.driver		= {
> +		.name	= "aaeon-mcu-wdt",
> +	},
> +	.probe		= aaeon_mcu_wdt_probe,
> +};
> +
> +module_platform_driver(aaeon_mcu_wdt_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
> +MODULE_LICENSE("GPL");
> 

