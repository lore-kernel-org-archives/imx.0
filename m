Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51747302CD5
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049234; cv=none; b=Bu/TlvsVgcgOxctb+Xv+YNn48w/Ch66hp8JktaT9aviW42bjLj4xP9DNVNxTwwThBwH/IorF8jA51GhQlHVjjN1fMXPNe/GPI7uv7i+Ndg8IUfJ5cLFjoBmfoJBLNUKxebGxx0xuNGa3zQPvGKOma9bAW1Hg7h2cdnVZDrnYIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049234; c=relaxed/simple;
	bh=dQYp1NJib6TqAfS9zqOKZQj1UbBkaUUpuTiS0q3EQcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SquQR274bvlN3hwJyb4kWHFyayqj5nLEY40D0ECaDfErWVKxxYbhI77FMfThfM+Eve87bXEY8ep9f9gcsFLi2MTaVngLCaB9FB9FXobyZ5VJnPQO6hlqBaO/hv7Y7MGr5vGepOinautQMiK3JiHmPAM4H7LVGn/VepoYPplSouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnGCpr2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnGCpr2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EC91F00A3F;
	Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049226;
	bh=2r4LtSFNnmUChhF9o4r3fkzuJjWy2v7q5EFQAp7Hh3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MnGCpr2NQ6IQnchmU52Q07fzEGITH64zVVnUH1pmStQcWTY2HkQvXrX0pXGVEOm43
	 C10qgbVPBKmehSNAH6wV3JS5r8iMk0IFxbERxH1vBFyRj2MCWSwFvkCCrKJUISBGBX
	 jUrMTVxKW+E+XaO8miXm1U01nxXzCUqM58/xbaXVEMC+CZZ5NJwHEQgBc2A2Giowh2
	 3ArTQEOLeDyp0Hhijko3K9T8kmYjOm5vyDjkz6KGa6gQDuRjZfLw0ohf5MyIaT27hx
	 kDj1hvhLlG+Ab2Fgdh33LbJmB2r8ZBV9XbYhWP4EXibWrCBzL1CG63MK6UKI/VFVKE
	 36E3FVjhIsleQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 13/14] net: enetc: use alloc_etherdev_mqs()
 to create netdev for VF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702025714.456233-14-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:05 +0000
Message-Id: <20260703032705.D5EC91F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dynamically allocating netdev queues based on unvalidated hardware=
 ring counts bypasses previous implicit limits, leading to array overflows =
and unhandled interrupts (interrupt storms) for queues >=3D 8.
--

commit 25e82eb7e0ae74aa61ceb3d3b3628db74277e9eb
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use alloc_etherdev_mqs() to create netdev for VF driver

The VF driver currently uses alloc_etherdev_mq() with a fixed queue count.
This commit changes it to use alloc_etherdev_mqs() so that TX and RX queue
counts can be set independently based on actual hardware capabilities.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 9cdb0a4d6bafb..3df515a6e3335 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,8 @@ static int enetc_vf_probe(struct pci_dev *pdev,
> =20
>  	enetc_get_si_caps(si);
> =20
> -	ndev =3D alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	ndev =3D alloc_etherdev_mqs(sizeof(*priv), si->num_tx_rings,
> +				  si->num_rx_rings);

[Severity: High]
By dynamically allocating the netdev queues based on unvalidated hardware
ring counts, can this bypass previous limits and cause array overflows?

Previously, alloc_etherdev_mq() capped the queue allocation to
ENETC_MAX_NUM_TXQS, which safely bounded the number of queues and would fail
if the hardware capabilities were excessive. If a PF or hypervisor
configures the VF with excessive queues (for instance, si->num_tx_rings > 8
or si->num_rx_rings > 6), wouldn't this allocation now succeed and lead to
out-of-bounds writes during initialization?

For example, in enetc_int_vector_init():

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_int_vector_init() {
    ...
    priv->int_vector[i] =3D v;
    ...
    priv->tx_ring[idx] =3D bdr;
    ...
}

If si->num_rx_rings > 6 and num_online_cpus() > 6, doesn't this overflow
the priv->int_vector[] array? And if si->num_tx_rings > 16, won't this
overflow the fixed 16-element priv->tx_ring[] array?

Furthermore, for TX queues >=3D 8, it seems the MSI-X handler and NAPI poll
loop still use the hardcoded limit ENETC_MAX_NUM_TXQS (8):

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_msix() {
    ...
    for_each_set_bit(i, &v->tx_rings_map, ENETC_MAX_NUM_TXQS)
    ...
}

And similarly in enetc_poll():

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_poll() {
    ...
    for_each_set_bit(i, &v->tx_rings_map, ENETC_MAX_NUM_TXQS)
    ...
}

Will this fail to clear or re-enable interrupts for TX queues >=3D 8,
resulting in unhandled interrupts and an immediate system lockup?

Should we validate si->num_tx_rings and si->num_rx_rings against the
maximum sizes supported by the driver structures before allocating the
netdev?

>  	if (!ndev) {
>  		err =3D -ENOMEM;
>  		dev_err(&pdev->dev, "netdev creation failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D13
