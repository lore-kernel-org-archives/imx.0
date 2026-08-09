Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7219F115
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245546; cv=none; b=XYRLqs0YXlugh5Vp35XSfGvCqgT68/9kCwYDPULYoPBy2YF8qVtX9BIyWVu744/smf7kumzqgQw/92AujlYKm2uYNVp5VIe8i71fgHk5XKfSuxXDHAHfLY3rqGNbqS9hh/70xi+/eInWqHh2saC/Rvyrs/UN+BHrJpT+Ht2fGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245546; c=relaxed/simple;
	bh=0RLz2UQL91c5+fzIwCEJa0vQdPiPlMojoI/fbpJUTPM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Phq84Lh294/5bPQDZXXzS6GE72XDQL1/1bt/dKCzgsX+k/UaaHjGteSYuJFp/xVzxo9+964gjVvKkFg2Ptm50YwreS2cqazj109mQge73V9dD1HiacNybkL/K3IMDHfQkZ14uNNp2cMmu2zmKU7OBR/c8st+IfH5cnJksEEQDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Prok8K60; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Prok8K60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520531F00A3D;
	Sun,  9 Aug 2026 03:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245545;
	bh=dygDrKlnFAxawj1fOtfBcjDHN9IeJCO/Y/seGo/wp6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Prok8K60Cwwq2r22OPDjmNCZl7XFlXfJaDiLKROUjit0q6M3145W+D3cig6Lasvfk
	 0UNSvoxyY5gvb084DLEwIfqEnyg+jPJCT9lcV0uYlocifYOqd1fxz8XBqg+o0Kcqh4
	 h0MHqpnYmb1cpRFzBJdXPoYp2yQ2g/Hg3cXZRaGbj94gxv6Jk1mx4FLPABU+7ccIOY
	 GZilQiOwdN3bUcjPtkmA+POBmG7q8Lp8B9oKmic+knCbvH6/JXutHHFrhRN2LYWaLC
	 RYie3z35XjYaL+6SSNxaAukNqiHMLsNrvGQ6q+hbM7PWPj5/Prpp8f/8257aB1ymyb
	 mfUOweYx2qB+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 5/7] net: dsa: netc: enable ingress port
 filtering lookup by default
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260808032146.2335723-7-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:04 +0000
Message-Id: <20260809031905.520531F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DSA `port_set_host_flood` callback executes sleepable operatio=
ns in atomic context.
--

--- Patch [5]: [PATCH v2 net-next 5/7] net: dsa: netc: enable ingress port =
filtering lookup by default ---
commit eec39f0d058c5db3118dad52f6e11e6878ffa678
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: enable ingress port filtering lookup by default

This commit enables the ingress port filtering lookup by default for netc.
It simplifies the code logic by removing the need to track and toggle the
lookup state when adding or removing host flood rules.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index d326a00104e1d..9cb9e618661e5 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1753,8 +1757,6 @@ static int netc_port_add_host_flood_rule(struct net=
c_port *np,
>  	np->uc =3D uc;
>  	np->mc =3D mc;
>  	np->ipft_hf_eid =3D host_flood->entry_id;
> -	/* Enable ingress port filter table lookup */
> -	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
> =20
>  free_host_flood:
>  	kfree(host_flood);

[Severity: High]
This isn't a bug introduced by this patch, but does
netc_port_add_host_flood_rule() execute sleepable operations in atomic cont=
ext?

When userspace changes interface flags (e.g., ip link set dev ethX promisc =
on),
the network core calls ndo_change_rx_flags while holding netif_addr_lock_bh=
(),
which disables bottom halves and establishes an atomic context.

The DSA core delegates this to the port_set_host_flood callback, which calls
netc_port_set_host_flood() -> netc_port_add_host_flood_rule() synchronously.

Looking at the code, do these functions execute sleepable operations?

- Allocating memory using GFP_KERNEL (via kzalloc_obj() in=20
  netc_port_add_host_flood_rule())
- Acquiring a sleeping lock (via mutex_lock() in ntmp_select_and_lock_cbdr(=
))
- Yielding to the scheduler (via read_poll_timeout() with sleep=3Dtrue in
  netc_xmit_ntmp_cmd())

Could this lead to a "scheduling while atomic" panic if
CONFIG_DEBUG_ATOMIC_SLEEP is enabled? Should this hardware configuration
be deferred to a workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D5
