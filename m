Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77352E613B
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564161; cv=none; b=XWejVUJiwA99YLSQ9nnYAe0Ohs71szEv7hKNek3RJnYtRjT4NL8D/lHeiIXbVpkHShnL3J2G1bWxt7PZ9DmWxQVaxvaYvu91qZJUAX67MAxvUvbzs3kJ9IjT3iic7wf02ab1ZDDsKsSNmwql069gKHtA2Fl1kPSeCCmu1M5J7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564161; c=relaxed/simple;
	bh=5nj6uvg21fnZ5JPC8KKJWuYSYbG5S54UifaAttUkc0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPvN7imeZTO/Gwv5ejeO7IbEQFwanuBlu998hYqgYIWpz+HJNHBkr+ynRkI1RR6Y8EI+i/KxnToOBfW+Uib8j8Q6gZ5YdOh9D514LiCjxAM4qaRnEHvZDok7R/CXmk6dS3Drrq2EQiwoOEyhg9LPnnQAvNWNMEVJSsjdLsSAT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OQbvNXOg; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OQbvNXOg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hgddpgXXdpWRrOCO4kQaM3CnBjKkRhnDW13T+vqMRLM=; b=OQbvNXOgYgjq3OEgqECQuxj/rU
	Gd0YDsGDJu2bW1LKLAs1bG1BF0SymVgBxcwV4WY8J9GTGfjELv/Vvz4Vz8KuBVTU2/peQC5gjWgQ9
	DeDh6hiWz4CnAnH2WdGDyCoLFzFdjDRs33CldLJmuA1D63ywul7e4M7sNjIGWAZT0jZGF2RrzgIzC
	S6wKx4jgg4D/5gT2AV6nURlldDThPwr2VKhAcLviUB9PVYvtSfnec+K10fo6NoYZsc67zVB7JeUC2
	n3sEthjKkS7kGsapk5fTCxMjkL1x9DF7qEtc7BHSEelek9I2Ptk6qQAsFPTiuTPfvLs7eFFVxN+QJ
	PbdL5Hzw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35864)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDLJ6-000000001jm-3RHy;
	Mon, 27 Oct 2025 11:22:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDLJ5-000000005Xs-0wS5;
	Mon, 27 Oct 2025 11:22:35 +0000
Date: Mon, 27 Oct 2025 11:22:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
Message-ID: <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027072749.GA7811@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> I've tried to diagnose the issue by adding interrupt counters to
> dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> interrupts storm, increasing at around 10k per second. However, the
> corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.

I'll add to my comments earlier, because it may help you work out
what's going on.

RGSMIIS will be set when the LNKSTS bit (bit 19) of 0xf8 changes
state. RGSMIIS is only cleared by reading this register. So, something
else to test would be to do a dummy read of this register and see
whether the interrupt storm still has the RGSMIIS bit set.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
