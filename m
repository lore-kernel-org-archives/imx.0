Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06515250A
	for <imx@lists.linux.dev>; Sun, 30 Jun 2024 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719764629; cv=none; b=d6z8bkGW3wGxTCbFGGuk/oglOav9YkPsvNZka8lx/x9CVUkrxfwS/JMK2to/fgmuv8JARvBIJSaL81Z9/IkES3F+gT7lSI1s/VEHePdEgugNjkll0h3rPsZD5ULtbc8nbOkmNGIyvSEW5X1d9yQE0oxeOpqndoYEm8v8yseSabM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719764629; c=relaxed/simple;
	bh=9htU6WoutJrpUNff3Wz+szGkhLvVmq0dajsxQsJ361g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsV1v/T+HOfDDV9g0l+H3huz8BCsoI9FY19HTZLePzqs89rAnDK3bshxd9pgWjXb2B7VmEHnrx4FL67t2R7bNKz/EflgsocD3Hf3iFaEg6OOO7ro2E+PftpfKiUJWns+dQU9gUK+YBtr+gVBeOt7zxR0daY4DX8Su/RmYpXeRMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uysl842/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uysl842/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-70df213542bso1054889a12.3
        for <imx@lists.linux.dev>; Sun, 30 Jun 2024 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719764626; x=1720369426; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meRrKUBJYAi063Ybn9ckzWyMWuNq5WiRKh+4W6KHvUo=;
        b=uysl842/5LMp8zERPe9llOfqwV1aLzqvW7uyS1dSoZc6mr2LDvs6sHWZa9spMZjy5R
         tIHwprdbLzcLdXV8HWu0hjRzAcAs96aVisaX5lpoT3AYi60cTiI/VHvGy/7KH0eixBvK
         FJcw/I3N6KoGvkSw5iLzX4KzbpVCN7T+qsbUkWoq8yKKNPZ96kr36kfkUHT01vXRsy5C
         0/IiZAtR0QbBRDg3vYi1h1aByZCwIP6YGoUeIfXTgMO9qXu3L4VBJFE9BbFldgNnnaa0
         PcNj1QW+e6saubab+yYTVcAhGIbTLNLtF6ZdS36GSl2tC/GQ/dsp72gZ5VFz2hyc3jbz
         tgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719764626; x=1720369426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meRrKUBJYAi063Ybn9ckzWyMWuNq5WiRKh+4W6KHvUo=;
        b=FnJ5fpLPl2SfDuXQLB4iQjIc+S+9B4dHRWrxgLJZ97LR4usa+dJ5WOl3g+udTzk0s1
         E01NK1zzNRfXuwLEyjUfKBVtlTvB3hJEZ11wKsghovI+vlRQs6n3pHRafyI+ChxeWNBB
         qbHKDKHKsbbexTjuT2+ZTwye45wqt+o2m6NTlzyAfnfRBrvf5Ta+o5kRZc8m6dJLdziw
         99YuTsSprvYV0e/crPx/Mp7hTqbj9jub3IclZSFhrONVQAYOojp6FJ60OKeB2X3yNNfs
         waXR8FIIpyRu0ZxP8zWhBxk/DpsEKiu9iE5vKbgQaLGBtvdBPxBydxhV+P78A37B05NF
         Zflg==
X-Forwarded-Encrypted: i=1; AJvYcCXPA88dmMQ4ewBqa0sbrwBV0MihmvhSv+NPob2JXTI6sxUeN5MDSbkrBjx54KgOz+3L/VO7uFlVOKgfBbWkomniezS9
X-Gm-Message-State: AOJu0YzluI2NxUr7lp0GGaVBw28N4IIiokDcnbQlYEBF+B8O3Labr7ol
	Bu0OhtQf0+hPEeZioHDiZlOmOyk1th/d62jiXM5KGfknqY6f8fwyZPAz+JLZoA==
X-Google-Smtp-Source: AGHT+IFB5GWSyOiS5lFM4xMyeymwyJX3RWJBnJqEHBblq0QLaA5/nACE76UedKAKXnyWt2Xoaj7jKg==
X-Received: by 2002:a05:6a20:b22a:b0:1bd:22fe:fcaa with SMTP id adf61e73a8af0-1bef6275a83mr1942482637.51.1719764625453;
        Sun, 30 Jun 2024 09:23:45 -0700 (PDT)
Received: from thinkpad ([220.158.156.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce73e34sm5028683a91.30.2024.06.30.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 09:23:45 -0700 (PDT)
Date: Sun, 30 Jun 2024 21:53:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/10] PCI: imx6: Call: Common PHY API to set mode,
 speed, and submode
Message-ID: <20240630162337.GD5264@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-9-e0821238f997@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-pci2_upstream-v6-9-e0821238f997@nxp.com>

On Mon, Jun 17, 2024 at 04:16:45PM -0400, Frank Li wrote:

You don't need the colon after 'Call' in subject.

> Invoke the common PHY API to configure mode, speed, and submode. While
> these functions are optional in the PHY interface, they are necessary for
> certain PHY drivers. Lack of support for these functions in a PHY driver
> does not cause harm.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ab0ed7ab3007a..18c133f5a56fc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -30,6 +30,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/reset.h>
>  #include <linux/phy/phy.h>
> +#include <linux/phy/pcie.h>

This should be moved one entry above.

>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  
> @@ -229,6 +230,10 @@ static void imx_pcie_configure_type(struct imx_pcie *imx_pcie)
>  
>  	id = imx_pcie->controller_id;
>  
> +	/* If mode_mask[0] is 0, means use phy driver to set mode */

/* If mode_mask is 0, then generic PHY driver is used to set the mode */

> +	if (!drvdata->mode_mask[0])
> +		return;
> +
>  	/* If mode_mask[id] is zero, means each controller have its individual gpr */
>  	if (!drvdata->mode_mask[id])
>  		id = 0;
> @@ -808,6 +813,7 @@ static void imx_pcie_ltssm_enable(struct device *dev)
>  	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
>  	const struct imx_pcie_drvdata *drvdata = imx_pcie->drvdata;
>  
> +	phy_set_speed(imx_pcie->phy, PCI_EXP_LNKCAP_SLS_2_5GB);

Is this setting really universal? This looks like applicable only to specific
platforms supporting this link speed.

>  	if (drvdata->ltssm_mask)
>  		regmap_update_bits(imx_pcie->iomuxc_gpr, drvdata->ltssm_off, drvdata->ltssm_mask,
>  				   drvdata->ltssm_mask);
> @@ -820,6 +826,7 @@ static void imx_pcie_ltssm_disable(struct device *dev)
>  	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
>  	const struct imx_pcie_drvdata *drvdata = imx_pcie->drvdata;
>  
> +	phy_set_speed(imx_pcie->phy, 0);
>  	if (drvdata->ltssm_mask)
>  		regmap_update_bits(imx_pcie->iomuxc_gpr, drvdata->ltssm_off,
>  				   drvdata->ltssm_mask, 0);
> @@ -955,6 +962,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  			goto err_clk_disable;
>  		}
>  
> +		ret = phy_set_mode_ext(imx_pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +		if (ret) {
> +			dev_err(dev, "unable to set pcie PHY mode\n");

s/pcie/PCIe

- Mani

-- 
மணிவண்ணன் சதாசிவம்
