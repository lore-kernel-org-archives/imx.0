Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810926B973;
	Thu, 28 May 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979322; cv=none; b=gCutEtlYcyinNe5/pLu29wGHYi8xhDbJsGanZwhfmLnOaiSCOnvTLQ47zybZehPD9XZEFmWmhLyBI2leR36kI8GD9DcMa3vLYnMh6PSGVLL8eGiXME4rDa3PFP7JiWscc26GBxbDp+0plU46Q733uqACFu/j6JBpmjkRgKkgs1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979322; c=relaxed/simple;
	bh=vu2PNBr6LzpDJ55bg12L3a5JmRwoCs0fCXThSdrtq7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxmLEKjsf9Jir6I9QmS9acOITG5g0eTWqz+MQFO5/Y9jy3b10uOQlUq9Upz671BybyyLU+8t55pjUWPSf17Fwf9rdSIlz+b5azvJgFeZHR1Znyc4px2f9GvOeo8zuISPwOWkoWj+B9vJqHBCZ86g5EyQO1Zsmn7NJfL1GfJHzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=V+DexVSx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="V+DexVSx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DMSgQFDN59OnpjSybTfSdSUQ8w7FM10W/DqXpKQK7Fs=; b=V+DexVSxdBVP2L4GwlIiZvG3/k
	IhZpDotv5a20dhf6BumLCEKwhQN43ZSG8w7xG134ZfI0H0iO+UDIaMWluVI46OZXf85m+/WWg6jh7
	jdUea2eFAD13fxJiCWFim+ZJrWv7KARaZeDqX+5x8WP+XhbO4dHgeXYXiShKO8sR+o8A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSbvl-004uk4-98; Thu, 28 May 2026 16:41:53 +0200
Date: Thu, 28 May 2026 16:41:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mark Brown <broonie@kernel.org>
Cc: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and
 driver_name support
Message-ID: <04994ebd-fb13-4d5e-8e1b-f93c504c88ae@lunn.ch>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
 <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
 <5314b232-9688-4f59-a57f-4cca044c9e44@sirena.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5314b232-9688-4f59-a57f-4cca044c9e44@sirena.org.uk>

On Thu, May 28, 2026 at 03:18:05PM +0100, Mark Brown wrote:
> On Thu, May 28, 2026 at 04:12:58PM +0200, Andrew Lunn wrote:
> > On Thu, May 28, 2026 at 11:07:22AM +0900, Chancel Liu wrote:
> 
> > > This series adds two features to the i.MX RPMSG ASoC card:
> > > 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
> > >    device tree property and use simple_util_init_jack() to
> > >    register a headphone jack with GPIO-based insertion detection.
> 
> > I'm not familiar with ASoC, but have been in a long discussion about
> > RPMSG and GPIO....
> 
> > I just want to confirm the GPIO you are talking about is a local GPIO?
> > You are not tunnelling the GPIO over RPMSG using some vendor protocol?
> 
> This is a GPIO accessed via gpiolib, the driver is for an audio
> subsystem accessed via rpmsg.

Great, thanks.

When we eventually get GPIO over RPMSG, it should also just look like
a standard gpiolib GPIO. But we are not there yet, defining the one
protocol that all vendors must use, rather than each vendor doing
their own thing.

  Andrew

