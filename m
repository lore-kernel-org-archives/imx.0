Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1224677F
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101871; cv=none; b=Z3L4ns53Hxn6Ov7CBT/jWUjyuGKlF+tKt08jP9TRQ+j6vUt04zBYYdgGTrvyu2ZtQHcsjtBZAER/0nvtL+Kq8nKVN4OKBdzsaCH1RGuSVcshM/R95WaCT1rWfGXFmW33W1aBAHLqsHJOh/kltNT3D+bZ3KlY0ztc+9vSXAEDPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101871; c=relaxed/simple;
	bh=zR1v6QuXlj3epnf4VImxGA2elYwYqjhD5DIfrYwvf00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b4lBRTG5bYz6nvgJ+0NHvfMamTpJE7izV1BQFiRyQ7QtcXx3+KoUmKd2Gs0wXB82ifClhD416w4/Lyb5mtG+gop5BNulq9zxHQmzEzs/SG1t2tDhTp0MHZfh0WP8kP9oVTnwVyTGMvkS82IRers60//IIqxnFXF8+kMDLBzB6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU5C/VWE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU5C/VWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E891F0089A;
	Sat, 30 May 2026 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101870;
	bh=e1IL43y6kDXOfxSy1PMwUrP8XaDj9guK+C+sndyMD3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VU5C/VWEFYQ97vDTUMp8saGOsk78azs+8JtKcGGEltGb9BcpWuXaB07CtrqNvlnFX
	 t+Pl3sWxDKgOlTMGSfFbvhZMhf4foe0ysEWh+D74jfxSlxEdUnHur5nk9XYgfJw33g
	 5SfQUmz3uha7169p/x52lhR5IJbGZWZ9e8SwpnSSVMuAw7FXAW4dcsey0griwUxZxW
	 /uNWp1DmwgJugWcrUip0LUtSlVIoRPbqJiHa4RE7YhuRh+vGWolamY9D8GU6BGXw3k
	 8fFWrmL5YtEYgsD44CQji1UwHyfv4VRE3v7kECYJgelmWRW/i2uN3Zyj6OwZepr5U3
	 LuxjQsa2BiUvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net 5/9] net: enetc: fix race condition in VF MAC
 address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260520064421.91569-6-wei.fang@nxp.com>
References: <20260520064421.91569-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:44:29 +0000
Message-Id: <20260530004430.35E891F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect MAC address programming on Big-Endian architectures due =
to the use of __raw_writel and __raw_writew.
--

commit 5639b35fec15cd95ac4b3347ba872a265e9e8d97
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix race condition in VF MAC address configuration

This commit introduces a per-VF mutex to serialize access to vf_state and
hardware MAC register updates. This prevents a race condition between the
VF message handler and administrative VF MAC configuration from the host.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index 09c6420408923..8e11a023d516b 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -252,8 +252,12 @@ static int enetc_pf_set_vf_mac(struct net_device *nd=
ev, int vf, u8 *mac)
>  		return -EADDRNOTAVAIL;
> =20
>  	vf_state =3D &pf->vf_state[vf];
> +
> +	mutex_lock(&vf_state->lock);
>  	vf_state->flags |=3D ENETC_VF_FLAG_PF_SET_MAC;
>  	enetc_pf_set_primary_mac_addr(&priv->si->hw, vf + 1, mac);

[Severity: High]
This is a pre-existing issue, but does calling this function cause an
incorrect MAC address to be programmed on big-endian architectures?

Looking at the implementation of enetc_pf_set_primary_mac_addr():

static void enetc_pf_set_primary_mac_addr(struct enetc_hw *hw, int si,
                                          const u8 *addr)
{
        u32 upper =3D get_unaligned_le32(addr);
        u16 lower =3D get_unaligned_le16(addr + 4);

        __raw_writel(upper, hw->port + ENETC_PSIPMAR0(si));
        __raw_writew(lower, hw->port + ENETC_PSIPMAR1(si));
}

The function parses the address using get_unaligned_le32() and
get_unaligned_le16(), which convert little-endian bytes to native CPU
byte order. It then writes these values using __raw_writel() and
__raw_writew().

Since the raw I/O accessors do not perform CPU-to-device endianness
byte-swapping, the CPU-endian values are written as-is to the device.
On big-endian architectures, would this cause the bytes to be reversed
from the hardware's perspective and corrupt the MAC address?

Could the driver use the standard writel() and writew() accessors, or
its own enetc_port_wr() wrapper, to ensure proper CPU-to-LE conversion?

> +	mutex_unlock(&vf_state->lock);
> +
>  	return 0;
>  }
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520064421.9156=
9-1-wei.fang@nxp.com?part=3D5
