Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0130320CD9;
	Tue, 17 Feb 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361002; cv=none; b=l7x+Ysf+SWzDXfNxiKT+wQ4lOfaSjiHqcJxjamcyaMP3V7qIg0uuNFHGLwuOra6yCn7Si8CELfQiog33E/akj46jyjWhNTDVyDdP3y+N239zGmkngiL1TFmCWtAE0kOryKbvKP27YDZ+dj5H9GuiBgMrvmfq9MMd2Z9oTRZQ+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361002; c=relaxed/simple;
	bh=xaNCkDVtXSVSu+DM8ddQ+7wjR8XHf3WU4okD6GFRVsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RA/Cjt6fbWzC3C3UAM+f2T26bQ6fjTMPo2nS2ZfGT/6mDUTzBblAo80lxF9Z9dWG+Vo1yIqAuovs47CTQdF/76OrQ7X88WMwRiJAJkb6uDpEh6ny2HYQZ0j+cHH8/eb7VyaNyBalqysSbD8oRyYojxgf/fRSrqCsPGrLjnPsK5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=i+51ALd7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="i+51ALd7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wlg17Kj/wYC+KcEPPN4TByd+mHs/UERfyc2emJHo0cc=; b=i+51ALd7gisJbAn50Bu8vXVC2/
	6y0UR/QhvSBWqdN5tqTwjnWh5VLwllXxHc1VMKEV2+7QaixWChmNc11D8uLCRe3d5pnlvoktWIiBO
	Bhjo6abQHteJe+8zpmGcNFYmWALs3T6RDzSXKCs80cQ5wTIbAq3kp/DdZl3Uqx00rfu8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsRue-007geQ-Nf; Tue, 17 Feb 2026 21:43:16 +0100
Date: Tue, 17 Feb 2026 21:43:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZTCGH1rKWdvYg5-@Lord-Beerus.station>

On Tue, Feb 17, 2026 at 08:31:36PM +0100, Stefano Radaelli wrote:
> Hi Andrew!
> > 
> > I don't think you say this explicitly anywhere, so i will ask. The PHY
> > is on the SOM? The carrier just has magnetics and the RJ45?
> 
> Yes, the Ethernet PHY (MXL86110) is physically mounted on the VAR-SOM.

O.K. so far.

> All RGMII signals, MDIO and the LED outputs are routed to the SOM
> board-to-board connector. The carrier board only provides the magnetics
> and the RJ45 connector.

And here you loose me. RGMII is between the MAC and the PHY. The PHY
is on the SOM, so there is no need for RGMII to leave the SOM.

MDIO is can understand going to the carrier, because there can be
other devices on the bus, such as an Ethernet switch.

You say the LEDs are not on the SOM. So they should not be listed in
the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
without LEDs. The colours will depend on the RJ45 socket. It could be
a single LED is connected to the front panel, which is typical of STB
etc. So the LEDs are a board property, not a SOM property.

> > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > >     * LED@0: Yellow, netdev trigger.
> > >     * LED@1: Green, netdev trigger.
> > 
> > Where are the LEDs? You say "carrier design", so are they on the
> > carrier? The DT properties should then be in the .dts file for the
> > carrier.
> >
> 
> The LED signals are driven directly by the PHY and originate on the SOM.
> They are exposed on the SOM connector and are typically routed straight
> to the RJ45 integrated LEDs on the carrier.

The problem here is 'typically', not absolutely required, otherwise
the magic smoke will escape making the box useless.

	Andrew
