Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8849482C
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531763; cv=none; b=q8V00aMf87klnV6v83eAF1Bo3IXnYxZV19RNASERUI8jtmfXDrW7GfrjD/257dWEmYTRa3B8IXfnsXTpr7ifpuI+YfDKFEJcFYatEnNqBtGjiFYa297MjZq6U17LVHsQl4boKEqBM8OEDwcM+/euuIWxaQPrQcHnX+ls7pmiRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531763; c=relaxed/simple;
	bh=maWBdJuLYCyT6JcoAf1a+wUeBnVCyx7cYqPorvDgB7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duM44d+dfqJQb3REI3TrOTf9PJjANq1rRkuWI6xeyHNlSfhSHcOLY0W+fDycodjdtxr54dKdQB5zuMDvkuwHd4ql/rFaADR3hPZr0zwrbe1mGho7UPoY4CwRNgcIi1V35jce7zqj5zwibXADau9abQiqwT7vPt8RRJ1Q0C/h/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k9sOpBn/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9sOpBn/"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CE05177;
	Fri,  4 Sep 2026 16:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788531667;
	bh=maWBdJuLYCyT6JcoAf1a+wUeBnVCyx7cYqPorvDgB7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9sOpBn/IOAIrlAhZ7k6LdxZAA7KM4Sdu0/b3RlbuB1QFrxrOtVjPYP772r/52GrO
	 w0+BwCGi+S1Z2ti7bAvtb7r/CS43hR+nhoXrUNurzaq2mLn9sPyGqGRphux/K/aRtB
	 rZoJcA5xD/0zmn/rMokATeOSkh029J2JsegKJRXI=
Date: Fri, 4 Sep 2026 17:22:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <20260904142238.GB795906@killaraus.ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
 <20260810190800.GA3046075@killaraus.ideasonboard.com>
 <antS9HruNMrGbZIc@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <antS9HruNMrGbZIc@SMW015318>

Hi Frank,

On Tue, Aug 11, 2026 at 11:51:00AM -0500, Frank Li wrote:
> On Mon, Aug 10, 2026 at 10:08:00PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> > > On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > > > The clock-frequency for camera sensors has been deprecated in favour of
> > > > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > > > the device tree.
> > >
> > > Remove "clock-frequency" may break back compatiblity.
> > >
> > > A similar case
> > > https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > >
> > > Need provide judgement in commit message about impact of break ABI.
> >
> > What ABI breakage ? The latest kernel supports the updated bindings
> > (merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
> > clock-frequency property for camera sensors") in v6.18).
> 
> Dts now not only use by kenrel. such as uboot may use the same dts file.
> 
> uboot may still use "clock-frequency". but uboot unlikely use camera. for
> this case, just need mention at commit message
> 
> "lock-frequency property for camera sensor have deprecated since
>  ("dt-bindings: media: Deprecate  clock-frequency property for camera
>  sensors") in v6.18, no known other user like (uboot) use it. So drop
> it safely"

How about the following ?

----
The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties since commit
aa1826696a55 ("dt-bindings: media: Deprecate clock-frequency property
for camera sensors") in v6.18. The Linux kernel ov5645 driver has been
handling the deprecated property as optional since the same kernel
version.

Replace the property in the device tree. There are no known users of the
property outside of the Linux kernel. In particular, U-Boot doesn't
operate the camera. Switching to the new bindings will therefore not
introduce any breakage.
----

If that's fine with you, can you please update the commit message when
taking the patch ?

> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v1:
> > > >
> > > > - Drop added blank line
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > index ca4cb986efbc..0cc05d084f9b 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > @@ -233,7 +233,9 @@ camera@3c {
> > > >  		pinctrl-0 = <&pinctrl_ov5645>;
> > > >  		reg = <0x3c>;
> > > >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > -		clock-frequency = <24000000>;
> > > > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > +		assigned-clock-rates = <24000000>;
> > > > +
> > > >  		vdddo-supply = <&reg_1p8v>;
> > > >  		vdda-supply = <&reg_2p8v>;
> > > >  		vddd-supply = <&reg_1p5v>;

-- 
Regards,

Laurent Pinchart
