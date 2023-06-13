Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C2F1361
	for <imx@lists.linux.dev>; Tue, 13 Jun 2023 23:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8812C433C9
	for <imx@lists.linux.dev>; Tue, 13 Jun 2023 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686699116;
	bh=aNJH35WRMNqV0lqZl8N98lkQSouazvy9Y1MphL/3tYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P5QlrbcFWh7WO7qIzYatE9h4nh2LMtoJoqbmvlUhmG+xX3L4nMF8JSkYNj3dGSRsH
	 62UsqX5srRIENLVAAARr2cn6i+6N5fqi6aU7RbjgLfCIysgIagLzVuUwg2wNhp10m+
	 K53Rmys1aL/uJqB/WyXJcfeBBEcYboH2agtTgcPfSeFaQ4lR4g3pKQFR9up1aIm3UV
	 e1G5RGhchegpQvIM98stlnHyW6cu/xyLZSxQ6QS4naV58YhdTTWFdxp1YqFOKGVBd2
	 skrpqTQ39P2WOY/qfxOkLNsh9TFbmGJ3byv0cwh1MSwo6lQGNu2LW7EN0e7TINNwqW
	 8aeTjELvZe/JA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b34969e65fso108701fa.3
        for <imx@lists.linux.dev>; Tue, 13 Jun 2023 16:31:56 -0700 (PDT)
X-Gm-Message-State: AC+VfDz6VcgOlYiC5caIwC+XXC6ycSJovn0qDSx/2jr8nxsvh3ClpkWt
	KdfVzQMsdqLLO9OFpE8eKjYZXxh0FlHXvgTzIw==
X-Google-Smtp-Source: ACHHUZ4iBNHpRqCMQM3h4+6Wob2LPbB25k7cHf6W6lan03IqY+Tgwf1MVZ9lZskiFqgCTd3mlLVMfhsrEJSJ9Y2ozVs=
X-Received: by 2002:a2e:91d7:0:b0:2b3:46ec:8014 with SMTP id
 u23-20020a2e91d7000000b002b346ec8014mr376176ljg.47.1686699114810; Tue, 13 Jun
 2023 16:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230515150149.2790189-1-Frank.Li@nxp.com>
In-Reply-To: <20230515150149.2790189-1-Frank.Li@nxp.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Jun 2023 17:31:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMtf__1Q+5MiaoXXx1LO=49XG490HZxOxcD7yDveioiQ@mail.gmail.com>
Message-ID: <CAL_JsqLMtf__1Q+5MiaoXXx1LO=49XG490HZxOxcD7yDveioiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mp: Add coresight trace components
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 9:02=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add coresight trace components (ETM, ETF, ETB and Funnel).
>
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82 CPU0  =E2=94=9C=E2=94=80=E2=96=BA=E2=94=82 ETM0  =E2=94=9C=E2=
=94=80=E2=96=BA=E2=94=82       =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98  =E2=94=82       =E2=94=82
>                       =E2=94=82       =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90  =E2=94=82  ATP  =E2=94=82
> =E2=94=82 CPU1  =E2=94=9C=E2=94=80=E2=96=BA=E2=94=82 ETM1  =E2=94=9C=E2=
=94=80=E2=96=BA=E2=94=82       =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98  =E2=94=82       =E2=94=82
>                       =E2=94=82 FUNNEL=E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90  =E2=94=82       =E2=94=82
> =E2=94=82 CPU2  =E2=94=9C=E2=94=80=E2=96=BA=E2=94=82 ETM2  =E2=94=9C=E2=
=94=80=E2=96=BA=E2=94=82       =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98  =E2=94=82       =E2=94=82   =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=90
>                       =E2=94=82       =E2=94=82   =E2=94=82     =E2=94=82=
  =E2=94=82     =E2=94=82
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90  =E2=94=82       =E2=94=82   =E2=94=82 M7  =E2=94=82  =
=E2=94=82 DSP =E2=94=82
> =E2=94=82 CPU3  =E2=94=9C=E2=94=80=E2=96=BA=E2=94=82 ETM3  =E2=94=9C=E2=
=94=80=E2=96=BA=E2=94=82       =E2=94=82   =E2=94=82     =E2=94=82  =E2=94=
=82     =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98   =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=98  =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=
=E2=94=98               AXI
>                           =E2=94=82          =E2=94=82        =E2=94=82  =
                 =E2=96=B2
>                           =E2=96=BC          =E2=96=BC        =E2=96=BC  =
                 =E2=94=82
>                       =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=8C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =E2=94=8C=E2=94=80=E2=
=94=B4=E2=94=80=E2=94=80=E2=94=90
>                       =E2=94=82          ATP FUNNEL       =E2=94=9C=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82ETF  =E2=94=9C=E2=94=80=E2=96=BA =E2=94=82ETR=
 =E2=94=82
>                       =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=94=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - add new line between nodes
> - add new line between properties and child node
>
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 204 ++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a19224fe1a6a..1a25710c3a90 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -304,6 +304,210 @@ soc: soc@0 {
>                 nvmem-cells =3D <&imx8mp_uid>;
>                 nvmem-cell-names =3D "soc_unique_id";
>
> +               etm0: etm@28440000 {
> +                       compatible =3D "arm,coresight-etm4x", "arm,primec=
ell";
> +                       reg =3D <0x28440000 0x10000>;
> +                       arm,primecell-periphid =3D <0xbb95d>;
> +                       cpu =3D <&A53_0>;
> +                       clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       etm0_out_port: endpoint {
> +                                               remote-endpoint =3D <&ca_=
funnel_in_port0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm1: etm@28540000 {
> +                       compatible =3D "arm,coresight-etm4x", "arm,primec=
ell";
> +                       reg =3D <0x28540000 0x10000>;
> +                       arm,primecell-periphid =3D <0xbb95d>;
> +                       cpu =3D <&A53_1>;
> +                       clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       etm1_out_port: endpoint {
> +                                               remote-endpoint =3D <&ca_=
funnel_in_port1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm2: etm@28640000 {
> +                       compatible =3D "arm,coresight-etm4x", "arm,primec=
ell";
> +                       reg =3D <0x28640000 0x10000>;
> +                       arm,primecell-periphid =3D <0xbb95d>;
> +                       cpu =3D <&A53_2>;
> +                       clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       etm2_out_port: endpoint {
> +                                               remote-endpoint =3D <&ca_=
funnel_in_port2>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etm3: etm@28740000 {
> +                       compatible =3D "arm,coresight-etm4x", "arm,primec=
ell";
> +                       reg =3D <0x28740000 0x10000>;
> +                       arm,primecell-periphid =3D <0xbb95d>;
> +                       cpu =3D <&A53_3>;
> +                       clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       etm3_out_port: endpoint {
> +                                               remote-endpoint =3D <&ca_=
funnel_in_port3>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel {
> +                       /*
> +                        * non-configurable funnel don't show up on the A=
MBA
> +                        * bus.  As such no need to add "arm,primecell".
> +                        */
> +                       compatible =3D "arm,coresight-static-funnel";

This device has no registers so it should not be under the bus node.

This is pointed out by the dtschema checks. Please don't add new ones.

Rob
