Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9244483A6
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321811; cv=none; b=dQ57QIdcyiEJhUE/R4RchOzTAU5h+Dy123dnPumGPuFzsTaSV/9NQO1CcXccAT3kX8efiplbMxqTPPZoGb5cTfljUiAmzNYYzgB49eEDWuPOVoiIuRiMT3gzStTmAlnsr2+4MViRAjznnHEIKXOpDVJ01J9TOfIeFH1OjlJ0gB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321811; c=relaxed/simple;
	bh=iXy7m0isanFWY1cthanWIjfwmG6W8gXfEE0t6iGrOzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLsP0ZdB5C0pm7CUckL0QLTKBxx9tdX29k08ngZ2u/tHVuWzUmjGWsRED1IJOB4XE+rdYh0L5ZlNIr4AW7tsXDf+lGIGqLMYnH+rIRIOz5SJpRsPkF4zhWw3TZJ8catfWYUir8h73yvkm82/zTdvNb+M35wg5S5lrHShwfPLMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=La0rkTxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="La0rkTxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABB81F00AC4;
	Wed, 29 Jul 2026 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321797;
	bh=x8kQ31fsBUGG5ga0yKaLk5v9Tiq8qQtRNIDrP3vXDzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=La0rkTxQWYQKspz73dZetAkUW3GeUM0jNp2vLxEJ4YCs5grKD3pCy0cgDKzlL7QI7
	 0AGFCzRIHrAYeh1uV/nk1/bsY7+ToZxQDqMpg86tiVt7QdOjmPrfEUQ/hM7CJMTlvZ
	 /zub2jJYlwgYAX65iX0Mdcp9pNQo9/GJuF9rfhphRTxKrvnOYGqRehZfcgF6Yqljq6
	 lb7gJeAnBl4Znsie/lJO5c00sV0Ef+6KGVsIqamg+aSRqurkfxJ5MwWQgYr55SaKaX
	 Bclden0mSDpPr7Q+5bl8EYMj8yVucuE3FOEalpprFNd43Cb4fv2n7wi27bJSLdrxRv
	 ph8sPNkOmUHTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 7/7] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728104548.3301214-8-wei.fang@oss.nxp.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:43:16 +0000
Message-Id: <20260729104316.EABB81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The in-flight one-step Sync SKB outlives the DSA port structures o=
n driver unbind, causing a Use-After-Free in the SKB destructor.
- [High] The unbounded skb_onestep_queue can cause an Out-Of-Memory (OOM) c=
rash if an attacker floods the port with forwarded PTP Sync packets.
- [High] Calling ptp_parse_header() without ensuring the packet headers are=
 in the linear data area causes an out-of-bounds read on fragmented packets.
- [Medium] Modifying the PTP originTimestamp in software without updating t=
he UDP checksum breaks the checksum for non-offloaded packets.
--

--- Patch [7]: [PATCH net-next 7/7] net: dsa: netc: add PTP one-step timest=
amping support ---
commit df83cf11f57c79cb36a98872a09e3e01dbf7936a
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP one-step timestamping support

This commit adds one-step TX timestamping support for PTP Sync frames on the
NETC switch. It implements serialization of one-step Sync transmission per
port and intercepts packets to program the PTP originTimestamp before handi=
ng
the frame to the hardware.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -1011,6 +1014,8 @@ static void netc_free_ports_resources(struct netc_s=
witch *priv)
>  		 * (sock_efree) while holding a spinlock.
>  		 */
>  		__skb_queue_purge(&np->skb_txtstamp_queue);
> +		cancel_work_sync(&np->onestep_work);
> +		__skb_queue_purge(&np->skb_onestep_queue);

[Severity: High]
Does this teardown path need to wait for or cancel in-flight packets that
were already handed off to the conduit device? Local queues are purged, but
an SKB currently in-flight might retain a pointer to the port structure in
its destructor.

>  	}
>  }
> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c
[ ... ]
> +static void netc_port_prepare_onestep_sync(struct netc_port *np,
> +					   struct sk_buff *skb,
> +					   u32 ptp_class, bool *twostep)
> +{
> +	struct netc_switch *priv =3D np->switch_priv;
> +	u16 correction_offset, timestamp_offset;
> +	struct ptp_header *ptp_hdr;
> +	u8 msg_type, twostep_flag;
> +	bool is_udp =3D false;
> +	u32 pkt_type;
> +	u8 *pkt_hdr;
> +
> +	ptp_hdr =3D ptp_parse_header(skb, ptp_class);
> +	if (!ptp_hdr) {

[Severity: High]
Does calling ptp_parse_header() here risk an out-of-bounds read if the
packet is fragmented? The function directly accesses the IP header, but the
code hasn't verified that the headers are in the linear data area using
pskb_may_pull() yet. The bounds check later in this function happens after
the read has already occurred.

> +		dev_dbg_ratelimited(priv->dev,
> +				    "Port %d failed to parse Sync header\n",
> +				    np->dp->index);
> +		return;
> +	}
[ ... ]
> +static void netc_port_program_onestep(struct netc_port *np,
> +				      struct sk_buff *skb,
> +				      u64 tstamp)
> +{
> +	u16 correction_offset =3D NETC_SKB_CB(skb)->correction_offset;
> +	u16 timestamp_offset =3D NETC_SKB_CB(skb)->timestamp_offset;
> +	bool is_udp =3D NETC_SKB_CB(skb)->is_udp;
> +	u8 *pkt_hdr =3D skb_mac_header(skb);
> +	u64 sec;
> +	u32 ns;
> +
> +	NETC_SKB_CB(skb)->tstamp =3D tstamp;
> +	NETC_SKB_CB(skb)->ptp_flag =3D NETC_PTP_FLAG_ONESTEP;
> +
> +	/* Update originTimestamp field of Sync packet
> +	 * - 48 bits seconds field
> +	 * - 32 bits nanoseconds field
> +	 */
> +	sec =3D div_u64_rem(tstamp, NSEC_PER_SEC, &ns);
> +	put_unaligned_be16((sec >> 32) & 0xffff, pkt_hdr + timestamp_offset);
> +	put_unaligned_be32(sec & 0xffffffff, pkt_hdr + timestamp_offset + 2);
> +	put_unaligned_be32(ns, pkt_hdr + timestamp_offset + 6);

[Severity: Medium]
Does modifying the originTimestamp payload here break the UDP checksum for
non-offloaded packets? The hardware PM_SINGLE_STEP_CH feature only updates
the checksum for the residence time delta it adds to the correction field.
Do we need to incrementally update the software checksum for this payload
modification?

> +
> +	netc_port_set_onestep_control(np, is_udp, correction_offset);
> +
> +	/* Orphan the skb to release the socket send buffer quota immediately.
> +	 * This is safe because sock_wfree() only updates sk_wmem_alloc and
> +	 * does not touch skb->data. After skb_orphan(), we install our own
> +	 * destructor so that when the conduit driver frees the skb after TX
> +	 * completion, we get notified to send the next queued Sync packet.
> +	 */
> +	skb_orphan(skb);
> +	skb_shinfo(skb)->destructor_arg =3D np;
> +	skb->destructor =3D netc_onestep_skb_destructor;

[Severity: High]
Can this in-flight SKB outlive the netc_port structure during driver unbind?
If the driver unbinds while this packet is still queued in the conduit
device, the devres-managed netc_port will be freed. When the conduit device
later transmits and frees the SKB, will netc_onestep_skb_destructor()
dereference a freed pointer?

> +}
[ ... ]
> +struct sk_buff *netc_onestep_sync_handler(struct dsa_switch *ds, int por=
t,
> +					  struct sk_buff *skb)
> +{
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +	struct netc_switch *priv =3D ds->priv;
> +	u64 tstamp;
> +
> +	/* Serialize one-step Sync packets: only one can be in-flight at a
> +	 * time because the SINGLE_STEP register is shared and must match the
> +	 * packet currently being transmitted. Claim the in-flight slot under
> +	 * ptp_lock. If another one-step Sync is already in-flight, queue this
> +	 * skb and return NULL; ownership is transferred to the queue, so no
> +	 * extra reference is needed and netc_xmit() stops processing it.
> +	 */
> +	spin_lock_bh(&np->ptp_lock);
> +	if (test_bit(NETC_FLAG_ONESTEP_IN_PROGRESS, &np->flags)) {
> +		__skb_queue_tail(&np->skb_onestep_queue, skb);
> +		spin_unlock_bh(&np->ptp_lock);
> +
> +		return NULL;

[Severity: High]
Is there a risk of memory exhaustion if an external source floods the port
with forwarded PTP Sync packets? Since this queue has no length limit and
returning NULL consumes the SKB, dsa_user_xmit() will return NETDEV_TX_OK,
bypassing qdisc backpressure mechanisms.

> +	}
> +
> +	tstamp =3D netc_timer_get_current_time(priv->tmr_dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728104548.3301=
214-1-wei.fang@oss.nxp.com?part=3D7
