Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBC37268C
	for <imx@lists.linux.dev>; Sat, 19 Sep 2026 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802783; cv=none; b=RWf7PAqDNCdC+TSuCRQq4MDZ+A7vNnNe6pfhdqp01pLbgmydk9Xn3BGbeQS37matuBBf3ROPGH9qoEqdOPU5SLnZwbPR42eNNxXL21lDqqkrz+YMXGXNgptxmoFGhhgI3s7l9GE7xXThcoMFBzFAyh5bbmh/2jH7fzJna8+IFe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802783; c=relaxed/simple;
	bh=vtgG66TNzf0ddHtc5zE8W/6a4AZcjJ/2njWo+n7RPyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bf4aqaa1POBuP2P4g4GAj8BGVc+Vv2Jg5h/NcgYTCBer9IhKLGyu+MSj4g92JyXvVQuVp5ujB/CEBKKuuuZKczd5gv78AaJSXPeqmHOZAGEq0YCbfW8G4wf8uodrVYsjINir/2erE1M6UvhJYBfAXy2YcfrcBw6Y16OaIBD6wOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQvRxrVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQvRxrVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09DE1F000FF;
	Sat, 19 Sep 2026 07:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789802782;
	bh=Gunvwuc1PgmqhhjySXxjr19alfnc7iMV2bja3z8gUiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQvRxrViFtPen+f2soYUS00XZZRgKeYxoYt8/Q/l4Jl1nK4IAnIpOPL1qAwdxN148
	 gcn2kcnSosZs6KtjYJYnbYhGXr+iMitoiP7nhVBTVquxvxKV9f20o5+eroqdmgITCc
	 fDNpiBKrm2YGJXSB8uPKI0cUYOuGeKxjHAjv90Hx4fImGQPz+sQ3yMGtkI+O853x/d
	 vZn4rfEmg2jlEa2+ITUwF8rqIwA/wjlGrkUT78TxCEKHyYkEURiMXps9mBfjerGObu
	 AO2nxb5qBhoSMNILqXawot/lnd7pw53syAMC6UAdvCxclDEY1TAJzSmSw77SGBXw86
	 msCV65AJ6xqbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 8/8] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260918072852.501420-9-wei.fang@oss.nxp.com>
References: <20260918072852.501420-1-wei.fang@oss.nxp.com>
 <20260918072852.501420-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 07:26:21 +0000
Message-Id: <20260919072621.D09DE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: netc: skb_clone causes downstream buffer unsharing pen=
alties and ownership violation
--

commit e1617e58a8399b2727842b7a8a9daba5929f414b
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP one-step timestamping support

This commit adds one-step Sync offload for NETC switch ports and advertises
HWTSTAMP_TX_ONESTEP_SYNC. It uses a deferred work mechanism and queue to
transmit one-step Sync frames, allowing hardware to compute the correction
field.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> index 2e743443ca030..1bc0f09562062 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -68,12 +77,276 @@ static int netc_get_ts_req_id(struct netc_port *np)

[ ... ]

> +static void netc_port_program_onestep(struct netc_port *np,
> +				      struct sk_buff *skb)
> +{

[ ... ]

> +		old_sec_h =3D __get_unaligned_t(__be16, hdr + tstamp_offset);
> +		old_sec_l =3D __get_unaligned_t(__be32, hdr + tstamp_offset + 2);
> +		old_ns =3D __get_unaligned_t(__be32, hdr + tstamp_offset + 6);
> +		inet_proto_csum_replace2(&uh->check, skb, old_sec_h,
> +					 new_sec_h, false);

[Severity: Medium]
Does modifying the payload of a cloned SKB here violate the networking core=
 SKB
buffer ownership guidelines?

The original SKB was cloned earlier in netc_port_onestep_work(), making its
data buffer shared (skb_cloned(skb) evaluates to true). Bypassing standard
buffer ownership rules and directly modifying the shared payload triggers an
expensive reallocation and copy (pskb_expand_head) in downstream conduit dr=
ivers
that check skb_cloned() before padding or modifying the frame, which could
severely degrade one-step PTP performance.

[ ... ]

> +static void netc_port_onestep_work(struct work_struct *work)
> +{
> +	struct netc_port *np =3D container_of(work, struct netc_port,
> +					    onestep_work);

[ ... ]

> +skb_dequeue:
> +	skb =3D __skb_dequeue(&np->onestep_queue);
> +	if (!skb)
> +		goto set_onestep_state_idle;
> +
> +	/* Clone is a ts_req_id token only; its payload is never read, so
> +	 * sharing the buffer with the mutated original is fine.
> +	 */
> +	clone =3D skb_clone(skb, GFP_ATOMIC);

[Severity: Medium]
Could this clone operation lead to the downstream buffer unsharing penalties
described above?

Since the clone is only used as a timeout token and its payload is never re=
ad,
would allocating a dummy lightweight SKB via alloc_skb(0, GFP_ATOMIC)
exclusively to hold the token avoid these performance penalties and
architectural ownership violations?

> +	if (unlikely(!clone)) {
> +		kfree_skb(skb);
> +		goto skb_dequeue;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918072852.5014=
20-1-wei.fang@oss.nxp.com?part=3D8
