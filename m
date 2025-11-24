Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C229B228
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973834; cv=none; b=fY6IoF6coNnimHgmldM/SjHMBdqnFC6FU5MNuL1ijsQli6feT6gKiFRVj/18KOx9c+CY2sWWNcrMzB7QW7s3i6PZ0EV4HM5GqScqW5Fm9NDiUbjjLLizY19PcmHW+wT4JK/tsF0/Xb4B6U9cQzC6upvYT6kp2ZGRlw9oGY4Hm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973834; c=relaxed/simple;
	bh=Kws+6hHqLaE358GJ8oQhHsOD8lXagFw7+j3g/9Ifp28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E75sBnB462I6sVFFzEHypjM9D3G874zsmbm/j620e2PqJoNli57WJtsTT1qgS6DGvFTyBYu+V/sMTviZ99xNAf0OTjl2lesVeYYV7nrJefIjmmhAKQtVzPOzdnnjVc8+DH0vp0/VPXLpN2zsrSSMIuLXUgNm1HQYDVgrfRCPRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WoPfX9Uk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WoPfX9Uk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lsszvakFMADLxt1ailSrb4YFGJxrr+DQEL8j+TCc3fo=; b=WoPfX9Uk8qnphiu8EMJ3Wlfh16
	fPLyXjYCpwt/dCPT6kNlprnhYXeKIRcWI5lhGA5SPVpmDY4zIb+SQNvHNwTY7q1amDotdwNRZhwxN
	XRWp2OiV7dOsu6nawrJm5uDsuE/Qg+77SskyUXygzsRmKeFn1MIdaJ3clWI9SMhZovhqHL7kUzk9p
	WfNK2S01Df+Xmvd4kwQQSpM6azjYTOP6sFMdetNhUpmSTj7HUF2mnA+LyLSNsvIUdWY1bxfsjEcRB
	ZFdOIpcz85N32G0iv8F/sSNWBrTGJI99SHb2i9oKctm/ypWRfLEP5uKWETLRfla8Tr1hJn6MGpEQh
	IgHOebmA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vNSAl-000000001TY-3flY;
	Mon, 24 Nov 2025 08:43:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vNSAj-0000000088I-3hgz;
	Mon, 24 Nov 2025 08:43:45 +0000
Date: Mon, 24 Nov 2025 08:43:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <aSQawUazSYykHeT4@shell.armlinux.org.uk>
References: <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
 <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
 <20251123152356.GF15447@pendragon.ideasonboard.com>
 <aSNAP9G4cwRKvxng@shell.armlinux.org.uk>
 <20251124001214.GI15447@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124001214.GI15447@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Nov 24, 2025 at 09:12:14AM +0900, Laurent Pinchart wrote:
> On Sun, Nov 23, 2025 at 05:11:27PM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 24, 2025 at 12:23:56AM +0900, Laurent Pinchart wrote:
> > > You're right. I've checked replied to the patch with the following
> > > numbers.
> > > 
> > > 100TX link, eee-broken-* set: 7000 interrupts
> > > 1000T link, eee-broken-* set: 2711 interrupts
> > > 100TX link, eee-broken-* unset: 9450 interrupts
> > > 1000T link, eee-broken-* unset: 6066 interrupts
> > 
> > Sadly, I think this means for iMX8MP, the correct answer is to disable
> > EEE completely. What I was thinking when I brought this up is as follows
> > and dwmac-imx.c can set STMMAC_FLAG_EEE_DISABLE for iMX8MP to prevent
> > the use of EEE.
> 
> I suppose there's no way to disable EEE in the RX path while keeping it
> enabled in the TX path ?

Sadly not, sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
