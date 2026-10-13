Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A03FCB33
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885599; cv=none; b=s7KlPV66vpBm7qNPpo/vG03fpBMf6WLeSM5Mn6kelaUw/o6HXqKb2a+vLCppQGoihf495bRYANpf8X0bgAM1DZL5Kf4uAIalFsvCsMRWKkVhJFJHtzcxqMZkQLrsu5N5Dx5HYCBrssnk82QIAvi5k3w3gxItBol1BUkTlpUFq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885599; c=relaxed/simple;
	bh=N57Vapyx20IyL9b0foNy6lhEc4G8/Uxm954rst270NU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gU6rE9WpM2eNv3Z4AUlPIXOK59e/cSJCyFvJWwLxzqWhq7zdS+0iVe4PzvGVXvU7f1CdEtK9l/TJa4wAdhiKXWckH6ss/Qa0YJt97I9HiW6wyvjkzX8biF2mDJ9YUV0RtwfoEJ8hUSEIplgo37Pvifhao/q69e1woumZoMDZ19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5WNZ3D4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5WNZ3D4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2BE1F00893;
	Tue, 13 Oct 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885598;
	bh=eHjKRK4iXSF+8MlFnE3Awy3uW2DXKwugELHuyi4EgXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5WNZ3D4Z1b0nGNpMEAEvVlZLgBLrbmX72ux5c9pXFg+Vuo2kvMxrKMtR+XVnb7xs
	 9HkQfy2g0oc+YW+r1jQsDUxG38Q50OtYLvT+HZfCjpFVODHRzZMj0OlnaUgQ+xaZBW
	 Uv3KomoM+5K4VQupv/pInjZwklV24nWzmdl2/Rngx86STou3n3cDn59ynkl/8n/FNX
	 720l0+hxzjxcbxg1Typ7WAQzY+aia51S9oywVUqQzAfr5hxj6IzxEbu89u//ydSY/3
	 CqhiZvWB1O2ApQ0JqZpErrb7+WDCLsxnIyrW/Ev8TZAK5R5LYnQMYV6rRD6qrACdK5
	 DS/3HBl8R0vwA==
Message-ID: <sashiko-outbox-169420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 9/9] net: dsa: netc: add PTP one-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261012095924.1129312-10-wei.fang@oss.nxp.com>
References: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
 <20261012095924.1129312-10-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:59:57 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dsa: torn read of jiffies_64 on 32-bit architectures
--

commit 0542eb3bb6feafa72e5bad3b8598c453a57cbc65
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP one-step timestamping support
   =20
This commit adds one-step Sync offload for NETC switch ports and advertises
HWTSTAMP_TX_ONESTEP_SYNC. It introduces a per-port queue that is drained
from a work handler to properly sequence one-step Sync frames.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_=
ptp.c
> index 756c69a02064e..c3875bce80bc1 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -116,7 +418,8 @@ static void netc_port_onestep_work(struct work_struct=
 *work)

[ ... ]

> +	NETC_SKB_CB(skb)->tstamp =3D tstamp;
> +	NETC_SKB_CB(skb)->ts_req_id =3D ts_req_id;
> +	NETC_SKB_CB(skb)->ptp_flag =3D NETC_PTP_FLAG_ONESTEP;
> +	NETC_SKB_CB(dummy_skb)->ts_req_id =3D ts_req_id;
> +	NETC_SKB_CB(dummy_skb)->ptp_tx_time =3D jiffies_64;

[Severity: Medium]
Is it safe to read jiffies_64 directly here? On 32-bit architectures, a
direct read of this 64-bit variable performs two 32-bit loads without
synchronization.=20

If a timer tick updates jiffies_64 between the two loads, the read value
can tear and jump forward or backward significantly. Should this use
get_jiffies_64() to safely capture the transmit time?

> +	NETC_SKB_CB(dummy_skb)->ptp_flag =3D NETC_PTP_FLAG_ONESTEP;
> +	np->onestep_tx_time =3D NETC_SKB_CB(dummy_skb)->ptp_tx_time;
> +	np->onestep_ts_req_id =3D ts_req_id;

[ ... ]

> +static bool netc_onestep_timeout(struct netc_port *np)
> +{
> +	u64 expire_time;
> +
> +	/* Use monotonic jiffies_64, as the PHC may be stepped backwards.
> +	 * Add one tick since the ns-to-jiffies conversion rounds down, so
> +	 * the software window is never shorter than the hardware window.
> +	 */
> +	expire_time =3D np->onestep_tx_time + 1 +
> +		      nsecs_to_jiffies64(NETC_ONESTEP_VALID_WINDOW);
> +	if (np->onestep_state =3D=3D NETC_ONESTEP_IN_FLIGHT &&
> +	    time_after64(jiffies_64, expire_time))

[Severity: Medium]
Does the direct evaluation of jiffies_64 here risk a torn read on 32-bit=20
systems?=20

A torn read during this check could cause massive premature timeouts (which=
=20
would incorrectly abort the in-flight state of one-step frames) or missed=20
timeouts that leak request IDs.=20

Could we use get_jiffies_64() instead, similar to how it is handled in=20
netc_port_prepare_twostep()?

> +		return true;
> +
> +	return false;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095924.1129=
312-1-wei.fang@oss.nxp.com?part=3D9
