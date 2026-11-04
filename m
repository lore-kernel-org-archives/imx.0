Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801376;
	b=j5LsciHjQIIf87hF6pbR3D3UgQJiHp4X1h9PPgY4o529I2wuINk8scbvuiw2U6TJJ03s
	 k8udRe88m6MdV0WJeCFtm6otMCpYhB6C8rk5Bp1764pgTDrsb2DVOWdlqOrrF8SMiJmC+
	 440l5cDehotREChgAjvFUHj7BrhMeXzWm+gjzeCb0sjmBolPI18YW3oFW2Oe7oU0Z6Hzp
	 IowPXVeuakZI6x2GAx48j/th00gTYRnyi5priuQhUHkFhwuF/7X/Ll3keESZ4QoIDpJ7P
	 w9CWMYbSjdOjbAxMsEimvFg6yWqUcQVbfZALL2J8ti2MXVDznfCfVLQy4QGQ3Ai6tmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801376;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dis1N9ApaTjVUV06o6HKxwJ6K12hg4N/iyLNhWr2wbQ=;
	b=5rV8QvuKXf7GpiV674UTKIf1ucQajlDxfUWvqHc0Zey1uUkkXE/y61HYm6CNoGzPLmWz
	 PnC4nwAXvmrKpfjN9xshG47cIKaMxvHfODGf176/szWEPOmGWS9w5XsGqiuNZboSBlaLe
	 QhrDnVF7Ag5/VlwqK8I3W/dBqd6KoNwybI5Ru2oF3ksJpmFrmvduIE/FDU6AxVqf4iaxC
	 f0RPb8ERhiUMyKQHFawhjyXVi+vsQVuvUpH/StGtrIJGPE+T4Klz+/UgcQCiqBmJEFxUH
	 SNHru2LJDKgdkqtC+gcqNS0cD59YbaU75eYuL5tznloXWTYcz44VKP87TAiJytFr2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9zz3iys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82493606A330
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9zz3iys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDAF1F00A02;
	Wed,  4 Nov 2026 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801376;
	bh=Dis1N9ApaTjVUV06o6HKxwJ6K12hg4N/iyLNhWr2wbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9zz3iysU0QL00Pd5UtADu0O6vwZA9MrbteCZnPupeF03DG9LoLPxyAgNpre+qUJo
	 8HKieuczy0q9X30aqWeA/58is52CO0H0+IFe3X7mFLZrcPemyKejrCM1GCq/lC4E5k
	 UgnG4hTQIMHFZTH1GJRuMNMGSvt9KAv3Kila4Th7Pgul8t4z77qC+JPVpHCqlLefU+
	 uhE3bQxSbCnOB4B/IaAMRP0ZZ8Fyrh3OirBbUE5oLyiG9GJ9sn6KPSy6ppf5i8ZwGm
	 3iaLUuCHe2LDKnIhdaDJKTEcedYR7bxXRjqNuUzvpvTcP/ZhlzEKCa6MLkgP2Fuf0J
	 XZj7Z/uvbgBcw==
Message-ID: <sashiko-outbox-197400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/5] net: enetc: Enable probing of version
 4.4 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Manoil" <claudiu.manoil@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <bf8effe9a06ba569b5e5a36cc1d1982b2e3fff53.1793712309.git.claudiu.manoil@nxp.com>
References: <cover.1793712309.git.claudiu.manoil@nxp.com>
 <bf8effe9a06ba569b5e5a36cc1d1982b2e3fff53.1793712309.git.claudiu.manoil@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:09:35 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] net: enetc: out-of-bounds write to int_vector[] in enetc_int_v=
ector_init()
--

commit 6de2e15f2fb313f3ab9a84d0bfd5a867de11c72c
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: Enable probing of version 4.4 devices

This commit adds driver data and platform info entries for ENETC v4.4 PF and
VF devices on S32N79 SoCs with a 500 MHz system clock frequency.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index c6571b5cc8425..b989823859ff2 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -3832,6 +3832,20 @@ static const struct enetc_drvdata enetc4_vf_data =
=3D {
>  	.eth_ops =3D &enetc_vf_ethtool_ops,
>  };
> =20
> +static const struct enetc_drvdata enetc4_s32n79_ppm_data =3D {
> +	.sysclk_freq =3D ENETC_CLK_500M,
> +	.tx_csum =3D true,
> +	.max_frags =3D ENETC4_MAX_SKB_FRAGS,
> +	.eth_ops =3D &enetc4_ppm_ethtool_ops,
> +};
> +
> +static const struct enetc_drvdata enetc4_s32n79_vf_data =3D {
> +	.sysclk_freq =3D ENETC_CLK_500M,
> +	.tx_csum =3D true,
> +	.max_frags =3D ENETC4_MAX_SKB_FRAGS,
> +	.eth_ops =3D &enetc_vf_ethtool_ops,
> +};
> +
>  static const struct enetc_platform_info enetc_info[] =3D {
>  	{ .revision =3D ENETC_REV_1_0,
>  	  .dev_id =3D ENETC_DEV_ID_PF,
> @@ -3862,6 +3876,18 @@ static const struct enetc_platform_info enetc_info=
[] =3D {
>  	  .dev_id =3D NXP_ENETC_VF_DEV_ID,
>  	  .data =3D &enetc4_vf_data,
>  	},
> +	{ .revision =3D ENETC_REV_4_4,
> +	  .dev_id =3D NXP_ENETC_PPM_DEV_ID,
> +	  .data =3D &enetc4_s32n79_ppm_data,
> +	},
> +	{ .revision =3D ENETC_REV_4_4,
> +	  .dev_id =3D NXP_ENETC_PF_DEV_ID,
> +	  .data =3D &enetc4_s32n79_ppm_data,
> +	},
> +	{ .revision =3D ENETC_REV_4_4,
> +	  .dev_id =3D NXP_ENETC_VF_DEV_ID,
> +	  .data =3D &enetc4_s32n79_vf_data,
> +	},

[Severity: Critical]
Can probing ENETC v4.4 on an 8-core S32N79 SoC overflow priv->int_vector[] =
in
enetc_int_vector_init()?

In drivers/net/ethernet/freescale/enetc/enetc.h, ENETC_MAX_BDR_INT is still
defined as 6:

#define ENETC_MAX_BDR_INT	6 /* fixed to max # of available cpus */
...
struct enetc_ndev_priv {
	...
	int bdr_int_num; /* number of Rx/Tx ring interrupts */
	struct enetc_int_vector *int_vector[ENETC_MAX_BDR_INT];
	u16 num_rx_rings, num_tx_rings;
	u16 rx_bd_count, tx_bd_count;

Previously supported SoCs had at most 6 CPUs, whereas S32N79 has 8 CPUs and
enetc4_default_rings_allocation() allocates up to ENETC_SI_MAX_RING_NUM (8)
RX rings to the PF.

When enetc_init_si_rings_params() runs on an 8-CPU system with 7 or 8 RX
rings:

	int cpus =3D num_online_cpus();
	...
	priv->num_rx_rings =3D min_t(int, cpus, si->num_rx_rings);
	priv->num_tx_rings =3D si->num_tx_rings;
	priv->bdr_int_num =3D priv->num_rx_rings;

priv->bdr_int_num becomes 7 or 8 without being clamped to ENETC_MAX_BDR_INT.
Then enetc_alloc_msix() -> enetc_int_vector_init() writes past the end of
priv->int_vector[]:

	for (i =3D 0; i < priv->bdr_int_num; i++) {
		...
		err =3D enetc_int_vector_init(priv, i, num_tx_rings);

where enetc_int_vector_init() does:

	priv->int_vector[i] =3D v;

overwriting num_rx_rings, num_tx_rings, rx_bd_count, tx_bd_count, and
subsequent fields in struct enetc_ndev_priv.

Should ENETC_MAX_BDR_INT be increased (and/or priv->bdr_int_num bounded by
ENETC_MAX_BDR_INT)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793712309.gi=
t.claudiu.manoil@nxp.com?part=3D2
