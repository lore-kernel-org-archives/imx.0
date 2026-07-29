Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B0438035
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321808; cv=none; b=LAucFv2wS6SkDtSvqgHxwsdpHqpt/Hk9jN3TNUwzJO/+W0wNkZuUyoSceB/rQGPeLhJwtPnEESfgiJ+sZLAPjCTRZZ2jirCVTU2l+t1Tzm83w0foc32nVcfNjQCp8ixeSgufoISWj85pANmpZXC95jsSSfn9CcT6TX0VH2q4l2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321808; c=relaxed/simple;
	bh=savk1K8aVoy2FaFOQK5AT+kWDestwFxCslUSUqE+zrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xz5mxMaw5wRpX5+lnz4a2+plglZVdk2/H7aeXdMQ011RctI0GJ+2R6DE6slnsyUxnvRtNzvV7Ss28LAVAijAoGPZaPE4CgwTIqHBYUJEY+GzwN05F3FajdZw+HKjco7QCO6qugDyhJGqLuJmT5QRyH1fzG4PeYojAyvXr5eJlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESnersVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESnersVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7667E1F00A3E;
	Wed, 29 Jul 2026 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321795;
	bh=/MXuWuKWJ/HNE4oCSr7TCu47oE8oBKCUy9hDMSRRKN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESnersVe56Ln4zfR25N6+4XOpnkHXFeHwZIcviM8GhzOOF7cuyJ0+Vlle9dft2WTR
	 Hp4PlmpQkZ13LKopkWcbZBRHoNm/eShLoho5Uba+CTQinY7YkuKnTzbQtCrSfv+k1Q
	 D8G+fmwAVjGIcIDSz8VLqhm76zZ5ELOuk15TUkEPHBCs9VgIESCFpka7XM6sgnQdxS
	 E6wQhtGjOQ0Cniu+scn7OzhgtIXnb47mvHQdN7wjZW98pGO8pVfS+3OT5M9wiLECQn
	 lZS9yUUq4U+cBL3xjkS4AbB6MpeTk+Zx60HbIyhO76TqQPOg4Uj0FnjMZWrXsAg0do
	 E2YJFisk2q3eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260728104548.3301214-7-wei.fang@oss.nxp.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:43:15 +0000
Message-Id: <20260729104315.7667E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Lockless dereference of a concurrently queued SKB clone in the TX =
fast path leads to Use-After-Free.
- [High] Lockless purge of `skb_txtstamp_queue` during teardown races with =
the active RX handler.
- [High] Insufficient length verification in `netc_rcv()` leads to an out-o=
f-bounds pull and kernel panic.
- [Medium] Hardware timestamping state is partially applied if RX filter co=
nfiguration fails.
--

--- Patch [6]: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step timest=
amping support ---
commit 13ed29f4ee1bf2dc117e6beb81ab58582da3681f
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add PTP two-step timestamping support

Add two-step TX timestamping and RX timestamping for the NETC switch.
For RX, install ingress port filter table (IPFT) rules to redirect PTP
frames. For two-step TX, clone the skb, allocate a timestamp ID, and manage
the asynchronous response via switch tags.

[ ... ]
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> +static void netc_free_ports_resources(struct netc_switch *priv)
> +{
> +	struct dsa_port *dp;
> +
> +	dsa_switch_for_each_available_port(dp, priv->ds) {
> +		struct netc_port *np =3D priv->ports[dp->index];
> +
> +		if (!dsa_port_is_user(dp))
> +			continue;
> +
> +		/* No new SKBs can be enqueued during teardown. Purge without
> +		 * the spinlock to avoid calling kfree_skb() with a destructor
> +		 * (sock_efree) while holding a spinlock.
> +		 */
> +		__skb_queue_purge(&np->skb_txtstamp_queue);

[Severity: High]
During switch teardown (e.g., driver unbind), the DSA teardown sequence
destroys the switch before the master/conduit interface's RX handler is
unregistered. Is it possible for late timestamp responses to still arrive?

If they do arrive, netc_twostep_tstamp_handler() will iterate over
skb_txtstamp_queue under ptp_lock.

Does calling __skb_queue_purge() here without the lock risk corrupting the
list pointers while the RX softirq is concurrently traversing them?

> +	}
> +}
[ ... ]
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c
[ ... ]
> +int netc_port_hwtstamp_set(struct dsa_switch *ds, int port,
> +			   struct kernel_hwtstamp_config *config,
> +			   struct netlink_ext_ack *extack)
> +{
> +	struct netc_port *np =3D NETC_PORT(ds, port);
> +	int rx_filter, err;
> +
> +	switch (config->tx_type) {
> +	case HWTSTAMP_TX_ON:
> +	case HWTSTAMP_TX_OFF:
> +		np->ptp_tx_type =3D config->tx_type;
> +		break;
[ ... ]
> +	err =3D netc_port_set_ptp_filter(np, rx_filter);
> +	if (err) {
> +		NL_SET_ERR_MSG_MOD(extack, "Failed to set PTP filter");
> +		return err;
> +	}

[Severity: Medium]
If netc_port_set_ptp_filter() fails and returns an error here, np->ptp_tx_t=
ype
remains updated from the earlier switch statement.

Does this leave the software state for hardware timestamping partially appl=
ied?
Should np->ptp_tx_type be restored to its previous value on failure?

> +
> +	config->rx_filter =3D rx_filter;
> +
> +	return 0;
> +}
[ ... ]
> +void netc_port_txtstamp(struct dsa_switch *ds, int port, struct sk_buff =
*skb)
> +{
[ ... ]
> +	if (np->ptp_tx_type =3D=3D HWTSTAMP_TX_ON) {
> +		struct sk_buff *clone =3D skb_clone_sk(skb);
> +
> +		if (unlikely(!clone))
> +			return;
> +
> +		if (netc_port_txtstamp_twostep(np, clone)) {
> +			kfree_skb(clone);
> +			return;
> +		}
> +
> +		NETC_SKB_CB(skb)->clone =3D clone;
> +		NETC_SKB_CB(skb)->ptp_flag =3D NETC_PTP_FLAG_TWOSTEP;
> +	}
> +}

[Severity: High]
When PTP two-step TX timestamping is used, netc_port_txtstamp() enqueues a
clone of the SKB via netc_port_txtstamp_twostep() before the original SKB
reaches netc_xmit().

If the hardware delivers a delayed timestamp response for a reused ts_req_id
before netc_xmit() executes, could the RX handler match this newly enqueued
clone, dequeue it, and free it via skb_complete_tx_timestamp()?

If so, when the tagger netc_xmit() eventually runs and calls
netc_fill_tp_tag_subtype2():

net/dsa/tag_netc.c:netc_fill_tp_tag_subtype2() {
    struct sk_buff *clone =3D NETC_SKB_CB(skb)->clone;
    u8 ts_req_id =3D NETC_SKB_CB(clone)->ts_req_id;
    ...
}

Could it dereference a clone that has already been freed?

[ ... ]
> --- a/net/dsa/tag_netc.c
> +++ b/net/dsa/tag_netc.c
[ ... ]
> @@ -126,14 +190,17 @@ static int netc_get_rx_tag_len(int type, int subtyp=
e)
>  static struct sk_buff *netc_rcv(struct sk_buff *skb,
>  				struct net_device *ndev)
>  {
> +	struct dsa_port *dp =3D ndev->dsa_ptr;
>  	struct netc_tag_cmn *tag_cmn;
>  	int tag_len, sw_id, port;
>  	int type, subtype;
> +	void *tag;
> =20
> -	if (unlikely(!pskb_may_pull(skb, NETC_TAG_MAX_LEN)))
> +	if (unlikely(!pskb_may_pull(skb, NETC_TAG_MAX_LEN - 2)))
>  		goto err_free_skb;

[Severity: High]
This length check was weakened to 12 bytes (NETC_TAG_MAX_LEN - 2) to admit
26-byte two-step response frames.

However, if a malformed 12-byte or 13-byte frame with NETC_TAG_TH_SUBTYPE1 =
is
received, it passes this 12-byte check. Later in the function, it calls:

tag_len =3D netc_get_rx_tag_len(type, subtype);
skb_pull_rcsum(skb, tag_len);

Since netc_get_rx_tag_len() returns 14 for NETC_TAG_TH_SUBTYPE1, will this
unconditionally pull 14 bytes?

Can this cause skb->len to underflow and result in an out-of-bounds memory
access during header stripping?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728104548.3301=
214-1-wei.fang@oss.nxp.com?part=3D6
