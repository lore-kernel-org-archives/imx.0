Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA037269B;
	Sun, 10 May 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410118; cv=none; b=okwjD0POPT9dyJeD6E6cg/VvmosFja8qKidDsvAwm7g2l+kospFte10Yw1VPpy3/uH2K/85zSJhDeriC+uhDFE8L5gyOhmGh8W4iO7/+3ulWjLgiQ6uO2AnXqjtJLImBJEvD3it1Fc+L0wuYo2ZFS+eVw/BP1uQoivflX1vVE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410118; c=relaxed/simple;
	bh=HR8PZphg5u2a++M8YaNX8wvl9xMnxQCqiitjGHB8pVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jk9rzgnX+K5VAKojVVT1frUm6Ojy5PbvePA21KYZXmrnbi2l2YV12RlegCmzOPOANE6LlKH+hUbO6Qp9kx8lJpdvmhZoQOIx2Up7xpzFlP0jYCZOogTkSIGTyKgsmC7L1pjZSW5MFtZs+A1lxKC6jFktbcGgUbMiCscrEbn3VMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEvcZJoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEvcZJoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72D6C2BCB8;
	Sun, 10 May 2026 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410118;
	bh=HR8PZphg5u2a++M8YaNX8wvl9xMnxQCqiitjGHB8pVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PEvcZJoW83MelwCJYiNDOacK3ePqg8LWvMK1Iybym9RmanE5CMAESjc3ksa8hqK1F
	 /jrNsQ5FUQxlSnjU+ueZPiWdR7xinaC9zWfSzXYBWRflOPQWXq1ZFZPGbs/65J2KAs
	 BNaJypCEvDrh0UTVqkdOZfZ6/82zEKG1ua8KXeIFWDpRvvP9InVPVHXv+LM+z8FoLX
	 I6qsJVd+pFxUuYHyD/nPXVZwW6hCYhOmX+LFxoTj2iVFkLmRtIBXCHjbms/bpOMN44
	 VV+cOH32o+fjqDyZgQTSvp+Asatogie7S7F0MQjyGvrE1ZyN2ZSeKlJmNxCyM/DKnG
	 U6yhpzV22EXTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 11/15] net: dsa: netc: add phylink MAC
 operations
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509102954.4116624-12-wei.fang@nxp.com>
References: <20260509102954.4116624-12-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:37 +0000
Message-Id: <20260510104837.B72D6C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Flawed read-modify-write logic in `netc_mac_port_rmw()` causes sta=
te desynchronization and clobbers PMAC registers.
--

commit e2073763516dc99734e9f1436d4b8e960d8ce680
Author: Wei Fang <wei.fang@nxp.com>

    net: dsa: netc: add phylink MAC operations

This commit implements phylink MAC operations for NETC switch ports, includ=
ing
capabilities retrieval and link configuration callbacks.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 8e3a3230226c3..8c1317b72a81d 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -43,6 +43,26 @@ static void netc_mac_port_wr(struct netc_port *np, u32=
 reg, u32 val)
>  		netc_port_wr(np, reg + NETC_PMAC_OFFSET, val);
>  }
> =20
> +static void netc_mac_port_rmw(struct netc_port *np, u32 reg,
> +			      u32 mask, u32 val)
> +{
> +	u32 old, new;
> +
> +	if (is_netc_pseudo_port(np))
> +		return;
> +
> +	WARN_ON((mask | val) !=3D mask);
> +
> +	old =3D netc_port_rd(np, reg);
> +	new =3D (old & ~mask) | val;
> +	if (new =3D=3D old)
> +		return;
> +
> +	netc_port_wr(np, reg, new);
> +	if (np->caps.pmac)
> +		netc_port_wr(np, reg + NETC_PMAC_OFFSET, new);

Does this code lead to desynchronized state and clobbered PMAC registers?

Because old is read exclusively from the MAC 0 register, if new =3D=3D old,=
 the
function returns immediately. If the preemptable MAC 1 register had a
different state (e.g. from the bootloader), it would not be updated and cou=
ld
remain permanently out of sync.

Additionally, if new !=3D old, this writes the modified MAC 0 state to MAC =
1.
Could this clobber any independent state in the MAC 1 register by overwriti=
ng
unmasked bits with MAC 0's values?

Would it be safer to perform independent read-modify-write cycles for each
MAC's register to preserve their respective unmasked bits?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D11
