Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A313AA55
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041933; cv=none; b=dryNSqS9KudIqRFB2tr5fdA/BPJaKNafWSNXGhCwsFcZXkm/H0sTBJV5Za6W5hJl9Rj60Fg72uzpUuAImC3cID7wBC1UEwLNz3e/EJb830vVRm74ngY1TAbzN4Zs+pBuBCqeyAUtHihNBTshYBQDWkqqU69dq+jdNcJ4GnDIiCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041933; c=relaxed/simple;
	bh=8uZ65RdBRrZVQLt3Jfa2DywrGVNgAqJJKx5brrMyuuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjPZTeJPKZ6qV2fMc2YGHbeBCuKiJOAJCSnLuLZyYf3MB/dA5iZK23gHvjFb2N+I01gWaY7xSqioRpvYnaxGL5It7/cjFRMSCsEWpVzB3ja3Lc/G8HjUdmdBj0NUfJtDnr71w+Uq1WLUUUnoxBbL3GXj6HN7AdZoTDaSHYnp6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2ywKVnX; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2ywKVnX"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3650196a12.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709041930; x=1709646730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIVyIgwTLXzwUXutxuVhEBa2JRV+KMFUyJvpPIJLlDo=;
        b=T2ywKVnXvstFAPS5pQzECHHKGZZ2xnbeWW6Byn1Zna8Qf/mDm0/axmpeBoFWeg5ioJ
         heN6dSA4/+tKm1IkQH7LcQ9aROGi7tgJdD2ipnGdQuDQ1ZQj0O035N5uFU9Mp4VBR0xm
         fNTX0rMIFuNclCetZRmE+JR7wLNs0YRcsLl51TyJ+LIldEd6dMap7kMsxFgcI+5HMlbZ
         Egb2KgQpKfPOTEsMyQ3V12+UsLOnRTdjr6o7inbNb5UgfAEEtRqQTGQLU1OZOZ/qrRWI
         WwlGpYR/D6SBPSWcdXFx4tINm7pl/QzHAIJ+bjA2CB234TI8BFLa1Lzs7yP9Sgu5yd2x
         gj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041930; x=1709646730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIVyIgwTLXzwUXutxuVhEBa2JRV+KMFUyJvpPIJLlDo=;
        b=oVqItOApT4jY5QCaAMTJ8xtJNmikI7VtA1tzHvA6LZRtA2TSi31o9JGpaG8ICbpHSu
         EXdGdFnmZYjjitRiOubJLjSkFRgPoEMjJD2B4kPd3X1j0ttGfgVQwS5gIloKxXOuFkhA
         k9TZVKfUDRHknA7WgICdbLkeGdJISF81Sl+BfcrRxyk9M0yV//eepVPDny3+PYP5HNM6
         7w5nxvo6J15xdrXT5dR76DJY0MaIxICfDr5R1zshOXgefurGldOtacaTtVe6e6KHwQWh
         c6l3i2uwx4TqU5VHSEe1bjyWZzbyvca+YEJ+fxYK0EzngNVSUsmQ3Xu+BM1wdBI/kXnY
         z/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWohHZPB7nmC/QcMCYbzsF0krarJGBZJEfjA3AXfJ0Ht4WMfJEBC7TRRM5rit4SgWF0XWIvCqt1rQFBsd7tPUOK7VXE
X-Gm-Message-State: AOJu0YztpTSzNPFDhachgv7sHJoPDmOt63f6PSfXDblKK+q/IH5nkPKA
	E4XPVRl4AArR3CWPUWnVJV9LCE/zlkBLoFbPLgXSh81+7NIUWu9fK+b/gZpGB83Qq8dPqT8PMHr
	pkD+R6hb/F+YR5s8//lHaXWC6tFQ=
X-Google-Smtp-Source: AGHT+IGDbPuViPnz5x8Or5gGEDuBn9xS6cKSAFV4NoAIctp6lQe6NM7m54HwbtmTcMeIm3lqzbT8HflIHThgZMUE2gs=
X-Received: by 2002:a17:902:db0e:b0:1dc:b77e:1973 with SMTP id
 m14-20020a170902db0e00b001dcb77e1973mr2408566plx.53.1709041930195; Tue, 27
 Feb 2024 05:52:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226234532.80114-1-aford173@gmail.com> <20240226234532.80114-6-aford173@gmail.com>
 <20240227083301.4saxxuv4n6aoqnl6@pengutronix.de>
In-Reply-To: <20240227083301.4saxxuv4n6aoqnl6@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 Feb 2024 07:51:58 -0600
Message-ID: <CAHCN7xKnEvrfYMZau95e7aknTkdqrQLfgWZTfb6mS3Yt5BT6+Q@mail.gmail.com>
Subject: Re: [PATCH V6 5/6] arm64: dts: imx8mp: add HDMI display pipeline
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Marek Vasut <marex@denx.de>, Kishon Vijay Abraham I <kishon@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, imx@lists.linux.dev, 
	Sascha Hauer <s.hauer@pengutronix.de>, aford@beaconembedded.com, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 2:33=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi Adam,
>
> thanks a lot for pushing this topic.
>
> On 24-02-26, Adam Ford wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the DT nodes for all the peripherals that make up the
> > HDMI display pipeline.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Marek Vasut <marex@denx.de>
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> > V6:  Make LCDIF3 disabled by default
> >
> > V5:  No change
> >
> > V3:  Re-ordered the HDMI parts to properly come after irqstree_hdmi
> >      inside AIPS4.  Change size of LCDIF3 and PVI to match TRM sizes
> >      of 4KB.
> >
> > V2:  I took this from Lucas' original submission with the following:
> >      Removed extra clock from HDMI-TX since it is now part of the
> >      power domain
> >      Added interrupt-parent to PVI
> >      Changed the name of the HDMI tranmitter to fsl,imx8mp-hdmi-tx
> >      Added ports to HDMI-tx
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 95 +++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 18bfa7d9aa7f..637b0265b0f1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1940,6 +1940,101 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >                               clock-names =3D "ipg";
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_IRQSTEER>;
> >                       };
> > +
> > +                     hdmi_pvi: display-bridge@32fc4000 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-pvi";
> > +                             reg =3D <0x32fc4000 0x1000>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <12>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
>
> this node should be 'status =3D "disabled";' as reported by Luca else thi=
s
> node will EPROBE_DEFER. With that beeing fixed you can add my:

sorry I missed that one...and I though I was done...sigh.  I hope it's
not too late to get this into the next release.
>
> Tested-by: Marco Felsch <m.felsch@pengutronix.de>
>

I'll push a V7 tonight and add your tested-by.  Thanks for testing.

adam

> Regards,
>   Marco
>
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@0 {
> > +                                             reg =3D <0>;
> > +                                             pvi_from_lcdif3: endpoint=
 {
> > +                                                     remote-endpoint =
=3D <&lcdif3_to_pvi>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +                                             pvi_to_hdmi_tx: endpoint =
{
> > +                                                     remote-endpoint =
=3D <&hdmi_tx_from_pvi>;
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     lcdif3: display-controller@32fc6000 {
> > +                             compatible =3D "fsl,imx8mp-lcdif";
> > +                             reg =3D <0x32fc6000 0x1000>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <8>;
> > +                             clocks =3D <&hdmi_tx_phy>,
> > +                                      <&clk IMX8MP_CLK_HDMI_APB>,
> > +                                      <&clk IMX8MP_CLK_HDMI_ROOT>;
> > +                             clock-names =3D "pix", "axi", "disp_axi";
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_LCDIF>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +                                     lcdif3_to_pvi: endpoint {
> > +                                             remote-endpoint =3D <&pvi=
_from_lcdif3>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     hdmi_tx: hdmi@32fd8000 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-tx";
> > +                             reg =3D <0x32fd8000 0x7eff>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <0>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>,
> > +                                      <&clk IMX8MP_CLK_HDMI_REF_266M>,
> > +                                      <&clk IMX8MP_CLK_32K>,
> > +                                      <&hdmi_tx_phy>;
> > +                             clock-names =3D "iahb", "isfr", "cec", "p=
ix";
> > +                             assigned-clocks =3D <&clk IMX8MP_CLK_HDMI=
_REF_266M>;
> > +                             assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL1_266M>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_HDMI_TX>;
> > +                             reg-io-width =3D <1>;
> > +                             status =3D "disabled";
> > +
> > +                             ports {
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <0>;
> > +
> > +                                     port@0 {
> > +                                             reg =3D <0>;
> > +
> > +                                             hdmi_tx_from_pvi: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pvi_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg =3D <1>;
> > +                                             /* Point endpoint to the =
HDMI connector */
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     hdmi_tx_phy: phy@32fdff00 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-phy";
> > +                             reg =3D <0x32fdff00 0x100>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>,
> > +                                      <&clk IMX8MP_CLK_HDMI_24M>;
> > +                             clock-names =3D "apb", "ref";
> > +                             assigned-clocks =3D <&clk IMX8MP_CLK_HDMI=
_24M>;
> > +                             assigned-clock-parents =3D <&clk IMX8MP_C=
LK_24M>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_HDMI_TX_PHY>;
> > +                             #clock-cells =3D <0>;
> > +                             #phy-cells =3D <0>;
> > +                             status =3D "disabled";
> > +                     };
> >               };
> >
> >               pcie: pcie@33800000 {
> > --
> > 2.43.0
> >
> >
> >
