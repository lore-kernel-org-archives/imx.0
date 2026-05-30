Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF51C69D
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101991; cv=none; b=tb9KJRfvUU62unOwyVo3ozBPmQ+itQAZC+vIHsP6NZhit1zIX+7yj0Byc5lIpEOjUj3ZEu/Zker/BXirBwM9p8Mhsu/x5P69asAE4E5a6VizFz2r2PoXXc7PRFruPZwkhAwjI2uOrF4Vm6PWqzEuJdcFnc+MYFj8AdPJhk/laNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101991; c=relaxed/simple;
	bh=eB4+AUq+4KAvKXsavvJWwzWnKagQfxl8UdqmLPVNUmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LzcDDJ8l3ewO0Iy+l8sntnwTelae7PJTwKnfrABt5t9Mf5kViRBv9YQq0W+dcTpnGTlZ6N69C7uh4rpMIYBGrvfQsT3pRx1E8poX5oa+t8Ob3c4lnGTOGijGovkergBdaaTVReIBOp1R/tuyYixyOC5FFaxmUSxBmhp4NKdWs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eexcLynI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eexcLynI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253131F00898;
	Sat, 30 May 2026 00:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101990;
	bh=kBunI5/rOvF9/QQ34pSRVl1uyZBLTs/K6K5709hmwxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eexcLynINSDIPtv2cNxqZRLmpUecq8QDE4+HIbdseIgBGcag7MTO3w40bQcACeSj2
	 k2Prrwfmt0+zXyIXm7ZjfWux/cXFwKHlDA9DPE3Y+dhQxEogxTU7KYjrK3/UFLB9t8
	 v1ylOl4+wg89zFlsyCpT7x2uE1KQyhu1TgrItrfRup9C3/wf159AmJq6ITug7yLX/I
	 u1llbSXkTWNJiympsomM9nW09AhKwBAxL8sUXatj9TGhcr0d9CNa6/j/NuHZkn+any
	 ua1CwJdgnwxTFauGgSWNEqqBOUxqXBsYefB6tapKdpw0VO+7FbUcl+AigJTZijxJ11
	 llJH+F1drUMNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 09/12] net: enetc: add CBDR setup/teardown
 hooks to enetc_si_ops for VF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260522092438.1264020-10-wei.fang@nxp.com>
References: <20260522092438.1264020-10-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:29 +0000
Message-Id: <20260530004630.253131F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing PCIe posted write flush during CBDR teardown leads to pote=
ntial DMA use-after-free/fault
--

commit e8719566bfcc671815aca75ea6a2c0caefb79aef
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add CBDR setup/teardown hooks to enetc_si_ops for VF support

This commit adds setup_cbdr and teardown_cbdr function pointers to struct
enetc_si_ops to allow the ENETC v1 and v4 VF drivers to register their own
command BD ring implementations. It updates the VF driver to call these
operations through the ops structure instead of invoking the v1 functions
directly, enabling runtime selection based on the hardware version.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index e8ad5ad5aba48..9cdb0a4d6bafb 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -288,6 +288,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *si=
, struct net_device *ndev,
>  static const struct enetc_si_ops enetc_vsi_ops =3D {
>  	.get_rss_table =3D enetc_get_rss_table,
>  	.set_rss_table =3D enetc_set_rss_table,
> +	.setup_cbdr =3D enetc_setup_cbdr,
> +	.teardown_cbdr =3D enetc_teardown_cbdr,

[Severity: High]
This is a pre-existing issue, but looking at the implementation of
enetc_teardown_cbdr(), the command ring is disabled by writing 0 to the
Mode Register. Because this write translates to an iowrite32, it is a
posted PCIe write that can be delayed in the interconnect fabric.

The code then frees the DMA memory immediately without reading back from
a device register to flush the posted write, and without polling for a
hardware busy status to clear.

If a previous command timed out and the hardware is still processing it,
or if the posted write is simply delayed, could the device continue
accessing the descriptor ring after the memory is unmapped? This might
result in an IOMMU fault or silent memory corruption if the IOMMU is
disabled.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522092438.1264=
020-1-wei.fang@nxp.com?part=3D9
