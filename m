Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35423183C;
	Fri, 16 Jan 2026 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576752; cv=none; b=PrRTRKl+Jp7paoFmSQMV4PVbGpp+c0M01hew7pifoqSMPMFTLEQKDT/IpMQWXvkaf8fwu6IM3EdR6SyyWvzHNBgp7PNJetgN6A7bDv5jJLabOhxEU3xIBXTncSMddywJ0zInmWqsoKcWd1uEZWuFbEephIXq5bGpH2M8OC/cijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576752; c=relaxed/simple;
	bh=/9O0R5rjmZujpMLlHrVPZtfNbDUyRW1NGw6vp9gE8YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfaZsws9EfuFbugoq+41qITZgtaoPei8IoF3xMNysvZJ2s2qgGC57mVtZe5SNVQ2Hjzk6cYdNWxRaWULyFS2g2bwHlMEquSnHST9wo9g3xJPd4noCrwp9YJA/lAegO5GZ5MRh7mBqL8NMd5jLK5RM7bi9+hO70M2qlmO+Kqyy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3OoSGdO7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3OoSGdO7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=4jzKf9K6CFuNeCcOT9ezQxETaHyJXF+75vK3fagkWV0=; b=3O
	oSGdO79FDY0Jzz/pb91kj6GNBfN+05zx4fjlyVR47VhJnOlnIrsnwt+SojRu3D1cZ5jcekwumRGKa
	OuzysH1W9Zg2tHLFsBOODK3bCKYcUGeKBtYTf7zfaeBpqwHEZAh/g8two2dzOgngWP+jOpmjOrhfC
	RTCY6l9Jl3djMpU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vglbJ-0035XQ-MB; Fri, 16 Jan 2026 16:19:01 +0100
Date: Fri, 16 Jan 2026 16:19:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org,
	neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>

On Fri, Jan 16, 2026 at 07:29:39PM +0800, Xu Yang wrote:
> On Thu, Jan 08, 2026 at 10:43:01AM -0500, Frank Li wrote:
> > On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > > The CR port is a simple 16-bit data/address parallel port that is
> > > provided for on-chip access to the control registers inside the
> > > USB 3.0 femtoPHY[1].
> > 
> > 
> > > While access to these registers is not required
> > > for normal PHY operation, this interface enables you to access
> > > some of the PHY’s diagnostic features during normal operation or
> > > to override some basic PHY control signals.
> > 
> > Simple said "Export these registers by debugfs to help PHY’s diagnostic."
> > should be enough
> 
> OK.
> 
> > 
> > >
> > > 3 debugfs files are created to read and write control registers,
> > > all use hexadecimal format:
> > > ctrl_reg_base: the register offset to write, or the start offset
> > >                to read.
> > > ctrl_reg_count: how many continuous registers to be read.
> > > ctrl_reg_value: read to show the continuous registers value from
> > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > >                 + ctrl_reg_count - 1, one line for one register.
> > >                 when write, override the register at ctrl_reg_base,
> > >                 one time can only change one 16bits register.
> > 
> > how many regs? how about create file regNNN,
> 
> >From 0x0 to 0x201F.

Rather than reinvent the wheel, could you use regmap?

https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546

Regmap should be able to provide a debugfs interface for you, no
driver code needed.

This will also help you with the abstraction between the core generic
part of the PHY driver and the SoC integration glue. You pass the
regmap to the core driver, and the funny muxing through two registers
is hidden away from the core. If the next SoC integrated uses plan
MMIO, that SoC glue driver can instantiate an MMIO regmap.

Using regmap is a good idea for core generic drivers which can be
integrated into SoCs in different ways. It hides the SoC details
behind a well known API.

      Andrew

