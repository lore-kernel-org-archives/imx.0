Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC200AD2C
	for <imx@lists.linux.dev>; Wed,  6 Aug 2025 03:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754452219; cv=none; b=n8hGsxP1TSyksVTEvAxS5ojmqkGqGNf6e971V+lkTDFKNWhf+W+CMmocDPb3+z+vCCXzl/QXhl4VwmaAihDAXyEanLegSKVB1PPl4yrmjG4Vl/sfAgHAaHRTmdzxubFB39jni4O/DXVe7hAc3Haks0uirxfeiNrowN2+NgzOBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754452219; c=relaxed/simple;
	bh=IN1Z8ZB1c3j1p8i9mF0p0zzTFXrm+j8K2pzZvSmArqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXFSJZFtKcedI3FePxZVvGQUNAyzj9CShFqmkiBhGVcgjJ8/yck74XCdHm1Y8MMJ1IkszcFnzEadMyRCzZezpxO/shyFI5lIQTqFA4s8d2DJ7Qgn/35IRwEd3UxL7vdZET4eiwMOo3hjk0aYroV0eRHjSqFVl69aYhrXad+kyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2TBJTMT; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2TBJTMT"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86a052d7897so322545539f.0
        for <imx@lists.linux.dev>; Tue, 05 Aug 2025 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754452217; x=1755057017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
        b=g2TBJTMTkUhdnw+WwGrNzGhA6KGGA+OuI/lazD8sQUzeEfwVTF29cq+Uk2W5jOW6uf
         aDDZ5lrEppgHHmg2WOBzE3JJEZkM/rzSMPLF5RzA6cHFs66Cpu0d1b6iT6SJDG2Gz84s
         uMLyK/ZuhaAIXyzblhy+0OpfY+NtSzylFW5FSSvse+/OeXc1O1KnNbT4ru6S3k5pFpQ4
         FnwxW1xzD52GyruEOXR+wmC9EdU5FyFa28Aqa+vLTm+Y4oRPDolNqmMnszpxChsugFjf
         o8DH/Q9ZgGheBiQYGvtRojrMKYTq4EIG+sUoDgEwh4b2bvSz09huJERGje/m5XNEnZ2N
         mrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754452217; x=1755057017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
        b=mF83w6427iUzm/j7IjL86vH9MEvOTmYKT2ZL7itiDlRFF8jhrlf89LUpuNyeUUSzWp
         gRwsL2XVhsVIoYkEY+imOTWXr1YzUDBJ9aCwbBrBy1bMVizL5hNYMFh9T8YvhrrGONHN
         hM6UZqYi15ITWu7y+cR1vZH0loG8L2TfHf3yp5wBMmzN0KTqPGlY7h+7Ee1jxVWrLrBr
         4kUWKPlp2QjY5kvSc5imBeSTlvM/wr/MbF9q5dMVrGKpyII3uhjmy/kjCsNLbsfOL37T
         m6H0XxPcBP6vLA0Cxss63ELK2Jid9E0L6X3e8CBcWA9xKGOxCtbQZRQ+HVyGNGVDQSWm
         F1QA==
X-Forwarded-Encrypted: i=1; AJvYcCWlYQin7IEEix053FW/A2GC69ba8cQWHXOzhACdwZyIRu5SzkYWjTpUe+cc9Ev9CGmNnIw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzws+7rUjsNtSPxzZd0MHDpz3M4HxjWY/Ay/9SAfZv10uyHUE6/
	297m6hbEz+tecx5lrk6QMfR4cmjemORmvqLxQuGjGd3dHoCU1tDDh5X0CX3OJnVqn8B93BxZ0N4
	BMAZ6S3ie9s4bGeWchEwEBAgenx1r5Og=
X-Gm-Gg: ASbGnct/5AfMy8NS0+1g8TMmQn7ti41T0AnBf1ujLFaU5DhLmOA8IeT0G3YqX9FrOW5
	pgM+2Kogb8Bm/o3mzb7ETH9/QmgFSBFdyiGlgMyVSAzQ7Ppbn9CbEh6ZE8V0LLWcUguDo/TH2Xn
	/pVH4MBM8GG1ajfesCeheqrjMGjav/3rb39p8emVEiTPr33jIGhyj87VdU/TSS/2585Uv9rx5UA
	OcYvdQ=
X-Google-Smtp-Source: AGHT+IFCQESUgdKuGOqs444QSzygbhrbLJwY9iG/XD2Q5CtWib3hxKckGgR3Hyw/Y4VQLjfx/NuyfuaWMxWrok5dFkc=
X-Received: by 2002:a05:6602:2b07:b0:881:7e3a:4a37 with SMTP id
 ca18e2360f4ac-8819f065f0bmr265326839f.6.1754452216814; Tue, 05 Aug 2025
 20:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-7-shengjiu.wang@nxp.com> <1932645.tdWV9SEqCh@steina-w>
In-Reply-To: <1932645.tdWV9SEqCh@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Aug 2025 11:49:57 +0800
X-Gm-Features: Ac12FXyh9zIEFgIR4jwpAfqlHLcCdIoWysUI9X5TL5LXhlIGHinLI0hUpNeMIog
Message-ID: <CAA+D8AM7hEcyVaZF7MHN-jY_NOS+cdhrXGdTXeQ48-WV=bnLMA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 3:10=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 4. August 2025, 12:47:22 CEST schrieb Shengjiu Wang:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> > Audio Subsystem to the HDMI TX Controller.
> >
> > Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai devic=
e.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-
>
> Please separate commits for SoC and board files. Thanks

Ok.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >  2 files changed, 31 insertions(+), 1 deletion(-)
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
> > index 841d155685ee..00d8474bd1b1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: audio-bridge@32fc4800 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> > +                             clock-names =3D "apb";
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
> > @@ -2143,6 +2161,14 @@ port@1 {
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
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
