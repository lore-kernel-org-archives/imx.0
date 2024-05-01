Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1BD12E1D5
	for <imx@lists.linux.dev>; Wed,  1 May 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570373; cv=none; b=MpBHp8WLlLXjRHjElHTc9eego01BTkTLmKPW4vgN/iaEZiVI0Rx5clUE9eAfD8li4SAmWwgt96z/DwUoJlzAVJHBlTgSt1mQ8NDslVeVzkQ3T1Vi/E8+k5WBrJhlYlz7E29LUs1jB+I251O4WnKAPCjqGD0BX5iiVvX5RqcQDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570373; c=relaxed/simple;
	bh=ZqcDVgO1hmm+00KuoWmbr7W1NZLQvg1QhUiwr8SEKP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLxe0N2aSztik36UFqDXwOY/wnY78aBWRY1YN4AkVJuNzODrnOdgGSKlwPrfrqaxpRgs+BWZb4WKZ84WolZ40jUeb8khN6V06UcYYPyHcOisOHOfHGpmmeegzl0TbwICa05iILLgcEZ75xgWdKzmgBPwI381tbXTikAP4vDDq34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMOTJZQH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMOTJZQH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34d7b0dac54so459756f8f.0
        for <imx@lists.linux.dev>; Wed, 01 May 2024 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714570370; x=1715175170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=mMOTJZQHeQBjjQCp+6iF6onn/MQqTo4T2rcD5p+srS37rMCohw+AfTKGcTGkUUqgOd
         FnFnl/vkwYA/xdTtPzuZrXHIkv3yLXJDbOZfFJZ18sJPprKOjQDxeCz+cXAqBy5H/jiq
         4eXevU2EP6wm4lPv911qG7UBObrA3JGvbMN1Kb1rZJ073gZjIiR3tLeLKrQeek2J5mKP
         1JdOKPhAXNtJtWlxYFkEC6Qi2oyV22HOcy6s665BiYdO5mQckB8wuF5gf0s0gTZjbJA5
         BfDp0xlNhSqdpWE3C0ZOKNH95ZN75k1YjKYehWQPruadgU5gXN3PBdn7wJFvBTYEAnI2
         /y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570370; x=1715175170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=OAcXtZNlPg3hjX0KHAr9hn2XLMfdLLjjDFKPQw1XOjlWdJ/3v0MTbQ8mK1Sm/Fu7NS
         Mpi69WODuODxW/ud9XrtXrFBUQgfFLfAEkCeSLJLK1v/qsDOXmwg7OPd1lkdhQE1yHLm
         FCf5KLlxXX9SoJy4AOgNcqoSbGD0BOowoKuWEm/ys5AL2v+vnQs4/hZt/q23Pbn6k+9c
         /8sKEPzR6/nUQsl7H8nhpsXLkc66goiCBf3oUsCCaFq6m/0hnK16EklJckmO1Lfs4XfT
         jUWkMyZIgAaWX6y7hqnWHhsVAAAsthOlTK0qnAPlaAzQvyoL4HF+bukNrw1mt1gt/q4c
         u3AA==
X-Forwarded-Encrypted: i=1; AJvYcCVwLW+HPim3nbNcQJyqxJEOy/R2P+InEsDtaNF89bVYWi+MvZbRGS9xC2hoxy70mgBOnTbO3jje2TR5kpDIB2NRHg2O
X-Gm-Message-State: AOJu0YzbFxbyND5T+Kebrm6vbwpAKKycDS7JeGLHMFJkJ02B1DO6eG5b
	buj/OfNHrDoPlRjdVDtng1XBYosBanGjnAB4Qc6yU0IixUqQwvvWk50LRFAJq14=
X-Google-Smtp-Source: AGHT+IHuNu3c35RsAkvpJAfWqKVWQhv6Z4Ac0yjTjDmpBKt12bv5Zna3drXEkGYfHrENBoZl/SwOjw==
X-Received: by 2002:a05:6000:24f:b0:34c:bf22:73f9 with SMTP id m15-20020a056000024f00b0034cbf2273f9mr2265612wrz.28.1714570369370;
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm32876234wrj.100.2024.05.01.06.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Date: Wed, 1 May 2024 16:32:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>

On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
>  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
>  	if (ret) {
>  		dev_err(dev, "Failed to register pinctrl\n");
> -		goto exit_out;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, iod);
>  
>  	return pinctrl_enable(iod->pctl);
> -
> -exit_out:
> -	of_node_put(np);
> -	return ret;
>  }

This will call of_node_put() on the success path so it's a behavior
change.  The original code is buggy, it's supposed to call of_node_put()
on the success path here or in ti_iodelay_remove().

If it's supposed to call of_node_put() here, then fine, this is bugfix
but if it's supposed to call it in ti_iodelay_remove() then we need to
save the pointer somewhere using no_free_ptr().  Probably saving ->np
is the safest choice?

The original code is already a little bit buggy because it doesn't
check for pinctrl_enable() errors and cleanup.


diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..f40a1476e4ff 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -156,6 +156,7 @@ struct ti_iodelay_device {
 
 	const struct ti_iodelay_reg_data *reg_data;
 	struct ti_iodelay_reg_values reg_init_conf_values;
+	struct device_node *np;
 };
 
 /**
@@ -884,7 +885,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iod);
 
-	return pinctrl_enable(iod->pctl);
+	ret = pinctrl_enable(iod->pctl);
+	if (ret)
+		goto exit_out;
+
+	iod->np = no_free_ptr(np);
+	return 0;
 
 exit_out:
 	of_node_put(np);
@@ -903,6 +909,7 @@ static void ti_iodelay_remove(struct platform_device *pdev)
 		pinctrl_unregister(iod->pctl);
 
 	ti_iodelay_pinconf_deinit_dev(iod);
+	of_node_put(iod->np);
 
 	/* Expect other allocations to be freed by devm */
 }




