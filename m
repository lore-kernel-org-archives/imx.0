Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA413ACA6A;
	Thu, 14 May 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754454; cv=none; b=EPkvul9vTdSfEonoFi3txX8BxsXXSUrAiMOCJ3QenE4riuFRw46mfLQ2+c7b4yTXUdTC7JmfnQUuIJ/LSolsIejzcxelOmgAsks1yNUMI2NRGxAeJBKTBy/cMgKsUtxMmS+EEKkyGhvSlzxXHD6Y0o3XYJ4zY4qtGwJo3RGOR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754454; c=relaxed/simple;
	bh=JvaOyMEk7lKMF50hufgY8FCjW2OD6n34LF25dtPeiRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NufFkRRdyeWA+BMkfqauKXUFMvOnTY3pG9QmM71e6ur1SAtk6aUx3x3GguLUAOLg2dGGVQBgKCmXY7igelD6yic+c1tFYtpYJQ6/5X3IVpp7z6ei7j7PqxeRTKvw/CJoRKd9WcjfE74lbGvAi2NxoDmYQj0rUOq7HBj8IJ8iT4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crNOsizL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crNOsizL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503B3C2BCB3;
	Thu, 14 May 2026 10:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754453;
	bh=JvaOyMEk7lKMF50hufgY8FCjW2OD6n34LF25dtPeiRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=crNOsizLeQmyeCTiiUjla4YP/DRc06E2/8muThZ9CE5OKCKHpjxiImfOL101x3JOn
	 qoMRXBe7J4PwY0UhhVhaq1Ymr9TRHybgrHyDmU2O1xzq16zThLQ6/etviC8SVQlJFt
	 N4J6r0NQEQlB8gHHOhHAAP40rnSNo67uX9e7rCmUAw9wRjQzMfLeSzjK6AQK8NEHJq
	 hbE/3rKKIppULz6AV5zj55PSrK1rDSsY92BmwH1o2P9n/RY/RN22waltP5k8rcWwXZ
	 /1JpNaUVYY3nxMKiRHD8kXbG/SuR2huS+/ugInzEjSub4BRYzP+n9v1bcqhO/Srd/r
	 J2zJRz+9pDYHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 net-next 15/15] net: dsa: netc: add support for
 ethtool private statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260513030454.1666570-16-wei.fang@nxp.com>
References: <20260513030454.1666570-16-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:27:32 +0000
Message-Id: <20260514102733.503B3C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds standard MAC and network device statistics to the=
 driver-private `ethtool -S` interface, duplicating existing standard uAPIs.
--

commit b533630ccd26c1520e0426d6fa7264b3df331e6a
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add support for ethtool private statistics

This commit implements the ethtool private statistics interface for netc
switches, exposing additional port-level, eMAC, and pMAC counters.

> diff --git a/drivers/net/dsa/netc/netc_ethtool.c b/drivers/net/dsa/netc/n=
etc_ethtool.c
> index ac8940b5a85c6..8d04db534347c 100644
> --- a/drivers/net/dsa/netc/netc_ethtool.c
> +++ b/drivers/net/dsa/netc/netc_ethtool.c

[ ... ]

> +static const struct netc_port_stat netc_emac_counters[] =3D {
> +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> +};
> +
> +static const struct netc_port_stat netc_pmac_counters[] =3D {
> +	{ NETC_PM_ROCT(1),	"pMAC rx octets" },
> +	{ NETC_PM_RVLAN(1),	"pMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(1),	"pMAC rx frame errors" },
> +	{ NETC_PM_RUCA(1),	"pMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(1),	"pMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(1),	"pMAC rx packets" },
> +	{ NETC_PM_TOCT(1),	"pMAC tx octets" },
> +	{ NETC_PM_TVLAN(1),	"pMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(1),	"pMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(1),	"pMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(1),	"pMAC tx packets" },
> +	{ NETC_PM_TUND(1),	"pMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(1),	"pMAC tx invalid octets" },
> +};

Are these counters duplicating values that already have standard kernel uAP=
Is?

According to the networking subsystem guidelines, driver patches must not a=
dd
new counters to ethtool -S for values that have a standard interface. Stand=
ard
metrics such as rx octets, rx frame errors, rx dropped packets, tx packets,
and tx FCS errors are already covered by standard interfaces like
rtnl_link_stats64 and ethtool_eth_mac_stats.

Since the driver already implements netc_port_get_eth_mac_stats() to handle
ETHTOOL_MAC_STATS_SRC_EMAC and ETHTOOL_MAC_STATS_SRC_PMAC, exposing these
metrics as private strings appears redundant and duplicates existing standa=
rd
uAPIs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513030454.1666=
570-1-wei.fang@nxp.com?part=3D15
