Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C8136E0E
	for <imx@lists.linux.dev>; Sun, 18 Aug 2024 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724008648; cv=none; b=iptxzyYsjdH3nEoJ+yXYq7VQgAgsqYL6ICwYtrvK/o4/IwO/v9RbfiNEhEuZKzxgu4ij63PvYf8BzB5sYbxwSGdS7WAHxcXpu7qpIZuq/by3akF1WAaYYK1Bk38DstkXmaF05++4SwoMmDMPIaLxSMo0i5K1W29fDqFcHmzUBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724008648; c=relaxed/simple;
	bh=/ZYG8t+3hi5zuFYN6jVlAC9keLvLYY6R0ZctQySQtgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYkWJFD+7h0ETExgPOFYbU4rAE9ctz+yBgPCsvV4On+/AadQw0C0oyrrXkLdCX19p/RKF56AVbMRWe9IItVngB0zs82AiTX9bmJXtjpLvG6GV/p+s7qXprMuUfpmiq0W/LuhKdx5B4ahHhqZ9VLeFq85tXHPtvcwYk0M/w8AVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IG3MpjcR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IG3MpjcR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3eda6603cso1739632a91.3
        for <imx@lists.linux.dev>; Sun, 18 Aug 2024 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724008646; x=1724613446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx+Zq4vdIq9k1ggzqz9SNl8byZkyOrOwHc6OFT3XW+8=;
        b=IG3MpjcRqaAKaG5PBcwWSuPhfB0Nw353rkv/mKpg+C8szoSRy5lMaZnIcQEd/Ll5N0
         7Ld2+ypegyIcCHmN71qEWhHkSufvZMpmcTy4NKhTqzRkX6u4VZhAx4Fl2NlkfjDha8nJ
         VLiMt2OOX/CoWEW5bnyeVspwE1uqs6XGh38+ygmL4v3Dbvm/AIqr1aIJc9InD+GFZaiy
         ZJ4yA7VdobK1rR10j4eWMEtyLgeXQimbsX7Ap+nxnHMGOu2Fd+msq5QiHAagnbIh68qd
         /V8fEM4xhlBys/fjokgqrY6oxuwSO0WkiX5+5OB+BCwlUr06mD5eODXIdLv0jMuI/nNI
         DRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724008646; x=1724613446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx+Zq4vdIq9k1ggzqz9SNl8byZkyOrOwHc6OFT3XW+8=;
        b=LTAAZIP1zLppUb0ItgLyweOqfOPV+4bvgFD4Uc8nzaGLck3NTMzXkIulLUF6f68iMI
         eALHrfgGQKam9ky8XOtRrR6b6OvlMAGLs2SxC25BziI0fk9qquUmGuljc+dy/7OvX37H
         XqRESq9YPsitXTRSu6DjAGGVmVx42Xxxru+e5izvifzstI3ij99NWMntYAtQBhUWux9F
         lFCjakG0iaKwr5tutHbIpppGWtJZ2tbQkq/OpN9XK3N5qJHIkKO5hAsb08e/Vb/AaaxS
         OqS+wr+f+PPBZveakNkHVMs6GmcuJ4XQaLMEJ4Q8jcc8F9sXNlNB96wIJ8UO9LeB8Mkb
         sWrg==
X-Gm-Message-State: AOJu0YwDvQ+LDlZjcXgHGPukAePpxsRE0ATO555kMGtbcMz7wDki+CJ+
	XJNPm23lMm6ToIJuu6yd/zzL4scjs6b64eTMB8SSdxEMNujsZcoCaE5BVOR+JG20CiH71uIpQKA
	BCIka4KqRr4HX00C5wzHyVmbL/YA=
X-Google-Smtp-Source: AGHT+IH8WepLSlH2NluePgXdNT6MiLUadEguZpClD0fmOW02SP4032jbu+wR8bEzJSMxjARp2HuF0+gK/X7067xVhoo=
X-Received: by 2002:a17:90a:d703:b0:2d3:b821:ba78 with SMTP id
 98e67ed59e1d1-2d3dfc79dfdmr10372924a91.22.1724008646482; Sun, 18 Aug 2024
 12:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com> <20240818190703.GA1148@pendragon.ideasonboard.com>
In-Reply-To: <20240818190703.GA1148@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 14:17:15 -0500
Message-ID: <CAHCN7x+Xrg969j20jANdB6c3Xz5UV22=hNunfoBi_HmSGDAAwg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 2:07=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Aug 18, 2024 at 01:24:01PM -0500, Adam Ford wrote:
> > On Tue, Aug 13, 2024 at 6:40=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >
> > > The ISP supports both CSI and parallel interfaces, where port 0
> > > corresponds to the former and port 1 corresponds to the latter. Since
> > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > receiver, set them both to port 1.
> > >
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> > > ---
> > > Changes since v2:
> > >
> > > - Assign clock parent and frequency in blk-ctrl
> > >
> > > Changes since v1:
> > >
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 +++++++++++++++++++++=
+-
> > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index d9b5c40f6460..09f1e27ee220 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > >                                 };
> > >                         };
> > >
> > > +                       isp_0: isp@32e10000 {
> > > +                               compatible =3D "fsl,imx8mp-isp";
> > > +                               reg =3D <0x32e10000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 74 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > +                               clock-names =3D "isp", "aclk", "hclk"=
;
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > +                               fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > > +                       isp_1: isp@32e20000 {
> > > +                               compatible =3D "fsl,imx8mp-isp";
> > > +                               reg =3D <0x32e20000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 75 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > +                               clock-names =3D "isp", "aclk", "hclk"=
;
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > +                               fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > >                         dewarp: dwe@32e30000 {
> > >                                 compatible =3D "nxp,imx8mp-dw100";
> > >                                 reg =3D <0x32e30000 0x10000>;
> > > @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_APB>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP1_PIX>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP2_PIX>,
> > > +                                                 <&clk IMX8MP_CLK_ME=
DIA_ISP>,
> > >                                                   <&clk IMX8MP_VIDEO_=
PLL1>;
> > >                                 assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_1000M>,
> > >                                                          <&clk IMX8MP=
_SYS_PLL1_800M>,
> > >                                                          <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > -                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>;
> > > +                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > +                                                        <&clk IMX8MP=
_SYS_PLL2_500M>;
> > >                                 assigned-clock-rates =3D <500000000>,=
 <200000000>,
> > > -                                                      <0>, <0>, <103=
9500000>;
> > > +                                                      <0>, <0>, <0>,=
 <500000000>,
> >
> > Is the insertion of the extra <0> here correct?  You inserted one
> > clock above for IMX8MP_CLK_MEDIA_ISP, but it appears you inserted two
> > here.
> > I think this might break the IMX8MP_VIDEO_PLL1 rate and not set the
> > IMX8MP_CLK_MEDIA_ISP as expected.
> >
> > Am I missing something?
>
> You're missing v4 :-)

Sorry.  I was traveling in Europe, so I was going through the backlog
in the order they arrived.  :-)

adam

>
> > > +                                                      <1039500000>;
> > >                                 #power-domain-cells =3D <1>;
> > >
> > >                                 lvds_bridge: bridge@5c {
> > >
> > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>
> --
> Regards,
>
> Laurent Pinchart
