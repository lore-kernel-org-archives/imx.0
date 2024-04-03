Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68D66D1A8
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129740; cv=none; b=n4y47OgRXkOqIQfMC54XakkvWWLs9QZn1aiVodUROUScOxSHof/iWLq4W79eLWCVcZbrFRQouS3NUjzG7YvtJzd1v3iNkrEt1ze5BAcwHHKMmZ/lRUNIoUQ9CnlXzprZ/BJsc8m9wSq8qYhpeVS/zt3m78b7Ytz5sD4paHXh1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129740; c=relaxed/simple;
	bh=kUuJoXklxwcVwYwh1KHqc0nVIfvCjiFCTE9UekJ4cYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IINMdr9HMcTkKQtBZApAWNeICMEObjADDiKAVU2lbl+pH+zuQhjopE5Rcw1cSQCO/BfBXYvmVTGf3zfwE5GCCOg79MRBirfDF4zEv6sbv8CsRYBOEZh6rHIBqXW+2joGGbXD4tmNC9SsFl5RDWenJvC0ar6OEPmwkJ5Qt4TK8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iIF4Aq58; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iIF4Aq58"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F19883A3;
	Wed,  3 Apr 2024 09:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712129699;
	bh=kUuJoXklxwcVwYwh1KHqc0nVIfvCjiFCTE9UekJ4cYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIF4Aq58HBl0RTO5peg/bN8ERJVlXfVrXuN8Uo81fvXk/u6uesH5p7gBoXk20+xsx
	 S4VA4T+OYQWbQuwXcsXdMY7elsjdcIHNiLgVPh0wBbWoVLxAW7wj2SJ1+COkU5JcTj
	 d9jFjOgb8tFAqtZ0/niXe+gje1Oa7CPjnrSDP3hU=
Date: Wed, 3 Apr 2024 10:35:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shawn Guo <shawnguo2@yeah.net>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone
 Maivin Starter Kit
Message-ID: <20240403073524.GK16740@pendragon.ideasonboard.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
 <ZgyjE05p/1NZnzaK@dragon>
 <20240403070651.GB5070@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403070651.GB5070@francesco-nb>

On Wed, Apr 03, 2024 at 09:06:51AM +0200, Francesco Dolcini wrote:
> Hello Laurent,
> 
> On Wed, Apr 03, 2024 at 08:30:11AM +0800, Shawn Guo wrote:
> > On Mon, Mar 25, 2024 at 10:32:45PM +0200, Laurent Pinchart wrote:
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> > > new file mode 100644
> > > index 000000000000..2d1c8e782465
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-maivin.dts
> > > @@ -0,0 +1,236 @@
> 
> [...]
> 
> > > +/* Verdin I2C_2_DSI */
> > > +&i2c2 {
> > > +	status = "okay";
> > > +
> > > +	clock-frequency = <400000>;
> > > +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > 
> > We usually end property list with 'status'.
> 
> This is now a written and explicit guideline, no longer tribal knowledge,
> see https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Thanks.

Any chance to teach checkpatch.pl (and/or the DT checker) about that ? :-)

-- 
Regards,

Laurent Pinchart
