Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A431B3954
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729767687; cv=none; b=hky+LzVPFuP935n79TZIEkRTaIB4EvclzdwKE990cuq+367sbV5Y9ruymFa3IH2q0NwNQYT90ycMIbz5KWlNQATbEipNUgTLRgls9l7QxaxI0SyHde2z6jZJWB3rIFqGwpggXri1UiE65J56JZXZNsqjHJuh/gKBcaccUc4s+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729767687; c=relaxed/simple;
	bh=GcsY4DwdXEo2baKa3bEnLz1/qW8Bmj1ZyGI6hMV6xmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2Mdjla8SUb7BrQJv04VyQEzwxjC37r1cYhYwdB80kg4txmdV8T9NReAW23WIp3eDtikTU0BtSzUdANBIW8hpmBBQnlq6o2Lji2L0i6zO00OCFD+N93SkUoAaAHRa93Pjjn5/uUL/eIUGly231zkXuFu1lb9APaxH6yEm2y3Q78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-0007iV-Rm; Thu, 24 Oct 2024 13:01:23 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-000BRi-1m;
	Thu, 24 Oct 2024 13:01:23 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-00B9fo-1P;
	Thu, 24 Oct 2024 13:01:23 +0200
Date: Thu, 24 Oct 2024 13:01:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-pm@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
Message-ID: <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
References: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Dario,

thanks for the patch.

On 24-10-24, Dario Binacchi wrote:
> The patch standardizes the probe() code by replacing the two occurrences
> of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
> other error paths of the probe() function.

I assume that this paths aren't using dev_err_probe because these paths
can't return EPROBE_DEFER and therefore dev_err_probe() would use
dev_err() anyway.

Regards,
  Marco

> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  drivers/pmdomain/imx/gpcv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 963d61c5af6d..6e6ecbf2e152 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>  
>  	ret = pm_genpd_init(&domain->genpd, NULL, true);
>  	if (ret) {
> -		dev_err(domain->dev, "Failed to init power domain\n");
> +		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
>  		goto out_domain_unmap;
>  	}
>  
> @@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>  	ret = of_genpd_add_provider_simple(domain->dev->of_node,
>  					   &domain->genpd);
>  	if (ret) {
> -		dev_err(domain->dev, "Failed to add genpd provider\n");
> +		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
>  		goto out_genpd_remove;
>  	}
>  
> -- 
> 2.43.0
> 
> 
> 
