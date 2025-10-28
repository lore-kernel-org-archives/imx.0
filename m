Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FE20297E
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 00:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613083; cv=none; b=dKHFKgV9eng1YYm719aXpxec0y1VOYYNRGuf8Wg80WOeTdvWirHft8L0tiLfuFlYlK0NModEa0ynFwNwLjDWN7PvAXSRtXCBnpA2PgjKJtlnMKbSBw2yJbKaaKIiccvvpwaNha5EWyxp1lmzGW/5kGvXchM8zT81EW0TZ0GeIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613083; c=relaxed/simple;
	bh=Pu5kqYu+8gpM71WXhfUOgdtRRnjxllEImtX1gx/QT1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OL5JTfMhFlhxHgP9gE6+Ed+149/jMLhmQuhidk3WmIPuqqrj5/AmiKmHNLhgctSiK8KT4Y2RaRpNj9LTeqtzhN2VbA5oYUFu4mwFUbc4odGCAy88Y18SAWGTBLuK9Dyvj+GZjEd+IRflSfm85kRV3aa6noumI2Ul8fEekGFr+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=DnK6ADmm; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="DnK6ADmm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=clpdrlOLu93rHtL/L9HiL9Is9OjufJxhxUPrU3Iy0XI=; b=DnK6ADmmspY4FAXcwDQ0Ysdv6z
	3S4CPo2pihH5GZTA/oVF2y5e34bRyMhblv53WeQELRwkUO2BT5BmjkopFJJqVTZxkBuTjDsmNoWXa
	6XPyCx0W3NSnUXXhnjbn+eZ7nLzC3iB7gQw9RFsMisCbk+om0sEEwp8A4bUacT7hTANRJoFNDfAAW
	+KjQqHc52E4TUodg2IqcIY1/cQ543DC8JYYgGT5fuySvCJFGxqVK3+VzqhYDJpjXGF5SYw8X8jlHp
	mp7PK+QbVNpLyXwif4OOcB3rHRfO7xpcd+7J7mOURBAHa3GZOsiCoIzMvOgzoSBslDz16MMQSadND
	JXrThypQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49596)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDY29-000000002YH-25XH;
	Tue, 28 Oct 2025 00:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDY27-0000000064p-3UG9;
	Tue, 28 Oct 2025 00:57:55 +0000
Date: Tue, 28 Oct 2025 00:57:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
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
Message-ID: <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027234648.GC24987@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Oct 28, 2025 at 01:46:48AM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 03:13:51PM +0000, Russell King (Oracle) wrote:
> > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > devices produces an interrupts storm. Disable EEE support to fix it.
> > 
> > We've finally got to the bottom of what's going on here. Please try
> > this patch (it's building locally, but will take some time because
> > I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
> > rebuild.) Thus, there may be compile bugs remaining.
> 
> I've applied it on top of 
> 
> I've started with a branch based on v6.18-rc3 plus "[PATCH net-next 0/5]
> net: stmmac: more cleanups" ([1]) and "[PATCH net-next v2 0/6] net: add
> phylink managed WoL and convert stmmac" ([2]) to make the patch apply
> cleanly.
> 
> [1] https://lore.kernel.org/all/aO_HIwT_YvxkDS8D@shell.armlinux.org.uk/
> [2] https://lore.kernel.org/all/aPnyW54J80h9DmhB@shell.armlinux.org.uk/
> 
> The base branch exhibits the interrupt storm issue. The patch
> unfortunately doesn't fix it.

So it's highly unlikely that your problem is the same as Emanuele's.

Do you know when the interrupt storm behaviour started? If not, I'd
suggest testing 6.13 and 6.14 as a starting point to see whether
the phylink-managed EEE conversion is involved.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
