Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18719F464;
	Tue, 15 Jul 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609246; cv=none; b=tnAXxlR9O+ozoovIiS/dRWOyKefw69rYVikiHTfK34gYitrUIYXE2MDb9GwRPdi5y121gnLzyf8r1ExHR2ERy5OtIvij1SEjvy+yo6ltYulCvy2wXAimcHwQ6Ckqw1xLA1p3ujDRM7gHzavEoRF+TE7vsaKIP7ToaRWCbt59nDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609246; c=relaxed/simple;
	bh=PffrbzQclI2RfRJLEDqJfXeDdnGsTFj67Fv5wf1WCBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUqNGwio8mMx9oDV6cFF4DO8LOSWKLWkI2S0srMyAaRR+oIf8rvk4zujd+CLKEYC0JYvGUd//98rpTV0laN7vWBpJCVCz73J6Vbrhfwu5boOBlAP8O7dIKCHo0hlBv2XlIQEmiM/DUfF3ayAhYl6a5qwSiz+kuamwMkBOC6FH8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwXzRXnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwXzRXnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9702C4CEE3;
	Tue, 15 Jul 2025 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752609245;
	bh=PffrbzQclI2RfRJLEDqJfXeDdnGsTFj67Fv5wf1WCBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwXzRXnYrwr+P0zGo7sETEYDwci+hBZNdMt7qouZgxN5K7UOgnJPKkTuALkYU3bnf
	 omItG7VZD+mQG9d0rOqphDVURMzAj+Hepqv5zUA7gY3Hwq+dkoeXmhZXtTBH0lvS6B
	 0gWAfErCYoWUbU0nIaRD0wM3Y8DeDBD9ZNgtT3dPcferAwBqP0y9cnPZRfWNuBK43r
	 8yXtDoJqk3rC0oK45izLlxHqJwGnLjiR7cLqyLYHC5QUyjBMDXFto2psp0dVFmTZrk
	 jcYoO0D6qvFO4upI18GaU369pQGwM2010/hJAG2rIIDC7g27fJ6xtE4jEhT3AD/D0Y
	 9Oko3mXvVx9jQ==
Date: Tue, 15 Jul 2025 14:54:04 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	inux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Compatible vs onnn,model at ap1302 binding
Message-ID: <20250715195404.GA1794419-robh@kernel.org>
References: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>
 <20250630183041.GA17697@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630183041.GA17697@pendragon.ideasonboard.com>

On Mon, Jun 30, 2025 at 09:30:41PM +0300, Laurent Pinchart wrote:
> Hi Frank,
> 
> On Mon, Jun 30, 2025 at 02:04:21PM -0400, Frank Li wrote:
> > Hi Rob:
> > 
> > There are long discussion about AP1302 support.
> > 
> > https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
> > previous thread
> > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > 
> > Let me summary the key points.
> 
> Thanks for the summary.
> 
> > AP1302 is I2C ISP processor, which can connect to some RAW sensors. such as
> > AR0144. AR0144 can work alone, a RFC upstreaming at
> > https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> > 
> > When AR0144 connect to AP1302, it is not 100% transparents for software,
> > It needs power supplies for it.
> > 
> > The basically there are two methods now.
> > 
> > Method 1 ( Laurent Pinchart purposed ):
> > 
> > use a vendor's specific property like model
> > 
> > camera@3c {
> >         compatible = "onnn,ap1302";
> >         ...
> >         sensors {
> >                 onnn,model = "onnn,ar0144";
> >                 ^^^^

Why is this outside the sensor node?

> >                 sensor@0 {
> >                         reg = <0>;
> >                         vdd-supply = <&mt6358_vcamd_reg>;
> >                         vaa-supply = <&mt6358_vcama1_reg>;
> >                         vddio-supply = <&reg_1p8v_ext>;
> >         ....
> > 
> > 
> > Method 2 ( suggested by Rob at 2021 ):
> > 
> > use compatible string:
> > 
> > camera@3c {
> >         compatible = "onnn,ap1302";
> >         ...
> >         ports {
> >                 port@0 {
> >                         compatible = "onnn,ar0144";
> >                         ^^^^
> >                         reg = <0>;
> >                         vaa-supply = <&vaa_regulator>;

Please don't hijack the graph binding (ports and port nodes). 

> > 
> >         ...
> > 
> > 
> >                Method 2                              Mathod 1
> > The same hardware should use the         There are not driver to match onnn,ar0144.
> > same binding regardless connect to       AR0144 is not visilable from host point.
> > which bus/devices
> > 
> >                                          compatible means software comaptible, but
> >                                          there are not driver for it at this case.
> > 
> > reg in difference spi/i2c also have      reg is i2c's address, but here is port or
> > difference means.                        sensor index.
> > 
> > Similar case for spi and i2c devices.    There are difference set of mandatory properties
> >                                          when connect to ISP or SoC.
> > 
> > 
> > Rob and Laurent Pinchart:
> > 
> >         Need a direction to move forwards!
> 
> There are two things to consider here. One is the DT property we want to
> use to identify the sensor model. It can be argued that the "compatible"
> property is widely used for this purpose. This is true, but the
> "compatible" property is meant to indicate compatibility from an
> operating system software point of view (regardless of which operating
> system is used). As a result, it serves as the central piece around
> which drivers are bound to devices, and therefore is also used to match
> DT schemas for the device.
> 
> What we need here is to identify the sensor model, first and foremost to
> load the corresponding AP1302 firmware, and to know which power supplies
> the AP1302 driver needs to control for the sensor. Note that it would be
> entirely feasible for the sensor power supplies to be connected to GPIOs
> of the AP1302 and entirely controlled by the AP1302 firmware, but on
> some designs those power supplies are connected to GPIOs of the main
> SoC, and therefore need to be controlled by the AP1302 driver.
> 
> While I think a custom property is better, I could live with
> "compatible" *iif* it does not imply at the corresponding DT schema for
> the sensor is pulled in. The DT binding for the sensor when controlled
> from the main SoC describe the properties of the sensor that are
> required for that use case, and those only overlap slightly with the
> properties of the sensor needed by the AP1302. Using "compatible" in
> such a case would in my opinion be misleading as it would imply
> compatibility with the sensor DT binding.

Why not a new compatible (e.g. onnn,ar0144-isp)? Seems to me there would 
be at least some overlap. If there are supplies, then the names should 
be the same, right?

If you really want onnn,model, then that's fine. Probably there's not 
enough different sensors for me to really care...

Rob
