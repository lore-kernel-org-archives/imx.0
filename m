Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F903D953B
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148218; cv=none; b=f4NI6gziBm4XLyk8eIFQ9+jYcsHIqXL/VY4lDG/ARyPJpT5d2o36Mb7HmNmJTHKGcigkKPz+qD0BLKzHc+YRraFzJuQbhgBbJFI6HtFNfqdy53aolhcPeDSl7AZv3oJJ1FJRARRpc4XOXmJ2+xGFEYwZ0F12vsAO11dNQk9LfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148218; c=relaxed/simple;
	bh=HTyG/OCsAOIWtYhQQWZ9YAfVBciLT1gsTaWZZtNcD6A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UufqOUtj9XYpEYgxFMLeUiUBn7Zbz6jbjGK17fXDkIWKmlaTLeeUboqgA56zjQauCSd7AYvjwtuBlIGW1+FloLBETqyluwZEtWIh9Esbf4qYZAi50SA02/Ipsy/Fg+JvTURdGaWCRBOaErMJ1Jp57ss6TXrmkBK/fFxWcCHtHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOkVzbFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOkVzbFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489851F000C4;
	Fri, 16 Oct 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148216;
	bh=J1SV81W0VUYBn8FIQt/1ZU3wl30P7KYL0edcDlW1wXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dOkVzbFUVbQrwE6xLbVhUSrXev7udH/2RugUf9rsJ70Yy51K+Z9QEcsqRms1dwVd5
	 owhdYl4x6ShvQ/4MMQOIVvt51H7prHjVjsJcgG+iLunu+Kx/DwQPY/OEOahWzk9wrC
	 33dCLCHxUOyEaWjeNYI7i1CUjQRZwVr71yMto4xbAtl80ghzzFvnfjdO9oq+sWw4a1
	 6iX1PaJLO/HSfLf1d/DcEhkgnLFdUHKUE7y33+ZfFa9E7BudbDIeHFgy+I5w5C1zWa
	 nhOCb4Z3DbH4KaDVAyehGLypvtb9rWD9IX421OT21rUCCzkhFHUnVXWZcTy04Azh0W
	 vVXMkwxtvKHRg==
Message-ID: <sashiko-outbox-174210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net 1/8] net: enetc: consistently track dropped
 frames in enetc_xdp_xmit()
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015105536.1692348-2-vladimir.oltean@nxp.com>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:56:55 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] enetc: Use-After-Free in enetc_xdp_xmit() racing with enetc_close(=
) teardown
- [High] enetc: OOB array access if CPUs exceed hardware TX rings
- [High] enetc: TX ring corruption when XDP_REDIRECT overlaps with network =
stack
--

commit 805311ddad67da52149365adfc7772abd1f8ca5b
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>

net: enetc: consistently track dropped frames in enetc_xdp_xmit()
   =20
This patch updates enetc_xdp_xmit() to consistently increment the xdp_tx_dr=
ops
counter for all silently dropped frames. It routes early failures and batch
failures to a common exit path to ensure statistics are updated accurately.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 80f0082f6c633..26abc5fafd188 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1814,15 +1814,18 @@ int enetc_xdp_xmit(struct net_device *ndev, int n=
um_frames,
>  	struct enetc_bdr *tx_ring;
>  	int xdp_tx_bd_cnt, i, k;
>  	int xdp_tx_frm_cnt =3D 0;
> +	int err =3D 0;
> +
> +	tx_ring =3D priv->xdp_tx_ring[smp_processor_id()];

[Severity: High]
Can tx_ring point to out-of-bounds memory here if the system has more
possible CPUs than hardware TX rings?

During initialization, the driver configures:

    first_xdp_tx_ring =3D priv->num_tx_rings - num_possible_cpus();
    priv->xdp_tx_ring =3D &priv->tx_ring[first_xdp_tx_ring];

If num_possible_cpus() is greater than priv->num_tx_rings,
first_xdp_tx_ring becomes negative, leaving priv->xdp_tx_ring pointing
out-of-bounds.

Because this patch moves the tx_ring assignment before the ENETDOWN check
and adds an unconditional dereference of tx_ring->stats in the goto out
path, an XDP_REDIRECT to this interface will now dereference this invalid
pointer and crash, whereas previously it would safely return -ENETDOWN.

[Severity: High]
Does this setup cause concurrent, lockless modifications of a TX ring
that is already in use by the network stack?

When no local XDP program is loaded, enetc_num_stack_tx_queues() allocates
all priv->num_tx_rings to the network stack. However, the driver also
unconditionally assigns priv->xdp_tx_ring to point to the uppermost
hardware queues.

If another interface uses XDP_REDIRECT to send frames to this device,
enetc_xdp_xmit() executes locklessly here, concurrently modifying the
same TX ring that the standard network stack is using under the Qdisc
__netif_tx_lock, leading to queue corruption.

> =20
>  	if (unlikely(test_bit(ENETC_TX_DOWN, &priv->flags) ||
> -		     !netif_carrier_ok(ndev)))
> -		return -ENETDOWN;
> +		     !netif_carrier_ok(ndev))) {
> +		err =3D -ENETDOWN;
> +		goto out;
> +	}
> =20
>  	enetc_lock_mdio();
> =20
> -	tx_ring =3D priv->xdp_tx_ring[smp_processor_id()];
> -
>  	prefetchw(ENETC_TXBD(*tx_ring, tx_ring->next_to_use));

[ ... ]

> @@ -1853,11 +1855,13 @@ int enetc_xdp_xmit(struct net_device *ndev, int n=
um_frames,
>  	if (unlikely((flags & XDP_XMIT_FLUSH) || k !=3D xdp_tx_frm_cnt))
>  		enetc_update_tx_ring_tail(tx_ring);
> =20
> -	tx_ring->stats.xdp_tx +=3D xdp_tx_frm_cnt;
> -
>  	enetc_unlock_mdio();
> =20
> -	return xdp_tx_frm_cnt;
> +out:
> +	tx_ring->stats.xdp_tx +=3D xdp_tx_frm_cnt;

[Severity: High]
Will this result in a use-after-free if it races with the interface teardow=
n?

In the teardown path, enetc_close() does not wait for RCU or hold a
synchronization lock against remote XDP_REDIRECT threads before freeing
the TX rings:

enetc_close()
    enetc_stop()
        set_bit(ENETC_TX_DOWN, &priv->flags);
    ...
    enetc_assign_tx_resources(priv, NULL);

Since this patch changes the early ENETDOWN check to jump to the out
label instead of returning immediately, the code will now unconditionally
dereference tx_ring->stats here even if the interface is going down
and the resources have already been freed.

> +	tx_ring->stats.xdp_tx_drops +=3D num_frames - xdp_tx_frm_cnt;
> +
> +	return err ?: xdp_tx_frm_cnt;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015105536.1692=
348-1-vladimir.oltean@nxp.com?part=3D1
