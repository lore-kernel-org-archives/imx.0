Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53F434E30;
	Tue, 21 Jul 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625968; cv=none; b=uotIJ9pJp+1wDnGGgsNQnHz7ILllaRouxku/qTLUiVROyTHDKZGrClsRDzlOTNMkht0octHcTDPeGhLYz+IPP040vdStW88ldevhlVLTQgTHpUHITwVvh67HwXfMPTP3KTLUK4XtJe/8jFvykSK3A0wMPXSUGGenHQiL31G0/wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625968; c=relaxed/simple;
	bh=vqjUtXFK+AhMT5mwM5PVBi8bVf/LqOB4BguUp7uQrHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e5uoVmicnSUGIktzXwozeziK2+QCK0lRGegK7kpMIdEt73GlLjCIHtuLVQAo8EkjAn2EoAOBAUFymcgTTThxcw2ewq69UakuIedWFkz2CfU73ZonJxwHEOC4c7iSaJzQKVuph73WzNXTnW9lYFV4XsuxBBvINL5znOnpJROH2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK5pFlQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK5pFlQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B1D1F00A3A;
	Tue, 21 Jul 2026 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625967;
	bh=OMvpcMN/wkwJlv7cv3UaGRItgzDdSvJqu7MFzciTQbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FK5pFlQYu56ioFKJAJgrbwtvGk5al/YD7WbDEZbP/4Q2sVSltqM8KsLin/Bw6/Dl7
	 sQkv/ihrwUvFq8qKKk3WgTGvgRxUWL88haIhWUjSzMkLDnCFDMqWSJDmYpxdL01rSk
	 AVd+s1HSST9xgjzn/mJxTX3yWz3LPdnmxZF+r9gQ4OF8HgskZUI61GTuSlft548bUq
	 8k5d3Kl5lAbMpCo7Dm1V6cdJB6v1HpERtrC9RKdPHm0HIYfekcVLPSLYm42snVk/Wl
	 +9L0H1Wt2R5jMJKNdp+8FeBTb0C6rX7QTEQrY6SYE0H3jnwhHyPz3IOFNqLwyRLt/t
	 di8aZDqbs2tdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] net: mv643xx: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-7-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-7-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:06 +0000
Message-Id: <20260721092606.B4B1D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver permanently leaks dynamically allocated platform device=
s, their resources, platform data, and fwnode references during teardown.
- [High] DMA mappings are leaked and the TX ring state becomes corrupted if=
 descriptor mapping fails during TSO processing.
--

--- Patch [7]: [PATCH 7/8] net: mv643xx: use platform_device_set_fwnode() -=
--
commit d4dc0688026958e8569e1e6212a8ec7a37b4fb45
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: mv643xx: use platform_device_set_fwnode()
   =20
Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

> diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/eth=
ernet/marvell/mv643xx_eth.c
> index 9caa1e47c174c..2f2d6cce8d852 100644
> --- a/drivers/net/ethernet/marvell/mv643xx_eth.c
> +++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
[ ... ]

While reviewing this patch, I noticed a couple of pre-existing regressions =
in
this file:

> static int txq_submit_tso(struct tx_queue *txq, struct sk_buff *skb,
> 			  struct net_device *dev)
> {
[ ... ]
> 	/* clear TX_END status */
> 	mp->work_tx_end &=3D ~(1 << txq->index);
>=20
> 	/* ensure all descriptors are written before poking hardware */
> 	wmb();
> 	txq_enable(txq);
> 	txq->tx_desc_count +=3D desc_count;
> 	return 0;
> err_release:
> 	/* TODO: Release all used data descriptors; header descriptors must not
> 	 * be DMA-unmapped.
> 	 */
> 	return ret;
> }

[Severity: High]
This is a pre-existing issue, but does this err_release path leak DMA memory
mappings and permanently corrupt the transmit ring state?

If txq_put_data_tso() fails (e.g., due to a dma_map_single() failure), the
code jumps to err_release and returns the error without rolling back already
configured descriptors.

Since txq->tx_desc_count is not incremented for the already processed
descriptors, the subsequent txq_reclaim() loop will never clean them up. The
txq->tx_curr_desc index has already advanced, which seems like it would cau=
se
the ring pointers to lose synchronization.

[ ... ]
> static void mv643xx_eth_shared_of_remove(struct platform_device *pdev)
> {
> 	struct mv643xx_eth_platform_data *pd;
> 	int n;
>=20
> 	for (n =3D 0; n < 3; n++) {
> 		if (!port_platdev[n])
> 			continue;
> 		pd =3D dev_get_platdata(&port_platdev[n]->dev);
> 		if (pd)
> 			of_node_put(pd->phy_node);
> 		platform_device_del(port_platdev[n]);
> 		port_platdev[n] =3D NULL;
> 	}
> }

[Severity: High]
This isn't a bug introduced by this patch, but does this loop permanently l=
eak
dynamically allocated platform devices and their resources?

The code calls platform_device_del() to remove the device from the hierarch=
y,
but it appears to be missing a call to platform_device_put() to drop the
initial reference count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D7
