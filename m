Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF23E44E4
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148218; cv=none; b=E+1MpE8V/7mKlGhy2Fva9GtRBjw4gn54IeOqJUhyUFvGOZyOHY9uMYDlSvaKmkd1WZOCJ+7H2FxQr5esC0Dn+63vnwdVFxDFvdubP3Oa9Zr9eVsomQSwD3G9ZNF/CmEnszNgFRh85JIHPS57AKbX4g8Q/M8Xk4qS/5kw1kb+pK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148218; c=relaxed/simple;
	bh=0UbxlKIfe++YVusgH14Xqn/NXC/5FTu2YxV/8qIGcFU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BP2UttIbidW6fhqygo4ueVPr7r0ZaaN8aZ9ZYVzwFH9xWewZjdSysIBX38ett8I6PPHjpU986YPdHIXt7K1goW6qQa9GFoFf5GXV9+g/w0s7BqoiWNY37Wzk8BH6RQUzbMV7nScKj0X9iuMV8EsZssnBM9V1/ztjJyqWbJ0GrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKCewzO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKCewzO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF43F1F000C5;
	Fri, 16 Oct 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148217;
	bh=aew6Pene2CZNLs52ghmI6s926qdDQiS30KM2rq27N3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKCewzO/xd2F46PxhwdE/eyB5HMQs9RW9ecthkjTn13uxOYD1H/i/tqVZBF3wCAZD
	 /3572vMP1DZafkhLJRkn8J0GmttkVrzmOQuYmBnzC/fK7uFIGDXnfG9S8S9xeGnWpQ
	 Q7Jn1xnEjw1wyIltL/HcUi1F8ydeIfWjJ18+wZSCbmQule/0tBVtNLvIIy/Xi/Am1T
	 YMmd0Nv3+IP8OqnouwmOTe6TawdzfCt0W1nl4PWbe3mQJ+oVROnGmFCG4EGha6S4Pm
	 iU+3mGl10p3k2BRBHUMlRZs5dX9+Sacz06lRZKcMtq56Jz68PRsRr9ouXKE0ghXaLp
	 duKq0tZx05gSA==
Message-ID: <sashiko-outbox-174211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net 2/8] net: enetc: serialize access to the same TX
 ring from NAPI XDP_TX and ndo_xdp_xmit()
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015105536.1692348-3-vladimir.oltean@nxp.com>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:56:56 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net/enetc: AB-BA deadlock between tx_ring->xdp_lock and enetc_mdio=
_lock
- [High] net/enetc: concurrent TX ring corruption from stack and XDP_REDIRE=
CT
- [High] net: enetc: out-of-bounds array access in enetc_xdp_xmit()
--

commit 129585c95d671cf1c40cb76a4f76a3a478c00776
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>

net: enetc: serialize access to the same TX ring from NAPI XDP_TX and ndo_x=
dp_xmit()

This commit introduces a spin lock to serialize access to the transmit ring
between the napi XDP_TX path and ndo_xdp_xmit(). It acquires the new
xdp_lock in both the transmit and receive paths.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 26abc5fafd188..418be387af18b 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1817,6 +1817,7 @@ int enetc_xdp_xmit(struct net_device *ndev, int num=
_frames,
>  	int err =3D 0;
> =20
>  	tx_ring =3D priv->xdp_tx_ring[smp_processor_id()];
> +	spin_lock(&tx_ring->xdp_lock);

[Severity: High]
Could this lead to an out-of-bounds array access if the hardware provides
fewer transmit rings than num_possible_cpus()?

If priv->num_tx_rings < num_possible_cpus(), enetc_alloc_msix() evaluates
first_xdp_tx_ring to a negative index. This causes priv->xdp_tx_ring to
point to memory preceding the priv->tx_ring array.

While enetc_setup_xdp_prog() refuses to attach a local xdp program when
resources are insufficient, the destination device's ndo_xdp_xmit() can
still be invoked independently via cross-device XDP_REDIRECT from another
interface. Under those conditions, this unconditionally reads garbage
memory and crashes when acquiring tx_ring->xdp_lock.

[Severity: High]
Is there a risk of concurrent transmit ring corruption from the network sta=
ck?

If no local xdp program is attached to the interface,
enetc_num_stack_tx_queues() exposes all transmit rings (including the ones
pointed to by priv->xdp_tx_ring) to the core network stack. The stack
queues packets to these rings via enetc_start_xmit() using __netif_tx_lock,
rather than tx_ring->xdp_lock.

Concurrently, if an XDP_REDIRECT from another interface targets this one,
enetc_xdp_xmit() will modify the exact same transmit ring using
tx_ring->xdp_lock.

Will this mismatch in locking strategies lead to unsynchronized access to
the producer variables (next_to_use, tx_swbd[]), causing ring corruption?

[ ... ]

> @@ -2120,6 +2131,8 @@ static int enetc_clean_rx_ring_xdp(struct enetc_bdr=
 *rx_ring,
>  	}
> =20
>  out:
> +	spin_unlock(&tx_ring->xdp_lock);
> +
>  	rx_ring->next_to_clean =3D i;
> =20
>  	rx_ring->stats.packets +=3D rx_frm_cnt;
>  	rx_ring->stats.bytes +=3D rx_byte_cnt;
> =20
>  	if (xdp_redirect_frm_cnt) {
>  		enetc_unlock_mdio();
>  		xdp_do_flush();
>  		enetc_lock_mdio();
>  	}
> =20
> -	if (xdp_tx_frm_cnt)
> +	if (xdp_tx_frm_cnt) {
> +		spin_lock(&tx_ring->xdp_lock);
>  		enetc_update_tx_ring_tail(tx_ring);
> +		spin_unlock(&tx_ring->xdp_lock);
> +	}

[Severity: High]
Does this create an AB-BA deadlock between tx_ring->xdp_lock and
enetc_mdio_lock?

In enetc_xdp_xmit(), the code establishes the lock order tx_ring->xdp_lock
followed by enetc_mdio_lock:

enetc_xdp_xmit()
   spin_lock(&tx_ring->xdp_lock);
   ...
   enetc_lock_mdio();

However, here in enetc_clean_rx_ring_xdp(), tx_ring->xdp_lock is released
at the out: label, but the enetc_mdio_lock remains held (or is re-acquired
after xdp_do_flush()). Then, if xdp_tx_frm_cnt > 0, it attempts to
re-acquire tx_ring->xdp_lock while enetc_mdio_lock is held.

Since enetc_mdio_lock is an rwlock_t, a pending writer (like an ethtool phy
command) will block new readers. A cpu holding xdp_lock will block waiting
for mdio_lock, while the cpu holding mdio_lock (read) spins indefinitely
for xdp_lock, creating a hard deadlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015105536.1692=
348-1-vladimir.oltean@nxp.com?part=3D2
