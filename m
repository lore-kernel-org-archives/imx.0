Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77E3C1D71
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735967; cv=none; b=RYAo3r6yXrGGMhxW2MNBEWzbEbZOt30+V9KOop6J+Be24mVkNpaxmsrtU1hJGlUgsCFFuqXBNkVcfnGlX4420InUSFGD9TPL23iBBArcA618a+xkY8yMWPZWK7R6lsVi6ZvovapOafuL0JBSZGlW/hMq0/mErEPz7EAAfu3qgnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735967; c=relaxed/simple;
	bh=C2uZiXdqREVnfm70XpmA+2sIVyu+rThvI8rPsudwwnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lNb8UB6Yr6xiENcjihheRPlviai5IEnNOrNq6tpCB4LPQZXx8CpMfzm9Xfik7E9uxk2uaFLwCWT0btZ3x9Yz+cIdTUFj+nguaSBvTEpvmF2GITUGnA8JOQt+HFExHYfKMBFvv439Bj4TkRup/o221ZpkzqXaawPfVbhiBveREIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXGHTta/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXGHTta/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE401F0157E;
	Wed, 26 Aug 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787735962;
	bh=cZvttvWwWOXePON70q4gVDf4klDf+ynI6EuL902+cH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXGHTta/JNhWDVI7cS0uQMsKWwplemEyZj2AB7lmrGCSGAe8qEKGdUcXreiwTtyji
	 8QM9ZNubtwLqL6d5kRBzuc7o+AbsKfArcuKB3iLuvPseCo/QQ4agOFU6q1YsjKroEV
	 843EVlfnzyoPN60NByt7vaQ3HqWbKVsW3sBzoVBT96kQiQTGFiJWL/v3I/+sVNXn65
	 yuKjKRQmtNxasZfnTzmlQwhEi/4+yiwss/BNcmLf9izEJaXDlnEy5tcY9cs5ymTrcL
	 xnlLEiwYPlWbElLqMFYKOj/n0+Ko2faHSeE2tKjBg1BJoeLTLVHij/9jQ5OBTXD5pt
	 L9NcKWFYLYSgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] net: fec: support RX flushing via an ethtool
 private flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
References: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 09:19:21 +0000
Message-Id: <20260826091921.CAE401F0157E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional access to the multi-queue specific FEC_QOS_SCHEME =
register (0x1f0) and unconditional exposure of the 'rx-flush-qN' ethtool pr=
ivate flags on single-queue hardware.
--

--- Patch [1]: [PATCH net-next] net: fec: support RX flushing via an ethtoo=
l private flag ---
commit 854fe678059b705accffaebdefe31e099763b2b1
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

net: fec: support RX flushing via an ethtool private flag

The FEC controller can flush the RX FIFO of an individual receive queue
through the RX_FLUSHn bits of the FEC_QOS_SCHEME (ENET_QOS) register.
This patch exposes this per-queue capability as a runtime ethtool private
flag.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index ced4dbf8cd90f..c45282defb0c3 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> +/* Program the per-queue RX flushing bits in FEC_QOS_SCHEME */
> +static void fec_enet_set_rx_flush(struct fec_enet_private *fep)
> +{
> +#if !defined(CONFIG_M5272)
> +	u32 val;
> +
> +	/* ethtool can race with fec_enet_adjust_link() (no RTNL) */
> +	guard(spinlock)(&fep->qos_lock);
> +	val =3D readl(fep->hwp + FEC_QOS_SCHEME);
> +	val &=3D ~QOS_RX_FLUSH_MASK;
> +	writel(val | fep->rx_flush_mask, fep->hwp + FEC_QOS_SCHEME);

[Severity: Medium]
Does this code safely handle older, single-queue SoCs?

It looks like fec_enet_set_rx_flush() accesses the FEC_QOS_SCHEME register
unconditionally (except on M5272). For older hardware without multi-queue
support, could accessing this reserved register space trigger a synchronous
external abort or other memory issues during interface startup?

> +#endif
> +}
[ ... ]
> @@ -3576,11 +3600,58 @@ static int fec_enet_get_sset_count(struct net_dev=
ice *dev, int sset)
[ ... ]
>  	case ETH_SS_TEST:
>  		return net_selftest_get_count();
> +	case ETH_SS_PRIV_FLAGS:
> +		return fep->num_rx_queues;

[Severity: Medium]
Are we unintentionally exposing the rx-flush-q0 ethtool private flag on
older single-queue hardware?

The documentation notes this as a multi-queue capability, but returning
fep->num_rx_queues here means single-queue controllers will still expose
and allow setting this flag, even if they don't support the register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825091908.1362=
677-1-alexander.sverdlin@siemens.com?part=3D1
