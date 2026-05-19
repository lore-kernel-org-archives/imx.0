Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272583E833A;
	Tue, 19 May 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179141; cv=none; b=MB2jubnnOEQcGxX3xKxcTgaccM0Y5+P370AQVG55ADmywpAt3Foa8Ds+v8Wt1GxAAkbRVspUlLoKRFovYgk8lnR422wrnFxfOl7mdK3Vf2xHfPzqXKxj8zY+PPpuT2Am5CYMA7QJOC/J8F+h7M38KvYmPK7ZZXzcceob4FDWl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179141; c=relaxed/simple;
	bh=TEPJbX2Ub+vh5hhH9ib1Fvsr0MdyZ296UEqpaVkU7Bg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LpkCQGzl2uScdoMGtMt2oWMqUe56dF9mV9kvics1QxikhqoE9hLZ+Jk/qEGGhsLBb0IfYTCtMeaxo2yHpfUL7ZNkuPPtKkeBMZVDVF3efbmZNYBokbE7ae988QF1Ypp+5MG/iO1F+NXwSd0S9Ux9tb27kZpJDiI/baAxz59oDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daD9eoNY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daD9eoNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F47C2BCF5;
	Tue, 19 May 2026 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179140;
	bh=TEPJbX2Ub+vh5hhH9ib1Fvsr0MdyZ296UEqpaVkU7Bg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=daD9eoNYik+QLBWcaK8jVe8QrvfugwnhAWB5Vn2At8Sv3bVKhxvdd89l8irW5GzbM
	 okwGwry87TIo/dOP4S38WMu1Q/bd1WbDj0yytEHkP3vc8X8vK0Rho9KUVb8ebTYIA7
	 SP/Vthj7bMaAjnQeRK7Jjd67ngSs6wvAxHUiQGwVNYXZN4j1OXRbaPnfKMFeD8IqNq
	 O4Npt1lrlSaFtLKxvQIRy7FrRwyh94GjafWWaq5sCC3sL7iOHY2gwn7qbsepul0k9w
	 3ikrWRH5Ndvv3oEv9GdYu5Rvj2f1gkyQiKICSLro8Z54y6i7gmENmaVNXSm+weLKMe
	 NTM+rR/u7k/rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 15/15] net: dsa: netc: add support for
 ethtool private statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260518082506.1318236-16-wei.fang@nxp.com>
References: <20260518082506.1318236-16-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:40 +0000
Message-Id: <20260519082540.A8F47C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch duplicates standard MAC statistics into the driver-pri=
vate `ethtool -S` interface, violating networking subsystem guidelines.
--

commit 69ac5ab61c392e1560b98f2d827a22869f473c36
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add support for ethtool private statistics

This commit implements the ethtool private statistics interface to expose
additional port-level and MAC-level counters. It adds string-based counters
for both the eMAC and pMAC.

> Note that although rtnl_link_stats64 provides some standard statistics
> such as rx octets, rx frame errors, rx dropped packets, and tx packets,
> these are overall port statistics. The NETC switch supports preemption
> on each port, and each port has two MACs (eMAC and pMAC). The driver
> private statistics are used to obtain statistics for each MAC, allowing
> users to perform analysis and debugging.

Does the standard struct ethtool_eth_mac_stats interface already provide a
native mechanism to report these exact metrics individually for the eMAC
and pMAC?=20

The ETHTOOL_MAC_STATS_SRC_EMAC and ETHTOOL_MAC_STATS_SRC_PMAC source fields
appear to be designed for this exact purpose.

> diff --git a/drivers/net/dsa/netc/netc_ethtool.c b/drivers/net/dsa/netc/n=
etc_ethtool.c
> index ac8940b5a85c6..e6028851a6d09 100644
> --- a/drivers/net/dsa/netc/netc_ethtool.c
> +++ b/drivers/net/dsa/netc/netc_ethtool.c
[ ... ]
> @@ -19,6 +19,50 @@ static const struct ethtool_rmon_hist_range netc_rmon_=
ranges[] =3D {
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

Are these counters duplicating metrics that already have a standard uAPI?

The networking subsystem guidelines state that stats with a standard uAPI
should not be duplicated in the ethtool -S interface.

Since the driver already implements netc_port_get_eth_mac_stats() to handle
the eMAC and pMAC sources, could these standard MAC statistics be provided
through that standardized interface rather than adding them as private
string-based counters?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D15
