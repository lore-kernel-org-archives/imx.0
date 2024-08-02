Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA32481AA
	for <imx@lists.linux.dev>; Fri,  2 Aug 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722606733; cv=none; b=BdwgsvZDtiiGztoSgQwfe4ljcqhcOgqjeJYEVuxr2nqRoR/jfbtB0VnI/7WiukCaXVWduNEE+Gope1QHf/Snk+5ryeUqYA5mqBFJD0//+KdG+W0qkZILn0VrqVRVd8KpPU3L82D2ZhgFmlXPtQsb8Cto8Y6LBtkdMDRBjhxTSxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722606733; c=relaxed/simple;
	bh=ou0DITIpMt48ak8JPLbfXRmSg/K+0yvdjanPFGT+N/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMtsmaiZD/ctIXWYZ9m0RVUzOR2EvuXB/LnPbgfWe60LzOCiahZ5pkRKv4qcLgwz3p/xnTAzGPCXjL0zMgUiz/MSoLEjRJ+gEjQpB5UJs5m5PiTNcq3b4VBlIasWR6+oDMNx1w4eyAsmqINjL9xznKvaNY2k18uiO0q5cPxeP0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBEtw5uh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBEtw5uh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd8807aaso12096939e87.3
        for <imx@lists.linux.dev>; Fri, 02 Aug 2024 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722606729; x=1723211529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ux3ZfNQ7ZOcoxTiKnqgkpQxKEOA6xyXfmnITSx+smY=;
        b=xBEtw5uh1Vere6Cb8Emm+wIZKLX9zsgM7jFcMbOcZQG++w5fQ56067QRB/qDnfNRdr
         SHqlOq91BfX1AK2HFOPN7w7hP1+mP0M9YV3Jl6oUAsyYyXeMCLiZbdlsvAWlvsM4eFq7
         52rG3bLUZXtQSrE8G3n28RBuDx5YNTYnR82NZR3cJ6sBliB+aMTZCsnMcUIEdiShaWkV
         ohvxVgGXYg20s4NT17QhsVJN1rDF4y6y7wjn1yo+upB1Pgq+dPLBBz8tZnYuFtwMJ385
         B3IYkjnyI2RmgCwL2oxbc59R/JHQsA54LclA4IETSDs5uuujMYA/OW080BBhqQZROb3C
         s+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606729; x=1723211529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ux3ZfNQ7ZOcoxTiKnqgkpQxKEOA6xyXfmnITSx+smY=;
        b=FGBQ3dJ7dL/Ry2Juup9hEcpS40s+imDhdHw7hERrFqmSVNjSveIYyg+vGd/MdUAD9F
         ukE+Bg+KqlkAEjClqKoKqYbt9DvD/65U6jfkCcgrRfPatb0lzuAPYjfrjN4A9rLpPUjm
         6aEZ+WqOQaUHR0/HzJelQ+n7KT+I/aJ2tOQq1lGtlMNa3RVMl/FM9dJ5hmVYJ7nXZ+ma
         x5oSm+Dr/QC43MyLAQdF5EGr3Kw6vShiLgYfBkzbY5Mu3D4HIzu0JMj4nNzdOgC6PDKr
         Je1Lo4smEyEKa22QpH2jNM3EoqAUhByY8DF4u+QpT8MPRGjXnBYSSCG4y8ht4lvZOQMo
         mJmg==
X-Forwarded-Encrypted: i=1; AJvYcCVhl89pagBzZk8KudMQVqLTh5ejkIOuO8kZfnVof14/eLp1ETR3Gjik+zR7Lh5+FA37lFccLaRQGiZn5YC7eXzOTgm7
X-Gm-Message-State: AOJu0Yzssguj+fc/N8Fjs0VZgxJp2LiRlCIh/sEznXJj0YX+zTHJLaNT
	QVlD+s5+PK6DM3wuFA4a+/VCQA8VhIu/6YeP4JeWwmaagoMNk5GhinIHW/Vu+T8=
X-Google-Smtp-Source: AGHT+IEINrdmFAx3zONnth4QNFrZH1h1meVudf30GLFqW4gmfs8ViUeInYhBNlmQrFmaR8IU0V+aZg==
X-Received: by 2002:a05:6512:108b:b0:52c:8a12:3d3b with SMTP id 2adb3069b0e04-530bb3c8259mr2169856e87.56.1722606728406;
        Fri, 02 Aug 2024 06:52:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba35252sm233281e87.196.2024.08.02.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:52:08 -0700 (PDT)
Date: Fri, 2 Aug 2024 16:52:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, Frank.Li@nxp.com, 
	jun.li@nxp.com, l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/5] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <i2o5pk7jnni4bgc6txktus26dtnd6quivxkslgqkelmyb334k6@s5waxd5ep75f>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <20240802091702.2057294-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802091702.2057294-3-xu.yang_2@nxp.com>

On Fri, Aug 02, 2024 at 05:17:00PM GMT, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> ---
>  drivers/phy/freescale/Kconfig              |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 238 +++++++++++++++++++++
>  2 files changed, 239 insertions(+)
> 

[..]

> @@ -398,6 +624,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>  
> +	if (device_is_compatible(dev, "fsl,imx95-usb-phy") &&
> +			imx95_usb_phy_get_tca(pdev, imx_phy) < 0)
> +		return dev_err_probe(dev, -ENODEV, "failed to get tca\n");

Pleas propagate error returned by imx95_usb_phy_get_tca() instead of
always returning -ENODEV.

> +
>  	imx8m_get_phy_tuning_data(imx_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +635,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
