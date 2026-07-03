Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9341433E7A
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049231; cv=none; b=W+bMhY9Ghe2JWq47MI+5SIJ14NrmM7t4kaz0v3CMZfuMPdmMJiC/nAkuvLXsuU8lW741JvITsHJ5dOiWTNqma3gQUpQaUHntX9arZdGwuqHbgJblzbdkN1mjdyr8gnEQbxuDxO0dXOjCaORP2hq3SZ90Fekn4+uRCsAK2QX4XVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049231; c=relaxed/simple;
	bh=npVNi3MwUX3/Xwyx5jI6siKm+qIXPCKutYAFMo/t0NE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NcJGY446DSghacuyHM3thdszvSXJe6sr/pWVDZCLZlI0CU/rd4ol1zBGeOrin4csGVysFXP6VoaY3//0+ojnTaYWoMxIu0ohsGR8R4kyM2nCHDTMBhAhMhPZis2G5leR3R3hmMJ4sFDjanqtLtGTTpidWeFS8+XMt/k31+4rsF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSrjQPC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSrjQPC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E751F00A3E;
	Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049225;
	bh=7V1ZI+Ldt0ZsMrvzFcJlkRL1O3s6f7c3yoxtWR4Trs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oSrjQPC416AbTPrhl12jTsa3unhf3FN0TKc9/0rTQUYHexrphdnnoW2pRgzF9BbM5
	 PsZRuPZ0ah9ZThrIOVLYCSjSUO42KUWZr1P0eyH/QNgYjmK069z0wbKp2+P+DVqQqD
	 P+czsO0b02/VS69b0fRj2KpW6bt/qNSuOLZvskQtI3ngChRegWJCMNEL4DWtwEQWEp
	 yixr7jKTFlJ1l03oOuDrifgGMMaiVuRcfSr/dKIFzxQcpL7UWFngqZFjjqtJnFwK6k
	 zJViN1S2i6w0Lr7cbQGkxr0srUbeXiBY10VC0eehO6D9xJJC/R5dwIrazmCIvrdv0/
	 qCCcFGktJMzXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260702025714.456233-11-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-11-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:04 +0000
Message-Id: <20260703032705.28E751F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing explicit initialization of VLAN promiscuous mode leaves h=
ardware and software out of sync if PCI FLR fails or is bypassed.
--

commit e4ae080b51f21aa8943d5f438c5a46ac35824f4b
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: enetc: refactor SI VLAN promiscuous mode configuration

This commit refactors the VLAN promiscuous mode configuration in the enetc
driver. It removes explicit initialization of VLAN promiscuous mode during
port configuration, relying instead on the PCI FLR default state, and
introduces a unified function for setting SI VLAN promiscuous mode.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index db2a800a7aaf0..096ccb35508c5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
[ ... ]
> @@ -442,10 +438,6 @@ static void enetc_configure_port(struct enetc_pf *pf)
>  	/* split up RFS entries */
>  	enetc_port_assign_rfs_entries(pf->si);
> =20
> -	/* enforce VLAN promisc mode for all SIs */
> -	pf->vlan_promisc_simap =3D ENETC_VLAN_PROMISC_MAP_ALL;
> -	enetc_set_vlan_promisc(hw, pf->vlan_promisc_simap);
> -
>  	enetc_port_wr(hw, ENETC_PSIPMMR, 0);

[Severity: High]
Is it safe to rely solely on PCI FLR for VLAN promiscuous mode initializati=
on
here in enetc_configure_port()?

If the PF driver is reloaded, or the kernel is warm-booted (e.g., via kexec)
and PCI FLR fails or is disabled (e.g., via pci=3Dnoflr), the hardware's VL=
AN
promiscuous mode register (ENETC_PSIPVMR) will retain its previous state.

If VLAN filtering was previously enabled, could the hardware silently drop
VLAN-tagged packets while the software assumes they are accepted?

Because NETIF_F_HW_VLAN_CTAG_FILTER is not enabled by default in
ndev->features, the core network stack will not invoke enetc_pf_set_feature=
s()
during registration to sync the software state with the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D10
