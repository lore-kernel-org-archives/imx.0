Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260124;
	b=UN7NaFEzGMCoBzISlwj2APtHmiX7u+0UEhvVEVXySHJuanLbIyv4AE4UMmy8fMHotisc
	 PFo4xdGgI4KN181pOHekt2ltk0sH+iNMVUuZhfISuDQDBmqLvH0hf09LuFHh49/6tls9s
	 NlGSA1KU3lgpKqsmA6CSjSLu///Q9/XXm/z+DMeAxmex+Vq5bSdwEeVIMWoz86P86K90y
	 pJmhJLmQ3JT1wfFHLwhby8bejOSf/c4g9iDZGzUFdtqkkQQgi1tzMLj2aGS/OeK3yY3ad
	 LMw4AGDzAzAhMBW2dg8/Ujn4PwDc3x5OiSddSRYfGsB8iSehvplIWth7V37Pbl36gpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260124;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wQ4V1PvMKSygbdVUw8VkL7KrHbnpoCvRqfmJnYvR0io=;
	b=KrpEp44PhUOrurUVSJ1mYEWZQpmyHU5Z6RH+VICfVbt2f+LBsT2rizJLmlshYsPxTgEF
	 IXIjPn2QYtc6Hfa+aRSTgPp1dNQVxHPdk0ktdlHqLMkB4z7+5pp+XPiDLpUudypMpSGkr
	 5JAIaRkFwBy9rWaG7tF+vAAw8x1Oz7cRMMSIKRyX0+DlOiNx7PVUopwywfgChz08DGCTP
	 To6tCwXOoVUDoX0j5w7qO3sJP+AM7TXa/elnJM2wRPXjDhY+cEspLkv8RCkReeXI52/qp
	 i8u5NZTmXqRxmhfj6BK2vdWbPNztugW5Bvd/M56t4CjOGCMnPlzfFtkD2UB0Bm/7rzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QhTcss/m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AC606A31A;
	Thu, 29 Oct 2026 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhTcss/m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADEB1F01825;
	Thu, 29 Oct 2026 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793260124;
	bh=wQ4V1PvMKSygbdVUw8VkL7KrHbnpoCvRqfmJnYvR0io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QhTcss/mKiWLY4yjZfG2vdpRumX1tSsDS2TdsAIlkWhybNEnNm/3s0Y7l52fzss/J
	 riQs3ZiG58y+8bQrdq2tIakoQGuhYBI6149R2YkTLeDA8AIQRwpYlT17gY9JN3NKak
	 jnoAVm8ktV7tNhSgncv9xMVZUbb8L/9koZOgcS1EwIp7s/NHiKGkPh1jfBlFIJ+3+b
	 5JjfS4pRBHFk7Gj86KSalYeiewvYXb1kX9NFabpuNMeQlgpk3Z3W47zt2/LHIvGkPJ
	 EivzBqHYmxyHe1NNbSCNfgaAFmjgzZVnDkMNW66xySFOYGiFLZJO7CptyOcgvdw81M
	 mZ+z2bzVYzNQg==
Message-ID: <sashiko-outbox-188900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx8ulp-evk: enable HiFi4 DSP device
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261029073257.84594-5-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:48:43 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: imx8ulp: dsp node bypasses sim_lpav clock gates
- [Low] dt-bindings: dsp: fsl,dsp: missing required resets for imx8ulp-hifi4
- [Low] arm64: dts: imx8ulp-evk: invalid underscore in dsp_reserved node na=
me
--

commit 66712dd8dcb982bd4722a81d3e966ce66f340e56
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

arm64: dts: imx8ulp-evk: enable HiFi4 DSP device

This commit enables the HiFi4 DSP remoteproc node and its associated MU3
mailbox on imx8ulp-evk, configuring its assigned clocks and reserved memory
regions.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8ulp-evk.dts
> index 4b925832bb662..358554a5e727e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -60,6 +60,27 @@ rsc_table: rsc-table@20000000 {
>  			no-map;
>  		};
> =20
> +		dsp_reserved: dsp_reserved@8e000000 {
> +			reg =3D <0 0x8e000000 0 0x1000000>;
> +			no-map;
> +		};

[Severity: Low]
Should the node name dsp_reserved@8e000000 avoid using an underscore?

Per Documentation/devicetree/bindings/dts-coding-style.rst and the
Devicetree specification, underscores are valid in labels like dsp_reserved,
but node names should use hyphens or generic names (such as
dsp-reserved@8e000000 or memory@8e000000) to avoid dtc W=3D2
node_name_chars_strict and dtbs_check warnings.

[ ... ]

> @@ -144,6 +165,15 @@ &cm33 {
>  	status =3D "okay";
>  };
> =20
> +&dsp {
> +	assigned-clocks =3D <&cgc2 IMX8ULP_CLK_HIFI_SEL>, <&cgc2 IMX8ULP_CLK_HI=
FI_DIVCORE>;
> +	assigned-clock-parents =3D <&cgc2 IMX8ULP_CLK_PLL4_PFD0>;
> +	assigned-clock-rates =3D <0>, <475200000>;
> +	memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +			<&dsp_vdev0vring1>, <&dsp_reserved>;
> +	status =3D "okay";
> +};

[Severity: High]
When enabling &dsp here, will the HiFi4 clock gates in sim_lpav be disabled
by clk_disable_unused() and left gated when the DSP boots?

In arch/arm64/boot/dts/freescale/imx8ulp.dtsi, the dsp node takes its ipg,
ocram, and core clocks directly from &cgc2 instead of &sim_lpav:

	dsp: dsp@21170000 {
		compatible =3D "fsl,imx8ulp-hifi4";
		reg =3D <0x21170000 0x20000>;
		clocks =3D <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
			 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>,
			 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
			 <&cgc1 IMX8ULP_CLK_DUMMY>,
			 <&pcc5 IMX8ULP_CLK_MU3_B>;
		clock-names =3D "ipg", "ocram", "core", "debug", "mu";

Meanwhile, sim_lpav in arch/arm64/boot/dts/freescale/imx8ulp.dtsi consumes
those three cgc2 clocks, and clk_imx8ulp_sim_lpav_probe() in
drivers/clk/imx/clk-imx8ulp-sim-lpav.c registers the three HiFi4 clock gates
in SYSCTRL0 without CLK_IGNORE_UNUSED or CLK_IS_CRITICAL:

	static struct clk_imx8ulp_sim_lpav_gate gates[] =3D {
		IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "core", 17),
		IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "bus", 18),
		IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "plat", 19)
	};

Because nothing references IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK,
IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT, or IMX8ULP_CLK_SIM_LPAV_HIFI_CORE,
clk_disable_unused() clears bits 17, 18, and 19 in SYSCTRL0 at late_initcal=
l.
When rproc_boot() -> imx_dsp_rproc_prepare() -> imx_dsp_runtime_resume() ->
clk_bulk_prepare_enable() later runs, only the upstream cgc2 dividers are
enabled while the sim_lpav gates remain closed during imx_dsp_rproc_load()
and imx_dsp_rproc_start().

Should the dsp node reference the three &sim_lpav clock gates for its ipg,
ocram, and core clocks instead of &cgc2 directly?

[Severity: Low]
Also related to enabling fsl,imx8ulp-hifi4, should
Documentation/devicetree/bindings/dsp/fsl,dsp.yaml be updated to require
resets and reset-names for fsl,imx8ulp-hifi4?

In drivers/remoteproc/imx_dsp_rproc.c, dsp_rproc_cfg_imx8ulp uses
imx_dsp_rproc_ops_reset_ctrl:

	static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp =3D {
		.att		=3D imx_dsp_rproc_att_imx8ulp,
		.att_size	=3D ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
		.ops		=3D &imx_dsp_rproc_ops_reset_ctrl,
	};

During imx_dsp_rproc_probe(), imx_dsp_rproc_reset_ctrl_detect_mode() requir=
es
the runstall reset control (and imx8ulp_dsp_reset() uses runstall, softrese=
t,
and dbgreset), but the allOf conditional block in
Documentation/devicetree/bindings/dsp/fsl,dsp.yaml requiring resets and
reset-names currently only lists fsl,imx8mp-dsp and fsl,imx8mp-hifi4:

	  - if:
	      properties:
	        compatible:
	          contains:
	            enum:
	              - fsl,imx8mp-dsp
	              - fsl,imx8mp-hifi4
	    then:
	      required:
	        - resets
	        - reset-names

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029073257.8459=
4-1-shengjiu.wang@oss.nxp.com?part=3D4
