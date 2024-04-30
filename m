Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763AD17584
	for <imx@lists.linux.dev>; Tue, 30 Apr 2024 05:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714454177; cv=none; b=eLCPkB5PqPW8CR8zHcp5CxBd9CFkhGBC6ijJyFLDCoh4cQkD5YREdlyw1kNOpjUSHs5d3KiHpUUxUICtth6TA3T8BSXtAV8ph6rEI+ZSqUHlubrwZbAUMaRnxcG26seuFR+1SNRceN4sUq95v7CHGIhGmb1yKNTEmUHpvsOYEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714454177; c=relaxed/simple;
	bh=bCkBpn/Vh2Kt4bDBmzkaG2zkzavinVKs6L0yROp2qXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOdt7XL9U5SW+5VzHjbaCIQ6N8+CScBJiiwjnt9YyzbohI4O/QLNdWhxGETNiXR5s1VYSR69oZlD/msFKVjsEM+BDt32rP78s2wTVxnu0dQ1U03PRmBkg5MvJbGaF75f3l/LteiSxty2gtcwW1sHTCixKgP1Yzbk6eSmi5Pc2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFfky+jQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFfky+jQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so4475626b3a.3
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454175; x=1715058975; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ynejgaDnZjcmZfXmFDrndip2YGb6tAWR1lBuHbKqsw=;
        b=sFfky+jQIcy/RX3xFfj2TwpenvDIGYIXwKN1clgcQGKgfeutBcT3VbO7n1gaqxkw+X
         J/NMDlbghArTXIvzKhwQyGTD6A5ahphdw29lAkhvBajD7yj1uQrliuvD+rH8FZCkaJWa
         Nla9HOg36fMI69NRx02x5RaAUXeWJiQ55a51HR/+MvhA2e4BhVs/IKGayvebAeS2/NSK
         sWdW8wIIc+EPU8mKPheltUaaHRhLRm+/uPbcpT42F1rLFW3XldMz2BvcLgov9kCAwRQL
         GFt/+z613rvuAkzS02wNls38l0GNR7049RyNlX388gLTKxAGRyWKB7m0jCy0aZNdsUCq
         sLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454175; x=1715058975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ynejgaDnZjcmZfXmFDrndip2YGb6tAWR1lBuHbKqsw=;
        b=iWMMpkF+W7ASDXwG+oxj6MgrwrZu5QmUyX96dmaK8ul8kih7zHvj1/IiKJm8AkpHzW
         jAga6r+1Z8lPita460QvJ98TjzcVdRkAJoM0/w24sB/sbL1UM1OpqPDeNz+aYkh1UC0U
         IMiIKtCECOAvHesLzxbPcdpaoJ1y9eJ+/AvAF5nyyb3lFcTPmdAD5+Igt1NuRrbmIiJg
         5UAywqe+CviR1fWtHhQLKnp+qblWQURjymhcJgO2d7pwYZmSfCJxsXhFe+x4wc2LwNyv
         aoOaAS6mDyD2R+ku2rcgh+DHBN78NREaAsSC+c40xAmhEgIgU9L1cF0CMXzmamWCn4Hc
         M5vg==
X-Forwarded-Encrypted: i=1; AJvYcCVX/D9oaR6KP/r7cgIS0ENutKB1pqiilmtDUhHt99shopjxr5joNT+4/atBY5lL4ooXmWOpALk7UexRzTYlT13aZ1fw
X-Gm-Message-State: AOJu0YxcDKZfz7QnPCIqzFF5gArMdbbLvVU39L+H3cfN0YeDwcUJjcV4
	gDGe0EjNvnC78omK9cF8EVQgG4eXQdCrN4iCYJgPWJpb1A0K0rwseMbzcmsXMw==
X-Google-Smtp-Source: AGHT+IGeASrZZdOKkLRwqMeew25lnfW2E16O02bRTclJxxqzXXmg/MPOAdDxiUpkYBPU/+iJ5ms0XA==
X-Received: by 2002:a05:6a20:12cf:b0:1a9:6cdd:6907 with SMTP id v15-20020a056a2012cf00b001a96cdd6907mr14733071pzg.29.1714454174430;
        Mon, 29 Apr 2024 22:16:14 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902cf4500b001e2c1ce5bb0sm21409980plg.83.2024.04.29.22.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:16:14 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v3 5/5] PCI: kirin: Convert to agnostic GPIO API
Message-ID: <20240430051604.GA3301@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429102510.2665280-6-andriy.shevchenko@linux.intel.com>

On Mon, Apr 29, 2024 at 01:23:22PM +0300, Andy Shevchenko wrote:
> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-kirin.c | 105 ++++++++----------------
>  1 file changed, 35 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index d5523f302102..d1f54f188e71 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -12,12 +12,10 @@
>  #include <linux/compiler.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/pci.h>
> @@ -78,16 +76,16 @@ struct kirin_pcie {
>  	void		*phy_priv;	/* only for PCIE_KIRIN_INTERNAL_PHY */
>  
>  	/* DWC PERST# */
> -	int		gpio_id_dwc_perst;
> +	struct gpio_desc *id_dwc_perst_gpio;
>  
>  	/* Per-slot PERST# */
>  	int		num_slots;
> -	int		gpio_id_reset[MAX_PCI_SLOTS];
> +	struct gpio_desc *id_reset_gpio[MAX_PCI_SLOTS];
>  	const char	*reset_names[MAX_PCI_SLOTS];
>  
>  	/* Per-slot clkreq */
>  	int		n_gpio_clkreq;
> -	int		gpio_id_clkreq[MAX_PCI_SLOTS];
> +	struct gpio_desc *id_clkreq_gpio[MAX_PCI_SLOTS];
>  	const char	*clkreq_names[MAX_PCI_SLOTS];
>  };
>  
> @@ -381,15 +379,20 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  	pcie->n_gpio_clkreq = ret;
>  
>  	for (i = 0; i < pcie->n_gpio_clkreq; i++) {
> -		pcie->gpio_id_clkreq[i] = of_get_named_gpio(dev->of_node,
> -						    "hisilicon,clken-gpios", i);
> -		if (pcie->gpio_id_clkreq[i] < 0)
> -			return pcie->gpio_id_clkreq[i];
> +		pcie->id_clkreq_gpio[i] = devm_gpiod_get_index(dev,
> +							"hisilicon,clken", i,
> +							GPIOD_OUT_LOW);
> +		if (IS_ERR(pcie->id_clkreq_gpio[i]))
> +			return dev_err_probe(dev, PTR_ERR(pcie->id_clkreq_gpio[i]),
> +					     "unable to get a valid clken gpio\n");
>  
>  		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						       "pcie_clkreq_%d", i);
>  		if (!pcie->clkreq_names[i])
>  			return -ENOMEM;
> +
> +		gpiod_set_consumer_name(pcie->id_clkreq_gpio[i],
> +					pcie->clkreq_names[i]);
>  	}
>  
>  	return 0;
> @@ -407,10 +410,16 @@ static int kirin_pcie_parse_port(struct kirin_pcie *pcie,
>  		for_each_available_child_of_node(parent, child) {
>  			i = pcie->num_slots;
>  
> -			pcie->gpio_id_reset[i] = of_get_named_gpio(child,
> -							"reset-gpios", 0);
> -			if (pcie->gpio_id_reset[i] < 0)
> -				continue;
> +			pcie->id_reset_gpio[i] = devm_fwnode_gpiod_get_index(dev,
> +							 of_fwnode_handle(child),
> +							 "reset", 0, GPIOD_OUT_LOW,
> +							 NULL);
> +			if (IS_ERR(pcie->id_reset_gpio[i])) {
> +				if (PTR_ERR(pcie->id_reset_gpio[i]) == -ENOENT)
> +					continue;
> +				return dev_err_probe(dev, PTR_ERR(pcie->id_reset_gpio[i]),
> +						     "unable to get a valid reset gpio\n");
> +			}
>  
>  			pcie->num_slots++;
>  			if (pcie->num_slots > MAX_PCI_SLOTS) {
> @@ -434,6 +443,9 @@ static int kirin_pcie_parse_port(struct kirin_pcie *pcie,
>  				ret = -ENOMEM;
>  				goto put_node;
>  			}
> +
> +			gpiod_set_consumer_name(pcie->id_reset_gpio[i],
> +						pcie->reset_names[i]);
>  		}
>  	}
>  
> @@ -463,14 +475,11 @@ static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
>  		return PTR_ERR(kirin_pcie->apb);
>  
>  	/* pcie internal PERST# gpio */
> -	kirin_pcie->gpio_id_dwc_perst = of_get_named_gpio(dev->of_node,
> -							  "reset-gpios", 0);
> -	if (kirin_pcie->gpio_id_dwc_perst == -EPROBE_DEFER) {
> -		return -EPROBE_DEFER;
> -	} else if (!gpio_is_valid(kirin_pcie->gpio_id_dwc_perst)) {
> -		dev_err(dev, "unable to get a valid gpio pin\n");
> -		return -ENODEV;
> -	}
> +	kirin_pcie->id_dwc_perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(kirin_pcie->id_dwc_perst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(kirin_pcie->id_dwc_perst_gpio),
> +				     "unable to get a valid gpio pin\n");
> +	gpiod_set_consumer_name(kirin_pcie->id_dwc_perst_gpio, "pcie_perst_bridge");
>  
>  	ret = kirin_pcie_get_gpio_enable(kirin_pcie, pdev);
>  	if (ret)
> @@ -553,7 +562,7 @@ static int kirin_pcie_add_bus(struct pci_bus *bus)
>  
>  	/* Send PERST# to each slot */
>  	for (i = 0; i < kirin_pcie->num_slots; i++) {
> -		ret = gpio_direction_output(kirin_pcie->gpio_id_reset[i], 1);
> +		ret = gpiod_direction_output_raw(kirin_pcie->id_reset_gpio[i], 1);
>  		if (ret) {
>  			dev_err(pci->dev, "PERST# %s error: %d\n",
>  				kirin_pcie->reset_names[i], ret);
> @@ -623,44 +632,6 @@ static int kirin_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> -static int kirin_pcie_gpio_request(struct kirin_pcie *kirin_pcie,
> -				   struct device *dev)
> -{
> -	int ret, i;
> -
> -	for (i = 0; i < kirin_pcie->num_slots; i++) {
> -		if (!gpio_is_valid(kirin_pcie->gpio_id_reset[i])) {
> -			dev_err(dev, "unable to get a valid %s gpio\n",
> -				kirin_pcie->reset_names[i]);
> -			return -ENODEV;
> -		}
> -
> -		ret = devm_gpio_request(dev, kirin_pcie->gpio_id_reset[i],
> -					kirin_pcie->reset_names[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	for (i = 0; i < kirin_pcie->n_gpio_clkreq; i++) {
> -		if (!gpio_is_valid(kirin_pcie->gpio_id_clkreq[i])) {
> -			dev_err(dev, "unable to get a valid %s gpio\n",
> -				kirin_pcie->clkreq_names[i]);
> -			return -ENODEV;
> -		}
> -
> -		ret = devm_gpio_request(dev, kirin_pcie->gpio_id_clkreq[i],
> -					kirin_pcie->clkreq_names[i]);
> -		if (ret)
> -			return ret;
> -
> -		ret = gpio_direction_output(kirin_pcie->gpio_id_clkreq[i], 0);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct dw_pcie_ops kirin_dw_pcie_ops = {
>  	.read_dbi = kirin_pcie_read_dbi,
>  	.write_dbi = kirin_pcie_write_dbi,
> @@ -680,7 +651,7 @@ static int kirin_pcie_power_off(struct kirin_pcie *kirin_pcie)
>  		return hi3660_pcie_phy_power_off(kirin_pcie);
>  
>  	for (i = 0; i < kirin_pcie->n_gpio_clkreq; i++)
> -		gpio_direction_output(kirin_pcie->gpio_id_clkreq[i], 1);
> +		gpiod_direction_output_raw(kirin_pcie->id_clkreq_gpio[i], 1);
>  
>  	phy_power_off(kirin_pcie->phy);
>  	phy_exit(kirin_pcie->phy);
> @@ -707,10 +678,6 @@ static int kirin_pcie_power_on(struct platform_device *pdev,
>  		if (IS_ERR(kirin_pcie->phy))
>  			return PTR_ERR(kirin_pcie->phy);
>  
> -		ret = kirin_pcie_gpio_request(kirin_pcie, dev);
> -		if (ret)
> -			return ret;
> -
>  		ret = phy_init(kirin_pcie->phy);
>  		if (ret)
>  			goto err;
> @@ -723,11 +690,9 @@ static int kirin_pcie_power_on(struct platform_device *pdev,
>  	/* perst assert Endpoint */
>  	usleep_range(REF_2_PERST_MIN, REF_2_PERST_MAX);
>  
> -	if (!gpio_request(kirin_pcie->gpio_id_dwc_perst, "pcie_perst_bridge")) {
> -		ret = gpio_direction_output(kirin_pcie->gpio_id_dwc_perst, 1);
> -		if (ret)
> -			goto err;
> -	}
> +	ret = gpiod_direction_output_raw(kirin_pcie->id_dwc_perst_gpio, 1);
> +	if (ret)
> +		goto err;
>  
>  	usleep_range(PERST_2_ACCESS_MIN, PERST_2_ACCESS_MAX);
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
மணிவண்ணன் சதாசிவம்
