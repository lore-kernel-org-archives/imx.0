Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656444E64E
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036648; cv=none; b=XER97CiEthKCYKZNF+jsLj6lrFlr62CuDpKiYzf8NZQjR8OskFwfhJUD11UucMfeQ5TUJX3iXtJMCMT45epbSUdQKbp8kN1yCIz5/fIFEPnr5bcOOP8kIQhqKjP2oEiocWK79cLsEvLKyLPx231amuZ28ybGkpTOO3C6zpYYfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036648; c=relaxed/simple;
	bh=HSCf1LCjuqowLlvvnl6QYuN/gazdMHLu3e/21de4rJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MR0GY6FTQ1gjgI/YINSOE2mYR0p80js3MaLCb93IH+Gd4hNd4i/5O49LEU0FCbKY9EZgBURbhNDokts5NTTNRtNCh1CWvj9Bxs8QMMD0+V1Tte527HbtjCKVrbZtaeJ7P4kfivDlCiCX7RLlEaIy5pkDwvKkHMhkbccxQFjmRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu5bfru4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu5bfru4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CBA1F000FF;
	Thu, 10 Sep 2026 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036647;
	bh=alxy4kEBRtfNPqUeZL47dpyG+Un4HMoeCtnstfHuF00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vu5bfru4mvnJjaVGMWIJWyjIAsSZ+DE/II26jbxH4VWVC9DJm30Z+0swmC576lS4h
	 NNRI17QHQqjR1Ch2yWHi5P5xJpIgakN0UlBK82VH2jaT9RrvZ29KQR84MwSbgy7qD5
	 uRyfY8oJRTMJsZyGtRijmudNJoL93wvk8oaRj01XeaNwinpCq9avivFuYtVIccYIr4
	 a5ydczg9nLTjGe4mtReEnmUskpM76zmolUorDqnJd3K1XJo9EpDT7DEr5FO8jtFElS
	 kG8M5euqhHyVLZUAcaaaE3B/O2Bffi4enHwkSozzBuoCAH0J/hpInwIy/BZ9ewOJU2
	 J48ORoRLniTtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 07/15] net: enetc: add .ndo_set_vf_mac() to
 the enetc v4 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909100733.1139689-8-wei.fang@oss.nxp.com>
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
 <20260909100733.1139689-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:37:26 +0000
Message-Id: <20260910103726.D6CBA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the newly added =
`.ndo_set_vf_mac` callback directly exposes it: Incorrect MAC address progr=
amming on Big Endian architectures due to `__raw_writel()`.
--

commit d4ab065b05df3371bda6a210173bde546f473ad3
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add .ndo_set_vf_mac() to the enetc v4 driver
   =20
Add .ndo_set_vf_mac() to the enetc v4 driver to configure the MAC
addresses of VFs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index e20989b6f8b49..a44d50b7fd2ad 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -579,6 +579,7 @@ static const struct net_device_ops enetc4_ndev_ops =
=3D {
>  	.ndo_hwtstamp_get	=3D enetc_hwtstamp_get,
>  	.ndo_hwtstamp_set	=3D enetc_hwtstamp_set,
>  	.ndo_set_vf_trust	=3D enetc_pf_set_vf_trust,
> +	.ndo_set_vf_mac		=3D enetc_pf_set_vf_mac,

[Severity: High]
This isn't a bug introduced by this patch, but the newly added
.ndo_set_vf_mac callback directly exposes a pre-existing issue in the MAC
address programming.

When the MAC address is set, the driver invokes enetc4_pf_set_si_primary_ma=
c()
via the enetc_pf_set_vf_mac() -> enetc_set_si_hw_addr() call chain:

drivers/net/ethernet/freescale/enetc/enetc4_pf.c:enetc4_pf_set_si_primary_m=
ac() {
	u16 lower =3D get_unaligned_le16(addr + 4);
	u32 upper =3D get_unaligned_le32(addr);

	if (si !=3D 0) {
		__raw_writel(upper, hw->port + ENETC4_PSIPMAR0(si));
		__raw_writel(lower, hw->port + ENETC4_PSIPMAR1(si));
    ...
}

Could the use of __raw_writel() cause the MAC address to be programmed with
reversed byte order on Big Endian architectures?

Since get_unaligned_le32() returns a host-endian integer, writing it direct=
ly
using __raw_writel() on a Big Endian system will write the bytes in reverse
order compared to what a Little Endian PCI device expects.

Furthermore, will writing the u16 lower value using the 32-bit __raw_writel=
()
place the MAC bytes in the wrong word offset on Big Endian systems?

This would cause the network interface to drop legitimate unicast traffic.

>  };
> =20
>  static struct phylink_pcs *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909100733.1139=
689-1-wei.fang@oss.nxp.com?part=3D7
