Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345251;
	b=fNzvBf1/wkA9RYXYOqrSJubjUqljOylqXIUCETWk+9A4NQGxy/W6NHuNDJYmh93QyzGV
	 OY2jwAzdxoL0hzH3DATHJUrkuLScbU8/2sTBOk5Z2kmTDMtbtjAitC9kyC3aINeJY21fB
	 hhEf7/BJ5cOjw55KIsbXJ0r3uwh7PX1RShvo3oebuqlhXsW3VuOfykQv0D10RausxCVpK
	 djVGUmbWGqgIwOvsP0oogWyxaLya6JLh3lMMK643BpoL+J5J22klVPeJz2aWlCuADzPei
	 hjnOT1B0BauQgHNaXQfg47TZN8jZu+HpdRXBFWgN16akeiYIMmMH4veZWXQmqvL+W0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345251;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=udWJrXNIpTxLGF6F0MLOBV1YkMsAJ0RVnTeV27nP6Fo=;
	b=DCo82zSUk4QuEude+O4fAdxUXUvII4IRuGdN7wrpRVNGv5jm0TddLsensh621aHGvlfR
	 glDNrDKiBIeuQfdBZlwHBxbDoExEeZN4zW/b0stDDIqtt3zmDxqu8FY/ibpACmaS/5zz1
	 5K/PzQourGPiuNKqpNnbBrgDoS9N36SClfGe+CrYtia+ro+OHkvsKWSOFWycBaCPxtneB
	 lluSR2qwsBhEx/236yJFd9tbHQRcStOhThiecp3takF13rII099rihhk8K96LsBtkL6mn
	 zqnacGr7+i/awPsvB10AeXMSp83cvuasWzlhB7eEn6vhVNuH5EqA7xXHSsYkHl0Hcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2WSzx8a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D3606A332;
	Sun, 22 Nov 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2WSzx8a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F351F000C0;
	Sun, 22 Nov 2026 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345251;
	bh=udWJrXNIpTxLGF6F0MLOBV1YkMsAJ0RVnTeV27nP6Fo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E2WSzx8aigeSWhRfrxSqxNR9NZGdHN1oao155zQPvQEwT1mHVpLErMBiz7tyjmx9L
	 9+vkOJVVtfjyHndYtfZrNdsE0tBkYeu60kacmiyPbHHI7Am2squZ3NrSCoDMC7JliE
	 O46Tbr6qjPj5MijYcV7dcDiX8iZyg6cw1MsN1OF+ZTaaO5Q8Fph9pji6NK/UavZo3b
	 Bu0g3NeC+QMRaGs2w+pWnmfZhb9O06x5Y/8/SYbelDKxFFs6Pg9MmXdh3r2DP20AXO
	 8HLYs64fxQDYk++GPC653p37Cm1974tsMczmmWloxSO1dZoTfe0pp2L1waeg9RJAYZ
	 gCHqQQcDpfUtQ==
Subject:
 Re: [PATCH net-next 2/4] net: enetc: netc_blk_ctrl: add i.MX952 support
From: netdev-bot+sashiko@kernel.org
To: frieder@fris.de
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de
Date: Sun, 22 Nov 2026 11:00:49 +0000
Message-ID: <179534524969.3135.7066285557650709547@kernel.org>
In-Reply-To: <20261118-imx952-enetc-v1-2-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-2-25721440602e@kontron.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] imx952_ierb_init()
  (drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c) writes only…
- [Medium] imx952_netcmix_init()
  (drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c) accepts serial…
- [Low] imx952_ierb_init() writes the hard-coded IMX952_BYTE_CREDIT
  (0xc35 = 3125 bytes) to E0TXHPTBCR/E0TXLPTBCR.

--

net: enetc: netc_blk_ctrl: add i.MX952 support

This patch adds NETCMIX support for i.MX952, which has two ENETC
instances on separate PCIe buses. Their link MII protocol is configured
through the IMX95_CFG_LINK_MII_PROT register. During IERB init it also
sets the ENETC0 TX byte-credit registers to 0xc35.

> diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> index 658fab31e9ed7..6e3098a0a43ee 100644
> --- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> +++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c

[ ... ]

> @@ -368,6 +374,56 @@ static int imx94_netcmix_init(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int imx952_netcmix_init(struct platform_device *pdev)
> +{

[ ... ]

> +			mii_proto = netc_get_link_mii_protocol(interface);
> +			if (mii_proto < 0)
> +				return mii_proto;
> +
> +			switch (bus_devfn) {
> +			case IMX952_ENETC0_BUS_DEVFN:
> +				val = u32_replace_bits(val, mii_proto,
> +						       CFG_LINK_MII_PORT_0);
> +				break;
> +			case IMX952_ENETC1_BUS_DEVFN:
> +				val = u32_replace_bits(val, mii_proto,
> +						       CFG_LINK_MII_PORT_1);
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_MII_PROT, val);

[Severity: Medium]
Does this leave serial links only partly configured?

netc_get_link_mii_protocol() maps sgmii, 2500base-x, 10gbase-r, xgmii and
usxgmii to MII_PROT_SERIAL, and that value gets written into
CFG_LINK_MII_PORT_n here. However, IMX95_CFG_LINK_IO_VAR and
IMX95_CFG_LINK_PCS_PROT(n) are never written, and serial modes are not
rejected either.

imx95_netcmix_init() sets these registers together for its serial link:

	/* Configure Link I/O variant */
	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_IO_VAR,
		       IO_VAR(2, IO_VAR_16FF_16G_SERDES));
	/* Configure Link 2 PCS protocol */
	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_PCS_PROT(2),
		       PCS_PROT_10G_SXGMII);

imx94_link_config() also sets NETC_LINK_CFG_IO_VAR whenever the protocol
is MII_PROT_SERIAL.

The patch "net: enetc: add i.MX952 ENETC support" in this series says
133 MHz is needed as the ENETC sysclk "to enable SGMII 1G". That makes
SGMII look like a supported configuration on i.MX952.

Take an i.MX952 ENETC with phy-mode = "sgmii". Would the MAC be switched
to the serial datapath while the I/O variant and PCS protocol keep their
reset or bootloader values? If so, the link would never come up even
though probe succeeds.

> +
> +	return 0;
> +}

[ ... ]

> @@ -783,6 +839,16 @@ static int imx94_ierb_init(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int imx952_ierb_init(struct platform_device *pdev)
> +{
> +	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
> +
> +	netc_reg_write(priv->ierb, IERB_ETXHPTBCR(0), IMX952_BYTE_CREDIT);
> +	netc_reg_write(priv->ierb, IERB_ETXLPTBCR(0), IMX952_BYTE_CREDIT);

[Severity: Low]
How was IMX952_BYTE_CREDIT (0xc35, or 3125 bytes) derived?

The commit message says:

  Both ENETC0 transmit byte-credit registers reset to 0x5dc, which
  matches the RM example for a 1536-byte maximum frame size.

0x5dc is 1500, and 1536 would be 0x600. Is the arithmetic in the commit
message correct?

The commit message also links the problem to jumbo frames. However, 3125
has no clear relation to ENETC_MAC_MAXFRM_SIZE (9600), which enetc4_pf.c
programs into PM_MAXFRM. The only reason given for the value is "the
same as port 1".

For comparison, the LS1028A code in enetc_ierb.c derives its TX credit
from the maximum frame size:

	tx_credit = roundup(1000 + ENETC_MAC_MAXFRM_SIZE / 2, 100);

Suppose the i.MX952 credit needs to cover at least one maximum-size
frame. Would 3125 bytes still throttle ENETC0 jumbo TX?

These registers cannot be changed once the IERB is locked. Could the RM
rule be documented here, or the value derived from ENETC_MAC_MAXFRM_SIZE?

Writing the value unconditionally seems fine, though. "ptp: netc: use
133 MHz system clock on i.MX952" in this series says the i.MX952 NETC
system clock is 133 MHz.

> +
> +	return 0;
> +}

[Severity: Medium]
Should imx952_ierb_init() also program the port EMDIO PHY address into
IERB_LBCR(n) for each ENETC?

Both sibling SoCs do this in their ierb_init callbacks: i.MX95 through
imx95_enetc_mdio_phyaddr_config() and i.MX94 through
imx94_enetc_mdio_phyaddr_config(). The i.MX95 version says:

	/* Update the port EMDIO PHY address through parsing phy properties.
	 * This is needed when using the port EMDIO but it's harmless when
	 * using the central EMDIO. So apply it on all cases.
	 */

Those functions also check the PHY addresses against the central EMDIO
mask from netc_get_emdio_phy_mask(). That check is missing here too.

netc_ierb_init() calls netc_lock_ierb() as soon as devinfo->ierb_init()
returns, so LBCR cannot be corrected later. Meanwhile,
enetc_mdiobus_create() still creates a port MDIO bus whenever the ENETC
node has an "mdio" child:

	mdio_np = of_get_child_by_name(node, "mdio");
	if (mdio_np) {
		err = enetc_mdio_probe(pf, mdio_np);

On an i.MX952 board that uses port MDIO, would that bus stay at the
reset-default PHY address instead of the PHY described in DT? That would
make the PHY probe or the link fail. A PHY address that clashes with the
central EMDIO would also go undetected.

The dt-bindings patch in this series describes the i.MX952 IERB block as
the same as on i.MX95. No later patch in the series touches
netc_blk_ctrl.c.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-imx952-enetc-v1-0-25721440602e%40kontron.de
