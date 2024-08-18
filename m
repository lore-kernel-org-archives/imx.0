Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423138DE4
	for <imx@lists.linux.dev>; Sun, 18 Aug 2024 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724005456; cv=none; b=iA5jGfK+6XL6BGNYU6JBR7d4Kc53V7WTTWlM+BqFSnXI725+/SeUhcXxSfyly3HbyXkuPKhfqxahKe/yT96VFWXF+qFv9ZURMWgFvfrbUQkT7eMPMCftgIHUp+D+Fr8KnnhKBhKu1rbH5eP8tDAIBGelzrr1jRvShywLMHZx8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724005456; c=relaxed/simple;
	bh=FvZ8kuAZWxMpIjQiOOdkwG/HNI1/9mgEBslJihXT+6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRd1Ewzh1LWDnSOa9LgVQc98HBZLIHFYAKgNpwv+bjI5wvnIQ8uoZhA7e3g5I7rhjWDbQvDIEDsJEAxRADoykFP4AyXHDpYjkMQ7vbfTYgF25dO/huMq55JcXIclq0UzXgikBl1U3Tjau+JtXThmV2j1+7m4wfIDvrkKcrx8mhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIZ9+9Qa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIZ9+9Qa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d1d6369acso2932141b3a.0
        for <imx@lists.linux.dev>; Sun, 18 Aug 2024 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724005454; x=1724610254; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztdZKVXboTeh21wML9vQfK4sieO9DxbPhdkFttpUEeU=;
        b=AIZ9+9QaPQBTmUqRxT6ON1XfPKWluzwVglj4sbqsSc+txYv07rP+dPxj39HRkA2rCt
         Yv/5fjmgsuh6+h5eKSrI/sV0wqtk5de8Ml1W9elmEvhupsub09daa9pg4fdW7QAkasAG
         ELbRGBaIAAg3uHdzGhYSzEHEUClYiFZdlibiatiFes58eKT+tGqf4J3cSRQLymbjWDLi
         U8rCp5rbLSruaJ6YcjdIakkMEYgHa7acSZLrH+KsFd/3BDyobU1pief9lJ8aUINESdNV
         UnNnFazjdl9iylerx7t02KSautuRUjkLE/7U9SWeC8mUvuPB/q2Ozz47BXyvuo1Gw4nD
         HScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724005454; x=1724610254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztdZKVXboTeh21wML9vQfK4sieO9DxbPhdkFttpUEeU=;
        b=TB//5AXJNEbbYCDE3kM3tyDHJr/EdPPqIyv6q79h0KUoUxy+hX58wth5ES8Opi9Zzh
         OAtvGdSglKSf6gPJG9Hcyl0vJUqVmtcOC9igpsQUXC2OV53CFHbkT3pdgUbP4LtdryzS
         gYniBf59NpR8CmEE/xoMyswFzPi44SqtJ6YGqNDU9NSjWdmw2rrO0TXgkWbUNiGiMlCb
         LLPfe+rWlwhBo1mbLMOZr08mPd58/URk/vNPoOoTGrEyGCdog5HuDGvMcaoomzZdjH4r
         Im3pKCZPao6KMnISD5sHct9JIrOnDBPXTOyNf939y09/CRW7bJkk2iHKY5/yKQxoRcI4
         0EWw==
X-Gm-Message-State: AOJu0YyyuQJi4E8f/ug31jjRKP+aXl+SeDOTDo8EzYxAQ8mukNIE7Mqa
	TI8UluJWE582yG3blkaT4RuIWlp8uQXcKACias/wim5atQ8ICg5kfWa6DYUK5IhhNbRRgqasA0E
	O3eKnU1I7vr2mCIi6j8fVxIO7D7Q=
X-Google-Smtp-Source: AGHT+IH8MNmh+Dob6GRO6qpaqicp8WJvCXkoghUcgid2cN6I1wiSRB01A4iSxWCvu5gRC7oiIAq/zct27GnmniEKul8=
X-Received: by 2002:a17:90a:f696:b0:2c9:7343:71f1 with SMTP id
 98e67ed59e1d1-2d3e45d3fa0mr13074786a91.14.1724005454124; Sun, 18 Aug 2024
 11:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 13:24:01 -0500
Message-ID: <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com>
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

On Tue, Aug 13, 2024 at 6:40=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> ---
> Changes since v2:
>
> - Assign clock parent and frequency in blk-ctrl
>
> Changes since v1:
>
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 ++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index d9b5c40f6460..09f1e27ee220 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
>                                 };
>                         };
>
> +                       isp_0: isp@32e10000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e10000 0x10000>;
> +                               interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       isp_1: isp@32e20000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e20000 0x10000>;
> +                               interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
>                         dewarp: dwe@32e30000 {
>                                 compatible =3D "nxp,imx8mp-dw100";
>                                 reg =3D <0x32e30000 0x10000>;
> @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>                                                   <&clk IMX8MP_CLK_MEDIA_=
APB>,
>                                                   <&clk IMX8MP_CLK_MEDIA_=
DISP1_PIX>,
>                                                   <&clk IMX8MP_CLK_MEDIA_=
DISP2_PIX>,
> +                                                 <&clk IMX8MP_CLK_MEDIA_=
ISP>,
>                                                   <&clk IMX8MP_VIDEO_PLL1=
>;
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>,
>                                                          <&clk IMX8MP_SYS=
_PLL1_800M>,
>                                                          <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> -                                                        <&clk IMX8MP_VID=
EO_PLL1_OUT>;
> +                                                        <&clk IMX8MP_VID=
EO_PLL1_OUT>,
> +                                                        <&clk IMX8MP_SYS=
_PLL2_500M>;
>                                 assigned-clock-rates =3D <500000000>, <20=
0000000>,
> -                                                      <0>, <0>, <1039500=
000>;
> +                                                      <0>, <0>, <0>, <50=
0000000>,

Is the insertion of the extra <0> here correct?  You inserted one
clock above for IMX8MP_CLK_MEDIA_ISP, but it appears you inserted two
here.
I think this might break the IMX8MP_VIDEO_PLL1 rate and not set the
IMX8MP_CLK_MEDIA_ISP as expected.

Am I missing something?

adam

> +                                                      <1039500000>;
>                                 #power-domain-cells =3D <1>;
>
>                                 lvds_bridge: bridge@5c {
>
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> --
> Regards,
>
> Laurent Pinchart
>
