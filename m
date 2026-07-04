Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC686314A84
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161829; cv=none; b=G7Z0VjyLQw/mtaq0J59dLiSPMwQXgduZlohgXdqhuYPWvasHzUiOA3wT+mOCBUr5opT5Dw9z/Cl4WKc6NpBZTpcB0Q7Ymw6Tj3G3x1XdPTu04cSLhrXd5dwoY7+bQ6lmtuw7QsOBCn6NvRANItEl9wK/LSjOCbAAmQTFx61aMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161829; c=relaxed/simple;
	bh=/McM7el0YTQq4uCAUyk3sRfocMUj+NC2csX5/bKlYbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JzAXKuLvpEuXjZiw58f5EAENKAuTeCCzy4YTicJrYl8rb/PPGE8F6OO5YAYbJfyhx2J3/i4zXIhNJwIMHzJQkolrE6T/RlQzLcDeW4FLd79A2RPMX7jmoRtQvBzvuxSJeKGCW40+6ABeWtQ5lOigzKfF+Gj/1ze/oXlm0q1RpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHYzliBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHYzliBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969BB1F00A3A;
	Sat,  4 Jul 2026 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161827;
	bh=tZQEHCrr6f56zJLIH8mXIzFRE5MhkzeQ2MSbDNr+4UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHYzliBfrZW+PtKAg6JGeu7c4MWpXDCbd+VPqPdcm4u0kQR1UdrxIRr+n8E5lj4HK
	 uTYXj+CLrZlEx6g7WTPD+g199yYPCQZxbG/y2X49YYBCqJA7F4YdROnXpzH7IkDq/6
	 F9SLzefqU44yn46tL0ntDRRxN8gfHVazHfE5EJlJhg8+p+cFNO/PO++DU2/7q30A1B
	 kJ8AANRL7OAfnBlxVyZ1+IYNOg1jEK5M1QDLXslOsmrDWxy2vQvzDpp+lwvabzBXZ4
	 Z3F6BfLecMOSvQIC4mVQE4sY3lrVHE9B0kIZpm8cP5z4r+s4ITpXCLYCZxXce7u5AI
	 66Y8ozLjDIyrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 13/14] net: enetc: use alloc_etherdev_mqs()
 to create netdev for VF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703101328.550714-14-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:47 +0000
Message-Id: <20260704104347.969BB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware-provided values for TX/RX rings are not bounded against i=
nternal fixed-size arrays, leading to out-of-bounds memory writes.
- [High] Missing `cancel_work_sync` for `tx_onestep_tstamp` leads to a Use-=
After-Free when the device is removed.
--

commit bc3a89d79f3274d57f2fc8eeefc80908aed8f007
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use alloc_etherdev_mqs() to create netdev for VF driver
   =20
The VF driver uses alloc_etherdev_mq() with ENETC_MAX_NUM_TXQS as the
queue count, which forces the TX and RX queue counts to be equal and
uses a compile-time constant rather than the actual hardware capability.
This patch switches to alloc_etherdev_mqs() so that the TX and RX queue
counts are set independently based on the actual rings assigned.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 9cdb0a4d6bafb..7dcb4a0246f52 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,14 @@ static int enetc_vf_probe(struct pci_dev *pdev,
> =20
>  	enetc_get_si_caps(si);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but can a malicious PF or
hypervisor cause an out-of-bounds write here?

Looking at enetc_get_si_caps(), it reads si->num_tx_rings and
si->num_rx_rings directly from the hardware register ENETC_SICAPR0 and
masks them with 0xff. This allows values up to 255.

While this patch properly bounds the values passed to alloc_etherdev_mqs()
using min(), the driver's internal arrays priv->tx_ring (size 16) and
priv->int_vector (size ENETC_MAX_BDR_INT) are still exposed to these
unbounded hardware values. During initialization, enetc_int_vector_init()
writes to these arrays using the unbounded ring counts, which could
overflow the fixed-size arrays.

Should the hardware capabilities be explicitly bounded against the internal
array sizes when they are read in enetc_get_si_caps()?

> -	ndev =3D alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	/* Currently, the supported SoCs have a max of 6 CPUs and the VFs
> +	 * have less than 6 RX/TX rings. So no issues for these supported
> +	 * SoCs, but for future SoCs which have more CPUs or more TX/RX
> +	 * rings, all the related logic needs to be improved.
> +	 */
> +	ndev =3D alloc_etherdev_mqs(sizeof(*priv),
> +				  min(si->num_tx_rings, ENETC_MAX_NUM_TXQS),
> +				  min(si->num_rx_rings, ENETC_MAX_NUM_TXQS));
>  	if (!ndev) {
>  		err =3D -ENOMEM;
>  		dev_err(&pdev->dev, "netdev creation failed\n");

[ ... ]

>  err_alloc_si_res:
>  	si->ops->teardown_cbdr(si);
>  err_setup_cbdr:
>  	si->ndev =3D NULL;
>  	free_netdev(ndev);

[Severity: High]
This is a pre-existing issue, but does this driver have a use-after-free
risk during device removal?

In the device removal path enetc_vf_remove(), which similarly calls
free_netdev(), the driver unregisters and frees the netdev (which also
frees the priv structure) without first calling
cancel_work_sync(&priv->tx_onestep_tstamp).

If a user requests hardware timestamping for outgoing packets and the
device is concurrently unbound, could the background workqueue thread
execute enetc_tx_onestep_tstamp() and dereference the freed priv pointer?

>  err_alloc_netdev:
>  err_get_driver_data:
>  	msg =3D si->msg;
>  	enetc_pci_remove(pdev);
>  	enetc_msg_dma_free(&pdev->dev, &msg);
> =20
>  	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D13
