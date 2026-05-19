Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341CD3E63AD;
	Tue, 19 May 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179138; cv=none; b=NzJhkVRaml/smrWiHCYeP4HA3VQLFljdtdxZFrSX8Lq6bdWbrxo/ihJnc7rY88LEocrHx7FDm5NCG4ftOo/zrs5I5q3I5o12CHjVA9uBwDfX3bsDbXgL9V0bVE9WHHON6k4aQwO4ycfN8iSyYe/6820hXKtwzWCeNARpaXD/4Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179138; c=relaxed/simple;
	bh=vTJQd7Dnocn4t1wc9F7k3t2/AYzhwuAflU1gA/tVAOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N8Ksz1uvGLHoY1BpcTyti6sjf/ZbSsTmL+oGYoIB9WsLnOHdFZljy3qhddNndvmL74WeM6onsJEYNgGfLEQUwTaU9fSCUKFnN+QrGdDIJUiwQwDEmwWhCcA2VxLY4h3vXlo40ogbLHdReaL1zJeOo0fRHaQcR0wiS6blaI2ao90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iu/YcL3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iu/YcL3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3FDC2BCF5;
	Tue, 19 May 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179137;
	bh=vTJQd7Dnocn4t1wc9F7k3t2/AYzhwuAflU1gA/tVAOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iu/YcL3kYjJkXFqIl9FYhNkL63ZsE5t6UhpuzYMLzHorNOJmgNmHO+8YhJa0Yepup
	 d+XA6InURD8vGjL38baSv7CF3IUGLag6Mgo/cwoKDIaAfXbhWE23KInX7amNmuDYBJ
	 z9ZEaAWwtvjhQzoogYiG6cKwfhATSkJjnuyOqDAHxHLDrb3NNwSRTuec8f50vptU6a
	 5a2zwQxcT4KSvBZxaqe1hDZm1BQUxjIXGFTb247qZ73qyL1OBN3A6e88l+80NnNjho
	 Ak/ua/1l+GCoKJISqBZqxcGjVeM7y/9VoxftDgCEwyW+Rmd8/lmcfFIh24rTyhRdH9
	 cFOKVc+AS7wGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 11/15] net: dsa: netc: add phylink MAC
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518082506.1318236-12-wei.fang@nxp.com>
References: <20260518082506.1318236-12-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:36 +0000
Message-Id: <20260519082537.4A3FDC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `netc_mac_port_rmw()` function can silently fail to synchroniz=
e the pMAC and eMAC registers due to a flawed early return optimization.
- [High] The `netc_port_mac_tx_graceful_stop()` function fails to wait for =
the switch port to become idle (`PSR_TX_BUSY`), risking trapped data and FI=
FO overflows.
- [High] Missing MAC-level speed, duplex, and PCS configuration for SGMII a=
nd 2500BASE-X interfaces renders them non-functional.
--

commit 1c39a10b5175a16ff2753fc6b076dd4c1bbc15de
Author: Wei Fang <wei.fang@nxp.com>
net: dsa: netc: add phylink MAC operations

This commit adds .phylink_get_caps() to struct netc_switch_info to handle
different numbers of ports and MAC capabilities across NETC switch versions.
It implements the phylink_mac_ops callbacks .mac_config(), .mac_link_up(),
and .mac_link_down().

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 8e3a3230226c3..2141b3aa96b7a 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

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

Does this early return prevent the pMAC register from synchronizing correct=
ly
if the bootloader or previous state left the eMAC and pMAC desynchronized?

Since old is read exclusively from the eMAC, if the new value matches the
eMAC's current value but the pMAC's state differs, returning early skips wr=
iting
to the pMAC register entirely. This could leave the preemptable MAC operati=
ng
with incorrect settings.

> +
> +	netc_port_wr(np, reg, new);
> +	if (np->caps.pmac)
> +		netc_port_wr(np, reg + NETC_PMAC_OFFSET, new);
> +}

[ ... ]

> +static void netc_port_mac_tx_graceful_stop(struct netc_port *np)
> +{
> +	netc_port_rmw(np, NETC_POR, POR_TXDIS, POR_TXDIS);
> +
> +	if (is_netc_pseudo_port(np))
> +		return;
> +
> +	netc_port_wait_tx_empty(np, 0);

Could this disable the MAC TX prematurely, trapping data in the pipeline?

The code disables the Switch Port from feeding new data and then waits for =
the
MAC TX FIFO to empty. However, it doesn't wait for the Switch Port to finish
pushing its current data into the MAC (PSR_TX_BUSY =3D=3D 1).=20

If the MAC momentarily drains its FIFO to the wire faster than the port fil=
ls
it, PM_IEVENT_TX_EMPTY might briefly read true while the port is still
actively transmitting data into the MAC.

Should we poll !(val & PSR_TX_BUSY) from NETC_PSR immediately after setting
POR_TXDIS, similar to how the RX path waits for PSR_RX_BUSY before disabling
the port?

> +	if (np->caps.pmac)
> +		netc_port_wait_tx_empty(np, 1);
> +
> +	netc_mac_port_rmw(np, NETC_PM_CMD_CFG(0), PM_CMD_CFG_TX_EN, 0);
> +}

[ ... ]

> +static void netc_mac_link_up(struct phylink_config *config,
> +			     struct phy_device *phy, unsigned int mode,
> +			     phy_interface_t interface, int speed,
> +			     int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct dsa_port *dp =3D dsa_phylink_to_port(config);
> +	struct netc_port *np;
> +
> +	np =3D NETC_PORT(dp->ds, dp->index);
> +	netc_port_set_speed(np, speed);
> +
> +	if (phy_interface_mode_is_rgmii(interface))
> +		netc_port_set_rgmii_mac(np, speed, duplex);
> +
> +	if (interface =3D=3D PHY_INTERFACE_MODE_RMII ||
> +	    interface =3D=3D PHY_INTERFACE_MODE_REVMII ||
> +	    interface =3D=3D PHY_INTERFACE_MODE_MII)
> +		netc_port_set_rmii_mii_mac(np, speed, duplex);

Are SGMII and 2500BASE-X interfaces left unconfigured at the MAC level?

The driver advertises support for PHY_INTERFACE_MODE_SGMII and
PHY_INTERFACE_MODE_2500BASEX in imx94_switch_phylink_get_caps(), including
10/100 half-duplex capabilities for SGMII.

However, MAC-level speed and duplex configurations are bypassed here for SG=
MII
and 2500BASE-X, and the driver doesn't implement the .mac_select_pcs callba=
ck
nor configure in-band autonegotiation. Without these, the interfaces might =
fail
to establish a correct link, especially at lower speeds or half-duplex.

> +
> +	netc_port_mac_tx_enable(np);
> +	netc_port_mac_rx_enable(np);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D11
