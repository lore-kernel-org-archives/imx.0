Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB194389110
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465399; cv=none; b=JXJY1BEtkCCGrThMD3h59egNuD1lHQD/UcQn+IhDH7dC358UQWHL16y/2xNlE+UMXwYjVaR/tUOy74R+ugX7h04zpoJpIScC4T1IsenNKYVK8NOYCLQ3i7Y4U+8U+MOYOEBf7R/4qkEzf2ekvAvcZDp0StOiygbdlo8o/C6XWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465399; c=relaxed/simple;
	bh=/MpQzMoECLRV+8i9LA1VSkALMthATzWzP8Gkw4Wj22Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sasvkZAJycyjgYQdgBPdys+qm5sX47JVuglHFozvkqHkBG5Nuqe3b6Rbj4O5bZIgyIalr1h6vKT2JubgJHtMP96DdvkUM8cJgOx466+AtVYx/B0ZoKdcpaQ3eUqu6PGzlUmirDVrHvsN3vb35Uva1QUfIfUxZQ3raQ1k8SbWtho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+NtiAfI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+NtiAfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8971F00893;
	Wed,  3 Jun 2026 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780465398;
	bh=3LTD+XJkKGd5IErJKBFCejDTlCFHWVDxbcdMQLn50Aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+NtiAfIjRF5VCLdw4kn7mMyDpL40dJTSDy/cj/8p92WGyvsP9P0NdkSWpbRmYnxX
	 1r3K3sb64vC2v7k68ls+2yQyLj+KX5gE/Cc0PmOEVEsuXkcMnAWKpA0CoumsHiDUdj
	 yrdt66O0zhsAF7FaayTnbzz/bQx8GTDzZeW812gDQF7RN7p66vWZ/3tHkTct2gnpLg
	 QePvli6ciAjWAcSb67vwOa8eXZB2D7vIKkJ7OqdxVePpUx+od4I9gKC8x73/xH/NM9
	 tUOB3luO5YNoFX9bDjgrlk39jv16PyOk+JMRVeBANVa2JWmEZ566E6Sz741EJkTOOi
	 CQYJ8F6pzIvGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, Frank.Li@kernel.org
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-1-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-1-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 05:43:17 +0000
Message-Id: <20260603054318.3A8971F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A concurrent consumer can invoke the Type-C switch `.set` callback=
 before `imx_phy->tca` is fully initialized, causing a NULL pointer derefer=
ence.
--

commit 0b20f824a9e9a9c613b1bcc66167f00382c9a5a1
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

This patch fixes a typec switch leak on the probe error path by using
devm_add_action_or_reset. This allows cleaning up the switch on both
probe failure and driver removal, eliminating the need for a separate
remove callback.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -248,6 +248,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct p=
latform_device *pdev,
>  	struct device *dev =3D &pdev->dev;
>  	struct resource *res;
>  	struct tca_blk *tca;
> +	int ret;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	if (!res)
> @@ -266,17 +267,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct=
 platform_device *pdev,
>  	tca->orientation =3D TYPEC_ORIENTATION_NORMAL;
>  	tca->sw =3D tca_blk_get_typec_switch(pdev, imx_phy);

[Severity: High]
This is a pre-existing issue, but is it possible for a concurrent consumer
to invoke the Type-C switch .set callback before imx_phy->tca is fully
initialized?

In tca_blk_get_typec_switch(), we call typec_switch_register() which makes
the switch visible to the system. Once registered, a consumer could
immediately resolve it and invoke its .set callback, which is
tca_blk_typec_switch_set().

If that happens, tca_blk_typec_switch_set() does:

tca_blk_typec_switch_set() {
    struct tca_blk *tca =3D imx_phy->tca;
   =20
    if (tca->orientation =3D=3D orientation)
        ...
}

However, imx_phy->tca is assigned using the return value of this function
later in imx8mq_usb_phy_probe():

imx8mq_usb_phy_probe() {
    ...
    imx_phy->tca =3D imx95_usb_phy_get_tca(pdev, imx_phy);
    ...
}

Could this race condition result in a NULL pointer dereference if the
callback fires before probe finishes assigning imx_phy->tca?

> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca =3D imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret =3D devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, =
tca->sw);
> +	if (ret)
> +		return ERR_PTR(ret);
> =20
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx8mp-usb=
-phy-improvement-v3-0-7afb8f89abc6@nxp.com?part=3D1
