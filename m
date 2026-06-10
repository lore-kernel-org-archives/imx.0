Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB1390230
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098577; cv=none; b=e9Gd6VlhCMUKlmHDG2LfklATW0wePF1btnOYXvrcUXj8tb2FJJHmjM/s107vQQl/yFuUcoHXHsz8LEIA5+BUkCZmSZumr99sBVNBC3+7/DJcHG/rAdVXblflxP2/JjmLS+l0A59bLkTPnKqLAfS5sA8MGRTo3pM0UUAOpWq4Fm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098577; c=relaxed/simple;
	bh=FwCrhZ8ZeNtqiyfs3zbi63seO5XAGbiguZKKrvA2sSA=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r2Lsvomu0e2BS9+ollvsuQ6ziIVs76E5/AxL5ljpRsFSfRzDHqc4KebX163Si8l6GApGODyYuXCo7r0A5jTsywrbT5yGdBWo69uxPNIB3jxW1mMWk6xXd39GfKZgZ62tKaO/+81AR3PzRSJ5hOTSnSZ8I/fhsYiG61c3/17qgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gf3AIIvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf3AIIvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8211F00893;
	Wed, 10 Jun 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098575;
	bh=tqGhRX9MuiPxu2KCVu5XHYIIUo3JHGGUA5sXwTmlE0s=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=gf3AIIvYNf9D/NKmLC3tYjeCcVSKoylXD7+GUbhlEk6d95T8AFt15pq4qpeW4UCnV
	 UqpQNM9MbQEr31NAvcGJu+ZKF02DDSJeffXF/hDzOwBbYcl2svswXUBWA77VHYIaXV
	 /cuQSqOyi9SSOc3ucSlNJSnl8TXiA2dKE6cWhypbPVHHtf3Q4cfAJZDYBzwe7+eQpE
	 BYxwLZkwhRqkrjZmhTHHzR+JNoI5Vfj4sDgIdzGVurdarVFcQDnJYhxCS9wl+TP4Te
	 AI9Tcei08opka4REtEEHO3L9/TB/4of83PVuLWUJq4FI9SrGpumzDJRuiTm2vVXWx7
	 dS01AV1QK+thg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] pmdomain: imx: Fix i.MX8MP power notifier
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-1-ea58ce929c84@nxp.com>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-1-ea58ce929c84@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 13:36:14 +0000
Message-Id: <20260610133615.1B8211F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `imx8mp_vpu_power_notifier` fails to ungate the NoC clock (bit=
 3) and omits `GENPD_NOTIFY_PRE_OFF` handling, which contradicts the commit=
 message and breaks the ADB handshake logic during power transitions.
--

commit b6702343f03cbdda69190bd48f95c1b0b1fe3617
Author: Peng Fan <peng.fan@nxp.com>

pmdomain: imx: Fix i.MX8MP power notifier

Using imx8mm_vpu_power_notifier() for i.MX8MP is wrong, as it ungates
the VPU clocks to provide the ADB clock, which is necessary on i.MX8MM,
but on i.MX8MP there is a separate gate (bit 3) for the NoC. So add
imx8mp_vpu_power_notifier() for i.MX8MP.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 19e992d2ee3b8..e13a47eeed75d 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
[ ... ]
> @@ -514,9 +514,34 @@ static const struct imx8m_blk_ctrl_domain_data imx8m=
p_vpu_blk_ctl_domain_data[]
>  	},
>  };
> =20
> +static int imx8mp_vpu_power_notifier(struct notifier_block *nb,
> +				     unsigned long action, void *data)
> +{
> +	struct imx8m_blk_ctrl *bc =3D container_of(nb, struct imx8m_blk_ctrl,
> +						 power_nb);
> +
> +	if (action =3D=3D GENPD_NOTIFY_ON) {

[Severity: High]
The commit message states there is a separate gate (bit 3) for the NoC on
i.MX8MP, but does this implementation actually ungate it?

It looks like the NoC clock (bit 3) is never ungated here. Also, there is no
handling for the GENPD_NOTIFY_PRE_OFF action.

During both power up and power down transitions, the GPC driver waits for an
ADB handshake. Without explicitly enabling the NoC clock, won't the hardware
state machine lack the necessary clock to respond to the GPC, potentially
stalling the handshake and deadlocking the system during domain transitions?

> +		/*
> +		 * On power up we have no software backchannel to the GPC to
> +		 * wait for the ADB handshake to happen, so we just delay for a
> +		 * bit. On power down the GPC driver waits for the handshake.
> +		 */
> +
> +		udelay(5);
> +
> +		/* set "fuse" bits to enable the VPUs */
> +		regmap_set_bits(bc->regmap, 0x8, 0xffffffff);
> +		regmap_set_bits(bc->regmap, 0xc, 0xffffffff);
> +		regmap_set_bits(bc->regmap, 0x10, 0xffffffff);
> +		regmap_set_bits(bc->regmap, 0x14, 0xffffffff);
> +	}
> +
> +	return NOTIFY_OK;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-b4-imx8mp-=
vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com?part=3D1
