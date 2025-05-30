Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472B08834
	for <imx@lists.linux.dev>; Fri, 30 May 2025 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593764; cv=none; b=jSg6sihA38bOBI93tRXQTB+pmCKealf9ulKRN5LjXy6pamf8RsttEuwcdxtjkNVpt1IQNZus23ZA8UM74BLZjus5pwE5sz21n8lES0obWrh7o89Hg7R4EVBUnICaEXA0G9FlracTuNFgNf5UZlvee/Oxtc0URGUCs8mGSdbmh84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593764; c=relaxed/simple;
	bh=zsu+yDkMEzb2harqD8aE1FdD6Jqia+PNCFH57/7eA3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2ztesu48zTuPsUvDSnxZk2UyO7ENsEiyXFasvdttgQ6bEzJTVAgQRO/AMXI1ruHoKCVa38Be+qblzg7p6DS174oSGGJRsKblCbXEV4wKt4oTkFDgHTdY3BxN4/jCGi3sF1p8kxuBwMwgwpD2oMZbkVOoWrWGMjOjz12kKw1jsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv71-00076R-2j; Fri, 30 May 2025 10:29:11 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv70-000wlp-2I;
	Fri, 30 May 2025 10:29:10 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv70-000oiP-1q;
	Fri, 30 May 2025 10:29:10 +0200
Date: Fri, 30 May 2025 10:29:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Message-ID: <20250530082910.o5jg7s5ckbm6knms@pengutronix.de>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com>
 <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
 <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-05-30, Shengjiu Wang wrote:
> On Wed, May 28, 2025 at 4:37 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi,
> >
> > On 25-05-28, Shengjiu Wang wrote:
> > > Add WM8962 codec connected to SAI1 interface.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
> > >  1 file changed, 79 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > index ff6e9ac5477f..da08aaa95904 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> > >               enable-active-high;
> > >       };
> > >
> > > +     reg_audio_pwr: regulator-wm8962-pwr {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-max-microvolt = <3300000>;
> > > +             regulator-min-microvolt = <3300000>;
> > > +             regulator-name = "audio-pwr";
> > > +             gpio = <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > >       reserved-memory {
> > >               ranges;
> > >               #address-cells = <2>;
> > > @@ -50,6 +59,21 @@ linux,cma {
> > >               };
> > >       };
> > >
> > > +     sound-wm8962 {
> > > +             compatible = "fsl,imx-audio-wm8962";
> >
> > Out of curiosity did you considered making use of "audio-graph-card2"?
> >
> > The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
> > could be added via the "audio-graph-card2" as well. Don't get me wrong,
> > it's not wrong what you're doing here but making use of the generic
> > sound card would be nice because it's very common to just copy'n'paste
> > the audio integration from the corresponding evk.dts file.
> 
> Thanks for the suggestion.
> 
> WM8962 has a function .set_pll(), which hasn't been supported in
> audio-graph-card2.  so we still use fsl,imx-audio-wm8962.

Thanks for the explanation.

Regards,
  Marco
