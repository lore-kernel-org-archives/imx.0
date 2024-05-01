Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4912839D
	for <imx@lists.linux.dev>; Wed,  1 May 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570273; cv=none; b=esbWR2vIFin96RwOg3pOYNGBgreyun/QiiWZInnBympsgczrcVTc4Wlq/35UVokUPGSZHVnSxvdh/Nu0B3Mi69KTh8+1aUHyaoszzzxeIX6c105gnN6VrPfKfW4xqU/PYX9/YQFD0+gxNAXRS8phgoSME8bYijJ7uJMSjmUWuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570273; c=relaxed/simple;
	bh=GOV9SpBdrbLUHNqrWyub6cb3BrALMYIpAncwmbro2yc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z86CvGWTQq5ktebWtqs8Dnd8T1vLP2yrAI6oqYbvRRXoqvnWNgx7dEqPFIZO+hG8qdrjpstVkO9vXQ5ksIQ/Z6WQUaTEth093MYGJXm2DM9SuygkxD1Ws9895HlK/1rN7NhzE/KsRvfVyyP6WM30Z3gxYbxaFF+oTyu57K1QsMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=tjUJJWYA; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tjUJJWYA"
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D08333FE61
	for <imx@lists.linux.dev>; Wed,  1 May 2024 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714570260;
	bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tjUJJWYAm037n+X+UwTKteZdNy6632ZFnwu71KGJdInaF/7ZyZ5OHcbuRmgzITc5D
	 ZBySWeb18UGuT68L6WPUyzb8VsxFARFrkX1CCKY31C7XiWiBiZgcYH43xGVfvUXA0x
	 dends1qVDcrj83j/BNwKJTcFTYLeLCdmYJS6HhoelNxzQmhEOsJFqXn3N15jCsJ8b3
	 29lLID7aDaYIFp745OAylulNt2eibyhj8KjdIeDECREkuF5ocq3Fky3vEWBQTyT9Qo
	 D/pxHrqHK0Q5XsjkrVoS6WOJFdtbS0oZUyGULkZqPkjsZadqYgLBi/l5ADm0yyhWz6
	 lViiOMZM4X7tA==
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d865b3b04cso4934121fa.0
        for <imx@lists.linux.dev>; Wed, 01 May 2024 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570258; x=1715175058;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
        b=vat+4yoLOzdzjcs+04zB6wG6dWmN/7K7qdo80rudkIBxQRvzrqsJtc2HlvRpe1lar4
         QJvw9Pkzpr1ylGb5SpWWiMHsLGNsyc6RkSKKI/JyPM7sHXkPhsJV1XPBQeTgY6kS1YdX
         9Z6+1wyTAuqpIrTle6hq5EhtEQIAUcDVGlTPIYed6xA7FyglwVgvg5HPArY/YJZcutyU
         Xa32yGf7br6DK2Dd3gIDyAM/jn0oPyNuoNQ/e2db2d0c6A2n5I17A/EGSA13Zcb1o1rX
         aE1vZtg/LG3l0lDqOnLqYkg/nMJa7zcn00keDZSCTldKXnn5w/lY6osPQUBl6dqCAaXE
         BeRg==
X-Forwarded-Encrypted: i=1; AJvYcCUsyMiqa3MpiYwUvkxKYdlu7ffcFcBxdFsYnpHJcujzfi0No3KVn3ShkvGkPPD4qJZCL7GHFsuEYf9SzPkQUJq12+bP
X-Gm-Message-State: AOJu0YxlZJD6wgQAMcy8uewyGKbSwcF65NKLGF4cpzjlrgltNtmr5BEQ
	+0v4GjQEUvwxa5YCW4V7e2RZxFgsC8XgkdkBf/1q2FPInkjalgcK/TreJQ1c1F7mHW2c7wifQGA
	qeVU3eUJgbFLbK7DuIjSCNDUW9TiCGSAy3FL97HedXFhsrGnguDIGodY23Fhhi0ymb+lufrOTsd
	zBxpMmMGB57tTJiSihsbnTqcxrZk2Hjne3txdzJJW/
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id x14-20020a2ea7ce000000b002df8ce696cbmr955441ljp.8.1714570258110;
        Wed, 01 May 2024 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYT+qTSOE1Kr9KmhXevsjrdrGfobx9Pel64hRtY96pMsR8tg00NtEJfiVi5E4mSMS1jyTIKo1grrZjSHhuefw=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955417ljp.8.1714570257684; Wed, 01 May
 2024 06:30:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 08:30:56 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com> <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Wed, 1 May 2024 08:30:56 -0500
Message-ID: <CAJM55Z9RuobAMR4EaevhTPRsJe3vuruV7-_DTQYpH_w8_azkcA@mail.gmail.com>
Subject: Re: [PATCH 05/21] pinctrl: starfive: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 6df7a310c7ed..27f99183d994 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
>  	struct device *dev = sfp->gc.parent;
> -	struct device_node *child;
>  	struct pinctrl_map *map;
>  	const char **pgnames;
>  	const char *grpname;
> @@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  	nmaps = 0;
>  	ngroups = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npinmux = of_property_count_u32_elems(child, "pinmux");
>  		int npins   = of_property_count_u32_elems(child, "pins");
>
>  		if (npinmux > 0 && npins > 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  		if (npinmux == 0 && npins == 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>
> @@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins;
>  		int i;
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  			if (ret)
> -				goto put_child;
> +				goto free_map;
>
>  			for (i = 0; i < npins; i++) {
>  				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
> @@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = NULL;
> @@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  				ret = of_property_read_u32_index(child, "pins", i, &v);
>  				if (ret)
> -					goto put_child;
> +					goto free_map;
>  				pins[i] = v;
>  			}
>  		} else {
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9609eb1ecc3d..4ce080caa233 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins = of_property_count_u32_elems(child, "pinmux");
>  		int *pins;
>  		u32 *pinmux;
> @@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
>  				np, child);
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  		if (ret)
> -			goto put_child;
> +			goto free_map;
>
>  		for (i = 0; i < npins; i++)
>  			pins[i] = jh7110_pinmux_pin(pinmux[i]);
> @@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  						pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
>
> --
> 2.37.1
>
