Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553A22B8A9;
	Tue, 20 Jan 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915961; cv=none; b=rzEKNmopidUWLnKFGV6ntSd36QsskUTNvtnaI55F5z09PHYnQXCqJiqKULtoGttk2epBrjaMv/8w43ewwJTsDsyJ+n3pfyNYvUju25x1EOo9hUo6xY4yMhVGZ2eawwIRVfQGM7zpEAEatCCJkXeHKfsdcOaY76s56DaZRLZlYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915961; c=relaxed/simple;
	bh=WSKZekmlx692VhPEBfBoIELhTZmDgcRwkzrNkUes+uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACzei7W0GtBenTiOYX1Xs6wHdVMGPPW9xjVrIOIak1OWHXTsRCFCosQME0q1DHjZVFKl9CgO0RxnDfSyWLa6j6jEgvV8MWkXyy2BRxUQW6HixE9W4sPwArE60UukVbkcJmLfg6GlqgppNYP2xKJLoLx5fhqekxjpOZNcwArVjo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=J9vkQPaC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="J9vkQPaC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nk/jil5P9bd18lXGzo7iKVLteI4PK9x59aS/JMtc4go=; b=J9vkQPaCXohOKQwicpD9vyG5hZ
	0RSc6vxzfIcNiZd5vB75M42d1j9XHPwD8LcQPkXxJyAAyxtlTa6y3iJKfVo1gEH0MOENlVDXIZzLh
	7aU0YslQ3Ie7T9DAgiZahEolidw9rmhERlqFY1UZPb+KxkSsCwW6RRN4cQDDX7kslWJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viBqQ-003gLQ-8O; Tue, 20 Jan 2026 14:32:30 +0100
Date: Tue, 20 Jan 2026 14:32:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org,
	neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <06ae1272-9874-4ce7-9e4f-01d521a5f27f@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
 <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
 <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>

> > Rather than reinvent the wheel, could you use regmap?
> > 
> > https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546
> > 
> > Regmap should be able to provide a debugfs interface for you, no
> > driver code needed.
> > 
> > This will also help you with the abstraction between the core generic
> > part of the PHY driver and the SoC integration glue. You pass the
> > regmap to the core driver, and the funny muxing through two registers
> > is hidden away from the core. If the next SoC integrated uses plan
> > MMIO, that SoC glue driver can instantiate an MMIO regmap.
> > 
> > Using regmap is a good idea for core generic drivers which can be
> > integrated into SoCs in different ways. It hides the SoC details
> > behind a well known API.
> 
> Thanks for your suggestion.
> 
> Using regmap is generally a good fit for reusable driver and I aggre it
> helps abstract Soc-specific details.
> 
> However, the regmap defbugfs has its own limitations:
> 1. By default the register is read-only, add write operation require rebuild
>    the kernel which make it inconvenient to debug the issue on the spot.

That is somewhat deliberate. We don't want a nice API which can be
used for user space binary blob drivers. In networking, which is my
more normal area, we pretty much reject any sort of write interface,
other than official kernel APIs.

>    Refer to: "09c6ecd39410 regmap: Add support for writing to regmap registers
>               via debugfs"
> 
>     # ls /sys/kernel/debug/regmap/2-0050/ -l
>     total 0
>     -r-------- 1 root root 0 Jan 20 07:45 access
>     -r-------- 1 root root 0 Jan 20 07:45 name
>     -r-------- 1 root root 0 Jan 20 07:45 range
>     -r-------- 1 root root 0 Jan 20 07:45 registers
> 
> 2. It can't randomly read specific one register with common linux commands. Besides,
>    the read operation is inefficient especially when the range is a bit large because
>    when you cat the register it always read and output all the registers. 

You are debugging. Do you need efficient output?

If you have a specific debug tasks in mind, maybe you should be
thinking of an official kernel API? In the past, there has been
interest in getting SERDES eye information out of PHYs, and being able
to change the configuration parameters of the eye. Could a generic API
be added for that? Some of these PHYs also support pseudo random bit
sequence generators, and there has been interest in adding APIs for
configuring them.

	    Andrew
