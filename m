Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFDD32D425
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608120; cv=none; b=DW2cf7jJ6sStpCRBivD+/h2o2V1+0wjLHgY1pltvSIUDN4seWmcRoB0OdPOxNOAkVquLXglwNlmJmnze1GYx/VDKN88OVP9RZAiRcJ49z6exNldfdp0RVM9qCQRIWO4OzI2IjL26cpt5BZ1no1s5XjDkSTYJEVJ4JUvv20TUnPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608120; c=relaxed/simple;
	bh=jBGpChVk0KQCf6GdVEfFy1wBUZJg9MivIDQuWD+C5Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tL4AtieVTiIarPl+xMytD03TFMaPLWAqS35IQ7qVg6rw+EX4WPp/lcgq8aYfNdM393mPs9Bqcv/Xfjp1gvJhSvRGjkeQWzaxvdLsW5UAF4qhxNTCe4hBpQcVpvmb4XnWYspScPJi9JPxwVBy0G1gNH8jYbVEC6xrPgVUm++YtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=t6p22Pfp; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="t6p22Pfp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3DMZzifuq5ecR8SK0Zfli2LHtmxBheCwlnXIyeG6GuM=; b=t6p22PfpjCdAg0+CT1RwfT+AFk
	Oeai+FEASjFbvjkGxxxau3SS/h5gR5+kslM+ae2F1ENVabwkesGj2s67ZUtMk9P5KVPph4dJMUikD
	ckp7viMWiko3Pm8BMbHhTaigVfBduYjeKRozAVeor2BoqAI9ddLN5LIg9LRxYAfAv9BmyqI2pRzku
	0HhCjf8YVezQrODnISQKNsCRO4hAVbhZcpMlmVuwsS4GyhrUqMVxbN2k/jaMfu7LJpSUiCXIVlIAD
	ZnPdcx8bWPU4GrXTVH6yu/7UqGWrJ7ZXTDIKKCnvmLHS8QzVVCzVvwdQdDaehrXi0hfpbqPxD6wqz
	01jj+rSA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60620)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQ7B4-000000000rO-34To;
	Mon, 01 Dec 2025 16:55:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQ7B1-000000006d4-1TOK;
	Mon, 01 Dec 2025 16:55:03 +0000
Date: Mon, 1 Dec 2025 16:55:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Li <Frank.li@nxp.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] dts: s32g: Add GPR syscon region
Message-ID: <aS3IZlGBQyvXNVOe@shell.armlinux.org.uk>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <c8302f53fcbb5cb5afe42cdb15aba7e2e6ed7338.1764592300.git.dan.carpenter@linaro.org>
 <aS3FWLWQ1g4YQjFi@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS3FWLWQ1g4YQjFi@lizhi-Precision-Tower-5810>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Dec 01, 2025 at 11:42:00AM -0500, Frank Li wrote:
> On Mon, Dec 01, 2025 at 04:08:33PM +0300, Dan Carpenter wrote:
> > Add the GPR syscon region for the s32 chipset.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
> >  arch/arm64/boot/dts/freescale/s32g3.dtsi | 8 ++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > index 51d00dac12de..3c9472f6c174 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > @@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
> >  			};
> >  		};
> >
> > +		gpr: syscon@4007c000 {
> > +			compatible = "nxp,s32-gpr", "syscon";
> > +			reg = <0x4007c000 0x3000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +		};
> > +
> 
> Please cc whole thread to imx@lists.linux.dev.
> 
> I think it is not good method by using syscon here.
> 
> Suppose using standard phy interface or mux controller interface.

I rather disagree, but I would like to see the definition of the
"ctrl_sts" register. The driver defines:

/* SoC PHY interface control register */
#define S32_PHY_INTF_SEL_MII    0x00
#define S32_PHY_INTF_SEL_SGMII  0x01
#define S32_PHY_INTF_SEL_RGMII  0x02
#define S32_PHY_INTF_SEL_RMII   0x08

This is mostly equivalent to the phy_intf_sel_i[2:0] input to the GMAC
block, who's bit combinations are defined by the PHY_INTF_SEL_xxx
constants. These seem to correspond to register bits 3:1, but with
the GMAC being configured for MII mode with an external SGMII PCS
when bit 0 is set.

If this is true, then no, there is no "phy" as such, and if we go
down the route of modelling the GMAC's phy_intf_sel_i[2:0] inputs
as a "phy" then we're going to end up with something that's a
drivers/phy PHY before a real seperate PHY for providing the
SGMII/1000BASE-X signalling. This falls into the category of needless
over-complication with no benefit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
