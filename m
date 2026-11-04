Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758017;
	b=QMMwMWAUxfuLFL9Cfm47Uly4z2Qh9eKYB5mDlsMMxKnC2nntm8FIwPhqDSUDwsqgdzEs
	 5D2FwqLcW4r1IBy92PkmOoHqRRWyH6Vp95V3jMCi5fNOWuoSNgMtYWnSYWnt9GbkDjKZU
	 iHvqNf3m9KDW93HUy7qSX+OFDV3Z088lOEKv7iSRq7nsv5j8rERN7VyO+kmY4em/vahkE
	 yDIuFWskYLiXU3ejdmEXTSbbDk7vso22Uk/ZnDDrr42uakbCgnelXMmo63zn4ebTdkNQ5
	 Jo4ABhHdDiUPjR7PvbHs5cyrxuDmli26eD4lPuYDj9e8FCp9qJ7Uk668zf6eLtZnIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758017;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GGmovUu/3S+glbLliFNixO0C464sel58IJCHZGLrXtQ=;
	b=gGbhyLzUK17CFtt0tGrYvfMvJ63+FDo45BDCblGYQqFCK85+BMja9QCP+YbHYooL5LrS
	 TJUQwHlQAOwom4UImkuTYIjIs43gVARI/UfU4czWaGEkfk7LjXyfoKk+O5MYnvuGQ4jHW
	 Gl/PI3dnMjGHEpaHPu4T/qaN54wt+BqSEbYKKygGCIpLwgWLVVtvaUanEGhBjL+jrQ1ks
	 WpxbaZML7SpTvQYHZdVLJAgwEGPalBAvWHHq5cxduHZFy5FryPpmjIQR3DW4IyW2S2Xd1
	 SU/jKLw4YSdsWm1EsXJxgXP11IvEzo2E9TLWWs37SmsVMjwVLlLLD4Wzcnzgco6dlfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XVH0cz/z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB378606A31B
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVH0cz/z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244351F000C1;
	Wed,  4 Nov 2026 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793758016;
	bh=GGmovUu/3S+glbLliFNixO0C464sel58IJCHZGLrXtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVH0cz/znLYMklS/Z95kYUAuVxBObRMoKuNuxx1rQ3yNGlX+FJKGLxSAeWylaUw7T
	 UmyoGLwrni/iorqoqpbk1mpno62M4gl1s4HGkqPAih9Hd6eqhJQI/z7Mr7M9+2Aaw/
	 mckTTfwcqJQp1aIhojMBBIcmWsIZQLkm7y/DP+6jzUoD2m7mIOZ5Q7vyN1pxYDqvZE
	 yMxpKlcArXiM8vS0cNT7REZeNIx1VoWDiTy43CFZgGP0I7Xt7BbxEFQFRnaB1GfLvb
	 Z6hXMz2xikARWm74K5WN4oojxzQjHKts30GUVD5HGKFCzYjYkcJAReHmjRUSGUICJm
	 DIhiQbBlezT3g==
Message-ID: <sashiko-outbox-196431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 9/9] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261103021024.3121936-10-wei.fang@oss.nxp.com>
References: <20261103021024.3121936-1-wei.fang@oss.nxp.com>
 <20261103021024.3121936-10-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:06:55 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: netc: premature onestep enable and state reset on link=
 up
--

commit bfd63636ea3f54065627cb205cd9578a3ead9864
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP one-step timestamping support

This commit adds one-step PTP Sync offload support for NETC switch ports by
queuing one-step Sync frames per port and draining them from a workqueue it=
em
that programs the shared PM_SINGLE_STEP register and inserts a To_Port
subtype 3 tag.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index d69df3060b471..bef19d7d8f16c 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1676,6 +1677,7 @@ static int netc_port_enable(struct dsa_switch *ds, =
int port,
>  		return err;
>  	}
> =20
> +	netc_port_enable_onestep(np);
>  	np->enable =3D true;
> =20
>  	return 0;

[ ... ]

> @@ -2561,6 +2564,7 @@ static void netc_mac_link_up(struct phylink_config =
*config,
>  	netc_port_set_rx_pause(np, rx_pause);
>  	netc_port_mac_tx_enable(np);
>  	netc_port_mac_rx_enable(np);
> +	netc_port_enable_onestep(np);
>  }

[ ... ]

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> index e4a06737ed0b0..830fd9e4ca751 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -31,6 +43,16 @@ static void netc_port_tstamp_timeout_work(struct work_=
struct *work)
>  				    "Port %d ts_req_id %u which seems lost\n",
>  				    np->dp->index, NETC_SKB_CB(skb)->ts_req_id);
> =20
> +		/* If the timed-out skb is the one holding the in-flight
> +		 * one-step frame's ts_req_id, resume the drain. Otherwise
> +		 * the frames queued on onestep_queue would never be sent or
> +		 * freed unless new traffic happened to arrive.
> +		 */
> +		if (NETC_SKB_CB(skb)->ptp_flag =3D=3D NETC_PTP_FLAG_ONESTEP &&
> +		    NETC_SKB_CB(skb)->ts_req_id =3D=3D np->onestep_ts_req_id &&
> +		    np->onestep_state =3D=3D NETC_ONESTEP_IN_FLIGHT)
> +			resume_onestep =3D true;
> +
>  		__skb_unlink(skb, &np->tstamp_queue);
>  		__skb_queue_tail(&free_list, skb);
>  	}

[ ... ]

> +void netc_port_enable_onestep(struct netc_port *np)
> +{
> +	if (!dsa_port_is_user(np->dp))
> +		return;
> +
> +	spin_lock_bh(&np->onestep_lock);
> +	np->onestep_state =3D NETC_ONESTEP_IDLE;
> +	spin_unlock_bh(&np->onestep_lock);
> +}

[ ... ]

> @@ -68,12 +97,286 @@ static int netc_get_ts_req_id(struct netc_port *np)
>  void netc_port_ptp_init(struct netc_port *np)
>  {
>  	/* Initialize to invalid entry IDs */
>  	for (int i =3D 0; i < NETC_PTP_MAX; i++)
>  		np->ptp_ipft_eid[i] =3D NTMP_NULL_ENTRY_ID;
> =20
> +	spin_lock_init(&np->onestep_lock);
> +	__skb_queue_head_init(&np->onestep_queue);
> +	INIT_WORK(&np->onestep_work, netc_port_onestep_work);
> +
>  	spin_lock_init(&np->tstamp_lock);

[Severity: Medium]
Can enabling one-step timestamping in both netc_port_enable() and
netc_mac_link_up() corrupt np->onestep_state across interface bringup?

In netc_port_ptp_init(), np->onestep_state is left at 0 (NETC_ONESTEP_IDLE)
rather than NETC_ONESTEP_PORT_INACTIVE. When a user port is opened via
dsa_user_open() -> dsa_port_enable_rt(), netc_port_enable() runs before
phylink_start(dp->pl) and calls netc_port_enable_onestep(np), setting
np->onestep_state =3D NETC_ONESTEP_IDLE while the physical link is still do=
wn
and the port MAC TX path is still disabled (POR_TXDIS is set and
PM_CMD_CFG_TX_EN is 0 until netc_mac_link_up() runs). Because
pl->old_link_state starts as false in phylink_start(), phylink_resolve() do=
es
not call netc_mac_link_down() while the link stays down during autonegotiat=
ion
or when no cable is plugged in.

Since DSA user net_devices use IFF_NO_QUEUE, one-step Sync frames transmitt=
ed
between dsa_user_open() and netc_mac_link_up() pass the
NETC_ONESTEP_PORT_INACTIVE check in netc_port_onestep_sync_enqueue():

netc_port_onestep_sync_enqueue()
  -> schedule_work(&np->onestep_work)
netc_port_onestep_work()
  -> allocates ts_req_id and dummy_skb on np->tstamp_queue
  -> np->onestep_state =3D NETC_ONESTEP_IN_FLIGHT
  -> tagger_data->onestep_sync_xmit(skb, ndev)

The first Sync frame is sent to the disabled MAC and dropped without a
timestamp response while subsequent Sync frames accumulate in
np->onestep_queue.

When the link then comes up, netc_mac_link_up() calls
netc_port_enable_onestep(np) a second time, unconditionally overwriting
np->onestep_state with NETC_ONESTEP_IDLE even though a frame is already in
flight or scheduled. As a result:

1. When netc_port_tstamp_timeout_work() later reclaims the timed-out
   dummy_skb, np->onestep_state =3D=3D NETC_ONESTEP_IN_FLIGHT is false, so
   resume_onestep is not set and any skbs waiting in np->onestep_queue are
   stranded until another Sync frame arrives or the port goes down.

2. Alternatively, if a frame is still in flight when netc_mac_link_up()
   resets np->onestep_state to NETC_ONESTEP_IDLE, the next Sync frame
   arriving at netc_port_onestep_sync_enqueue() sees NETC_ONESTEP_IDLE and
   immediately schedules netc_port_onestep_work(), reprogramming
   NETC_PM_SINGLE_STEP(0) before the earlier frame finishes.

Should netc_port_ptp_init() initialize np->onestep_state to
NETC_ONESTEP_PORT_INACTIVE, with netc_port_enable_onestep(np) called only f=
rom
netc_mac_link_up()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103021024.3121=
936-1-wei.fang@oss.nxp.com?part=3D9
