Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D5248F73;
	Tue, 30 Dec 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091617; cv=none; b=Ieh0zZQYwX71ARoQVpt6Fh9kWV2TC6b4WPOv8itAgTq8lbCn4sYJ/qijrViFd+hQms/g7CQIhFMRBX/rgWnYf4W2tb695/Ow+Jq3chXSzs6/Vsn0bgXJ3GyGuoCYEu4UUJOU1M/4MY9bhwnFygaff8cgbyXWFJPIES/xhJHzBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091617; c=relaxed/simple;
	bh=XdtjgpQAgRDdjh2oZzm0in6AV/QXe+GroHwLTh8qWr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj/DLduauk0nXBsNMmS4eQ937krjf5JQUWnggCjclrmPFhflJ6p8IMTFM3UMLmVMhNtf2vnJ7crTPPaHh7WRC/4lI4MN2tfyRUD8QXdFN81gvE9P1sIDR0zH1h81rQD77PKx9Gtnn0rbm+wLHCTJwnVJK5255drTuLQ2SfEGKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PZTl4DwF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PZTl4DwF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aateUwJAsBS5ebefM0Zc7Bz+yjeqfX9VuoGySIleu9E=; b=PZTl4DwF3xaHNqfimFBTn4RXBA
	DkT3T/aWBGIF1MgWAaP11qTxSOxD0I0+IQRzQKSUSwWJL+lfdJHbhp4FSPoa/kW19siILDLIP2W/2
	pFve28IcEjalh5z3HMTU7ZyJa2/qV9V4swmuu/Ydy7Stw5Y8+56nU8Ab48r4pJLvQ+NE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaXFJ-000raV-5k; Tue, 30 Dec 2025 11:46:33 +0100
Date: Tue, 30 Dec 2025 11:46:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229193706.73564-4-marex@nabladev.com>

> +&fec1 {
> +	fsl,magic-packet;

Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.

WoL for a port connected to a switch? Have you tested this? Normally
you would have WoL on each port of the switch, and not on the conduit
interface.

> +&fec1 {
> +	fsl,magic-packet;

Have you tested WoL?

> +&fec1 {
> +	fsl,magic-packet;

WoL again?

	Andrew
