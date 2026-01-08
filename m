Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F1313E10;
	Thu,  8 Jan 2026 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883645; cv=none; b=bpH8Sq3mnZme4EVuIvbpA5i6Ktissv+dZG/3qqdMIvHr6iOAM8rJWe8c/RT8BdVkdwKdkDZ4ah3Vuo86YTBo2vBk8ztL56UjyxX0wvjGtft3gn/yRR50vZ/vN6pMLJ1ZhL0TRdWAMKrGPp7vxjxPKeCqGeoeM5ceJpS9omftqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883645; c=relaxed/simple;
	bh=QDj46AvwFdmTlI/GYuUrrkI75UJ0Kd5b5REsXQXybOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8y10NCGMLw+nGF1mjA5Zh9dWDM9DBU6HqlQMQPpmQS0Csvrjj1/Yklr6zUe5ndPT/jxQiHN1b4Mb7DfjtHNmk/z2wZQcp7+9PHWbpeRnIYfrx4F0eocBa+D9U0BbiiS4LCgyiOmU9IHKAAmsUJ43g0eu3UjSGPsaTpheXo1tVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=flHdKeHc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="flHdKeHc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=nQUgsMQ5jvqItU8dCXxHEIGvMiHPPcibzrzgNYGiwJA=; b=fl
	HdKeHc0+XcPmpYUEA9fz7MduvxbadrOiIM5W5YDw2ab0FTSZgcJKREVD5H9GVO3/BkalG5jbYY5UC
	GCA27pJO/z3SsJ2leu9Qri705bymstZGiOkGCMI6rOobH/5pgtdudcczgy6GIlz4zH1mFt8ZdUVek
	+zlwn+btNPNdrLE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdrID-001xo9-1h; Thu, 08 Jan 2026 15:47:17 +0100
Date: Thu, 8 Jan 2026 15:47:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <0b61c962-9aa1-4275-a40a-220f6d7f1210@lunn.ch>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
 <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
 <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>

On Thu, Jan 08, 2026 at 04:22:24PM +0800, Xu Yang wrote:
> On Wed, Dec 24, 2025 at 02:51:11PM +0100, Andrew Lunn wrote:
> > On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> > > The CR port is a simple 16-bit data/address parallel port that is
> > > provided for on-chip access to the control registers inside the
> > > USB 3.0 femtoPHY. While access to these registers is not required
> > > for normal PHY operation, this interface enables you to access
> > > some of the PHY’s diagnostic features during normal operation or
> > > to override some basic PHY control signals.
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
> > Are the registers openly documented somewhere? Could you include a
> > link in the commit message.
> 
> We integrate a SNPS PHY in Soc. So the registers are documented
> in SNPS doc. Anyway, I can add a link for reference.

Humm, so the registers are defined by a Synopsys databook?

Shouldn't this patch be split into two? The access mechanism to the
registers is specific to the imx8mq. But the registers themselves
should be part of the generic SNPS PHY driver which should be shared
by all devices using this licensed IP?

I should say, generic PHY is not my usual subsystem. But i've seen the
mess chip vendors make with licensed Synopsys Ethernet drivers, lots
of blind copy/paste, no real thought about what is generic to the IP
and what is specific to the SoC integration, and what can be shared
between different SoC integration's, etc. I just want to make sure the
same issues are not being repeated here.

	Andrew
