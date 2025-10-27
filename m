Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DF2652BD
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557643; cv=none; b=GqgmR1icBlZxS6qstxWIuhozO3yZ90LYE5X+CP2+xz2UD8+ZXYyljw9PE68wv+9Ym00ex4rxRQHGv2EJ69n/7oy25moFmCub85JfB2yacS/IbISUkp3QNejt5K7Nla6KMnVtkTOuSVP8l5JkhM/54uNu2bhP9b77mRWf0y6bBJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557643; c=relaxed/simple;
	bh=JWOTEzsnqe2ZVX69WMnwkdkU+ZQ82vlW3C/Ncaoe77o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiG9fFUWYLquEmK2wzxPRWlpiQgS4E5nUiIj6fmDLDA8TOZwMQJZ4Bi6sldXRnIdswjCtTDxSF9uOQaJ6bivsHSqb22dmi1Urw8K1ISQ9bn3eAfZ9PrFk4qWVsmugzTaYO1x812+GegTa3RKfxsIhk9z596T8vsOJpHFWE4CRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RfpAy3rG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RfpAy3rG"
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E04621661;
	Mon, 27 Oct 2025 10:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761557532;
	bh=JWOTEzsnqe2ZVX69WMnwkdkU+ZQ82vlW3C/Ncaoe77o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfpAy3rGzg7hBJpFqUe7Fcpd2joSB2//BoH9daa4FQ+HnQfqX8G+sj8/R00TFllqI
	 cQMwAYuX5R2+RasSArIE2mwNRaD6Kf/eEFGu/laS4ld6sJh9OnTie2QTLPbOQUxlDQ
	 FTH363BCa5sL1N+W5wxr8+ivFHTA2jiaswQSmNyg=
Date: Mon, 27 Oct 2025 11:33:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027093346.GB1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>

Hi Russell,

On Mon, Oct 27, 2025 at 09:07:32AM +0000, Russell King (Oracle) wrote:
> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > devices produces an interrupts storm. Disable EEE support to fix it.
> 
> As this is the second problem that has been reported recently, please
> bisect the conversion of stmmac to phylink managed EEE support and see
> whether there is anything in that which is causing this.

Emanuele Ghidoli has bisected this to commit 2c81f3357136 ("net: stmmac:
convert to phylink PCS support"), as reported in [1]. I can test that
commit and the commit just before tonight.

[1] https://lore.kernel.org/all/341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com/

> Please also confirm that EEE was enabled (as soon through ethtool)
> prior to stmmac's conversion (I believe it was due to this code that
> was present in stmmac_init_phy():
> 
> -               if (priv->dma_cap.eee)
> -                       phy_support_eee(phydev);
> -
>                 ret = phylink_connect_phy(priv->phylink, phydev);
> 
> > The exact reason for the interrupt storm is unknown, and my attempts to
> > diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> > understand, the DWMAC implements EEE support, and so does the RTL8211E
> > PHY according to its datasheet. What each side does exactly is unknown
> > to me. One theory I've heard to explain the issue is that the two
> > implementations conflict. There is no register in the RTL8211E PHY to
> > disable EEE on the PHY side while still advertising its support to the
> > peer and relying on the implementation in the DWMAC (if this even makes
> > sense), so disabling EEE is the only viable option.
> > 
> > This patch is likely a workaround, but it fixes ethernet usage on the
> > board, so it's in my opinion worth being merged. If someone with better
> > knowledge of EEE and DWMAC, as well as an interest in getting it working
> > properly on the Debix board, wants to submit additional patches to drop
> > eee-broken-1000t, I will be happy to test them.
> 
> The changes to stmmac have been tested on nVidia Jetson Xavier NX,
> which uses RGMII with dwmac4 and a RTL8211F PHY, connected to a Netgear
> GS108 switch. It seems to be the same that your board is using similar.

Very similar indeed, with a RTL8211E instead of the RTL8211F.

> I will re-test today.

Thank you.

-- 
Regards,

Laurent Pinchart
