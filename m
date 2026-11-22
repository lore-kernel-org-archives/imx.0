Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345252;
	b=p78JGjOFTHOusUqBmh60aq6DQ1JmlzEj6+NUN0OaPxV/ulpFylQ5Cp7LOYo0SQCXfdLJ
	 znU23vG9PD7VxV8YkoZQQMW0HdT64RbCBk2Zme7IWgygvos/rCpK+laxFCbEWdOrT4g3n
	 UWlFv+HzGqmgRC26QkufQKR6M7b3tfFn31gj/dDJT5EMKpc0zYBCC03zuyFl32LpgE7O0
	 2TezULUBHVu0rAZCZTo3N3ca5kj9lXAlFPKQR3Pz47T39K307CQCVyk/yDTHYKWq5e+0v
	 0JdifRAWsE6WydaeIgvRhuA7o9NXVhIt1DaAl37b3leRrU43veKe2li+CMDZq5hwj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345252;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zggGzxEmYdUO2ER56cmR3uCkWwbZK6jGMEYqYgWH4qo=;
	b=ItCsVBAkqZZXLyH+HRa1RBYh1gakIravlxGATW0K0mzEgYngVQg8nR3k9csF7+O4sNoQ
	 vW5r+kfn07MnoGxc8J7VgLfd6mhmdWYUfLf3njWycHRF1OTX5ygPDx1caZmeLJ5r3X5Ao
	 q7YE57bYZvFjzUY2NKUFM0rAK/yPRw+NivpM8RPCXZQ3mCnLQ6uhur3ze/v9mllpvhzM5
	 ABQTMLUhYd2sEpjZKHtV1dVrx6pFeokC/d/PbfaQHnX0zPIhkHEfthv32N2Jze7mEzOtL
	 7H+H77GI8oodqqb8oTl+frSSA3c9HRJ3JlosIrq0qpms44sPgtl567TmQ2+5czPmg5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=db6jrTnn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9306606A681;
	Sun, 22 Nov 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=db6jrTnn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40EF1F000C6;
	Sun, 22 Nov 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345252;
	bh=zggGzxEmYdUO2ER56cmR3uCkWwbZK6jGMEYqYgWH4qo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=db6jrTnn+WbkFLApyKYhketGr/FUPldhNR/KbNljcMY5jriBMR3R4zTA5wGO4RMSM
	 /dFynGSlhdNnxZVGKXNSJE+5FkKkzWNnYIEzpvDSDLh4GxplUgq6O8DCRBj5xsdC7N
	 jYwnaSAlITZPYhGyLQjNoWqliI18FNWEC2CK8BIYUB8fOrF4l7xz5+Xun3duRD0QoN
	 zBeGkOpSEmG0RdSiL1Ve9jENSaspZ6Ct2CQcJ2+1LR1E0ElAhk4zzh/EWyBQMqbBib
	 GPzKV9V6n0lqaRmfslCAWcUuNsK58bAq37z9YUzb7H3Ot2AY+Jg5/wO1uAm4U5mXCm
	 jBtLgVmaiAoHg==
Subject: Re: [PATCH net-next 3/4] net: enetc: add i.MX952 ENETC support
From: netdev-bot+sashiko@kernel.org
To: frieder@fris.de
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de
Date: Sun, 22 Nov 2026 11:00:51 +0000
Message-ID: <179534525124.3135.3738979682916581664@kernel.org>
In-Reply-To: <20261118-imx952-enetc-v1-3-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-3-25721440602e@kontron.de>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When an i.MX952 (ENETC rev 4.6) VF cannot get its IP minor
  revision from the PF, enetc_vf_get_revision()…
- [Medium] This finding is speculative.

--

net: enetc: add i.MX952 ENETC support

This commit adds ENETC revision 4.6 (i.MX952) entries to the enetc_info
table, with new PF and VF driver data that use a 133 MHz sysclk. It also
maps revision 4.6 to a PTP timer at PCI_DEVFN(0, 1) in
enetc_get_phc_index_by_pdev().

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index c6571b5cc8425..4ef387578b1e4 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c

[ ... ]

> @@ -3832,6 +3840,13 @@ static const struct enetc_drvdata enetc4_vf_data = {
>  	.eth_ops = &enetc_vf_ethtool_ops,
>  };
>  
> +static const struct enetc_drvdata enetc4_6_vf_data = {
> +	.sysclk_freq = ENETC_CLK_133M,
> +	.tx_csum = true,
> +	.max_frags = ENETC4_MAX_SKB_FRAGS,
> +	.eth_ops = &enetc_vf_ethtool_ops,
> +};
> +

[Severity: Medium]
What happens to an i.MX952 VF when it cannot get the minor revision from
the PF? enetc_vf_get_revision() in enetc_vf.c falls back to a fixed
revision:

drivers/net/ethernet/freescale/enetc/enetc_vf.c:enetc_vf_get_revision() {
    ...
	ip_mn = enetc_vf_get_ip_minor_revision(si);
	if (ip_mn >= 0) {
		si->revision = (si->pdev->revision << 8) | ip_mn;
		return;
	}

	si->revision = ENETC_REV_4_1;
    ...
}

In that case enetc_get_driver_data() matches the ENETC_REV_4_1 VF entry.
It selects enetc4_vf_data (333 MHz) instead of enetc4_6_vf_data
(133 MHz), and enetc_vf_netdev_setup() copies the 333 MHz value into
priv->sysclk_freq.

Before this patch every v4 VF drvdata used 333 MHz, so the fallback still
gave the right clock. Now that rev 4.6 uses a different sysclk, would
every usec/cycle conversion on that VF be off by about 2.5x?

For example, enetc_init_si_rings_params() does:

	priv->tx_ictt = enetc_usecs_to_cycles(600, priv->sysclk_freq);

At the real 133 MHz clock this works out to about 1.5 ms instead of
600 us. The RX DIM work and the ethtool coalesce get/set paths would be
scaled by the same wrong factor.

The fallback also makes enetc_get_phc_index_by_pdev() take the
ENETC_REV_4_1 case. That case looks up the timer at PCI_DEVFN(24, 0), not
at the PCI_DEVFN(0, 1) added below for rev 4.6. Without a ptp-timer
phandle, could the VF then report no PHC, or the wrong one?

The fallback runs whenever enetc_vf_get_ip_minor_revision() returns an
error. That can be a DMA allocation failure, a busy mailbox, a poll
timeout, or an error status from the PF.

>  static const struct enetc_platform_info enetc_info[] = {
>  	{ .revision = ENETC_REV_1_0,
>  	  .dev_id = ENETC_DEV_ID_PF,

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> index 7965dfd06f5f6..3c6c6fc0ab8cf 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -1149,6 +1149,7 @@ static int enetc_get_phc_index_by_pdev(struct enetc_si *si)
>  		devfn = PCI_DEVFN(24, 0);
>  		break;
>  	case ENETC_REV_4_3:
> +	case ENETC_REV_4_6:
>  		devfn = PCI_DEVFN(0, 1);
>  		break;

[Severity: Medium]
Is there a NETC timer at 00.1 on the bus of each i.MX952 ENETC?

netc_blk_ctrl.c puts the two i.MX952 ENETCs on different buses:

#define IMX952_ENETC0_BUS_DEVFN		0x0
#define IMX952_ENETC1_BUS_DEVFN		0x100

This lookup uses the ENETC's own bus->number. So ENETC0 would look for a
timer at 00:00.1, and ENETC1 would look for one at 01:00.1.

i.MX94 has a timer at 00.1 on each bus. It also programs the
ENETC-to-timer binding explicitly in imx94_enetc_update_tid():

	netc_reg_write(priv->ierb, IERB_ETBCR(eid), tid);

imx952_ierb_init() only writes the byte credit registers and never
programs IERB_ETBCR. There are also no i.MX952 timer definitions or NETC
DT nodes in the tree to compare against, so I couldn't verify the
topology. This may well be fine on real hardware.

If only one timer exists, would the ENETC on the other bus get -1 here
and report no PHC?

If each bus has its own timer, but the reset value of IERB_ETBCR does not
bind each ENETC to the timer on its own bus, could the PHC index reported
to userspace differ from the timer that actually timestamps the packets?

>  	default:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-imx952-enetc-v1-0-25721440602e%40kontron.de
