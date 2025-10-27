Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D276134BD
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556058; cv=none; b=kySIed7/LawJQapAXDu6L8fl8GGaFR1raVBZp/gsznA3JI221Ch8UdWOYmh36XjzBaZsxjTgIhVBgm1VxGcMOCF6PeaA6+CNJGqqQW4fYwfGo2h7SQSCjT3IN5GgWX4/EVCWXXbrzg9W/fT/4QnLueDkm6ME0tLNbYxaQW3Xsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556058; c=relaxed/simple;
	bh=DD87kObRuwfJeWGR3dmVb48UnqIvfVXFSpj/QHLUVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BggKhgbJr8OTLFYhaYo6HSoDzwuCEaD8iG8zHv3cqF0V4nHmBrU02oz52nnQxDT7gYYkmzJQPXG/TDIWrv6SsBsekWgnQpVb2jrykeXXDiUGr8WcXjMk2W8wQE9EcS9UysKeWwzJbJx6ErAueOfVoYdrqE5MryOnL8x1gbpZZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XJ6LgvaA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XJ6LgvaA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQKAFumxB6z8ZgppllACAzOPSvDS5er1n2d0F4pV3cI=; b=XJ6LgvaAoGvEQFO+fz2IgNqtVA
	sUt0PMRw6xIHPbE62n1KXQQwZqJa47/yiLoDMa+ykAnV1CuoECCEmM0jVsOzQAvYva9jCDU3l2nI/
	erP7cY26QjO/q9lUZPGk3yKnMHvYVrctTJKy1OOgX2s5J0FSiUUVYovwWo0EXObwRg6+gI5n7yEyn
	TxmWvADoHuSgCTqD+AAOk+YYMqEys92M0xXVnQJTkVfNWDgk4mkveP+QRuTKfJ2EfpiYG9++tAX6g
	P+dbZJI+bgYxkTu7bYvUGPlX6Uuw5buzuonoA2iXoNDpHYYPVybPJQLWuqViwb+ef4/yLET4iZS08
	S2ehhSKQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDJCQ-000000001Xm-15CY;
	Mon, 27 Oct 2025 09:07:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDJCO-000000005Rv-3QXY;
	Mon, 27 Oct 2025 09:07:32 +0000
Date: Mon, 27 Oct 2025 09:07:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.

As this is the second problem that has been reported recently, please
bisect the conversion of stmmac to phylink managed EEE support and see
whether there is anything in that which is causing this.

Please also confirm that EEE was enabled (as soon through ethtool)
prior to stmmac's conversion (I believe it was due to this code that
was present in stmmac_init_phy():

-               if (priv->dma_cap.eee)
-                       phy_support_eee(phydev);
-
                ret = phylink_connect_phy(priv->phylink, phydev);

> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet. What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense), so disabling EEE is the only viable option.
> 
> This patch is likely a workaround, but it fixes ethernet usage on the
> board, so it's in my opinion worth being merged. If someone with better
> knowledge of EEE and DWMAC, as well as an interest in getting it working
> properly on the Debix board, wants to submit additional patches to drop
> eee-broken-1000t, I will be happy to test them.

The changes to stmmac have been tested on nVidia Jetson Xavier NX,
which uses RGMII with dwmac4 and a RTL8211F PHY, connected to a Netgear
GS108 switch. It seems to be the same that your board is using similar.

I will re-test today.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
