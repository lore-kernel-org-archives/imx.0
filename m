Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591873FFABF
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 02:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600014; cv=none; b=rcaztGcHHLNFy0PuVWeiaHJo1dORn9gkR95XjqbJgA2lmv//QNBfYAPFtn2qwXDHfU2eXOE8yigOt0534Jbl3CUfVrPCZSeqCAA6PriZ9Nezgoih4kN2/de+ejlvdgFCX6AvSbbQRbUG4ku2Z6Mq9D4qVlPKR+PF22T+U8B32JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600014; c=relaxed/simple;
	bh=s4PfDS3Ar581cuWfxN0lJreDawVKXF93Fnwbp/C5zJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m26NVykoZ7Dh07tyh17louBsVyOwjTP4KijiVSMycR4RD/NaG2ECRDNPXH57E6U3FzDH52QJV6BqYfKf1lgBfsLuhL2zhbuMPvQVy7vDQp8JMXR2CRLghXZEdrNG6ExnyR9yJanDem4I+nEWD0+Ihovrnah97S7pbcx4bQUgfnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wvxd3KDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wvxd3KDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B431F000E9;
	Tue, 21 Jul 2026 02:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784600013;
	bh=j1TL9KaoH+fA/akNKvlLwq4CAe4STludofjopQKh/7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wvxd3KDDibYO0orQou/at4bDwDQEtktmExSeEXEDtXEaucHv6/ofEced4L069Ztbj
	 5vTUJpVO7/YsdC5U/DRcRCahl2PIzFDIDjbhXp3a6YyH0OJd5OCE9OqsZoHgn650z1
	 ERAR9lhK9xOCMprLeX36QET1MZZhBi0u/1nyv8pGtHaZ8bCx4bhUDq/AX5Mk4FAyB4
	 f9vjdJPxXa5neFnWkh1UOdxAbkxhyEO+BGXTwIts0hjcXi00HQpL4oMyRpk/QBBb82
	 qMIlMAH2v4YBEu6igNc89WpohNGLuZaGGL+gwpT06On4SkMiOgfbtpd3gWqgq+P4U6
	 PmNL8UIkGS7lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 net-next 13/14] net: enetc: use
 alloc_etherdev_mqs() to create netdev for VF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260720014317.1059359-14-wei.fang@oss.nxp.com>
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:13:31 +0000
Message-Id: <20260721021332.C1B431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Passing 0 to alloc_etherdev_mqs() triggers a pr_err() inside the ne=
tworking core if the hardware reports 0 rings.

Pre-existing issues:
- [Critical] Hardware-provided ring counts are not bounded against driver s=
tatic array sizes, causing out-of-bounds writes.
--

--- Patch [13]: [PATCH RESEND v4 net-next 13/14] net: enetc: use alloc_ethe=
rdev_mqs() to create netdev for VF driver ---
commit 79eef0d032f82d691851f474deed33cca36dd548
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use alloc_etherdev_mqs() to create netdev for VF driver

This commit changes the VF driver to use alloc_etherdev_mqs() instead of
alloc_etherdev_mq(), allowing TX and RX queue counts to be set independently
based on the actual hardware capabilities up to ENETC_MAX_NUM_TXQS.

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

[Severity: Low]
Does this code handle the case where the hardware reports 0 rings?

If si->num_tx_rings or si->num_rx_rings is 0, this passes 0 to
alloc_etherdev_mqs(), which triggers a "Unable to allocate device with zero
queues" pr_err() in the network core and returns NULL. The previous hardcod=
ed
ENETC_MAX_NUM_TXQS guaranteed a valid count.

Should there be a check to ensure the ring counts are at least 1?

[Severity: Critical]
This is a pre-existing issue, but is it possible for the hardware to report
ring counts that exceed the internal array sizes, causing an out-of-bounds
write?

Looking at enetc_init_si_rings_params(), the hardware-provided ring counts
are assigned without validating them against the internal array bounds:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_init_si_rings_params() {
	...
	priv->num_tx_rings =3D si->num_tx_rings;
	priv->bdr_int_num =3D priv->num_rx_rings;
	...
}

Subsequently, enetc_alloc_msix() loops over these values and writes to the
statically sized arrays in enetc_int_vector_init():

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_int_vector_init() {
	...
	priv->tx_ring[idx] =3D bdr;
	...
}

A malicious or misconfigured PCI hypervisor or Physical Function (PF) could
supply arbitrary values to the Virtual Function (VF) driver. If the hardware
reports huge ring counts, this causes a buffer overflow on the heap when
writing to priv->int_vector (size 6) and priv->tx_ring (size 16), which cou=
ld
lead to a panic or arbitrary code execution.

Could these values be strictly bounded against the array sizes during probe?

>  	if (!ndev) {
>  		err =3D -ENOMEM;
>  		dev_err(&pdev->dev, "netdev creation failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720014317.1059=
359-1-wei.fang@oss.nxp.com?part=3D13
