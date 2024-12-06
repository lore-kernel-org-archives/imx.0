Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC61FC7FE
	for <imx@lists.linux.dev>; Fri,  6 Dec 2024 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485297; cv=none; b=HNch0AehjTKjBgEYIyZ7inJzitPSP8hTS+zGhrvXflHPehwnEfAg4l295uHl1KbaDPTQSbXtIyiyhsbKlXRwlyZ1bvJ8m+VJMHOyACxI+IhRrQvI/lwpvDYueRWVDx7Th8Nu6ybr7dFItAFtTxjVuLqqtO9ljMWDjiC6VgM+A1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485297; c=relaxed/simple;
	bh=dupK57BdJX5cg+uWCPUKDNnfu0xZaQF9e+9fgA0TBX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVBVV1Cm45H1+Yum+0FLVG95R7T2Zt1UbSHebNr4AhzAwzPIo1aGsjyaLUr9rnzG1FOOYF0etQWBJIsLBNTnU8uvbXFhB37Z/Td0Bf/KInmypJ7f4ZyReSMRhLkIku0lDfPCjVT60QwxG50DQBllutk3g9FBgeAjqx3y1cr4I+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWiA-0004H7-Up; Fri, 06 Dec 2024 12:41:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWi9-001zVh-2H;
	Fri, 06 Dec 2024 12:41:30 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWiA-000nbD-1C;
	Fri, 06 Dec 2024 12:41:30 +0100
Date: Fri, 6 Dec 2024 12:41:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, marex@denx.de,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx8m: Add remove function
Message-ID: <20241206114130.zt4rkotzbzi3xt5n@pengutronix.de>
References: <20241206112843.98720-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206112843.98720-1-peng.fan@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 24-12-06, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Unregister the cpufreq device and soc device in remove path, otherwise
> there will be warning when do removing test:
> sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> 
> Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx8m.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 8ac7658e3d52..8c368947d1e5 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -33,6 +33,11 @@ struct imx8_soc_data {
>  	int (*soc_revision)(u32 *socrev, u64 *socuid);
>  };
>  
> +struct imx8m_soc_priv {
> +	struct soc_device *soc_dev;
> +	struct platform_device *cpufreq_dev;
> +};
> +
>  #ifdef CONFIG_HAVE_ARM_SMCCC
>  static u32 imx8mq_soc_revision_from_atf(void)
>  {
> @@ -198,7 +203,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	const struct imx8_soc_data *data;
>  	struct device *dev = &pdev->dev;
>  	const struct of_device_id *id;
> -	struct soc_device *soc_dev;
> +	struct imx8m_soc_priv *priv;
>  	u32 soc_rev = 0;
>  	u64 soc_uid = 0;
>  	int ret;
> @@ -207,6 +212,10 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr)
>  		return -ENOMEM;
>  
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
>  	soc_dev_attr->family = "Freescale i.MX";
>  
>  	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
> @@ -235,21 +244,34 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr->serial_number)
>  		return -ENOMEM;
>  
> -	soc_dev = soc_device_register(soc_dev_attr);
> -	if (IS_ERR(soc_dev))
> -		return PTR_ERR(soc_dev);
> +	priv->soc_dev = soc_device_register(soc_dev_attr);
> +	if (IS_ERR(priv->soc_dev))
> +		return PTR_ERR(priv->soc_dev);
>  
>  	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
>  		soc_dev_attr->revision);
>  
>  	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> -		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> +		priv->cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);

If CONFIG_ARM_IMX_CPUFREQ_DT is enabled, I asusme that
platform_device_register_simple() shouldn't fail else it will be an
error, right? Therefore I would like to add the 'if(!IS_ERR())' check
here instead of the remove function.

> +
> +	platform_set_drvdata(pdev, priv);
>  
>  	return 0;
>  }
>  
> +static void imx8m_soc_remove(struct platform_device *pdev)
> +{
> +	struct imx8m_soc_priv *priv = platform_get_drvdata(pdev);
> +
> +	if (!IS_ERR(priv->cpufreq_dev))

With the above shifted, we only need to:
	if (priv->cpufreq_dev)

Regards,
  Marco


> +		platform_device_unregister(priv->cpufreq_dev);
> +
> +	soc_device_unregister(priv->soc_dev);
> +}
> +
>  static struct platform_driver imx8m_soc_driver = {
>  	.probe = imx8m_soc_probe,
> +	.remove	= imx8m_soc_remove,
>  	.driver = {
>  		.name = "imx8m-soc",
>  	},
> -- 
> 2.37.1
> 
> 
> 
