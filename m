Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5C23BCFD;
	Mon, 27 Oct 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569427; cv=none; b=I0ukZ+xOK6tFVFC3ZgqjIvnswjfzo6vAZd110AROtUA25q2QxLesXzCbbZpmbZsdAZ6VapA4TkG54UO1RXUw0bjrQwVqQdL1+UWBClSXycc7QWPAui/ipvnP8tbXpGv9uO/BkoBUEtC0S2yV4FeeQ48j+10PhRdY7Jtd2TYoy/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569427; c=relaxed/simple;
	bh=m0IptN6d8/xSAvrYqsLrY528kDwnFNnoYBY5GhEv4lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCGUzU2nbf2js8QkSvjB+4XqspOikUBPUPbFR84WQWNynK8bmJyExRe/sXicPcJtsOSIwRXh5UGDO7+3mBFfra5h6a+dRg398B+sBXho65C4dY245iN/8y3jHmPun1b9aGMS7DGMbqCRgcW0rajUSNcZEXBPhNCNVMNIl7XcV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YMVoSKxV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YMVoSKxV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hKaaHV2NST1VuzXBfc6VQU/jhNrAzykCq1FQtjK/evA=; b=YMVoSKxVmOBII8dLdRmBG6fWwB
	AsarXFDeYQj4nAHcnPas0cq9acQUKIhXjC+Ln4PI8dOFWtDhahRYh9SJMrPaY0nypYfD1IQCuvz0U
	/ZZmbN26xi0kZWSbFyRrS3YepU4hTKr4HhwNSOA3qbkSz6QWVDiclQnAxK3fJdS8vGyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDMg1-00CBuN-58; Mon, 27 Oct 2025 13:50:21 +0100
Date: Mon, 27 Oct 2025 13:50:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
 <aP9NJHtbAEmsd89r@pengutronix.de>
 <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>

> > Ack. With comment in the code, why we prefer this way, in case some one
> > wont to spend time on making it work. Probably SmartEEE or some other
> > word should be used.
> 
> So we have options.
> 
> However, we need to get to the bottom of what caused the change of
> behaviour before we start throwing solutions at this.

It also seems like the PHY is FUBAR. If the standard 802.3 EEE
registers are being used, a management plane is using them to
negotiate EEE with the link partner, the PHY firmware should disable
SmartEEE and only provide 802.3 EEE.

It sounds like this PHY is not 802.3 compatible.

	Andrew
