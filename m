Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE4377AA6
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991206; cv=none; b=ubeQnYPjWhEoFo8s9FBCVm2v61pvIniQwibSEAOEsql98a/a3awQCWpXxBKr0NnqPQ4AYm9vCmqoadMX56bvPsZ6oaxSZ4bHmWCAyFXMh990LeayN4O/PWzxecNQubySySOu+YA+y3VssjUkoH/0P342Ctl3508K/SbNNcXazDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991206; c=relaxed/simple;
	bh=z1IuHZx2xy/casTgyymT+0h2WfDtqgt+jM8jXKfaapU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cK0bTljwhW7TlwilI4oLWx8x5iIHi/YeGUSk8uAYzyGedNnrjJLlUGNLvB9Pk9kMZLOd1aR4DXlGqsLA7W/ppubXVa3GiZV4sMzYSXXnCyLhr8FxnDdXECODSdgU9WS7ST/Q9kTkg+PFaHY2HE82UQ//clZek93sHnz2qGe5rRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYnBWRpl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYnBWRpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACF21F00893;
	Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991205;
	bh=Z1PHqSSY1WlONs33XHvM6d7vgF482vtduZGB3LGKRJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KYnBWRplWFQ8Nkng4wpp97u/41rx1w6ITppYvkgM4rtENBBwaN2UjG2tioQan+4U8
	 PaFl7X9NmL/3/OpBt8M3BSbDKfmnMfFK6OwVJB2uBd3xxOgrisq3pwcTNdwc2DEpOt
	 4k4E8Nn86L4YWpYHqpXklkCfr+JbWn2Nv8gXVkJk8+hENgTmnHYuydirkQfx7EjYu9
	 uAAWBoDOipSF/MokkamoVUJPXMMoUvqLsF9mYb4/bbDTEkUP1Gm4pX2Gf99Cj05+Gs
	 zTh/ifuucpjOwnAITOwhEPVGNs1db1hJ6KZ8CSuhcPsgjLWO1Vn3a8N3eg6xJmyqeJ
	 wBZTFIhJ9fsOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net RESEND] net: fec: drain PEROUT requests before
 canceling the timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261001180258.4054391-1-mhun512@gmail.com>
References: <20261001180258.4054391-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:24 +0000
Message-Id: <20261003013325.2ACF21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: fec: use-after-free of ptp_clock in fec_pps_interrupt
--

commit ab1057fad6a311f8c4eada4b450b44f774123656
Author: Myeonghun Pak <mhun512@gmail.com>

net: fec: drain PEROUT requests before canceling the timer

Unregister the PTP clock first so all in-flight ioctls have returned
before canceling the timer. Clear the PEROUT state and compare channel
afterward, then disable PPS. Serialize the channel write with PTP clock
shutdown and skip it when that clock is off.

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 56801c2009d59..67901e036ac32 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c

[ ... ]

> @@ -856,11 +859,12 @@ void fec_ptp_stop(struct platform_device *pdev)
>  	struct net_device *ndev =3D platform_get_drvdata(pdev);
>  	struct fec_enet_private *fep =3D netdev_priv(ndev);
> =20
> -	if (fep->pps_enable)
> -		fec_ptp_enable_pps(fep, 0);
> -
>  	cancel_delayed_work_sync(&fep->time_keep);
> -	hrtimer_cancel(&fep->perout_timer);
>  	if (fep->ptp_clock)
>  		ptp_clock_unregister(fep->ptp_clock);
> +
> +	/* An in-flight PEROUT ioctl can arm the timer until unregister returns=
. */
> +	fec_ptp_pps_disable(fep, fep->pps_channel);
> +	if (fep->pps_enable)
> +		fec_ptp_enable_pps(fep, 0);

[Severity: High]
Can fec_pps_interrupt() fire after ptp_clock_unregister() but before
fec_ptp_enable_pps() finishes?

Since ptp_clock_unregister() drops the reference and frees fep->ptp_clock,
and fep->pps_enable is still true in this window, if the hardware timer
interrupts, fec_pps_interrupt() could execute:

drivers/net/ethernet/freescale/fec_ptp.c:fec_pps_interrupt() {
    ...
		if (fep->pps_enable) {
			event.type =3D PTP_CLOCK_PPS;
			ptp_clock_event(fep->ptp_clock, &event);
		}
    ...
}

Would this dereference the freed fep->ptp_clock pointer causing a
use-after-free?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001180258.4054=
391-1-mhun512@gmail.com?part=3D1
