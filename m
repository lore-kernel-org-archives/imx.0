Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD3244694
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245547; cv=none; b=RNKr/ay/KeVGpJRdORYDC0CRMh55jZo/p+XfdKWekAmpDn/n6pIH2qE7j6h3k4LxSrg7JNBxTrqRcpdt+l0CebAbv47hXZ03zY+1eHTEHewIJg1XzhHQi0YCrq8yHi5PIuUu2RhDgdX0DZS2hGYtbDAL4uuxJGT8CZ1WpxcnCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245547; c=relaxed/simple;
	bh=0t2PiuxcxJAquyfhbEmaz5l3hTQVcxqxcWQMRQBI1Ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ielRcAOjs/JRKbtLPFonyJK5dwl22/zxYXz0p0tSGurg9QdhuG4L+k+8ky4uoy0rJh+1iKSpIbdYgcjDLqYOFfUWJ3W+kU5YH9hc4cbB4LvWxFJjxNGHVfstHTqRIZz1qgDAVO8/blx4da9dYDDpbvBT7xDwCqinOp1KB1tWuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PViSZlj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PViSZlj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1439B1F00A3A;
	Sun,  9 Aug 2026 03:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245546;
	bh=ewMliE+GOVTaKADeHJdEQsuXDWGGXTBwb6KErz3gn7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PViSZlj0K2K1jL2XUKbNCOurfIIBsxHz1wQAMrG7B3VoDHV8SB9BQkk/oYgBZFjxF
	 58GgEHOSPUqd/suQYWFSaYaTdNWRXYsEYRau3jCRg9Uj55r6mUGHgA+VKXST+8r5a+
	 UvMuXvU5yzvABl0xjoNkyJrIjEZbHBL/qONVVbZcuZC6CKIAReWLTlqu/n9CCzoLkg
	 ueYr+wbbayOMGpLUabFNhOVNHmp/GZDfp6fiorQk0uUlSjGnWENBvm1MHTAF/vIPwC
	 5UR2C/yKRuhDkEb3lg8vUUSoUs4q2mN98I438YTg6PbbkN/pN7aLN85uMEJkW7hU8w
	 4ZwOw2tqCyv2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 1/7] ptp: netc: use
 ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260808032146.2335723-3-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:05 +0000
Message-Id: <20260809031906.1439B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The external timestamp event handler loop drains the hardware regi=
sters but only publishes the last event, silently dropping all preceding va=
lid hardware timestamps. This problem wasn't introduced by this patch, but =
it remains a significant logic error.
--

--- Patch [1]: [PATCH v2 net-next 1/7] ptp: netc: use ioread64_lo_hi/iowrit=
e64_lo_hi for 64-bit register access ---
commit 20c67a6850880b0f14f8d15d3feff060e9651e26
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access

This patch refactors the 64-bit register accesses in the ptp_netc driver by
using the standard ioread64_lo_hi and iowrite64_lo_hi helpers. It introduces
netc_timer_rd64 and netc_timer_wr64 macros to reduce boilerplate and replace
open-coded register sequences.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 1c20d7efab929..0e0972596d880 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but does this loop
unintentionally drop valid hardware timestamps?

In drivers/ptp/ptp_netc.c:netc_timer_handle_etts_event(), when multiple
timestamp events are latched in the hardware before the interrupt is fully
serviced, the while loop drains all pending events from the hardware
registers but only saves the final read into the local etts variable.

Since ptp_clock_event() is called outside the while loop, all preceding
timestamps appear to be silently discarded. Should ptp_clock_event() be
called from inside the loop to ensure every captured timestamp is reported
to the PTP subsystem?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D1
