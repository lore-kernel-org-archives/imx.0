Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8192581
	for <imx@lists.linux.dev>; Sun, 18 Aug 2024 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724006020; cv=none; b=rjsOzUC/ZMiXXEHjBySviQ1rHv6nJbQC536/ILc/oEhbFO5CApqweh0XYrkRQ0CRkF8b8ky7+gIubA45HSot6xVBtmEJWihzab+7RmWeafA4Ghm2BSZ+1zMjOwyhvcdRZp33n41XnbwspIgoI2EY9K+5Oa+QAx+eFNJwr0pDIBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724006020; c=relaxed/simple;
	bh=WLfNB2hjnuXUi7ar/tjtRVxhvzUkUsg8LdXkRDpUIAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRCvDKrTfzjVsMfiTQgH7suoANxrimQCYB8HrTHbJMqwcZXG4spzhPWZjF/NmdQSNSkVKXD2vlymojT0TOYSg1lSZozDFcf7rGC+Ur61KG4qHhHPPc9/JxVNSwDs/2y+MCp6ZPfRKl3RT/JHO7iM6wkQbIlSRPtUXaH73MG2VB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzZ+1PaS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzZ+1PaS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so2757854a12.3
        for <imx@lists.linux.dev>; Sun, 18 Aug 2024 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724006018; x=1724610818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNqrC2SyS9w8+woH5OI0AUEQTcV1jIUuxeB51N4GQTw=;
        b=gzZ+1PaSxVnyy18A1dYUchUD0lWVe80zXFlsj0+S4vshV7fgMj5VRROG9KFGmbsrrx
         eK6blD/W0amtAhlT5hXIv0Ram3Th+5MbI+92qwYz7VzwsR3d7uUuBJoXoljM5TfqAdAT
         sRbMGDFB25X+ZA76Dp8ZS3+dXwjezIvr6QOUVhVk5BfKg801zZWSfrOWIzU15m/cymkG
         rA8jidpeWmONgE37kdaDkbq56eNRIwa1/s+3XAJ5YM4wVnGk2w/5krsp8OdUWFzBUvli
         LsuR5nrMT8q8rnZT20XboLq0HeolX2kMJdyrMfkQcimfqxsHUTG9EwqELkqobRX2sddn
         m7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724006018; x=1724610818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNqrC2SyS9w8+woH5OI0AUEQTcV1jIUuxeB51N4GQTw=;
        b=ZmFnlDQU03eeuEz330daFgelJXES4FoEong9MRGnwSvkbZR9U3mwn1oug+eYe4tJVS
         0E5ug2/jkTVattp7sDsPH3UY5tNHBopcnvv5eyoe0KCZcmfdTzYqekn149eEJt0lbhVm
         i1IwmQwV2wCOfEqaEAkjZwkRJJ3A+RXPVJc46yZBtpOz+2BifLSXt7gDDQZMpxli8J6F
         5nG1NSoB3OU3L1qAAd0RXpeSL21YqiI8FdSmcxRP+XgzGVPHtz2S6TbawOOPm55bCWWc
         Ju4hyWBqOZirp/myUbx6tAkSzu9fEyCfRi0ImymBInJjkcT+qxNPE5vG2r8TrCeLv9CU
         WNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1txRMf34fJESWdUQQHev/UFSkpBQ5TNKlRXo6FlYSMPQ+xmQORRz5kMjJhF0GuZApITHaVhwFBNo5EM95gvtsizw
X-Gm-Message-State: AOJu0Yz+/GH0U8MXZ68YRd0/VwxZEEuAC75TfwFEyMr+LiTJaDzQb5FZ
	EsTBlxRqjgzeP0o4FsHj4kd68pFSyhCWP6u/EsXwT/m4QO7OVTRXc3BOiXcAj9f0KF2vQlnzHvz
	B6XbF1Z9/GXIAPQ1Mqo+hbj/Ti8Q=
X-Google-Smtp-Source: AGHT+IEf2Ui4HNRNaVCs6S89BpH9IcoFqwFXSYEloSuS6c3VjlCxleH3qS45XnYClZ6d46SUWnxddAcgrsXTfF5NXaE=
X-Received: by 2002:a17:90a:db0d:b0:2cd:2992:e8e5 with SMTP id
 98e67ed59e1d1-2d3dffde884mr9321082a91.33.1724006017771; Sun, 18 Aug 2024
 11:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
 <13578505.uLZWGnKmhe@steina-w> <20240817182546.GC29320@pendragon.ideasonboard.com>
In-Reply-To: <20240817182546.GC29320@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 13:33:26 -0500
Message-ID: <CAHCN7x+LCeNpaDi65aiEAWTgukWY7YufCnBmym5OU6FAujAxbg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 1:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Alexander,
>
> On Thu, Aug 15, 2024 at 02:05:39PM +0200, Alexander Stein wrote:
> > Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >
> > > The ISP supports both CSI and parallel interfaces, where port 0
> > > corresponds to the former and port 1 corresponds to the latter. Since
> > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > receiver, set them both to port 1.
> > >
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v3:
> > >
> > > - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> > > - Fix assigned-clock-rates
> > > - Dropping Tested-by as the clock configuration has changed
> > >
> > > Changes since v2:
> > >
> > > - Assign clock parent and frequency in blk-ctrl
> > >
> > > Changes since v1:
> > >
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 +++++++++++++++++++++=
+-
> > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index d9b5c40f6460..f3531cfb0d79 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > >                             };
> > >                     };
> > >
> > > +                   isp_0: isp@32e10000 {
> > > +                           compatible =3D "fsl,imx8mp-isp";
> > > +                           reg =3D <0x32e10000 0x10000>;
> > > +                           interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> > > +                           clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > +                           clock-names =3D "isp", "aclk", "hclk";
> > > +                           power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > +                           fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > +                           status =3D "disabled";
> > > +
> > > +                           ports {
> > > +                                   #address-cells =3D <1>;
> > > +                                   #size-cells =3D <0>;
> > > +
> > > +                                   port@1 {
> > > +                                           reg =3D <1>;
> > > +                                   };
> > > +                           };
> > > +                   };
> > > +
> > > +                   isp_1: isp@32e20000 {
> > > +                           compatible =3D "fsl,imx8mp-isp";
> > > +                           reg =3D <0x32e20000 0x10000>;
> > > +                           interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> > > +                           clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > +                           clock-names =3D "isp", "aclk", "hclk";
> > > +                           power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > +                           fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > +                           status =3D "disabled";
> > > +
> > > +                           ports {
> > > +                                   #address-cells =3D <1>;
> > > +                                   #size-cells =3D <0>;
> > > +
> > > +                                   port@1 {
> > > +                                           reg =3D <1>;
> > > +                                   };
> > > +                           };
> > > +                   };
> > > +
> > >                     dewarp: dwe@32e30000 {
> > >                             compatible =3D "nxp,imx8mp-dw100";
> > >                             reg =3D <0x32e30000 0x10000>;
> > > @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >                             clock-names =3D "apb", "axi", "cam1", "ca=
m2",
> > >                                           "disp1", "disp2", "isp", "p=
hy";
> > >
> > > +                           /*
> > > +                            * The ISP maximum frequency is 400MHz in=
 normal mode
> > > +                            * and 500MHz in overdrive mode. The 400M=
Hz operating
> > > +                            * point hasn't been successfully tested =
yet, so set
> > > +                            * IMX8MP_CLK_MEDIA_ISP to 500MHz for the=
 time being.
> > > +                            */
> > >                             assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_AXI>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
APB>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
DISP1_PIX>,
> > >                                               <&clk IMX8MP_CLK_MEDIA_=
DISP2_PIX>,
> > > +                                             <&clk IMX8MP_CLK_MEDIA_=
ISP>,
> > >                                               <&clk IMX8MP_VIDEO_PLL1=
>;
> > >                             assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>,
> > >                                                      <&clk IMX8MP_SYS=
_PLL1_800M>,
> > >                                                      <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> > > -                                                    <&clk IMX8MP_VID=
EO_PLL1_OUT>;
> > > +                                                    <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> > > +                                                    <&clk IMX8MP_SYS=
_PLL2_500M>;
> > >                             assigned-clock-rates =3D <500000000>, <20=
0000000>,
> > > -                                                  <0>, <0>, <1039500=
000>;
> > > +                                                  <0>, <0>, <5000000=
00>,
> > > +                                                  <1039500000>;
> >
> > Unfortunately for some reason this reparenting doesn't work (on my plat=
form).
> > 'media_isp' is still below IMX8MP_CLK_24M.
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >     mipi_dsi_esc_rx                  0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id
> >     media_isp                        0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id
> >        media_isp_root_clk            0       0        0        24000000=
    0          0     50000      N         32e10000.isp                    i=
sp
>
> Hmmm... I get
>
>                 sys_pll2_500m        3       3        0        500000000 =
  0          0     50000      Y                  deviceless                =
      no_connection_id
>                    media_isp         0       0        0        500000000 =
  0          0     50000      N                     deviceless             =
         no_connection_id
>                       media_isp_root_clk 0       0        0        500000=
000   0          0     50000      N                        32e10000.isp    =
                isp
>
> > I have to add this diff for isp_0 (and isp_1 if you use it):
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
> >                                 clock-names =3D "isp", "aclk", "hclk";
> >                                 power-domains =3D <&media_blk_ctrl IMX8=
MP_MEDIABLK_PD_ISP>;
> >                                 fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > +                               assigned-clocks =3D <&clk IMX8MP_CLK_ME=
DIA_ISP>;
> > +                               assigned-clock-parents =3D <&clk IMX8MP=
_SYS_PLL2_500M>;
> > +                               assigned-clock-rates =3D <500000000>;
> >                                 status =3D "disabled";
> >
> >                                 ports {
> >
> > Now clock is setup properly:
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >                 sys_pll2_500m        3       3        0        50000000=
0   0          0     50000      Y                  deviceless              =
        no_connection_id
> >                    media_isp         0       0        0        50000000=
0   0          0     50000      N                     deviceless           =
           no_connection_id
> >                       media_isp_root_clk 0       0        0        5000=
00000   0          0     50000      N                        32e10000.isp  =
                  isp
>
> I'm not sure why that's the case, I don't have assigned-clock*
> properties in the ISP nodes in my device tree and things still work
> properly. Would you be able to investigate ?


For what it's worth, when I remove the extra <0> clock reference on my
board like:

--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1927,7 +1927,7 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
                                                         <&clk
IMX8MP_VIDEO_PLL1_OUT>,
                                                         <&clk
IMX8MP_SYS_PLL2_500M>;
                                assigned-clock-rates =3D <500000000>, <2000=
00000>,
-                                                      <0>, <0>, <0>,
<500000000>,
+                                                      <0>, <0>, <500000000=
>,
                                                       <1039500000>;
                                #power-domain-cells =3D <1>;


I am able to get:

                sys_pll2_500m        1       1        0
500000000   0          0     50000      Y                  deviceless
                    no_connection_id
                   media_isp         0       0        0
500000000   0          0     50000      N
deviceless                      no_connection_id
                      media_isp_root_clk 0       0        0
500000000   0          0     50000      N
32e10000.isp                    isp


The video pll is also  set to 1039500000

adam
>
> > >                             #power-domain-cells =3D <1>;
> > >
> > >                             lvds_bridge: bridge@5c {
> > >
> > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > > prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f
>
> --
> Regards,
>
> Laurent Pinchart
