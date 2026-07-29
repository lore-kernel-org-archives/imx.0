Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88144780C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321800; cv=none; b=smEv+P33fVVKNMBbAVpNuwXPFDsumqoEOpWcNS6MD7R2YyeUs6qXLH02eZuj+A++xQM/44yAoq4IgYsHJFx4j2ty2Shy6kwCZuG8EvuMVF+TgcoUvBmE4NpZybqk821zoMlHJONIsUu/SLoy2hJ9S6QLA1Oq4rSHsSxCyspZ+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321800; c=relaxed/simple;
	bh=MRBEquwazNUlAGwzMhY/OE4bpc7D+tzpfAW60LveNps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nskvGv7cxln93M7i09klgJnFUe42xUlAvB91kKrTUVJYxCEzdRhqI13h/owGhtbUM6v749v/o8WFbc7KcRYX/gV8a9RQI7PeLPAO9u6N6rAPL0e/2JWdijLeav/VkCAYlDLgPbO81PMNlW3o19bPKCANgVWV879CVU6S7e/f7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OorWYBmG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OorWYBmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82561F000E9;
	Wed, 29 Jul 2026 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321794;
	bh=E2Y+fG9IkaXKHCI0nlrG0153MRzHrmeLTEzAKROED94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OorWYBmGoE5zUPrI3sgz3K5qWqWirpxduDRenXVYFDuTAHDNPsNmp6JIWz9QhSrcc
	 dWQ13W8uPBs/hfXK2wH4ef4QILezsCUekECU4FEc9D5BtwizeIc/fFdm4uRjPk6AAw
	 IaQAP2ryPbwbsgCma84Oh33eui0TEFqKosrCyB/sd//NuSatSyucOUyxkM0gSO6Wvq
	 pPbFmT9IL57yincr0MhwDA0Rg4myO50qOo3w3iT1BJvTLEHTdD2THOUYgQU/gsDNBy
	 Du51g9U/5o1l8Y2eOe/psErJsVg+QJ9uUto7tfglzdUsoq/fgdAVj1s18zBaL1m5NW
	 oGfm37v65KHGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/7] ptp: netc: use
 ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728104548.3301214-2-wei.fang@oss.nxp.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:43:13 +0000
Message-Id: <20260729104313.E82561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The EXTTS event handler loop drains the hardware timestamp FIFO bu=
t drops all but the latest event because the event is dispatched outside th=
e loop.
--

--- Patch [1]: [PATCH net-next 1/7] ptp: netc: use ioread64_lo_hi/iowrite64=
_lo_hi for 64-bit register access ---
commit 3efd12fe5d16abdea087944988e6ffe114ea760a
Author: Wei Fang <wei.fang@nxp.com>
ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access

This patch replaces the open-coded 64-bit register read/write sequences
with ioread64_lo_hi() and iowrite64_lo_hi() helpers. It introduces two new
macros netc_timer_rd64() and netc_timer_wr64() that wrap these helpers and
uses them throughout the driver to reduce boilerplate.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -497,22 +470,19 @@ static void netc_timer_handle_etts_event(struct net=
c_timer *priv, int index,
>  					 bool update_event)
>  {
>  	struct ptp_clock_event event;
> -	u32 etts_l =3D 0, etts_h =3D 0;
> +	u64 etts =3D 0;
> =20
> -	while (netc_timer_rd(priv, NETC_TMR_STAT) & TMR_STAT_ETS_VLD(index)) {
> -		etts_l =3D netc_timer_rd(priv, NETC_TMR_ETTS_L(index));
> -		etts_h =3D netc_timer_rd(priv, NETC_TMR_ETTS_H(index));
> -	}
> +	while (netc_timer_rd(priv, NETC_TMR_STAT) & TMR_STAT_ETS_VLD(index))
> +		etts =3D netc_timer_rd64(priv, NETC_TMR_ETTS_L(index));
> =20
>  	/* Invalid time stamp */
> -	if (!etts_l && !etts_h)
> +	if (!etts)
>  		return;
> =20
>  	if (update_event) {
>  		event.type =3D PTP_CLOCK_EXTTS;
>  		event.index =3D index;
> -		event.timestamp =3D (u64)etts_h << 32;
> -		event.timestamp |=3D etts_l;
> +		event.timestamp =3D etts;
>  		ptp_clock_event(priv->clock, &event);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does this code drop all but the last
external timestamp event?

When the hardware queues multiple external timestamp events, the while loop
in netc_timer_handle_etts_event() pops all valid timestamps from the hardwa=
re
into the local variable etts.

Because ptp_clock_event() is called only once outside the loop, aren't all
prior events silently discarded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728104548.3301=
214-1-wei.fang@oss.nxp.com?part=3D1
