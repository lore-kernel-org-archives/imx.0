Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7861990D8
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 03:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753068545; cv=none; b=ZvbcKiYVj7sFTn+oNLQUKnACPYI/5lL24dMUlI/ayjPQ8k6BpR1g2bA3U4lQpIB0oq+KGe7dYor3rpr0yrcwy5Maz2O5eDUpHF8UeVMsOWL1yVAHTC3W017EhH1L6pspUuS1VuoAb2jELr8uOsITxVB7WTru/4j0EsJMqe9Z9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753068545; c=relaxed/simple;
	bh=qUq5NHdmOFA7O5PdwwBHJAGMUWRewhr25IuO53b3q9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX93WNm/Rq6SWuec41g4t5O6hhUqxCnw+Yv5JttmWk78SSkLKRdORTJu3TGH2FnqHQt+SGs+QZM3Y+4tp7+7IAY9XgwiYQKGqMIvgU5XjU38p/JSQfwJxonUsEWLh4q3v046oB+8okHmF07E5/h6Sv4SJUSu+mVkF9jPPluIeME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljbVa954; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljbVa954"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df2dbe85d1so29706345ab.0
        for <imx@lists.linux.dev>; Sun, 20 Jul 2025 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068543; x=1753673343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
        b=ljbVa954w56l5qC186s9IjwdOQfZMVnwcGBONgsmSTYyfaGQYgb0UilLTKemOIHedH
         9BKVMXk+KLXetPLcXQERV+R/Eci8h3OXIwr/VvUoIxXcivdmDd78tJ3n/d739OGCJs7Y
         wS4F6IN5zY6zR6Fwzf9BPd6Z/L+fHZNXpqBNomVCMQq7DQsNpZ5D8l0uc+MP8DllTaCd
         /3GuXS3/k4LTmAJmmptzFlYXxOh02o4GLcBtCvwqCtpxWyeVeWlRg9RDzAzZMzerdK/n
         MIRaIJJeNtpbG8ZmH/EuKaInvUqqvKtj1X2PpxBGzbrvz59VPwkKF/iPiT3dDve50RQS
         ZFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068543; x=1753673343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
        b=SMFU9Fh0W6gfxWvZVBiqR8DAcHTWLP99KpA6asTe+Z+uuZ6uotYz40PXP6bslU/mJu
         4qLyr1d17YAX2ToIP2NpAmc10cidLcL55sH3yzLPVjnndXTKoIg0SGB7mrkYEhjkuntO
         opWYmYeIMvdq3ZEoor5jM62PkC6fjotZH+wo3IsB3/eNSncL7CtODmLuokLT20S2FU+V
         tns6FhaWowzrwAH84Sx8vvhEe64D//dB9zKSJRU9Ad74YTKYIq6igM/m0+qk1z1KU36U
         9yjb0Mf7SRJ9og/3qQziCTtUmsIR7YCP37BIJiSOBV9VtAokisVS1GpqR59G9PgtLRZg
         jW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4Vbok5FztDUO+47OiIMpU+8T2HPkzsZu4gtwl3VNqwmMeyDN5i0flQ61n6o5Yuk+vn7A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywri+wcAgkfR5oMkJxNjwAEqg4BNQfCSmfIvqIQm4R32Rb0xWhE
	2jYEIH7EBUDGOpy5B0h8vQsKZobKLu1UwwAeqcNeamf79ACUQ6lZJ8EfuWVlGa/e2aOABKUI9FX
	wbgJbFzd9ytBOQ3kX5d4RcPpqLr3aiN8=
X-Gm-Gg: ASbGncvd36yf3XNdelH+bjsFTUMtqKcV3dc13bO5DcVvdCp7f9QMfNp+aQQYFycW8Pz
	EmfgI1BEjCrJWtlugvnm7x/Tgq4lJ4qv0M3yCRNIR6SdJdgDURApNrvyDPHOAWaKyaOmGyFirRW
	Z5mUQL/cU6N0J+we/jgHFbo1ZKdfQBicr4xJNF+gGvsSsroS+GxvCAT/IZLD0x1gKuD5rX4sI9b
	ze20c546stZppSg9A==
X-Google-Smtp-Source: AGHT+IETEm9xXMr77IDr6KJZdmuLlNFoj+aCrz2mROuJITSXc/2fmarCRzlGXALoW/ZTbwduUUZbV41vvElTnzhtcLQ=
X-Received: by 2002:a05:6e02:1fec:b0:3df:347f:ff3e with SMTP id
 e9e14a558f8ab-3e282d9c846mr214673475ab.7.1753068542942; Sun, 20 Jul 2025
 20:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-5-shengjiu.wang@nxp.com> <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:28:47 +0800
X-Gm-Features: Ac12FXxlzAFWQkaGaWWuP5cmwncPGBSTwpvgKOefFzCXa9uYxNYrdhmd2LNtgq8
Message-ID: <CAA+D8AO4+YRrsFUU3kDB_YU5WbA8Dm=+0v_NOvZ2jqg4vPjRKg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Add hdmi parallel audio interface node
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:50PM +0800, Shengjiu Wang wrote:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> > acts as the bridge between the Audio Subsystem to the HDMI TX Controlle=
r.
>
> Remove " a digital module that acts as the" is more straightforward.
>
> >
> > Correct the register map of hdmi_pvi, which is overlapped with the
> > hdmi_pai device.
>
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Ok, will update them in next version.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mp-evk.dts
> > index c0cc5611048e..cc9351a5bd65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -442,6 +442,10 @@ &flexcan2 {
> >       status =3D "disabled";/* can2 pin conflict with pdm */
> >  };
> >
> > +&hdmi_pai {
> > +     status =3D "okay";
> > +};
> > +
> >  &hdmi_pvi {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index bb24dba7338e..6e5a41f46309 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2089,6 +2089,22 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: hdmi@32fc4800 {
>
> commit message it is bridge device, maybe audio-bridge is good node name

Ok, will use audio-bridge.

best regards
Shengjiu Wang
>
> Frank
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PAI>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +
> > +                                     pai_to_hdmi_tx: endpoint {
> > +                                             remote-endpoint =3D <&hdm=
i_tx_from_pai>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> >                       lcdif3: display-controller@32fc6000 {
> >                               compatible =3D "fsl,imx8mp-lcdif";
> >                               reg =3D <0x32fc6000 0x1000>;
> > @@ -2140,6 +2156,14 @@ port@1 {
> >                                               reg =3D <1>;
> >                                               /* Point endpoint to the =
HDMI connector */
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg =3D <2>;
> > +
> > +                                             hdmi_tx_from_pai: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pai_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >
> > --
> > 2.34.1
> >
