Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634B19C564
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287293; cv=none; b=fvBRl4RCjPoRKrdUb1996uGmQzEyPZ4BjR7KgSg+FIQ1eJzYKf8SQ4z0kbAqxOaBQRcBXzGWaeY+Dbvu081sFraHbHHUTgENc/F1sU/Rk6iXuBito2FveBWy4eywaQ9QUJWBTRI/0V7aepT2gNRMXLlbcJ2HM5RW57S6JqrDxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287293; c=relaxed/simple;
	bh=v9jLjjvwoKPM7C9aTg0cuvm7/8/aoh5fXGwVeHKRXMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UxZvlqamAhYzx+ge1Qp4rZnPO0jYaydNwfLZpWMzzXDwx8gOIOEpvzDo+y1cqfehgWzMdQQuOlnM+2NSsLZeLasnFOo2xUN9JoJV8Od38dO9Kw6rihrLQfw+Crj2xTbLy6n1blHEseji7Zw5XQqeYrX7Dq5z+VUZWq4puWwSuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YLFIruWP; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YLFIruWP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2948360003;
	Mon,  2 Sep 2024 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725287290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPsXU8s4xSlfCi2ei8mMQVrT3eZ7dvgcLn4ER60DDQk=;
	b=YLFIruWPdvEyIIaxTPWbqmBqIi+ZsD11uCkcQLfBui6zK8jeFyxE0XKtBsZvbBZKJyAQGo
	GE5QqyECOCOkzGpk5fkooLny1ftx/vrNna/6PvkBuxO2D7gByknZ9eLxrMwUCuRVHZ3m1P
	se5KgLavzvupZPWlDgkmi+JNZ4j7TFyJO9vgNGuHEyyA7rRH867bXxAhFZqS6PSLg5Vzjz
	75VBITWhqWe5MBLRkivTyDUE9eA11No4ZoseM53qpLmgjAwDM4B7GxuryHs2inz5VwR8qk
	qPC02BWVidXTl8/PXVNq7sy/ZPbmHhz42pPkMo7ynD4a3Xu8tid8HvjvUpzmog==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andrew Davis <afd@ti.com>, Andre Przywara <andre.przywara@arm.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Daniel Mack
 <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 3/7] ARM: orion5x: Switch to new sys-off handler API
In-Reply-To: <20240729123538.175704-4-afd@ti.com>
References: <20240729123538.175704-1-afd@ti.com>
 <20240729123538.175704-4-afd@ti.com>
Date: Mon, 02 Sep 2024 16:28:08 +0200
Message-ID: <87mskqf7uv.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi Andrew,

> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied on mvebu/arm

Thanks,

Gregory

> ---
>  arch/arm/mach-orion5x/board-mss2.c             | 2 +-
>  arch/arm/mach-orion5x/dns323-setup.c           | 6 +++---
>  arch/arm/mach-orion5x/kurobox_pro-setup.c      | 2 +-
>  arch/arm/mach-orion5x/mv2120-setup.c           | 2 +-
>  arch/arm/mach-orion5x/net2big-setup.c          | 2 +-
>  arch/arm/mach-orion5x/terastation_pro2-setup.c | 2 +-
>  arch/arm/mach-orion5x/ts209-setup.c            | 2 +-
>  arch/arm/mach-orion5x/ts409-setup.c            | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-orion5x/board-mss2.c b/arch/arm/mach-orion5x/board-mss2.c
> index b0f16d223adf5..9e3d69891d2f6 100644
> --- a/arch/arm/mach-orion5x/board-mss2.c
> +++ b/arch/arm/mach-orion5x/board-mss2.c
> @@ -82,5 +82,5 @@ static void mss2_power_off(void)
>  void __init mss2_init(void)
>  {
>  	/* register mss2 specific power-off method */
> -	pm_power_off = mss2_power_off;
> +	register_platform_power_off(mss2_power_off);
>  }
> diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
> index 062109efa0ecc..fcd38ff7ca459 100644
> --- a/arch/arm/mach-orion5x/dns323-setup.c
> +++ b/arch/arm/mach-orion5x/dns323-setup.c
> @@ -700,7 +700,7 @@ static void __init dns323_init(void)
>  		if (gpio_request(DNS323_GPIO_POWER_OFF, "POWEROFF") != 0 ||
>  		    gpio_direction_output(DNS323_GPIO_POWER_OFF, 0) != 0)
>  			pr_err("DNS-323: failed to setup power-off GPIO\n");
> -		pm_power_off = dns323a_power_off;
> +		register_platform_power_off(dns323a_power_off);
>  		break;
>  	case DNS323_REV_B1:
>  		/* 5182 built-in SATA init */
> @@ -717,7 +717,7 @@ static void __init dns323_init(void)
>  		if (gpio_request(DNS323_GPIO_POWER_OFF, "POWEROFF") != 0 ||
>  		    gpio_direction_output(DNS323_GPIO_POWER_OFF, 0) != 0)
>  			pr_err("DNS-323: failed to setup power-off GPIO\n");
> -		pm_power_off = dns323b_power_off;
> +		register_platform_power_off(dns323b_power_off);
>  		break;
>  	case DNS323_REV_C1:
>  		/* 5182 built-in SATA init */
> @@ -727,7 +727,7 @@ static void __init dns323_init(void)
>  		if (gpio_request(DNS323C_GPIO_POWER_OFF, "POWEROFF") != 0 ||
>  		    gpio_direction_output(DNS323C_GPIO_POWER_OFF, 0) != 0)
>  			pr_err("DNS-323: failed to setup power-off GPIO\n");
> -		pm_power_off = dns323c_power_off;
> +		register_platform_power_off(dns323c_power_off);
>  
>  		/* Now, -this- should theoretically be done by the sata_mv driver
>  		 * once I figure out what's going on there. Maybe the behaviour
> diff --git a/arch/arm/mach-orion5x/kurobox_pro-setup.c b/arch/arm/mach-orion5x/kurobox_pro-setup.c
> index acba066180801..339b10891808f 100644
> --- a/arch/arm/mach-orion5x/kurobox_pro-setup.c
> +++ b/arch/arm/mach-orion5x/kurobox_pro-setup.c
> @@ -373,7 +373,7 @@ static void __init kurobox_pro_init(void)
>  	i2c_register_board_info(0, &kurobox_pro_i2c_rtc, 1);
>  
>  	/* register Kurobox Pro specific power-off method */
> -	pm_power_off = kurobox_pro_power_off;
> +	register_platform_power_off(kurobox_pro_power_off);
>  }
>  
>  #ifdef CONFIG_MACH_KUROBOX_PRO
> diff --git a/arch/arm/mach-orion5x/mv2120-setup.c b/arch/arm/mach-orion5x/mv2120-setup.c
> index b7327a6128353..5b0249f109cde 100644
> --- a/arch/arm/mach-orion5x/mv2120-setup.c
> +++ b/arch/arm/mach-orion5x/mv2120-setup.c
> @@ -238,7 +238,7 @@ static void __init mv2120_init(void)
>  	if (gpio_request(MV2120_GPIO_POWER_OFF, "POWEROFF") != 0 ||
>  	    gpio_direction_output(MV2120_GPIO_POWER_OFF, 1) != 0)
>  		pr_err("mv2120: failed to setup power-off GPIO\n");
> -	pm_power_off = mv2120_power_off;
> +	register_platform_power_off(mv2120_power_off);
>  }
>  
>  /* Warning: HP uses a wrong mach-type (=526) in their bootloader */
> diff --git a/arch/arm/mach-orion5x/net2big-setup.c b/arch/arm/mach-orion5x/net2big-setup.c
> index 6ad9740b426b6..4afd9b4c71a94 100644
> --- a/arch/arm/mach-orion5x/net2big-setup.c
> +++ b/arch/arm/mach-orion5x/net2big-setup.c
> @@ -423,7 +423,7 @@ static void __init net2big_init(void)
>  
>  	if (gpio_request(NET2BIG_GPIO_POWER_OFF, "power-off") == 0 &&
>  	    gpio_direction_output(NET2BIG_GPIO_POWER_OFF, 0) == 0)
> -		pm_power_off = net2big_power_off;
> +		register_platform_power_off(net2big_power_off);
>  	else
>  		pr_err("net2big: failed to configure power-off GPIO\n");
>  
> diff --git a/arch/arm/mach-orion5x/terastation_pro2-setup.c b/arch/arm/mach-orion5x/terastation_pro2-setup.c
> index 23a5521c68336..a9f01859d1012 100644
> --- a/arch/arm/mach-orion5x/terastation_pro2-setup.c
> +++ b/arch/arm/mach-orion5x/terastation_pro2-setup.c
> @@ -349,7 +349,7 @@ static void __init tsp2_init(void)
>  	i2c_register_board_info(0, &tsp2_i2c_rtc, 1);
>  
>  	/* register Terastation Pro II specific power-off method */
> -	pm_power_off = tsp2_power_off;
> +	register_platform_power_off(tsp2_power_off);
>  }
>  
>  MACHINE_START(TERASTATION_PRO2, "Buffalo Terastation Pro II/Live")
> diff --git a/arch/arm/mach-orion5x/ts209-setup.c b/arch/arm/mach-orion5x/ts209-setup.c
> index bab8ba0e01ab9..de9092e992c56 100644
> --- a/arch/arm/mach-orion5x/ts209-setup.c
> +++ b/arch/arm/mach-orion5x/ts209-setup.c
> @@ -314,7 +314,7 @@ static void __init qnap_ts209_init(void)
>  	i2c_register_board_info(0, &qnap_ts209_i2c_rtc, 1);
>  
>  	/* register tsx09 specific power-off method */
> -	pm_power_off = qnap_tsx09_power_off;
> +	register_platform_power_off(qnap_tsx09_power_off);
>  }
>  
>  MACHINE_START(TS209, "QNAP TS-109/TS-209")
> diff --git a/arch/arm/mach-orion5x/ts409-setup.c b/arch/arm/mach-orion5x/ts409-setup.c
> index 8131982c10d97..725688aa5cba7 100644
> --- a/arch/arm/mach-orion5x/ts409-setup.c
> +++ b/arch/arm/mach-orion5x/ts409-setup.c
> @@ -312,7 +312,7 @@ static void __init qnap_ts409_init(void)
>  	platform_device_register(&ts409_leds);
>  
>  	/* register tsx09 specific power-off method */
> -	pm_power_off = qnap_tsx09_power_off;
> +	register_platform_power_off(qnap_tsx09_power_off);
>  }
>  
>  MACHINE_START(TS409, "QNAP TS-409")
> -- 
> 2.39.2
