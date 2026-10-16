Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DD3A0B2E
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148220; cv=none; b=jaqvY1LmOcmzsBBDBKgAjhODBL99cqqNTcqJ6uEZYs6tAu8Rd4Bm/MPN7GFiwXkN6FavL6VlVseXGHVZfJRNEG6VtUGaAsCkhpENBbPqQu+u7XXIQ5EHIw487MBoC/vwTfEFR4oggmr5+E6qAwtvhVWKTEEf8NiNveyEZTznViY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148220; c=relaxed/simple;
	bh=irfIajnFWu2g+9+TH4ADlcQhgMvkbq631aiNAFZq6+4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UmC2vY4MYyIxCZ8CnOQ8cH6aUyS/BQJjL0jzvPb4H2QPKArokd5hJzPolJCulbbq1lPF8SaUf598hskboAgsqX30XraRBgLHHy8O1v4zSopTzG5mG6RHf2GO1k7ARmy2z4Pf4bItefDjZWGReOIa4YxF/huc0kK6b5GZoZ6OzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U55hAwy2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U55hAwy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B361F000C5;
	Fri, 16 Oct 2026 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148219;
	bh=LI6pjZWzrYVFJPmLF6f9VaTsfteZSwjYiDKL5epM0Ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U55hAwy20aKV4pG6hwtWgPBRwL1u2zOCh1upTMoi2yC8td+FSV6DbfC6sRZrptI4l
	 xKcEhi5XSIPooDMG5KsKlZjNiNqdssr0lGFZpBjtGgrMnc5tGGOE05WXeuVOCz07e3
	 TAARjTfP4u/lzdmkWE6tjfFwMjBgxwLdcRNUBJblrsjwDEXfifQymkrD4A4ugrXnPl
	 8EGNRYdGkrac1pJ6SjiwZyvIcnO9u+x33nEM+2rtrs0TcSH6mUmCPyJ+95F6vtSeT3
	 pFa6OuDluQ0R/mfvslBk7Us9eSJS7jA2OcWdtF6M6r8Geq07UU7cC0x5zAVK7d7dLo
	 KpeqdCZ3V3VFw==
Message-ID: <sashiko-outbox-174217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net 8/8] net: enetc: ensure enetc_xdp_xmit() calls
 enetc_update_tx_ring_tail()
Reply-To: sashiko-reviews@lists.linux.dev
To: vladimir.oltean@nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015105536.1692348-9-vladimir.oltean@nxp.com>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-9-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:56:58 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: enetc: XDP_XMIT_FLUSH is ignored when k =3D=3D 0 causing TX r=
ing stalls
--

commit a3de2d9d87edd1ec648a1023c638ce2d70118f57
Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>

net: enetc: ensure enetc_xdp_xmit() calls enetc_update_tx_ring_tail()

This commit changes the loop exit condition that triggers the TX doorbell
in enetc_xdp_xmit(). It replaces the redundant xdp_tx_frm_cnt variable with
the loop index k and updates the logic determining when to flush the TX
ring.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
[ ... ]
> @@ -1928,22 +1928,20 @@ int enetc_xdp_xmit(struct net_device *ndev, int n=
um_frames,
>  						    &xdp_redirect_arr[i]);
>  			break;
>  		}
> -
> -		xdp_tx_frm_cnt++;
>  	}
> =20
> -	if (unlikely((flags & XDP_XMIT_FLUSH) || k !=3D xdp_tx_frm_cnt))
> +	if (unlikely(k && ((flags & XDP_XMIT_FLUSH) || k < num_frames)))
>  		enetc_update_tx_ring_tail(tx_ring);

[Severity: High]
If a caller batches XDP frames by making multiple ndo_xdp_xmit() calls
with flags =3D 0, and then makes a final call with flags =3D XDP_XMIT_FLUSH,
does this new condition safely handle the case where the final call fails
to enqueue any frames?

If the caller passes num_frames =3D=3D 0, or if the first frame fails to map
(for example, due to a full TX ring or DMA error), the loop exits with
k =3D 0.

With the addition of the "k &&" guard, the entire condition evaluates to
false.

Could this skip enetc_update_tx_ring_tail() and leave previously queued
packets stalled in the TX ring without a doorbell ring, violating the
XDP_XMIT_FLUSH contract?

>  	enetc_unlock_mdio();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015105536.1692=
348-1-vladimir.oltean@nxp.com?part=3D8
