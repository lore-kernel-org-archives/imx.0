Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5A1B3925;
	Sat, 15 Aug 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785574; cv=none; b=hTQUNEvqTQvjUjfnib0t8tL/PEY8QbYuhgQoR1Zw5hsIDzNnURTOsGO6DpRT8xc/yyzKjNt2wLiouOzznyPm1Xrqx7+CIlZ32vn2OvxWkARXTgZRAf//M0uzkMtymtqFytjyUsZI50OqzrW0+ms4Tnst4Gl59pMJ2Bb/rWSFAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785574; c=relaxed/simple;
	bh=qcS0nkxivq9w8KtgWHFZabGWuDwrcomxpwmc909Nx5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CWPRiRixKgwo/x/9i/cD9YmHdzsbOBmUyOGDANQ40DNjl9rp4/3osgC/WpJBfUPDRTPx01/KjNb/KKEaZSFCb0OKM9W2ANqR5JtdNZrOR7WBEyvfrWiWfwIM709gpcbd9EY6lpiRmU5IOzK+ghASjiXGOk/ZiOQN73XQ5Qhmdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBAHtmjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBAHtmjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA5C1F000E9;
	Sat, 15 Aug 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786785572;
	bh=j1s65DkP4wlhLXjmAoKerVkA6aihvJGm0/9D4kgKGt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PBAHtmjQchGtNVc6q/EVM6ZqWPCtDIFip8OnWxaiQ0ddTkxshAr1weFbLodiSQ9In
	 HzQWwQD9C8OXLtOCFB3Wnv5UiVULk3No999tXj4DcCxzlv2GbUHdrT9gdVvbXBUWvQ
	 3EuHiTJfoh7xjF/HDXhOrWn+GstgMTGQZzyBmciaARZicPuTO8DMvCcY1cs+JiYUe9
	 hzxWiKJD0WVtIdFId4/pUJwj23ri5v/Ci9HlK/upkp5qhy2AVloWsBDbHSVkmMC0x+
	 0XX+n8vEU4f1/K15wMl9Zklbr8/HxAJ7TM2xepGYYcxFxPFa0dTo5VcZALbt/ssZ8f
	 rLlfr8NY6BM/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: fec: support receive flushing via
 fsl,rx-flush-queues
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260814090906.2225075-3-alexander.sverdlin@siemens.com>
References: <20260814090906.2225075-1-alexander.sverdlin@siemens.com>
 <20260814090906.2225075-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:19:31 +0000
Message-Id: <20260815091932.1DA5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver fails to clear bootloader-configured RX flush settings =
when `fsl,rx-flush-queues` is not specified, potentially inheriting a vulne=
rable hardware state.
- [High] The newly introduced `FEC_QUIRK_HAS_MULTI_RX_FLUSH` collides with =
the existing `FEC_QUIRK_HAS_MDIO_C45` bitmask, defeating the ERR050395 erra=
tum safety check.
--

--- Patch [2]: [PATCH net-next 2/2] net: fec: support receive flushing via =
fsl,rx-flush-queues ---
commit ccf669baa787206c1aada126a00677e049b4714b
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

net: fec: support receive flushing via fsl,rx-flush-queues

This commit adds support for flushing frames stuck at the head of the RX FI=
FO
via the FEC_QOS_SCHEME register. It parses the fsl,rx-flush-queues device t=
ree
property and ensures erratum ERR050395 is respected by restricting multi-qu=
eue
flushes to hardware that advertises support.

> diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/=
freescale/fec.h
> index 7176803146f3d..4af3ae286895f 100644
> --- a/drivers/net/ethernet/freescale/fec.h
> +++ b/drivers/net/ethernet/freescale/fec.h
[ ... ]
> @@ -499,6 +504,12 @@ struct bufdesc_ex {
>  /* Jumbo Frame support */
>  #define FEC_QUIRK_JUMBO_FRAME		BIT(25)
> =20
> +/* Receive flushing (QOS Scheme register RX_FLUSHn) may be enabled on mo=
re than
> + * one RX queue at a time. Parts without this quirk are subject to errat=
um
> + * ERR050395 and must limit RX flushing to a single queue.
> + */
> +#define FEC_QUIRK_HAS_MULTI_RX_FLUSH	BIT(24)

[Severity: High]
Does this new quirk collide with an existing one?

It appears FEC_QUIRK_HAS_MDIO_C45 is already defined as BIT(24) in this
header file (though outside the context of this patch).

Because of this collision, controllers with MDIO C45 support will mistakenly
evaluate as having the multi-rx-flush quirk, completely bypassing the errat=
um
safety check added in fec_probe() and allowing lock-ups on vulnerable
hardware.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index ced4dbf8cd90f..a4fe8423630b5 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> @@ -1090,6 +1090,15 @@ static void fec_enet_enable_ring(struct net_device=
 *ndev)
>  			       fep->hwp + FEC_RCMR(i));
>  	}
> =20
> +	/* Enable receive flushing for the selected queues */
> +	if (fep->rx_flush_mask) {
> +		u32 val =3D readl(fep->hwp + FEC_QOS_SCHEME);
> +
> +		val &=3D ~QOS_RX_FLUSH_MASK;
> +		val |=3D fep->rx_flush_mask;
> +		writel(val, fep->hwp + FEC_QOS_SCHEME);
> +	}

[Severity: High]
Can this leave vulnerable bootloader configurations active if the device tr=
ee
omits the fsl,rx-flush-queues property?

If fep->rx_flush_mask is 0, this register update is skipped entirely.
Meanwhile, controllers with FEC_QUIRK_HAS_MULTI_QUEUES skip the hardware
reset in fec_ctrl_reset().

If a bootloader (or prior kernel via kexec) enabled RX flushing on multiple
queues, and the current device tree doesn't specify the property, the old
configuration will persist. This could inherit a dangerous hardware state
and trigger the ERR050395 RX path lock-up.

Should the FEC_QOS_SCHEME register always be updated to clear the mask if
fep->rx_flush_mask is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814090906.2225=
075-1-alexander.sverdlin@siemens.com?part=3D2
