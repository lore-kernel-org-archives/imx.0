Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA13FF893
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500512; cv=none; b=pBC0x9CtVYurhRoUnKyCpdOZTbV25ZjBzT7Kp2ZjCBzOC6NSV6kukfXM2ma3iSahoDcjE7DvUgv1iMml11XQZ3ei8D94eFDgvIQdRSkQAjeTob8ad7GMSyBBVUvWJJuEIrKdjXtiFVvgdpj/bMeLLfsl0Ur4OtXwjwk1BbiIxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500512; c=relaxed/simple;
	bh=3tH0mZwzdG21HqEcfD4/xgWYfYWmL0xVQ8qauokyMhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hYG7jkiXykCCYttVp/9sJ7tEtu+KSRtDFmR9b379uJo1XbCWvo1jBg/+fbrnQ5YH1T8W0d/gSBaedS4KToug25qh862mZSgxzXbHSo7LwapX5WWyC/n45fNkbSHI64EMB7WmTfWTVPHkoaNe8vFBmUlYx4e+ezLr9gsPVqUCt9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVqkQEQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVqkQEQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9AE1F000E9;
	Wed,  8 Jul 2026 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500511;
	bh=UXy6ldyMKwSq0ZH0Z7gbDxUYwNqu1R4TQM4EdbxI5EI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVqkQEQukcDklQxVRfTxe5umpk+ZGaaUo/Woa0yiNM0hx9jxXh91IQwLXwBon8v5i
	 G8eivlZEZV15Dj/QoEWHltiakrCdKs9YejQ0o5Cl1OOWZphlVwKSc2n7NOTEuNOhoL
	 rdJ+7W8d9vhMpejm6OGpvz1ZZf6rLpZxvXv6lNCxhqT6UKO3GnJ3hi1s/VzBRZna1u
	 IZ4U+kO2aUxbj2ULAXt2HiPy/Xk0fsc2QCa56TbK6R2j1nor+H58YQfixldDsxsVlP
	 gTQg709o225KTUMfdCR1G3FQYbB29U6P35e0RlFAdaU+DtbrlU8v+xc1v1N4I84PYl
	 39P34VrATAawg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 13/14] net: enetc: use alloc_etherdev_mqs()
 to create netdev for VF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707081834.710730-14-wei.fang@oss.nxp.com>
References: <20260707081834.710730-1-wei.fang@oss.nxp.com>
 <20260707081834.710730-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:48:31 +0000
Message-Id: <20260708084831.6C9AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds checks on hardware-provided ring counts lead to hea=
p buffer overflows in internal driver structures and undefined behavior via=
 out-of-bounds pointer arithmetic.
--

--- Patch [13]: [PATCH v4 net-next 13/14] net: enetc: use alloc_etherdev_mq=
s() to create netdev for VF driver ---
commit 351253af314542011d0490ff56bc5d410a44e0d7
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use alloc_etherdev_mqs() to create netdev for VF driver

The VF driver uses alloc_etherdev_mq() with ENETC_MAX_NUM_TXQS as the
queue count, which forces the TX and RX queue counts to be equal and
uses a compile-time constant rather than the actual hardware capability.
This patch switches to alloc_etherdev_mqs() so that the TX and RX queue
counts are set independently, each capped at ENETC_MAX_NUM_TXQS, based
on the actual number of rings assigned to the VF by the PF.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 9cdb0a4d6bafb..7dcb4a0246f52 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,14 @@ static int enetc_vf_probe(struct pci_dev *pdev,
> =20
>  	enetc_get_si_caps(si);
> =20
> -	ndev =3D alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	/* Currently, the supported SoCs have a max of 6 CPUs and the VFs
> +	 * have less than 6 RX/TX rings. So no issues for these supported
> +	 * SoCs, but for future SoCs which have more CPUs or more TX/RX
> +	 * rings, all the related logic needs to be improved.
> +	 */
> +	ndev =3D alloc_etherdev_mqs(sizeof(*priv),
> +				  min(si->num_tx_rings, ENETC_MAX_NUM_TXQS),
> +				  min(si->num_rx_rings, ENETC_MAX_NUM_TXQS));

[Severity: High]
This is a pre-existing issue, but since we are relying on hardware-provided
values (si->num_tx_rings and si->num_rx_rings) read from ENETC_SICAPR0, is
it possible for a misconfigured or malicious PF/hypervisor to provide values
larger than the fixed-size arrays in struct enetc_ndev_priv?

In enetc_init_si_rings_params():

	priv->num_rx_rings =3D min_t(int, cpus, si->num_rx_rings);
	priv->num_tx_rings =3D si->num_tx_rings;

These values are then used in enetc_alloc_msix() which calls
enetc_int_vector_init(). Since priv->int_vector is sized to 6
(ENETC_MAX_BDR_INT) and priv->tx_ring is sized to 16, a VF providing a large
number of rings could cause out-of-bounds pointer writes:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_int_vector_init() {
	...
	priv->int_vector[i] =3D v;
	...
	priv->tx_ring[idx] =3D bdr;
	...
}

Additionally, in enetc_alloc_msix(), if priv->num_tx_rings is less than
num_possible_cpus(), does this calculation lead to out-of-bounds pointer
arithmetic?

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_alloc_msix() {
	...
	first_xdp_tx_ring =3D priv->num_tx_rings - num_possible_cpus();
	priv->xdp_tx_ring =3D &priv->tx_ring[first_xdp_tx_ring];
	...
}

Would it be safer to explicitly validate si->num_tx_rings and
si->num_rx_rings against ENETC_MAX_BDR_INT and ARRAY_SIZE(priv->tx_ring)
early in the initialization rather than assuming they will always be small?

>  	if (!ndev) {
>  		err =3D -ENOMEM;
>  		dev_err(&pdev->dev, "netdev creation failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707081834.7107=
30-1-wei.fang@oss.nxp.com?part=3D13
