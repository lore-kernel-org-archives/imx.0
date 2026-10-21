Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607839;
	b=asZdRKaNawRLuA9UgHn6zC4BIrP3DxYt89OYKtGOuVQPgXJ3xFplSRQMh810bZiS4U/R
	 fLPcI+nc82ZHSN7MGJsTLQdkxJahuHo+I/kCi0suOBn0Wza5m12JsRTJnKK2jp7NgK1Px
	 poMxNQPLReyvjRRNGiBAYmOsMiqIqhLqDFaMTwvza+656T+Hj6ZzAST48Ovw+t6rYaz+/
	 hokHhYxQLuP9MJN+pTWk9HrH6uzVhjMSDAO+8m9wnurqkHlE3dnoTa30hisftkVvHTaiw
	 B/c+4+MCr989n9iPoXzGDP6mGUOSysX3ddjv5QYrvtVgIIlET0NL2gEOfQDmRK4n6xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607839;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=;
	b=OvSZ8sk+ez4kexSWD7AHJpNIghkTSrkTCeyDN5tc0v33zeV+MBs3k68T9ld6wVhzu31q
	 +7oUT0a3rmbM2SqwdlnEUMuleNYSZuzi30T0HJx6ZL2IcHDRpjUlxsDkB0O/y4CYyGgl3
	 mVOnjeq7jO88C/skLl9et1qwxG62lGR9tl4VZbn6ViQ0sOYzNYw0Gy7SjQSW7yd/ZG9zM
	 Zw5CKRWD5B7Oe23qsiWy9XKzIYQW/MIMw+KTdHjxqFMpM7iHs/KT8d3JobcmwDrOBsznW
	 jVjAmBi2NxmGoPeVE0ZiRbm0qfsebEzcdR6CcbZ794CCfRSHWRF9pKIpKsufV0IbW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=geMMPvYn;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3EC606A31B
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 18:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=geMMPvYn
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 53DB71F8D1;
	Wed, 21 Oct 2026 20:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792607828;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=; h=From:To:Subject;
	b=geMMPvYngn0H4t28uKQQEecN1/bxf/dEtIJlow+C9lQm8GCeyim4/IfbzBP+hpQ89
	 noFQLdGDpaJmieI9uLkXIDit3R04DVO0Fm/2vp8hGaOvThka/Quph19vyqJwNc7rvi
	 dTV6h2n5uercGurux+uTywbRlkWjg6utsUQUdewxUtuKHni/7vVaUgQjYfO4o471uI
	 U+ihLq60RIGZk3Uix3woeN5D0kqGdTa5L5A3WofQCbRe90DF2Zfgc8q2LwZJpY5GMF
	 Jri72b7y0wZVJOWqPG6/Q4DtzbklPbMip9+mN+BUYUxXkX3iyVZLcr+OJN3ZYblZDq
	 Eb3doXU8uNgHg==
Date: Wed, 21 Oct 2026 20:37:04 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@nabladev.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261021183704.GA1116319@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>

On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
> > On the maveo box, the SPI pins are connected to connector X10,
> > but no device is connected. The device "dhcom-board" was used
> > only to test the hardware, but was not removed afterward. So
> > remove this device to accurately represent the current hardware
> > configuration here.
> > 
> > Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > ---
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Marek Vasut <marex@nabladev.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: kernel@dh-electronics.com
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > index 047f7b2d8526..eb0b91040110 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > @@ -60,14 +60,6 @@ &ecspi4 {
> >   	pinctrl-0 = <&pinctrl_ecspi4>;
> >   	pinctrl-names = "default";
> >   	status = "okay";
> 
> Drop "status = "okay"" too , since this controller will be unused ?

you can instantiate a new device on the SPI bus from userspace. up to
you, but if I was a user I would appreciate to have it enabled.

Francesco

