Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77529898B;
	Tue, 17 Feb 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354453; cv=none; b=LLtxCK4yfBdkEy0BDKIPlWCdJ8sfn0e6kiKv0GgZYnM2hNiBvqwiNG8ADf6/X2+T1JDx87FtG7Kluh6U8iANl9m2gH/qjwnd+gsMp0VxjV4ud/lmk9k9DINW758vJojz7FiJM5R/kHDE2kDmBDCxwU+r+g4yv1uTDXVl+8DfxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354453; c=relaxed/simple;
	bh=ZZFx9IrxTykvO3FcVi9xoco9XQ48BQxm0P84qZVpw2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rd7r9nCk5I8a46TZ5oAt1tmltv0WXYzneUeIWs1paHsfgdT0HFb+u4jCzO+/9YfNvgWrlXA9FLaI0a4oeSRa2upvOILwpz8Oyk6U9vbQZG0NK7rAFqyx1+KB6uLDZyrDvyPs+qbHsgyXD3fRQz90Oif2M7DVSEwwhoRESlg68zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=An7RiBtN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="An7RiBtN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+VxzOjhbLsYYL+mX2QcCnQ5Ia3ry4vUbtIAtS9YChfk=; b=An7RiBtNMniRbnZjW1ozMaROrb
	Yk7/rgoAprwkj2GjLFeggqnLgIeaQrGYGcIfuysxJ5GmDgZ5MGz5i4RYnQ+kJC23cPK06GnaSb1UR
	BtN3ItcPEDweMfzifGbNlxrm1BDPX9B/PjPlcCRLrzdTKS/WRt743rmohN+4YN9+eYCQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsQD2-007gDd-Vg; Tue, 17 Feb 2026 19:54:08 +0100
Date: Tue, 17 Feb 2026 19:54:08 +0100
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
Message-ID: <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>

On Tue, Feb 17, 2026 at 07:42:37PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
> latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

I don't think you say this explicitly anywhere, so i will ask. The PHY
is on the SOM? The carrier just has magnetics and the RJ45?

>   Two LEDs are defined to match the VAR-SOM carrier design:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.

Where are the LEDs? You say "carrier design", so are they on the
carrier? The DT properties should then be in the .dts file for the
carrier.

	Andrew
