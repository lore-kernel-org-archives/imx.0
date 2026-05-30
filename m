Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7AE46B5
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101990; cv=none; b=FBM05XtAwyot3/o/9eSLkKQsWPcvBpX0n8csMCD4JZkTCXrLA7yYj+AR465bg6gKpm8WYYomiVY4wiQBcXaolCX8YW4qVchu+sjX26sV0hGycwGvqGLCRWA+85T3EFhPAxw7J5J0FiBItSCtmvLYF+9CJlpiIZHacBCu2mDaTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101990; c=relaxed/simple;
	bh=VNVtg5yKytvR8AfdeN3cepfVIlC/D2+G5SCD8BeT4l8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ShQLD4EGJb+iX7nodyE6AZKlytwB0r71+T7JAs/SP5H6nbCvsvG7tB3Moi4shSUCtefSCjpj1zpyFGQQ8C+iOwPMf2MO1WR68Nkl9huUFbpSDfr2iRtfRQNZ+kd+ojAy9P0SkggViz6eXThsKLKUBRQ/3klFhmXXzQv6yCk9Bic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JabXlTcw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JabXlTcw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1B11F00893;
	Sat, 30 May 2026 00:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101989;
	bh=4oNMEddPtgqKWRbUyOI76UKKskgUkrljhHwvFYwdGcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JabXlTcwnJnXMPmck/HFNujBNhBjDoVdZjw6pSaCMd3k5KX95e/G2LYwhcuzYo5RA
	 ishoUOADu6mcV2MkxYS1EyOunk4AvPDgMLH4WhF9p6+aZFCJG7zUHZA9/AMsKM7h1s
	 2Aq0HT06bnSgLmgg634dHsTgmAxMS4Mf5ljlKcvg1BwBhPYcUCEn1R86K25pcBTcQS
	 Fw8feI3iOV9uj/D2nDkDLKL1MMe+4Qbd53KMIklhtPu/pyK4dhshTlPXjid1B/+vsf
	 pWbi/8wlxRlHfLv6qP+H+NPGmBzpQnzzrbcgyKa6FmnFEUX7OVXBahUqpQ2Sw4MvS9
	 RvM7fT8KYODJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 01/12] net: enetc: use
 enetc_set_si_hw_addr() for setting MAC address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522092438.1264020-2-wei.fang@nxp.com>
References: <20260522092438.1264020-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:29 +0000
Message-Id: <20260530004629.7C1B11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware registers for MAC address configuration are accessed usin=
g `__raw_readl` and `__raw_writel` without endianness conversions, causing =
incorrect MAC addresses on Big Endian systems.
--

commit 9950ab386f64a0d2f5b71b2003e9ca960d52dddd
Author: Wei Fang <wei.fang@nxp.com>
net: enetc: use enetc_set_si_hw_addr() for setting MAC address

This commit replaces enetc_pf_set_primary_mac_addr() with the generic
enetc_set_si_hw_addr() function to prepare for moving MAC address setting
logic to the common driver for reuse.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 76263b8566bb3..c30b5f71efd5e 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
[ ... ]
> @@ -7,13 +7,13 @@
> =20
>  #include "enetc_pf_common.h"
> =20
> -static void enetc_set_si_hw_addr(struct enetc_pf *pf, int si,
> -				 const u8 *mac_addr)
> +void enetc_set_si_hw_addr(struct enetc_pf *pf, int si, const u8 *mac_add=
r)
>  {
>  	struct enetc_hw *hw =3D &pf->si->hw;
> =20
>  	pf->ops->set_si_primary_mac(hw, si, mac_addr);

[Severity: High]
This is a pre-existing issue, but does the underlying MAC address
configuration code have an endianness bug on Big Endian systems?

Hardware registers for MAC address configuration are accessed using
__raw_readl() and __raw_writel() without endianness conversions.

The code uses get_unaligned_le32() to read the first 4 bytes of the MAC
address into a host-endian u32. For a MAC address starting with 12:34:56:78,
on a Big Endian CPU this creates the u32 value 0x78563412.

It then uses __raw_writel() to write this u32 to the PCIe memory-mapped
register. __raw_writel() performs a raw host-endian memory store without any
byte swapping. On a Big Endian CPU, 0x78563412 is stored in memory as the
byte sequence 0x78, 0x56, 0x34, 0x12.

Since the PCIe controller interprets the MMIO space as Little Endian, it
reads those bytes back as 0x12345678, completely reversing the MAC address
bytes. Could this break network configuration and communication on Big Endi=
an
systems?

The rest of the driver correctly uses iowrite32() and ioread32()
(via enetc_wr() and enetc_rd()), which handle the host-to-LE conversion
properly.

>  }
> +EXPORT_SYMBOL_GPL(enetc_set_si_hw_addr);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522092438.1264=
020-1-wei.fang@nxp.com?part=3D1
