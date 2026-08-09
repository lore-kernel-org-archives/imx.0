Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4D255F28
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245549; cv=none; b=vDU1dnVMKBPzQX/DjmyJxagPVVO60TpIxg9orASLMnpSmNGn8phd0ko9qYLOvj5YepqgRlYxU3atd0IKLyz5ehTHdvWGgNpCDxM9Y+CvLIETpYwpubPDVmE421JIYbtQDRMbUidy97ZIOOmyYwUXf9C8fcHDUUxdithTFykw/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245549; c=relaxed/simple;
	bh=RpbujLUIiqjYn/n51zYlTeCr9V9dPPY5j9kHe6Y7V5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T38Pc8orqQuk1jqxKyo5CuOV3ghwFskvfdtexHi9kaC9+GIsaMmiI0roLQj2dRJD2dmEvdMQBHmZbwg7NL8sBl23UEas5wbHUpoeQZzw59qqRs881BefhTrkpu1NABDyIaKyv7OVq/CZ7iBwK9UuF/elRRefOEqvDTeg2FXS8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRA1Wov8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRA1Wov8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888511F00A3D;
	Sun,  9 Aug 2026 03:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245547;
	bh=1Xay08xCdb0XYOkwJ5Quk4mXcTa28YFokpFlFGHAio0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZRA1Wov83jQRxgN5LML0fjoebJfxvcdMsgeGfebRmRrVVhlPVQnZXmjgT4X1IylwT
	 Z7XufymI/THuxILlYaCm9pOFuNnCkliZj4b9ElHnmQLd4aZKH9GdUFQmRyiNLVbLo7
	 LIqnscUStj5KPK7Z8jsMhETkbK1kTxCBdsOSTcjt1grqkM/J8ErCmpG50HOP/C+9ru
	 x7ICzmaO59GyFrDUJjmQuJ94SefawNxRVslninRjuUgV+Qs/7Gyevw5SOt45m4Z0lo
	 QURFDPJt0QOcBzhzfJh+17Ui8ZNdKkresf4gsBjn/nf3jCQzPpIsLCDcOwd7o4JwN2
	 bcGmGk5fTrfWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260808032146.2335723-8-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:07 +0000
Message-Id: <20260809031907.888511F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Lazy garbage collection of timed-out TX SKBs permanently leaks soc=
kets and network namespaces.
--

--- Patch [6]: [PATCH v2 net-next 6/7] net: dsa: netc: add PTP two-step tim=
estamping support ---
commit b5b95ff6c72f97e31680784516eda771a0e7104f
Author: Wei Fang <wei.fang@nxp.com>
Date:   Sat Aug 8 03:21:45 2026 +0000

    net: dsa: netc: add PTP two-step timestamping support

This commit adds two-step TX timestamping and RX timestamping support for t=
he
NETC switch. It installs ingress port filter table rules to redirect RX PTP
frames to the CPU port and handles TX timestamp requests and responses via
switch tags.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> new file mode 100644
> index 0000000000000..1384a6f31d1c1
> --- /dev/null
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -0,0 +1,454 @@

[ ... ]

> +static void netc_port_txtstamp_twostep(struct netc_port *np,
> +				       struct sk_buff *nskb)
> +{
> +	DECLARE_BITMAP(ts_req_id_bitmap, NETC_NUM_TS_REQ_ID);
> +	struct sk_buff *clone =3D skb_clone_sk(nskb);
> +	struct netc_switch *priv =3D np->switch_priv;
> +	struct sk_buff_head free_list;
> +	struct sk_buff *skb, *skb_tmp;
> +	unsigned long ts_req_id;
> +	int err =3D 0;
> +
> +	if (unlikely(!clone))
> +		return;
> +
> +	bitmap_zero(ts_req_id_bitmap, NETC_NUM_TS_REQ_ID);
> +	__skb_queue_head_init(&free_list);
> +	spin_lock_bh(&np->tstamp_lock);
> +
> +	skb_queue_walk_safe(&np->skb_txtstamp_queue, skb, skb_tmp) {
> +		if (time_before(NETC_SKB_CB(skb)->ptp_tx_time +
> +				NETC_TXTSTAMP_TIMEOUT, jiffies)) {

[Severity: High]
Does this lazy garbage collection of timed-out TX SKBs permanently leak soc=
kets
and network namespaces?

When a frame requests a two-step hardware TX timestamp, skb_clone_sk() is u=
sed,
which takes a reference on the socket. If the frame is dropped in software
(e.g., due to qdisc drops or congestion) before reaching the hardware, the
hardware never generates a timestamp response, and the clone remains in
np->skb_txtstamp_queue.

Because the driver only lazily checks for timed-out SKBs here when a new PTP
packet is transmitted, the queue will not be purged if the application stops
transmitting or closes the socket. The stranded clone holds a reference to =
the
socket indefinitely, which in turn prevents the associated network namespace
from being destroyed.

> +			dev_dbg_ratelimited(priv->dev,
> +					    "Port %d ts_req_id %u which seems lost\n",
> +					    np->dp->index, NETC_SKB_CB(skb)->ts_req_id);
> +
> +			__skb_unlink(skb, &np->skb_txtstamp_queue);
> +			__skb_queue_tail(&free_list, skb);
> +		} else {
> +			__set_bit(NETC_SKB_CB(skb)->ts_req_id, ts_req_id_bitmap);
> +		}
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D6
