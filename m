Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A853BED30
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892280; cv=none; b=LCxH27BeFAqUtvtilMvx1A/q5KwOtQyvUSvqj0cI+uI2hDHquN2WNcQ/S7LcKDEuHYdoExNhzLWdY6/Abb0EBPuH+A/5qnEv7UYr/Bj5ialkc3DB3/tPTOoNn2QxqbdHEDMZPlLGResfUYNHQYZ6s0JDAiBlD15UWNnyOVebndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892280; c=relaxed/simple;
	bh=ndy7ltFPK1rqoKfJ3sJ0w66KZBRS/GrWSfK/SLcr7So=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qz0MO1hqO5eYU2i2z1U3ggvc1VksLH5jNsCMP/L0CGZKoL269HQSa9e4J1BNKOm+7oDvhZu6v3nJh0iz+XbinjwSrbyqbm5gnuTCGf2bHKUBdzQfGqiBMhIKpXN6OeDyhQB53wmzkOqxm1+YUVVcCRd3jG8ZI7J18AJ51MTwhlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAi7Cr0k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAi7Cr0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB31F00A3D;
	Wed,  1 Jul 2026 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892277;
	bh=CGr+NtkuK23k1YleSws3Nwl2ayarTEV0soSaWjA+apE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FAi7Cr0ksPHtsEGJQRm1AsSHaqyCIwRdrVhGHEwCa/wY+3u+42OgRRMv0hrbmUSUJ
	 iIfJrFUR08hscn4dwVeqarK0lsnq4nsIdDV9Aj6crqAnj+nyELcbobO7h2gQgzyaNr
	 tR61cRMMnjxCZFu6SbmtTyzcaWhgcpJ6h/d6kGso0Uo9CDvXg24dF6fp2LFs9zfmmK
	 sM5nxv/1dUahoewOkbtTZSgZxWLQiXk+If30O2JsgA9aWdndk5gh2CJibpkvAX/o1R
	 nSVOQhpaixjVvOp8y8KXplvNIlTTaWVoFqRaN13X5Jmz49EJWJowre4zfACcbko9kR
	 B6nTORxBEoY9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 13/14] net: enetc: use alloc_etherdev_mqs() to
 create netdev for VF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260630072036.382761-14-wei.fang@oss.nxp.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:51:16 +0000
Message-Id: <20260701075117.34DB31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch dynamically allocates the netdevice TX/RX queues based o=
n hardware-provided `si->num_tx_rings`, but the interrupt handlers still us=
e the hardcoded `ENETC_MAX_NUM_TXQS` (8) limit, causing unhandled interrupt=
s and hanging queues for any TX rings >=3D 8.

Pre-existing issues:
- [High] Missing bounds check on hardware-provided queue counts leads to ou=
t-of-bounds writes on the fixed-size `tx_ring` and `rx_ring` static arrays.
- [High] The `int_vector` array has a hardcoded size of 6, but is indexed b=
y a value bounded only by `num_online_cpus()`, causing out-of-bounds writes=
 on systems with > 6 CPUs.
--

commit 79626f31ed7ba6f966e47382436575165e9f1b3d
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: enetc: use alloc_etherdev_mqs() to create netdev for VF driver

This commit changes the netdev creation in the ENETC VF driver to use
alloc_etherdev_mqs(). This allows setting the TX and RX queue counts
independently based on the hardware capabilities (si->num_tx_rings and
si->num_rx_rings) rather than using a hardcoded ENETC_MAX_NUM_TXQS limit.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,8 @@ static int enetc_vf_probe(struct pci_dev *pdev,
> =20
>  	enetc_get_si_caps(si);
> =20

[Severity: High]
This is a pre-existing issue, but does enetc_get_si_caps() bound the ring
counts read from hardware?

Looking at enetc_get_si_caps() in enetc.c, si->num_tx_rings and=20
si->num_rx_rings are read directly from hardware and bounded only by 0xff.
The arrays priv->tx_ring and priv->rx_ring are statically sized to 16 in
struct enetc_ndev_priv.

If the hardware provides a ring count greater than 16, could this cause an
out-of-bounds write when enetc_int_vector_init() initializes these arrays?


[Severity: High]
This is also a pre-existing issue, but is the int_vector array size safe
when running on a system with more than 6 CPUs?

In enetc_init_si_rings_params(), the driver bounds the interrupt vector
count by the number of online CPUs:

    priv->num_rx_rings =3D min_t(int, cpus, si->num_rx_rings);
    priv->bdr_int_num =3D priv->num_rx_rings;

However, the int_vector array in struct enetc_ndev_priv is statically
sized to ENETC_MAX_BDR_INT (6). Could this lead to an out-of-bounds write
in enetc_int_vector_init() if the system has more than 6 CPUs and the
hardware provides more than 6 RX rings?

> -	ndev =3D alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	ndev =3D alloc_etherdev_mqs(sizeof(*priv), si->num_tx_rings,
> +				  si->num_rx_rings);

[Severity: High]
By replacing ENETC_MAX_NUM_TXQS with si->num_tx_rings here, could this
cause queues to hang if the hardware provides more than 8 TX rings?

Looking at the interrupt handling in enetc.c, both enetc_msix() and
enetc_poll() still use the hardcoded ENETC_MAX_NUM_TXQS (8) limit when
iterating over the rings map:

enetc_poll() {
    ...
    for_each_set_bit(i, &v->tx_rings_map, ENETC_MAX_NUM_TXQS) {
        ...
    }
}

If a VF is initialized with more than 8 TX rings, will the interrupts for
queues 8 and above remain masked at the end of the NAPI poll loop,
preventing further TX completions?

>  	if (!ndev) {
>  		err =3D -ENOMEM;
>  		dev_err(&pdev->dev, "netdev creation failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630072036.3827=
61-1-wei.fang@oss.nxp.com?part=3D13
