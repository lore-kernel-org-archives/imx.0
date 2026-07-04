Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F19DDC5
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161827; cv=none; b=lO3i2gW9PWeBX7tVcalKY6uiOvCG8QhlEeIrKpC5YRgwmvn6UDaAhe+/CHUVIcwyh1Tc6Ob//pjLQp58T1j17HXZjYt/ijeAPHtpvsKJhqbKxK1XpUj3l/ipDCaDLjzlPywXeE3G60e6yLDEOoTmPRqEd/CjDUXi/qmJimlKMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161827; c=relaxed/simple;
	bh=Oko+YsQpSG7wkOOa5IwhB0kK8Nkas6QDicbor+BN/Os=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kN+LPvPFnQVrqJpMAXGuEZZnorUTWbqKWKyQ4RSven1Pc+YU1hvQL8BxsXHvkLzeRxTLxJ1Xyt5n8jqW+AxoEPl4m7E5/r6Qq6LWuzTKx7NkWREpxWFj8gKF2IFAaLA+pcfK3FdLZ/yAvDC25w0GcvDeP3E77tmtTOfnV7u/Iik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4C/8y48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4C/8y48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232751F000E9;
	Sat,  4 Jul 2026 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161826;
	bh=Ne1SrWJuUZ6TUBeoiro1UN+EJI5AC1In8vCp+pC0zzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4C/8y48RAXQxRPXLmHTxNAVzmVmCfFNrtFZmqf+qGKG9yvbSLBQm0IwhrXIWGnJi
	 EVPHoeN6cap+m8RSbXuZpytKb6QSzuScqs1XbZJtgae4n7Rivu3J4pRH/Ncl2s8YBn
	 4Ubbq3DRVZY5ZNbfD/8rrQGXAdYQKQ6WjyIoh6c0WlcA/cJGK/EcqeLLrBi8kwZccg
	 +ffB6uXF6eziQnQJnf9UF11PeYa/MlSUVwwK1uvihlSb1ACtKfrvGauAu9shk6MyQ2
	 xpNDpcshBYlCrAlwvtN2kKjixMk17FikTcWK9JU7wqeFBCZ2Gd0cKo5xL/z9ofFjAc
	 auljmHUjB83EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703101328.550714-11-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-11-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:45 +0000
Message-Id: <20260704104346.232751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The loop iterating over total_vfs uses BIT(si_id) which can trigge=
r a shift-out-of-bounds (UB) on 32-bit systems or silently fail on 64-bit s=
ystems if the PCI device exposes a large number of VFs.
--

commit 646431737a5f49e08ba2d9ff1794e7e7489db129
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: refactor SI VLAN promiscuous mode configuration

This commit removes the enetc_set_vlan_promisc() functions and replaces
them with a unified enetc_set_si_vlan_promisc() function. It also removes
the vlan_promisc_simap field from struct enetc_pf to simplify the logic.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/ne=
t/ethernet/freescale/enetc/enetc_hw.h
> index 66bfda60da9cb..16da732dc5de8 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -185,9 +185,8 @@ enum enetc_bdr_type {TX, RX};
>  #define  PSIPMMR_SI_MAC_MP(n)	BIT((n) + 16)
> =20
>  #define ENETC_PSIPVMR		0x001c
> -#define ENETC_VLAN_PROMISC_MAP_ALL	0x7
> -#define ENETC_PSIPVMR_SET_VP(simap)	((simap) & 0x7)
> -#define ENETC_PSIPVMR_SET_VUTA(simap)	(((simap) & 0x7) << 16)
> +#define  PSIPVMR_SI_VLAN_P(n)	BIT(n) /* n =3D SI index */

[Severity: High]
Can this result in a shift-out-of-bounds if n >=3D 32?

> +
>  #define ENETC_PSIPMAR0(n)	(0x0100 + (n) * 0x8) /* n =3D SI index */
>  #define ENETC_PSIPMAR1(n)	(0x0104 + (n) * 0x8)

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index db2a800a7aaf0..afc02ed62c770 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -42,24 +42,20 @@ static void enetc_pf_destroy_pcs(struct phylink_pcs *=
pcs)

[ ... ]

> -static void enetc_set_vlan_promisc(struct enetc_hw *hw, char si_map)
> +static void enetc_set_si_vlan_promisc(struct enetc_si *si, int si_id,
> +				      bool promisc)
>  {
> -	u32 val =3D enetc_port_rd(hw, ENETC_PSIPVMR);
> +	struct enetc_hw *hw =3D &si->hw;
> +	u32 val;
> =20
> -	val &=3D ~ENETC_PSIPVMR_SET_VP(ENETC_VLAN_PROMISC_MAP_ALL);
> -	enetc_port_wr(hw, ENETC_PSIPVMR, ENETC_PSIPVMR_SET_VP(si_map) | val);
> -}
> +	val =3D enetc_port_rd(hw, ENETC_PSIPVMR);
> =20
> -static void enetc_enable_si_vlan_promisc(struct enetc_pf *pf, int si_idx)
> -{
> -	pf->vlan_promisc_simap |=3D BIT(si_idx);
> -	enetc_set_vlan_promisc(&pf->si->hw, pf->vlan_promisc_simap);
> -}
> +	if (promisc)
> +		val |=3D PSIPVMR_SI_VLAN_P(si_id);
> +	else
> +		val &=3D ~PSIPVMR_SI_VLAN_P(si_id);

[Severity: High]
If si_id >=3D 32, will this silently fail or corrupt the VLAN promiscuous s=
tate
for SI 0?

Since val is a 32-bit integer, even on 64-bit architectures where BIT() won=
't
overflow, the result gets truncated when applied to val here. On 32-bit
architectures, the shift wraps (e.g. 1 << 32 becomes 1 << 0), which would
inadvertently modify the state for the PF instead of the target VF.

> =20
> -static void enetc_disable_si_vlan_promisc(struct enetc_pf *pf, int si_id=
x)
> -{
> -	pf->vlan_promisc_simap &=3D ~BIT(si_idx);
> -	enetc_set_vlan_promisc(&pf->si->hw, pf->vlan_promisc_simap);
> +	enetc_port_wr(hw, ENETC_PSIPVMR, val);
>  }

[ ... ]

> @@ -441,10 +437,9 @@ static void enetc_configure_port(struct enetc_pf *pf)
> =20
>  	/* split up RFS entries */
>  	enetc_port_assign_rfs_entries(pf->si);
> -
>  	/* enforce VLAN promisc mode for all SIs */
> -	pf->vlan_promisc_simap =3D ENETC_VLAN_PROMISC_MAP_ALL;
> -	enetc_set_vlan_promisc(hw, pf->vlan_promisc_simap);
> +	for (int i =3D 0; i < pf->total_vfs + 1; i++)
> +		enetc_set_si_vlan_promisc(pf->si, i, true);

[Severity: High]
Does the driver validate or bound pf->total_vfs anywhere before this loop?

If the hardware or hypervisor advertises a TotalVFs value >=3D 32, this loop
will pass an unbounded index to enetc_set_si_vlan_promisc() and trigger the
shift issues above. The previous implementation safely bounded this by using
a hardcoded 0x7 mask.

> =20
>  	enetc_port_wr(hw, ENETC_PSIPMMR, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D10
