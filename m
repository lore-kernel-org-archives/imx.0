Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EB432E64
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250826; cv=none; b=WgvfmdINTTroHo52f5SQK9qd+DXE/XBj/r0mCHkNDtEeu0KHr+h+OSiqJYiZE9JlhUUOyX74GfAU+/UZFy0fxUb2eoUjR65GzvAQ7zOpWOarohGQnJY8bo9Xgd/aKrrxc99PSnIdJZu3uRzyleL6SUKasshZEx0fbvDVNy1ODXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250826; c=relaxed/simple;
	bh=0jyLq8/iRzxCynwo2SdcQQ6VxzUfuXaGs5ZBGnep0Ys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rkgi7mKj8GeudnPyEEMltKGfU8K2oH/+92NycHDp4kKid4259OnCirXtg467lj0Yb3a3QDOkB31aRTiqzZarMJDTaeHKahk51UY9USCjF0q+BnIqkCuCn4Mp52g0vnEGWp5bR2pdcixWkoUgErJZ8mdNzE05/LkEj31UpyzQF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl5Hlj77; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl5Hlj77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F931F000E9;
	Tue,  1 Sep 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250825;
	bh=tn/6FvV8lo49EBKbxqv4C02veDjyCIBXDrkoZ4ifCe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gl5Hlj77FrBatWZJq21sJ55OqhK/5ClwMJg6kBRceA8XeQVoflTpKv5K5SfHlrQBC
	 CaeuF++P2/Huj1wCYKl7y7UfsjBcCRcBqLQzEDh1gd0/NS0PV/pAJ1Jp+WJZouFTW9
	 njVZT9zCnP/ETl3e2wGrEpikId3ZB6AUHvfgIauTmaP2WhBNAfNVzL1zviyPoBABrL
	 wFbTwQg4flmmuv9KzsNT870orAYVfGWWTrkMQdtFCvuab9X/ZMPcLC8/4x/DYmwfCW
	 Ot0guobNDJKVoz7YO/k8+TXuwM+NeHu7m2aTLkExPURrJDbId0CAtT5LHVCBE3i28F
	 wny/2V2ZhoWFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 1/8] ptp: netc: use
 ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260831082335.1184605-2-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
 <20260831082335.1184605-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:20:24 +0000
Message-Id: <20260901082024.E6F931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data loss of external hardware timestamps due to discarding all bu=
t the last timestamp from the FIFO
--

commit 7676c74333a13c4f33beb4f741615e25a7faf299
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access

This commit replaces open-coded 64-bit register read and write sequences
with ioread64_lo_hi() and iowrite64_lo_hi() helpers. It introduces new
macros to wrap these helpers to reduce boilerplate and enforce strict
L-before-H access ordering.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 19ca99d80e95b..376b3b0d1a38f 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -500,22 +473,19 @@ static void netc_timer_handle_etts_event(struct net=
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
This is a pre-existing issue, but does this loop discard all but the last
timestamp from the hardware FIFO?

The while loop successfully drains multiple timestamps from the TMR_ETTS FI=
FO
if they accumulate before the interrupt is handled. However, because etts is
overwritten on each iteration and ptp_clock_event() is only called once
after the loop completes, it appears any prior external events in the batch
are silently lost.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082335.1184=
605-1-wei.fang@oss.nxp.com?part=3D1
