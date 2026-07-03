Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A452FC00D
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049230; cv=none; b=KvyyS9tPwWmXLF11Nsw+F0kcKPqZ+gh+NRo58HEL0hc2qPLONjYrz+UCUY8DBD77hbZFNPT5tFOZm13vv6IUy56hYCsbQ+eCPo8nIerROZPJXWZI2/H3kD2mRq4iSoupCvRMQNP8K7smtqYitoP67P2UMbRpsTxZ0CrjkvgU0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049230; c=relaxed/simple;
	bh=mQuc1AcVlaiBMsyRXQawxJQdXb59zcxtG66Spo/bh88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z7aFBVJBEVpCKoFgOATfqT0cY2ITy9I9p3CgFUoFeP+6hAviH2/NRHv/vlfgcYo+ZHpwcqbzum6QdjYdNyZ1mlWUcgGF+JkMRoVQMDAlm0+W9X1shUcYn5FSLnuGWfLRHPztyYl5Sjygrx3OodE5jXHvGZ9vrvAHxiiuLeo3dKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EshG45kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EshG45kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A831F00A3A;
	Fri,  3 Jul 2026 03:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049223;
	bh=UcZkgJq3boWiP2opXeD3nGsRXrWIiMV8kccf+ZDdrw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EshG45kxEy88Gl7SrjKqziEQbPuEjCiVywkRjvAXMfDW7GJ8dJS9KwHtiCl4yvELD
	 xFDV5LoRqYcpUnkp/xXECHIbEn6rkkOHbcNnyH8QT6BRbFeQMgQTBe7xlcFpYNS1pY
	 pDZia7mlQfmwwvCtOwiKJ3GIOl5+9KlLoV54pJmJEoipJdqcCp4KRWcIou5f7KwXVV
	 TVjtJwv4hAC2SsY0UOu8XwL1vBYaNyuwKgclIeuzdDb0jqk6wiLVlKAlwKmr7pOXnc
	 ircj2W2Cb5y2LIz/y7cFh7u+BDGEozUlClirCkr9jEhhVRXhYzlSOHYhetXsuvPi81
	 Hpj2ZaaJV/G8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 06/14] net: enetc: simplify
 enetc4_set_port_speed()
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702025714.456233-7-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-7-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:02 +0000
Message-Id: <20260703032702.E6A831F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removal of the switch statement allows SPEED_UNKNOWN to be program=
med as an invalid hardware state.
--

commit 923303ff32884703a5eb3f948098684f15149ba1
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: simplify enetc4_set_port_speed()

This commit simplifies enetc4_set_port_speed() by removing a switch
statement, assuming phylink only passes valid speed values. It also
updates PCR_PSPEED_VAL() to use FIELD_PREP() instead of an open-coded
shift.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/n=
et/ethernet/freescale/enetc/enetc4_hw.h
> index 6a8f2ed56017c..dea1fd0b81758 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> @@ -148,7 +148,7 @@
>  #define  PCR_L2DOSE			BIT(4)
>  #define  PCR_TIMER_CS			BIT(8)
>  #define  PCR_PSPEED			GENMASK(29, 16)
> -#define  PCR_PSPEED_VAL(speed)		(((speed) / 10 - 1) << 16)
> +#define  PCR_PSPEED_VAL(s)		FIELD_PREP(PCR_PSPEED, ((s) / 10 - 1))

[Severity: High]
Does this safely handle negative values like SPEED_UNKNOWN?

If SPEED_UNKNOWN (-1) is passed here, the expression ((s) / 10 - 1)
evaluates to -1. FIELD_PREP then casts this to an unsigned type and masks
it against PCR_PSPEED, filling all 14 bits with 1s (0x3FFF).

> =20
>  /* Port MAC address register 0/1 */
>  #define ENETC4_PMAR0			0x4020
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index b966637572a7a..db7bad2c3cbde 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
[ ... ]
> -	switch (speed) {
> -	case SPEED_100:
> -	case SPEED_1000:
> -	case SPEED_2500:
> -	case SPEED_10000:
> -		val |=3D (PCR_PSPEED & PCR_PSPEED_VAL(speed));
> -		break;
> -	case SPEED_10:
> -	default:
> -		val |=3D (PCR_PSPEED & PCR_PSPEED_VAL(SPEED_10));
> -	}
> -
> -	priv->speed =3D speed;
> +	val =3D enetc_port_rd(&priv->si->hw, ENETC4_PCR) & (~PCR_PSPEED);
> +	val |=3D PCR_PSPEED_VAL(speed);

[Severity: High]
The commit message states: "Since phylink only passes valid speed values
to mac_link_up, the switch statement with its default fallback to SPEED_10
is unnecessary."

Is this assumption accurate?

In the kernel phylib/phylink implementation, if a PHY establishes link befo=
re
autonegotiation completes (or if an out-of-band PCS status hasn't fully
resolved the speed), genphy_read_status() can leave phydev->speed as
SPEED_UNKNOWN (-1) while phydev->link is 1.

Phylink then propagates this state via phylink_resolve() and calls
mac_link_up() with SPEED_UNKNOWN.

Without the switch statement's default case, won't this write the 0x3FFF
garbage value generated by PCR_PSPEED_VAL() to the MAC speed configuration
register (ENETC4_PCR) and cause undefined hardware behavior?

>  	enetc_port_wr(&priv->si->hw, ENETC4_PCR, val);
> +	priv->speed =3D speed;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D6
