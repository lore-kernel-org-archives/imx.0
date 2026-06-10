Received: from akranes.kaiser.cx (akranes.kaiser.cx [152.53.16.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA073BADB1;
	Wed, 10 Jun 2026 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.16.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084560; cv=none; b=Ob/f7SW9+JpfR5LqLmGaodfUTr8ZY3gdEB2gJGNzq+UchGkrAYyNfzWHKtk4HBMIG7IWAfrfd+xa08ZVUS0VQgIpYx42PJ3xFx9LmQ0Ake0HYNpf1qPk4hoELN8WiaMRhnEOGP6rOLCC+JnvzHXsutZ/6eoZkCvPvWK6Mn44Rvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084560; c=relaxed/simple;
	bh=gGav5we0l5prcmEXpVjbiiIZf4FoHRlrrE4CRsZbcTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+IXqPp1jVdFaoD3SUC0tZvapBLeeaeDCsJ4K/4pO/RLSlA9ea5c+0V3+yCeJnOpTWO2gqwduLXxwPnPsTBnEspzZEpq4n2PGlljP8yxGc/iDPgtOAwKlwURPYcJU/Q2esbtAR4cmuh1agdtlR5fQwwYp3Xs4+Jw1BdEbL3PgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx; spf=pass smtp.mailfrom=kaiser.cx; arc=none smtp.client-ip=152.53.16.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaiser.cx
Received: from ipservice-092-209-184-216.092.209.pools.vodafone-ip.de ([92.209.184.216] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wXFS7-00000002FrG-018Q;
	Wed, 10 Jun 2026 11:42:27 +0200
Date: Wed, 10 Jun 2026 11:42:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: avic: fix device_node refcount leaks in
 mxc_init_irq()
Message-ID: <aikxg5xtXWccXPO8@nb282.user.codasip.com>
References: <20260610053115.2263570-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610053115.2263570-1-geoffreyhe2@gmail.com>

Hi,

Thus wrote Weigang He (geoffreyhe2@gmail.com):

> mxc_init_irq() obtains two device_node references via
> of_find_compatible_node() and never releases either one:

>   - The "fsl,imx25-ccm" node (looked up to map the CCM low-power
>     interrupt mask registers on i.MX25) is stored in np, used by
>     of_iomap(), and then the same np variable is overwritten by the
>     second of_find_compatible_node() call without an of_node_put().
>     On i.MX25 this leaks the node reference on every boot.

>   - The "fsl,avic" node is passed via of_fwnode_handle(np) to
>     irq_domain_create_legacy(), which takes its own reference on the
>     fwnode through fwnode_handle_get(), so the caller's reference is
>     not transferred. np is then leaked at function return.

> Both lookups predate the switch to irq_domain_create_*(); the missing
> puts have been there since the code was introduced.

> Drop each reference once the value derived from it is no longer needed:
> after of_iomap() has mapped the CCM registers, and after
> irq_domain_create_legacy() has taken its own fwnode reference.
> of_node_put() is NULL-safe, so platforms without these nodes are
> unaffected.

> Found by static analysis tool CodeQL.

> Fixes: 544496ab5cbd ("ARM: imx: move irq_domain_add_legacy call into avic driver")
> Fixes: 9b454d16e57d ("ARM: imx: avic: set low-power interrupt mask for imx25")
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
> ---
>  arch/arm/mach-imx/avic.c | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/arch/arm/mach-imx/avic.c b/arch/arm/mach-imx/avic.c
> index 3067c06b4b8eb..6873a50bbe2c0 100644
> --- a/arch/arm/mach-imx/avic.c
> +++ b/arch/arm/mach-imx/avic.c
> @@ -173,6 +173,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)

>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx25-ccm");
>  	mx25_ccm_base = of_iomap(np, 0);
> +	of_node_put(np);

>  	if (mx25_ccm_base) {
>  		/*
> @@ -203,6 +204,7 @@ static void __init mxc_init_irq(void __iomem *irqbase)
>  	np = of_find_compatible_node(NULL, NULL, "fsl,avic");
>  	domain = irq_domain_create_legacy(of_fwnode_handle(np), AVIC_NUM_IRQS, irq_base, 0,
>  					  &irq_domain_simple_ops, NULL);
> +	of_node_put(np);
>  	WARN_ON(!domain);

>  	for (i = 0; i < AVIC_NUM_IRQS / 32; i++, irq_base += 32)

> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> -- 
> 2.43.0

Reviewed-by: Martin Kaiser <martin@kaiser.cx>

Thanks,
Martin
