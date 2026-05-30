Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB042DC76C;
	Sat, 30 May 2026 00:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101942; cv=none; b=pJb5MFSfTrb4MP0yK8oi9MvU/SmsqV++HBB3rAJrYvRZZNxBV/TcDZoM8rOLzr4hq8r6p8tLhTuR7yncA+HKo7C+PjsnZ4loXT2kulQPFvu1aeYtrZlA8rnC4KVtiF7B15ORZRld9Ta3kLV3i31ZcAoKff/7RpNy9oa4iW7G20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101942; c=relaxed/simple;
	bh=hZrsprkC3piBu7Gs3nsnfYJbkjcSZ24uO0id/Qx/QQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KP2QJKc5e4flUQeA3b9n7Ban8SYlh2OruAZavduCUjrznCKGVO5Q6Is7nX77fOnaz733K1kpf9pJ9O6YX9jX26DTht7kcLLUJ8LOQKSnYqIV/C/mZPiFJAt45lTn+hY0RZzGrJuEq7Zis0IeDjt4dyB1E96dTBJnonf+hHwQTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKsFB3eu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKsFB3eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422941F00893;
	Sat, 30 May 2026 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101941;
	bh=V3fMNJZnPxXLkXLHJrV9yqQPyPsOVv1zijbqeFv5WxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aKsFB3euspezFXwl1GctlWwodgP8D8hENTmx2onX7yKW+Z8PMvmermfvynszaTC8y
	 s6weQERvumwlpw9KA4EabRClBpP2dRiwNs1mpreG9xlDxVi149ae+eV9KudlUQCco5
	 UXDx+TwSiKwb4o9Yvs/KIz3cX7k07uml+p9S7W2+0rT9dPUkSnMGMNkfD5ZAF1LDUd
	 hYzBcsL0CKFutm+7q+Zp6u0ufxmsTH8cINeFwwhZDp0ZkLQ1o6K7cblolsH/4qOhQs
	 4iyHGlkz5us9MCUNpdKXJv3nENWc5LKJ5QPSpNJ0uOSt8Kj+TC1Y3uEIhrjke2lIAp
	 U49xTyZJNn5gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/23] net: bcmgenet: use platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-13-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-13-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:40 +0000
Message-Id: <20260530004541.422941F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixing `goto`-based error handling and scope-based cleanup (`__free=
`) in the same function.
--

commit f58d150fd8f8c2ac44d34e557009b66b7a1a1343
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: bcmgenet: use platform_device_set_of_node()

This commit uses the platform_device_set_of_node() helper to assign the OF
node for dynamically allocated platform devices. This is done ahead of
reworking the reference counting logic for platform devices.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/e=
thernet/broadcom/genet/bcmmii.c
> index a4e0d5a682687..451b23a039ceb 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
> @@ -490,10 +490,14 @@ static int bcmgenet_mii_register(struct bcmgenet_pr=
iv *priv)
>  	/* Retain this platform_device pointer for later cleanup */
>  	priv->mii_pdev =3D ppdev;
>  	ppdev->dev.parent =3D &pdev->dev;
> -	if (dn)
> -		ppdev->dev.of_node =3D bcmgenet_mii_of_find_mdio(priv);
> -	else
> +
> +	if (dn) {
> +		struct device_node *np __free(device_node) =3D bcmgenet_mii_of_find_md=
io(priv);

[Severity: Low]
Does this mix scope-based cleanup and goto-based error handling in the same
function?

The bcmgenet_mii_register() function currently uses a goto-based cleanup pa=
th
later in the function. According to include/linux/cleanup.h, the expectation
is that usage of goto and cleanup helpers should never be mixed in the same
function.

Could the entire function be converted to use scope-based cleanups, or shou=
ld
this remain as a traditional cleanup to avoid mixing the two patterns?

> +
> +		platform_device_set_of_node(ppdev, np);
> +	} else {
>  		ppd.phy_mask =3D ~0;
> +	}
> =20
>  	ret =3D platform_device_add_resources(ppdev, &res, 1);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D13
