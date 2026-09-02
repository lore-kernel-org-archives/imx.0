Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FDD377A8F
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335277; cv=none; b=t7jmD8po8nP80H7janCz9PICzC2WncpQ7/uJn4AkPS57+JL4tHXWxqQqcxt4va6mz1rSa2JOgXDScjLa3U9fdetyEduEdq5L72eF5cMMH+KOo7iMjyYzIgY2OXYqwjPIilfQFNbpQz8GDqxNxpe7TaQrBo0ZkQ4txyMDCk7z5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335277; c=relaxed/simple;
	bh=4wyJJErmSw/0/xkKLWk5KIUMamR/QMqISmOizPs9Cgc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g8zkBqwC/ZPgFQKvLUH/WHphiU8O3mC4JzdwHolK7cQuxyc22Fc6Oi2h5aGMZPmvzDUvJ560Cf5H907DoAAokR/zhYZTBMGSsmuX6oXJvRFxNRLzjHsbF9gdmPc1XN+ZwHIdqT4vFLIVXlpBeaMz6wYEwu27I+SvX0tUfktvP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOYzdFGW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOYzdFGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFC01F000E9;
	Wed,  2 Sep 2026 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335276;
	bh=JsckJL1qNdDa/wZkwMe12ezOc407ebeBsixO4KR9cHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOYzdFGWRIwEjSlZiF/3RwHl2UnpgQvF807vbVf9suQtZxeWsGP0l+TDpqGiLtZMQ
	 tXHj24KmVt0YbuSo4cVRFqX4asyWxvJ48648QzuRS9hKdGmzMA05jlG6kcJqlb+ApT
	 t2HUSc/NOAhVeiKRQWNsnciRYYxDiQldKTmM3LRJVSPAXOLMWHL6WAr6lQeECrri5s
	 aZTSNcOi9xv9D3lt3XypniZe7XIC4KseGbs5hze3uiGR1r3vaAIRn0NhC7GarMe+Q7
	 7ZuQeFVG5wlSvtb8op2Y0DT3vreEAvM4JqM35uVwLcPWtIIPkLDwYiss9bL9BtBDvY
	 0yxjOVhGT40zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2] net: fec: support RX flushing via an
 ethtool private flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260901074732.113791-1-alexander.sverdlin@siemens.com>
References: <20260901074732.113791-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 07:47:55 +0000
Message-Id: <20260902074756.1AFC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] fec_enet_get_sset_count() triggers WARN_ON_ONCE by returning 0 ins=
tead of -EOPNOTSUPP for ETH_SS_PRIV_FLAGS on unsupported hardware.
- [Medium] Data race on fep->rx_flush_mask due to lockless write in fec_ene=
t_set_priv_flags().
--

commit 0779caeb36f03b70108effeec07b7cd6055f53f4
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

net: fec: support RX flushing via an ethtool private flag

This commit adds support for flushing the RX FIFO of an individual receive
queue via an ethtool private flag. It exposes a per-queue rx-flush-qN capab=
ility
for controllers with the FEC_QUIRK_HAS_MULTI_QUEUES quirk.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..e5c1d04a665c4 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> @@ -3576,11 +3603,67 @@ static int fec_enet_get_sset_count(struct net_dev=
ice *dev, int sset)
> =20
>  	case ETH_SS_TEST:
>  		return net_selftest_get_count();
> +	case ETH_SS_PRIV_FLAGS:
> +		if (fep->quirks & FEC_QUIRK_HAS_MULTI_QUEUES)
> +			return min(fep->num_rx_queues, fep->num_tx_queues);
> +		return 0;

[Severity: High]
Should this return -EOPNOTSUPP instead of 0 when the hardware doesn't suppo=
rt
multi-queues? Returning 0 for unsupported private flags violates the ethtoo=
l API
contract and can trigger a WARN_ON_ONCE(!ret) in ethtool_get_strings().

>  	default:
>  		return -EOPNOTSUPP;
>  	}
>  }
[ ... ]
> +static int fec_enet_set_priv_flags(struct net_device *ndev, u32 flags)
> +{
> +	struct fec_enet_private *fep =3D netdev_priv(ndev);
> +	u32 mask =3D 0;
> +	int i;
[ ... ]
> +	for (i =3D 0; i < fep->num_rx_queues; i++)
> +		if (flags & BIT(i))
> +			mask |=3D QOS_RX_FLUSH(i);
> +
> +	if (mask =3D=3D fep->rx_flush_mask)
> +		return 0;
> +
> +	fep->rx_flush_mask =3D mask;

[Severity: Medium]
Does this assignment need to be protected by fep->qos_lock?

It appears fep->rx_flush_mask is read concurrently under fep->qos_lock in
fec_enet_set_rx_flush():

	guard(spinlock)(&fep->qos_lock);
	val =3D readl(fep->hwp + FEC_QOS_SCHEME);
	val &=3D ~QOS_RX_FLUSH_MASK;
	writel(val | fep->rx_flush_mask, fep->hwp + FEC_QOS_SCHEME);

Could this lockless write lead to a data race if userspace modifies the fla=
gs
while the PHY state machine adjusts the link in the background?

> +
> +	if (!netif_running(ndev))
> +		return 0;
> +
> +	fec_enet_set_rx_flush(fep);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901074732.1137=
91-1-alexander.sverdlin@siemens.com?part=3D1
