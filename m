Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A24A21
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943165; cv=none; b=VsGkdQiYGh3JXYHHFevEEMwZwTEiqGASyvo33SidtW+p6f77XFWvMh/sm7oxoWhiIswbdG59Ws0aIoHhMwhM9BR73SOrTegMZIEZmOsMP2wbxeCOO+5YuiT08gSH7IXVjoaPgUUNqcCRegeemtvW5SJEw17Xh/0nbZ+qbJ3xAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943165; c=relaxed/simple;
	bh=vJG0Qwix1POvTb+AAFX2RrWo0EkB/Z4JteoPIsJvwak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQgH86BmhZm/jTpIuamaPSGEwh2CVHsak4+aRwltfBkF4M72UB6eqWC3NTW1ThqnGvftrcTe0cNq8mBzjO4rqDr+205ZrZ78C6P1keVhXAwXedg6NF1H08RO57K77ndZwBI8Tlp4wtqTiW/xryeuncNvShc3GEwXUuVuxpHtu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hlx0NMTR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hlx0NMTR"
Received: from pendragon.ideasonboard.com (unknown [210.170.118.136])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8C7B529A;
	Mon, 24 Nov 2025 01:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763943032;
	bh=vJG0Qwix1POvTb+AAFX2RrWo0EkB/Z4JteoPIsJvwak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlx0NMTRjzGRyawi2kfkQgIDGesb8d1mI6aGmAWZuzqd4MDMft+ZXjZeJ6DA3TC9j
	 vdarSP2wQTHIgbBkoX2QOcQde5kLvY2gclcnWQbo0eGjpSi9XizdDG+rFAZprmuVKh
	 dkzv5wW/f5UeFIE89hMxqmuDlftmor1LozbSZgK8=
Date: Mon, 24 Nov 2025 09:12:14 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251124001214.GI15447@pendragon.ideasonboard.com>
References: <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
 <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
 <20251123152356.GF15447@pendragon.ideasonboard.com>
 <aSNAP9G4cwRKvxng@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSNAP9G4cwRKvxng@shell.armlinux.org.uk>

On Sun, Nov 23, 2025 at 05:11:27PM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 24, 2025 at 12:23:56AM +0900, Laurent Pinchart wrote:
> > On Sun, Nov 23, 2025 at 08:52:00AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Nov 23, 2025 at 02:38:02PM +0900, Laurent Pinchart wrote:
> > > > On Sat, Nov 22, 2025 at 09:57:49AM +0000, Russell King (Oracle) wrote:
> > > > > On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> > > > > > Hello Wei,
> > > > > > 
> > > > > > On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > > > > > > Sorry, I only have a little experience with DWMac, add Clark to help look
> > > > > > > at this issue.
> > > > > > 
> > > > > > Thank you.
> > > > > > 
> > > > > > I think we're getting close to having a good understanding of the
> > > > > > problem. I've debugged it as far as I could based on the information
> > > > > > available publicly. Let's try to get to the bottom of this issue, it
> > > > > > impacts quite a lot of people and it would be very nice to fix it
> > > > > > properly in mainline.
> > > > > > 
> > > > > > The short summary is that I'm experiencing an interrupt storm on IRQ 135
> > > > > > when EEE is enabled with the EQOS interface.
> > > > > > 
> > > > > > My current theory is that
> > > > > > 
> > > > > > - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> > > > > > - The issue is triggerted by the PHY exiting LPI mode
> > > > > > - When it exits LPI mode, the PHY restarts generating the RX clock
> > > > > >   (clk_rx_i).
> > > > > > - The MAC detects exit from LPI, and asserts lpi_intr_o.
> > > > > > - Before the CPU has time to process the interrupt, the PHY enters LPI
> > > > > >   mode again, and stops generating the RX clock.
> > > > > > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> > > > > >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > > > > 
> > > > > Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
> > > > > see whether that changes the behaviour.
> > > > 
> > > > I have tested that and it worked like a charm ! I have submitted
> > > > https://lore.kernel.org/r/20251123053518.8478-1-laurent.pinchart@ideasonboard.com
> > > > 
> > > > That was quite an adventure. Thank you so much for all your support, I'm
> > > > not sure I would have managed without you (or at least I would have
> > > > needed way more time). I really really appreciate it.
> > > > 
> > > > If the above patch gets accepted, we will probably be able to remove the
> > > > eee-broken-* properties from the i.MX8MP device tree files (and possibly
> > > > from i.MX8DXL and i.MX93 as well). I have mentioned that below the
> > > > commit message of the patch, with a test procedure as it should be
> > > > tested on each board.
> > > 
> > > As stated in reply to that patch, while this may reduce the severity of
> > > the storm, I don't think it'll completely eliminate it.
> > > 
> > > I made the suggestion to set the flag as a test to confirm whether the
> > > lpi_intr_o is indeed the problem by ensuring that the receive domain is
> > > always clocked, and thus ensuring that the signal clears within four
> > > clock cycles, rather than an indefinite period should the remote end
> > > re-enter LPI mode quicky.
> > 
> > You're right. I've checked replied to the patch with the following
> > numbers.
> > 
> > 100TX link, eee-broken-* set: 7000 interrupts
> > 1000T link, eee-broken-* set: 2711 interrupts
> > 100TX link, eee-broken-* unset: 9450 interrupts
> > 1000T link, eee-broken-* unset: 6066 interrupts
> 
> Sadly, I think this means for iMX8MP, the correct answer is to disable
> EEE completely. What I was thinking when I brought this up is as follows
> and dwmac-imx.c can set STMMAC_FLAG_EEE_DISABLE for iMX8MP to prevent
> the use of EEE.

I suppose there's no way to disable EEE in the RX path while keeping it
enabled in the TX path ?

> This works because, in phylink, pl->mac_supports_eee_ops will be set
> since stmmac implements the two LPI operations. pl->mac_supports_eee
> will be clear because pl->config->lpi_capabilities will be zero, and
> pl->config->lpi_interfaces will be empty. This causes phylink to call
> phy_disable_eee() on all PHYs that end up being attached to this
> phylink instance, which should result in the PHY EEE advertisement
> being cleared.
> 
> I'll package this up into a proper patch tomorrow.

Thank you. I can respin my patch on top.

>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  include/linux/stmmac.h                            | 9 +++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1d37c2b5ad46..113cae2bc593 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1376,7 +1376,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  				 config->supported_interfaces,
>  				 pcs->supported_interfaces);
>  
> -	if (priv->dma_cap.eee) {
> +	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
> +	 * used for stmmac's main interrupts, which leads to interrupt storms.
> +	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
> +	 */
> +	if (priv->dma_cap.eee &&
> +	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
>  		/* Assume all supported interfaces also support LPI */
>  		memcpy(config->lpi_interfaces, config->supported_interfaces,
>  		       sizeof(config->lpi_interfaces));
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 8ae068706b63..4c770262a2f8 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -187,10 +187,11 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
> -#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> -#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
> -#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> +#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
> +#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
> +#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
>  
>  struct mac_device_info;
>  

-- 
Regards,

Laurent Pinchart
