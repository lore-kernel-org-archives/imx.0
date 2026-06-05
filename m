Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6894D2EF3
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658536; cv=none; b=iUN3B9+2CGf64kHz94lccORWxjZSEPwnnby0BGdMBgeQ8v0mtqahNfCndMAgqmDufh06tB36EacwsOj4KOwteqBBodHdSIHgbgaUn9Z+qyUN/Y8zom5T16++PwUasGayM9Lg9SrO+x8mL0rNyZXltglHSlDze8KqS5mBwANu4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658536; c=relaxed/simple;
	bh=xB/sz0thjCg9RIKIkFdB7/ambri33x02b5xh0+VpHx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kWoQmD+iKi6arvzw/n0ax2XlvuhsDw7P86PAq5edC62lO+isk5kGeIiNf/zkInHgg9zrPWa3RpbDopKxbic/ggY2UwcnjQwYmpGpQAWjTbNx3Z5rfqkENyq2tsofhOL6rQim55EE09cSl6WJ8BQ8RfFZ6r2Id2mOwsUEPAaBglQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxgewI5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxgewI5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5831F00893;
	Fri,  5 Jun 2026 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658533;
	bh=tb12Qi0Rr5byC63yxO/H3th6dwVJUniEn3PJA2T8Nuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxgewI5LGEehnxeAm/49PZzLdVQSlknk+2dAwYjvuRF7n75wrstdg+eRRL8bd5aR8
	 MdcIq0jPIDBpAXhzQDB/NG0uebkkWun9tVyp1D0WxxFWbbsmij8y2fwvpq60FJLBgQ
	 0ipT1JFNmVjGAIH1lmbZM6RQl7nKnGmftPDMnm/odN3g8RHbWzW1YfTjT68P8jLMdJ
	 V8HlGxLO1WWItHsLrdh9kd/7LFFkYkWub7p+v0nakXNanO0pqdbwPuU/8RfEVtdcCa
	 zBbV1bp5Pf6mMqM1Fya0+Ak7CZDYEKVdwvvfSZw6L6Q2iL3OFMCdu0fttNCJ9x3yd9
	 ReiidbLXkvlaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-1-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-1-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:22:12 +0000
Message-Id: <20260605112212.AB5831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition during probe leading to NULL pointer dereference.
- [High] Use-After-Free (UAF) of provider driver data on manual unbind.
--

commit 9dde5dedb4fbdef1b93e7e96ccdb22fc9407f2cc
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

This commit fixes a memory leak of the Type-C switch on the probe error
path by using devm_add_action_or_reset() for cleanup. This ensures the
switch is unregistered on both probe failure and driver removal.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..88b804b2c982b 100644
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
This is a pre-existing issue, but does this create a race condition
during probe?

When tca_blk_get_typec_switch() registers the Type-C switch, it becomes
exposed to the subsystem. If a consumer binds asynchronously in this narrow
window and invokes the .set callback, could it dereference imx_phy->tca
before it gets assigned back in imx8mq_usb_phy_probe()?

drivers/phy/freescale/phy-fsl-imx8mq-usb.c:tca_blk_typec_switch_set() {
	struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
	struct tca_blk *tca =3D imx_phy->tca;
	...
	if (tca->orientation =3D=3D orientation)
		...
}

Would it be safer to assign imx_phy->tca before registering the
Type-C switch?

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

[Severity: High]
This is also a pre-existing issue, but can this lead to a Use-After-Free
if the driver is manually unbound?

If the driver is unbound via sysfs, devres will automatically free the
imx_phy and tca structures since they were allocated with devm_kzalloc().
However, if typec_switch_unregister() doesn't revoke existing consumer
references, could a consumer subsequently call typec_switch_set() and
access the already freed imx_phy and tca structures?

drivers/phy/freescale/phy-fsl-imx8mq-usb.c:tca_blk_typec_switch_set() {
	struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
	struct tca_blk *tca =3D imx_phy->tca;
	...
	if (tca->orientation =3D=3D orientation)
		...
}

> +	if (ret)
> +		return ERR_PTR(ret);
> =20
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-imx8mp-usb=
-phy-improvement-v4-0-b2ddf2f3862c@nxp.com?part=3D1
