Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7D3EDADC
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410288; cv=none; b=dIhKXjc+PTwY3NySizPbbIfDgOYMr2caoEqAPj4rq5tDYJckM2DQXWXnnbkMXvblA5M19M4s/wfDEhNWEL/xCg1BKXNG+9bnCTCa++7y/7mcTxYPnuL4lEsj47zlMbyZPvLziKRWAQTnStAdCKwEHOigO/oKfT8xEUASp0PqUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410288; c=relaxed/simple;
	bh=FTUGopICu5pzJ26ZVY8nluyeQkvP++79uebQFpiTuS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B4SLEcajRrbKQyc+wrRR2rGJ1HEWAjCYQuG6DY82T9gwgHVCtxnyvnVgiMKDptu//hmcNAZKfsboNSOwKLk3NTwywu9KdfVn85fnln9wdXaotsXi5RPPeAlug/TvXL0xbWXShugWEotaP3B2b2FzbVPQReQlZHcQ4dyPqbuHcmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biX/R5rF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biX/R5rF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A5F1F00898;
	Tue,  2 Jun 2026 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780410287;
	bh=SXAayy10Ie1KB/LuASBKA28+N8P9zo1ocn6gpxfPpUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=biX/R5rFl5/wmE1kyL1NuvYPaV/q0qeq0omQ1osx5dTor8JQQXpvD0fdS4r90vfD2
	 h8CRRa2PfOKPt9+E18bzcbCmPyXfTdWPKhrM+/bVkJq6A3YdW1nNUSIw5HbboB14gM
	 fRhWlI4XE2VDYU7XKBwJa5TijX2zKSM/EV17N+8+2Cm6dvKoKw5uQYFa/Yohfa/eOg
	 qMfyiATPb7n/lbmcdh9gQmmAAX9ppQC8qVa7RiYAbhc3fUzKNSkdl9VS9wn8ZXEoe6
	 rnNYhddCMxtYO4YsLKnulSYUrcKI8ZmAnA3qHprmBrlwDzmcJ2ZgwnS8Nd0neltYaA
	 ipfuPLc4B+HKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, Frank.Li@kernel.org, olteanv@gmail.com, imx@lists.linux.dev
In-Reply-To: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
References: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 14:24:45 +0000
Message-Id: <20260602142445.C5A5F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference if the Type-C switch's `.set()`=
 callback is invoked concurrently during probe.
- [High] Potential Use-After-Free if a typec port driver holds a reference =
to the switch and calls `.set()` after the PHY driver unbinds.
--

commit 546b07c54e0077d325cf3fd20b1dd95d1c123a9d
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
switch leaks because the only cleanup path was in .remove, which
never runs on probe failure.

Use devm_add_action_or_reset() so the switch is cleaned up on both
probe failure and driver removal.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..8af5a4f856987 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_sw=
itch(struct platform_device
>  	return sw;
>  }
> =20
> -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +static void tca_blk_put_typec_switch(void *data)
>  {
> +	struct typec_switch_dev *sw =3D data;
> +
>  	typec_switch_unregister(sw);
>  }

[Severity: High]
This is a pre-existing issue, but could this cleanup sequence lead to a
use-after-free during unbind?

When the PHY driver unbinds or fails probe late, the devres framework will
automatically free the imx_phy and tca structures since they are allocated
with devm_kzalloc. While typec_switch_unregister() drops the initial
reference to the switch, it doesn't force consumers to drop their reference=
s.

If a consumer typec port driver still holds a reference to the switch and
calls its .set callback after the PHY driver unbinds:

tca_blk_typec_switch_set()
    struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
    struct tca_blk *tca =3D imx_phy->tca;

won't this callback access the freed imx_phy and tca memory?

[ ... ]

> @@ -266,17 +269,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct=
 platform_device *pdev,
>  	tca->orientation =3D TYPEC_ORIENTATION_NORMAL;
>  	tca->sw =3D tca_blk_get_typec_switch(pdev, imx_phy);

[Severity: High]
This isn't a bug introduced by this patch, but does registering the switch
here expose it to consumers before imx_phy->tca is assigned?

Once registered, the switch becomes globally discoverable via fwnode matchi=
ng.
If a consumer discovers it and immediately invokes the .set callback
(tca_blk_typec_switch_set), that callback expects imx_phy->tca to be
fully initialized:

tca_blk_typec_switch_set()
    struct tca_blk *tca =3D imx_phy->tca;
    int ret;

    if (tca->orientation =3D=3D orientation)

Since the assignment of imx_phy->tca happens later in the probe sequence
after this function returns, wouldn't this concurrent access dereference a
NULL pointer?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-imx8mq-typ=
ec-v1-1-3debe9bc77d9@gmail.com?part=3D1
