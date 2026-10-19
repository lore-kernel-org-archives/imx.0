Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B63E4500;
	Mon, 19 Oct 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408598; cv=none; b=EhFDy300pE60V0c2svcmR1fGBZGZq4+x3/jspGkKekR6nQbJGMQarmayu5CXQwGxsjFIVW4OnLGXhn9/dKrS58I1uC0hlPt44l4tID5aYn/OMy59udjSVzs5dcJMBgGS5oaNz++hwGiuTh7obDVfjfTn6/UNgsOKJMWWjYAP1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408598; c=relaxed/simple;
	bh=bQLzH/Vrs18wMaqtS2+VVYh62o9vm5kkEgb+qTYfAGs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Xutaeq7i780wMfx0T9lH8n77L/k0OZjWMvt7z/7LtahSyxVgNg3UEB6MCJZ2nfRZpFlMclwZMLR94C93aZo6CcdXNUUZeczseA+TK5jB3WpSE51NJmoesKGQtnRiTQNA3EuovaLEUqITMV7JScJRbUUucN8VnQURfaZ8+CrtJzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqRVB3iL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqRVB3iL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B08E1F000C4;
	Mon, 19 Oct 2026 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792408593;
	bh=RjqYszNzvLk8VvgnWP0VVTE+G/3+AqcexBs3fI1Fq2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqRVB3iL02tyafdsoXiJN47cmOjCJuixIrIAEyNaq0EsBU0B78w1p5FcytsoUkr4v
	 1z27fnlKrkHcsp2MzQi2H9ESiKkJp6vr74WFtu4xD+OFAPtr4JOlc8uK31JY4WXMV6
	 4sYWbuJpIAk1B9ITl2XKfOtqPnjGa9K/aoOPK1qLsCMCvduguU3FPqbwn+y4J+Zmf9
	 Rzw9N6bDZzCkqm/s29z0Jgqd8RmtA5QQHtTPM81Ji54D6NBx/c8V9Ozx/UIac/tr/d
	 73M0Q/4WsbawufaLTPKeifGudvnFF2z+4zfD/nu9M940ZCYzDr37pGBnQtA+gi30fT
	 o9/dVX4/Jr3Gg==
Message-ID: <sashiko-outbox-177023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX937 FRDM board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019-b4-imx937-frdm-v1-2-76d949a61954@oss.nxp.com>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
 <20261019-b4-imx937-frdm-v1-2-76d949a61954@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:16:32 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: freescale: shared pinctrl-multiplexer on flexcan2/3 fa=
ils probe
- [Medium] arm64: dts: freescale: mismatch between imx937.dtsi GPU OPP and =
commit message
--

commit 27f9d906883e5428d8c5dbb12d877982379dd7f9
Author: Joy Zou <joy.zou@oss.nxp.com>

arm64: dts: freescale: add i.MX937 FRDM board support

This commit adds device tree support for the NXP i.MX937 SoC and i.MX937
FRDM board based on the i.MX952 device trees.

>     arm64: dts: freescale: add i.MX937 FRDM board support
>    =20
>     The i.MX937 is a derivative of the i.MX952 SoC, so it reuses the
>     i.MX952 device tree as its base. Add imx937.dtsi based on imx952.dtsi
>     and imx937-frdm.dts based on imx952-frdm.dtsi to support the NXP
>     i.MX937 FRDM board.
>    =20
>     Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
>     blocks and runs its Cortex-A55 cores at a lower maximum frequency.
>    =20
>     The PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM,
>     unlike 0x20 on i.MX952 FRDM, so disable the inherited node and add
>     the expander at 0x21.
>    =20
>     Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>

> diff --git a/arch/arm64/boot/dts/freescale/imx937-frdm.dts b/arch/arm64/b=
oot/dts/freescale/imx937-frdm.dts
> new file mode 100644
> index 0000000000000..d6be48c810573
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx937.dtsi"
> +#include "imx952-frdm.dtsi"
> +
> +/ {
> +	model =3D "NXP i.MX937 FRDM board";
> +	compatible =3D "fsl,imx937-frdm", "fsl,imx937", "fsl,imx952";
> +
> +	can_mux: mux-controller-0 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		/*
> +		 * PCAL6416 (0x21) pin 4 selects the CAN/GPIO mux:
> +		 * low selects CAN, high selects GPIO. With GPIO_ACTIVE_HIGH,
> +		 * mux state 0 drives the pin low (CAN) and state 1 high (GPIO).
> +		 */
> +		mux-gpios =3D <&pcal6416_21 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	can_mux_pinctrl: pinctrl-gpiomux {
> +		compatible =3D "pinctrl-multiplexer";
> +
> +		can_fun: can-grp {
> +			mux-states =3D <&can_mux 0>;
> +		};
> +
> +		gpio_fun: gpio-grp {
> +			mux-states =3D <&can_mux 1>;
> +		};
> +	};
> +};
> +
> +/* Select CAN on the shared CAN/GPIO mux when FlexCAN is enabled. */
> +&flexcan2 {
> +	pinctrl-0 =3D <&pinctrl_flexcan2>, <&can_fun>;
> +};
> +
> +/*
> + * The CAN transceiver silent-mode line is on the 0x21 PCAL6416 on
> + * i.MX937 FRDM (the inherited 0x20 expander is disabled below).
> + */
> +&flexcan2_phy {
> +	silent-gpios =3D <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&flexcan3 {
> +	pinctrl-0 =3D <&pinctrl_flexcan3>, <&can_fun>;
> +};

[Severity: High]
Will the second FlexCAN controller to probe fail with -EBUSY when both
flexcan2 and flexcan3 reference <&can_fun> in pinctrl-0?

Both flexcan2 and flexcan3 inherit status =3D "okay" from
arch/arm64/boot/dts/freescale/imx952-frdm.dtsi:

arch/arm64/boot/dts/freescale/imx952-frdm.dtsi:
	&flexcan2 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&pinctrl_flexcan2>;
		phys =3D <&flexcan2_phy>;
		status =3D "okay";
	};

	&flexcan3 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&pinctrl_flexcan3>;
		phys =3D <&flexcan3_phy>;
		status =3D "okay";
	};

When the first FlexCAN device probes, the call chain

  really_probe() ->
    pinctrl_bind_pins() ->
      pinctrl_select_state() ->
        pinmux_enable_setting() ->
          mux_pinmux_set_mux()

selects func->mux_state in drivers/pinctrl/pinctrl-generic-mux.c:

drivers/pinctrl/pinctrl-generic-mux.c:mux_pinmux_set_mux() {
	...
	ret =3D mux_state_try_select(func->mux_state);
	if (ret)
		return ret;
	...
}

which calls mux_control_try_select_delay() in drivers/mux/core.c and
acquires the exclusive binary semaphore mux->lock (initialized to 1 in
mux_chip_alloc()):

drivers/mux/core.c:mux_control_try_select_delay() {
	...
	if (down_trylock(&mux->lock))
		return -EBUSY;
	...
}

Because mux->lock remains held until mux_pinmux_release_mux() calls
mux_state_deselect(), when the second FlexCAN device probes and attempts
to select the same <&can_fun> state backed by &can_mux,
down_trylock(&mux->lock) fails with -EBUSY and aborts its probe.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx937.dtsi b/arch/arm64/boot/=
dts/freescale/imx937.dtsi
> new file mode 100644
> index 0000000000000..7912a9c282d8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx937.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx952.dtsi"
> +
> +&gpu_opp_table {
> +	opp-1000000000 {
> +		status =3D "disabled";
> +	};
> +};

[Severity: Medium]
Is disabling opp-1000000000 in &gpu_opp_table intentional here, or does the
commit message mismatch the change in imx937.dtsi?

The commit message states:

  "Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
   blocks and runs its Cortex-A55 cores at a lower maximum frequency."

However, the only change in arch/arm64/boot/dts/freescale/imx937.dtsi
disables the 1.0 GHz operating point in &gpu_opp_table, which is the
operating-points-v2 table for the Mali GPU (gpu@4d900000) in
arch/arm64/boot/dts/freescale/imx952.dtsi:

arch/arm64/boot/dts/freescale/imx952.dtsi:
	gpu_opp_table: opp-table {
		compatible =3D "operating-points-v2";
		...
		opp-1000000000 {
			opp-hz =3D /bits/ 64 <1000000000>;
			opp-microvolt =3D <920000>;
		};
	};

while the Cortex-A55 cores in imx952.dtsi use SCMI performance domains
(<&scmi_perf IMX952_PERF_A55>).

If the i.MX937 reduces the maximum GPU frequency, should the commit message
describe that instead (or was this meant to target the CPU frequency)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-b4-imx937-=
frdm-v1-0-76d949a61954@oss.nxp.com?part=3D2
