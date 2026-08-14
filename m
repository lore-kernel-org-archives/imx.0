Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC3414A2F;
	Fri, 14 Aug 2026 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692484; cv=none; b=IySe5IQ73nk5ggY95SiahKZ9L/N9MdtI07CyXzoJeq2uxxFop6wZNK/AQGBQvTwmMkhK5zv9+3oq3CDNEJodmR7HKyvPmNHJfAgQSxhRATRYbrkkFzhC+qm2aj/1RuzFJOd2mUqJGy9snd3O0so2B9nILNPEm7TDQ2AkNibCjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692484; c=relaxed/simple;
	bh=1xHew+fT+N2yBDid+AaG8M+YjglFr6Mdyc1l2D4X7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyrlNlyZ4hgShRWgFduAZ/GUfnUjDF4hw06VTGi74OPMMJkP2Cxd7Ht29PJerrHmJuw43jBR0C/VYTV1DRSYqr+by6p/nbtfLc3RyeXx+OXVoyvYYR+1twSSseg1HO9OVO1y7h7Az6pcPpbhcg0cl3nxp0JxfmOLk9Kn7c0y9Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy8Xe91b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy8Xe91b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1741F000E9;
	Fri, 14 Aug 2026 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692474;
	bh=fLzxgQunLn3rTDnZhCwKBAHKrSDwRymxoZHim98a9WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qy8Xe91buoX7ocsf4E+E5gn8kT1wTwvYKYLm4lGfeDhamN/un+PO/+MtmLqXgBhaz
	 3qGAtS8xYbggsM3Pt4lx8dciyZ21YuUQpcy0q0Za8xcoEtAelOMGNQWg/n+niA1EyY
	 /LHoEvQFv+upPL+ygjQk0btCnKCSS+tzX0SkWRJUdeIDfI5Q+BdIwzCyKUhmMCMXHL
	 0k/n7JDQmUM1Ma1qthrgM9jx5CGkAYqG3aczByIa/QaY2iOFOrT+5xgd1HEyzV3aOE
	 G4711+8IoSLg9EXTgbH8G3YGeN3TYML4kmdlmTJjtEX5av0RpgjgzudrAtoF2RY9tt
	 Pn7cd39oY8hcA==
Date: Fri, 14 Aug 2026 09:27:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260814-indefinable-grateful-buzzard-4eefbc@quoll>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
 <20260813161101.2274327-5-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813161101.2274327-5-mehmet.fide@gmail.com>

On Thu, Aug 13, 2026 at 06:11:01PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Iris is a small off-the-shelf carrier board for the Colibri
> family. Describe what the board itself provides: Ethernet, one USB
> host and one OTG port, the pin header UARTs, i2c with the carrier
> RTC on it, the PWM pins on the X16 header, SPI and the microSD slot.
> The host port gets its VBUS through a regulator on SODIMM 129, and
> the two GPIOs that turn the RS232 transceivers on, SODIMM 102 and
> 104, are hogged. The touchscreen is an add-on rather than part of
> the board, so it is left out.
> 
> This describes an Iris V1.1. A V2.0 carries the same signals on the
> same pins; what it adds, and what this does not describe, is the
> regulator on SODIMM 100 that can cut power to the uSD slot.
> 
> Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at

Since you booted now on v7.2, drop the version description.

> 100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
> place, the RTC read back over i2c0, all three UARTs, the SPI
> controller registering, both PWM chips registering, the microSD
> slot, the EXT_IO pin group still applied next to the carrier hog
> group, and both hogs holding their pins.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
>  arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
>  .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
>  .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++

Good old ScreeningEagle/Proceq times, had a lot of fun with this tiny
tiny board and module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

