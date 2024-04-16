Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3112BF3E
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713273095; cv=none; b=HCOz8DoUmqI1THK2QMCejvWimV0qxmyCtDjIN3hILKRfK+jbseoL95cmP8YW8V1iTpGoAvo9nr1bwuGxjzkH5sr4qCMObGKU2cBqNoY+LhbnsbGPVJRJGeGCOIWh5vRDeC4mDeEC8R9QLn9yymAXXsRX/ZXrzukd/ZGe9xed+bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713273095; c=relaxed/simple;
	bh=FMud9HK4Txi9Iloc/q5Mve8zMEYyQTCHPEZjygPTd+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLZwWB5F5kfinLTZ3gBb0vsEGHNdfzXeATRjwCdDRoessJeg5lo8yqgYkYMRJcUedtjyfuWxIxDGVWVLQN7RLdMBKqT0C+CUkYgulUlb3ov/jWnUO/W0PiwvRCCrx6LsxIBe9rKUifm6RH5CrOT0Y2LOo6Ui19iyVLcqLKaiqhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiXHc8sK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiXHc8sK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a2474f2595so3666529a91.1
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713273090; x=1713877890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZPeQ9YwB2tF4++h7n2kgZp1SSqfxUcQvkgkrBvzhQQ=;
        b=UiXHc8sKLhmbxg5v525gAtbiGM3TPmwrtjt4gJuRdaEPO9CtQdMQRn19azDPP7M4U1
         gt84BbN8C2HPNDvi7sprUXIRCJrUljhWPBwDyufIzyxIEwRsYXmxxNbWCqOspIIMcnUZ
         5pja0C/G0//MwKXM61WrpI4eVUZjfKjPM16OSLqB6D+6jASXiYi+9wUs8gPAXlibxMm6
         QWMkHHG1X90wLgeB8MwMsrSDu0NDIMxLy47fP2UITw8qTd6FuuZjZbN1TfOdd2wzafYd
         LhCgpNWEgiq6btfj0WVxRySgN2ocG9gkRLg7S1xcN9/tD1mrQuYRxp+IT4XCYvQsnS1j
         XFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713273090; x=1713877890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZPeQ9YwB2tF4++h7n2kgZp1SSqfxUcQvkgkrBvzhQQ=;
        b=tpmwo5dAsoShrmf4Ie6wm2NM/aJ4mx7DrcpcRAhZlaYxL0qEWA+vfTeiJ9YDp+gmkJ
         cVfzvk1ZrvRHPAJTjMpSeagNlqESb16ttTjOlgdxEECTIUudF+XVHCA/2Xm7rdvzvkfi
         A8wGeN0ZWShUFbnwx7Htn2V8j0q1qD330eLEx7BDZiS7OEx3nry1bT4p6jwGh9XLUIuR
         VlZa1JhX18UpUlKxuR4H+4SEFnnwhYsHcZp3QpAQZjRN6i29ZOa0zt+07PPnKi7Qt6qq
         GIvNCiJhc53sQntByKLJjrDu527s45w3QE9uUImlR/GyUlUqWJBi0Luh1CSrrFu9h9dJ
         7EZg==
X-Forwarded-Encrypted: i=1; AJvYcCVhModUZ/o/KkR0ZGXcuH70dkyqb2QGWm8IxQhbxjOLIp0/OOr6PAjUFdmogxZdYHYCSJh2JUwKBkEhDm+3arU6QeiC
X-Gm-Message-State: AOJu0YxXwY0+KSQIZxkEHfygd/9uZFV0vyiEWaGzxBxRNSeRKXVncNA1
	Kxk6T+CsxfUc1geSztH8Dn7AaLQ8WDKtf2LCGFd1eewY3UW7sg9fyHJkKMyTHzLq0pZyJD2CXBY
	KrmYpEI0ZOd/MIFzALoz9hpGTchg=
X-Google-Smtp-Source: AGHT+IFzD1rh2qZ23AsZb3QVgRg8Tiuoux9ZgSgycHvDEg/8cqCQUPMy4CmD0O8wRUYekZwsbgGcvTdTzex4J9tnJv4=
X-Received: by 2002:a17:90b:3a8c:b0:2a6:ff2e:dce1 with SMTP id
 om12-20020a17090b3a8c00b002a6ff2edce1mr10060329pjb.10.1713273090238; Tue, 16
 Apr 2024 06:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405202243.46278-1-marex@denx.de> <CAHCN7xKX7v4tmhjvoPLirEoUG91jpu-8R2DV9eE=mnWt=3FffA@mail.gmail.com>
 <8c1935d1-7f59-4742-9659-bf87ac4b736c@denx.de> <5771435.DvuYhMxLoT@steina-w>
In-Reply-To: <5771435.DvuYhMxLoT@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 Apr 2024 08:11:18 -0500
Message-ID: <CAHCN7xLVhCWZZ5jaZTaxeA56dJkBEGY3cg_UYtWMZ=BGA-moOw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Align both CSI2 pixel clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 5:14=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi everyone,
>
> Am Samstag, 6. April 2024, 04:58:39 CEST schrieb Marek Vasut:
> > On 4/5/24 11:04 PM, Adam Ford wrote:
> > > On Fri, Apr 5, 2024 at 3:43=E2=80=AFPM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > >>
> > >> Hi Marek,
> > >>
> > >> (CC'ing Adam)
> > >>
> > >> Thank you for the patch.
> > >>
> > >> On Fri, Apr 05, 2024 at 10:22:26PM +0200, Marek Vasut wrote:
> > >>> Configure both CSI2 assigned-clock-rates the same way.
> > >>> There does not seem to be any reason for keeping the
> > >>> two CSI2 pixel clock set to different frequencies.
> > >>
> > >> There's an issue when using two cameras concurrently. This has been
> > >> discussed some time ago on the linux-media mailing list, see [1]. Ad=
am
> > >> knows more than I do on this topic.
> > >>
> > >> [1] https://lore.kernel.org/linux-media/CAHCN7x+kymRGO2kxvN2=3DzLiqR=
jfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com/
> > >>
> > >>> Signed-off-by: Marek Vasut <marex@denx.de>
> > >>> ---
> > >>> Cc: Conor Dooley <conor+dt@kernel.org>
> > >>> Cc: Fabio Estevam <festevam@gmail.com>
> > >>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>> Cc: Paul Elder <paul.elder@ideasonboard.com>
> > >>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > >>> Cc: Rob Herring <robh@kernel.org>
> > >>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > >>> Cc: Shawn Guo <shawnguo@kernel.org>
> > >>> Cc: devicetree@vger.kernel.org
> > >>> Cc: imx@lists.linux.dev
> > >>> Cc: linux-arm-kernel@lists.infradead.org
> > >>> ---
> > >>>   arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> > >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mp.dtsi
> > >>> index 1bb96e96639f2..2e9ce0c3a9815 100644
> > >>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > >>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > >>> @@ -1703,7 +1703,7 @@ mipi_csi_1: csi@32e50000 {
> > >>>                                                  <&clk IMX8MP_CLK_M=
EDIA_MIPI_PHY1_REF>;
> > >>>                                assigned-clock-parents =3D <&clk IMX=
8MP_SYS_PLL2_1000M>,
> > >>>                                                         <&clk IMX8M=
P_CLK_24M>;
> > >>> -                             assigned-clock-rates =3D <266000000>;
> > >>> +                             assigned-clock-rates =3D <500000000>;
> > >
> > > I am traveling, so I don't have the technical documents in front of
> > > me, but I beleive this is an over-drive speed, and 400MHz would be th=
e
> > > single clock, standard rate.  I created an imx8mm-overdrive and
> > > imx8mn-overdrive dtsi file to let users who operate in overdrive mode
> > > to update their clocks in one place.
> > >
> > > I also think this goes down if the user is running two cameras instea=
d
> > > of one.  I re-read the old thread, and it's coming back to me, but
> > > until I can get settled into my hotel in Germany, I won't have time t=
o
> > > review.  I think the original idea was to use the lowest, conservativ=
e
> > > value with the idea that people can tweak their clock settings if
> > > they're only running one and if they are running in over-drive mode.
> >
> > MX8MPCEC does indeed read 400 MHz regular, 500 MHz overdrive.
> >
> > Shall we align both CSI2 ports to 400 MHz ? Currently they are one 500
> > MHz and the other 266 MHz .
>
> No, that won't do. The (industrial products) datasheet says (Table 1):
> * Single camera on CSI1: 400/500 MHz in normal/overdrive mode
> * Single camera on CSI2: 277 MHz
> * Dual camera on CSI1 & CSI2: 266 MHz
>
> Assuming you need CSI2 more likely in a dual camera setup only, defaultin=
g to
> 266MHz seems sensible to me.

I agree.  I think that at a minimum, the 500MHz clock should be
reduced to 400MHz since 500MHz requires overdrive mode, but the safest
clock rate would be to set both to 266MHz.  Would it be appropriate to
add a note to the device tree indicating that a single camera
operating mode could potentially increase this to 400/500 depending on
overdrive mode?

adam

>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
