Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F85D29E
	for <imx@lists.linux.dev>; Wed, 24 Apr 2024 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949214; cv=none; b=pymWoQkhPM8kKxywRcS1li5QRZnY0LfgX5BHkX8yaEzvVa7aXouCfgQb+Kt7OrG6/wLd3LqPE/f4mY+7HtoB1T8QSo9caSmvf31nAqv4C5X5vaS78PIvnXwZfsHIdgqgVmcN2S6jwoY6VrbpmTthSJtLbTwAcMlwzEluAKgWXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949214; c=relaxed/simple;
	bh=qsf+RRnp5g+OnDLjpDsc5DoXxwNV0G0O90um6qiv6m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn66LV4yb9h5hId7z9WMJOSUkF+szBYywjT0Tp++SJj1V8yMIE0CIi/rjGhMmi+1FG1h7TZIO6ljajfOvM/AjD72YqK7Fkyx72gMsRHW8NSzEpKFMuubVu8iSEd5FNXmKy+3QEUH65/KeGtI2xr5UvKFGd+sJDaaNvabMv4tK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rzYTs-0008Pi-Ko; Wed, 24 Apr 2024 10:59:56 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rzYTr-00E2yV-Sd; Wed, 24 Apr 2024 10:59:55 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rzYTr-00BWz3-2Y;
	Wed, 24 Apr 2024 10:59:55 +0200
Date: Wed, 24 Apr 2024 10:59:55 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v4 1/1] arm64: dts: imx93-11x11-evk: add rtc
 PCF2131 support
Message-ID: <20240424085955.xsseqmzarh3uyfys@pengutronix.de>
References: <20240417031455.3177778-1-joy.zou@nxp.com>
 <20240417031455.3177778-2-joy.zou@nxp.com>
 <20240417045720.hk3y6m6roiqtuvfz@pengutronix.de>
 <AS4PR04MB9386FB10797C0AE8A19AA88BE1102@AS4PR04MB9386.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS4PR04MB9386FB10797C0AE8A19AA88BE1102@AS4PR04MB9386.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 24-04-24, Joy Zou wrote:
> 
> > -----Original Message-----
> > From: Marco Felsch <m.felsch@pengutronix.de>
> > Sent: 2024年4月17日 12:57
> > To: Joy Zou <joy.zou@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; Jacky Bai <ping.bai@nxp.com>;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
> > <linux-imx@nxp.com>; devicetree@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v4 1/1] arm64: dts: imx93-11x11-evk: add rtc
> > PCF2131 support
> > 
> > 
> > Hi Joy,
> > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > > b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > > index 07e85a30a25f..bc3c9271d747 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > > @@ -281,6 +281,23 @@ ldo5: LDO5 {
> > >       };
> > >  };
> > >
> > > +&lpi2c3 {
> > > +     #address-cells = <1>;
> > > +     #size-cells = <0>;
> > 
> > while reading your patch I also noticed that you had to specify these cells
> > here. It is very common to specify it within the base dtsi file imx93.dtsi. Can
> > you please provde an extra patch which adds this to the base dtsi followed by
> > this patch, which of course do need to specify it again.
> > 
> > Thanks you,
> >   Marco
> > 
> Thanks for your comments!
> Have checked the base dtsi file imx93.dtsi. The these cells already existed.

You're right, not sure why I didn't saw it in the first place.

> The current cells is same with the lpi2c3 node in imx93.dtsi. So should remove
> these cells in order to keep terse?

Yes please remove it.

Regards,
  Marco
