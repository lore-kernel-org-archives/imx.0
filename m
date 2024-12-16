Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD722010EF;
	Mon, 16 Dec 2024 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344271; cv=none; b=rRQ76t07RVuIaJyen9PZl/As2fUC/8rIYNLXsqiAHLuolUVWY9QmxJukcGwxvZmb/gsSwcHEl70ZCKtIoaJ8SR1ED49v1Ex9JLqYRwUbL2yPnu3n7LR8k4ABjAfCPdXUJwYYJij9llGZhFFR0xK+1NpZZPFQAquclng/EM568DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344271; c=relaxed/simple;
	bh=Wj1Oweu+Szj7mpyYgjBeEPPhvh5D8048ZrAWL9nZ3DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1SQP2Aw1VHvFaO4MgoCH/TX1onRCDB6unj9hsQ61qyH7niocnDW9TSDoBVFtc1Y/w8T1RXboA5GRwqMwP/lDqPyivsCFkDVqi7dyWGzNzZ5rZB5iUYYTHtTSmLwyMGPda12L+vls+2AyRq1SXpKGCudwFz/O298TjlGeJmyWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj5sMwiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj5sMwiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5001C4CED0;
	Mon, 16 Dec 2024 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734344270;
	bh=Wj1Oweu+Szj7mpyYgjBeEPPhvh5D8048ZrAWL9nZ3DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uj5sMwiKyHo6YspBPoquPQgameUG7oNyAYX59Rd2tFgDP703/eJhYQXGJgMY146Pk
	 M+uQqIr2CsijPOQm8XPUMUX818tQ5trkk9+ajFmVbSvhahaklXPJNdVcP9gX6rZd3v
	 8L7X2HyvoW5A5Oo4BIw08EwlcWwhTois8FW3EoBibts7z86MuQE2R/HGslcuCZ1vGV
	 cTx6UPey2wxx/f4zyGtw6Nmj4y7SqCpDzMIwCwaa72zuHeoVcE/L+Kpei9o7X6B5ij
	 1ZhMrsZwFWgZBn7TYj2SuHUYMwk5K4mjg20ZfRYyCOyrtmIdf1Ji4Z7mjjflTDqpoS
	 +lluJM/AoKp2Q==
Date: Mon, 16 Dec 2024 11:17:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <bx3r4cs3oklfduvkg65vke3clb3fc6sseske2ellq27ifpmsnm@msz6iqvjwufn>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241212093555.1376568-2-ping.bai@nxp.com>

On Thu, Dec 12, 2024 at 05:35:55PM +0800, Jacky Bai wrote:
> The i.MX 943 applications processors integrate up to four
> Arm Cortex A55 cores and supports functional safety with
> built-in 2x Arm Cortex M33 and M7 cores which can be
> configured asa safety island. Optimizing performance and
> power efficiency for Industrial, IoT and automotive devices,
> i.MX 943 processors are built with NXP=E2=80=99s innovative Energy
> Flex architecture.
>=20
> This patch adds the minimal dtsi support for i.MX943 with
> peripherals like uart, edma, i2c, spi, mu, sai etc.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
>  .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
>  arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284 ++++++++++++++

No, this is untested, uncompilable.

We do not add dead code to the kernel. You need users.

>  4 files changed, 3063 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-clock.h b/arch/arm64/bo=
ot/dts/freescale/imx943-clock.h
> new file mode 100644
> index 000000000000..64b9d5d4051e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-clock.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __CLOCK_IMX943_H
> +#define __CLOCK_IMX943_H
> +
> +#define IMX943_CLK_EXT				0
> +#define IMX943_CLK_OSC32K			1
> +#define IMX943_CLK_OSC24M			2
> +#define IMX943_CLK_FRO				3
> +#define IMX943_CLK_SYSPLL1_VCO			4
> +#define IMX943_CLK_SYSPLL1_PFD0_UNGATED		5
> +#define IMX943_CLK_SYSPLL1_PFD0			6
> +#define IMX943_CLK_SYSPLL1_PFD0_DIV2		7
> +#define IMX943_CLK_SYSPLL1_PFD1_UNGATED		8
> +#define IMX943_CLK_SYSPLL1_PFD1			9
> +#define IMX943_CLK_SYSPLL1_PFD1_DIV2		10
> +#define IMX943_CLK_SYSPLL1_PFD2_UNGATED		11
> +#define IMX943_CLK_SYSPLL1_PFD2			12
> +#define IMX943_CLK_SYSPLL1_PFD2_DIV2		13
> +#define IMX943_CLK_AUDIOPLL1_VCO		14
> +#define IMX943_CLK_AUDIOPLL1			15
> +#define IMX943_CLK_AUDIOPLL2_VCO		16
> +#define IMX943_CLK_AUDIOPLL2			17
> +#define IMX943_CLK_RESERVED18			18
> +#define IMX943_CLK_RESERVED19			19
> +#define IMX943_CLK_RESERVED20			20
> +#define IMX943_CLK_RESERVED21			21
> +#define IMX943_CLK_RESERVED22			22
> +#define IMX943_CLK_RESERVED23			23
> +#define IMX943_CLK_ENCPLL_VCO			24
> +#define IMX943_CLK_ENCPLL_PFD0_UGATED		25
> +#define IMX943_CLK_ENCPLL_PFD0			26
> +#define IMX943_CLK_ENCPLL_PFD1_UGATED		27
> +#define IMX943_CLK_ENCPLL_PFD1			28
> +#define IMX943_CLK_ARMPLL_VCO			29
> +#define IMX943_CLK_ARMPLL_PFD0_UNGATED		30
> +#define IMX943_CLK_ARMPLL_PFD0			31
> +#define IMX943_CLK_ARMPLL_PFD1_UNGATED		32
> +#define IMX943_CLK_ARMPLL_PFD1			33
> +#define IMX943_CLK_ARMPLL_PFD2_UNGATED		34
> +#define IMX943_CLK_ARMPLL_PFD2			35
> +#define IMX943_CLK_ARMPLL_PFD3_UNGATED		36
> +#define IMX943_CLK_ARMPLL_PFD3			37
> +#define IMX943_CLK_DRAMPLL_VCO			38
> +#define IMX943_CLK_DRAMPLL			39
> +#define IMX943_CLK_HSIOPLL_VCO			40
> +#define IMX943_CLK_HSIOPLL			41
> +#define IMX943_CLK_LDBPLL_VCO			42
> +#define IMX943_CLK_LDBPLL			43
> +#define IMX943_CLK_EXT1				44
> +#define IMX943_CLK_EXT2				45
> +
> +#define IMX943_CLK_NUM_SRC			46

Drop and all other clock numbers like that.

=2E..

> +#include <dt-bindings/dma/fsl-edma.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#include "imx943-clock.h"
> +#include "imx943-pinfunc.h"
> +#include "imx943-power.h"
> +
> +/ {
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		idle-states {
> +			entry-method =3D "psci";
> +
> +			cpu_pd_wait: cpu-pd-wait {
> +				compatible =3D "arm,idle-state";
> +				arm,psci-suspend-param =3D <0x0010033>;
> +				local-timer-stop;
> +				entry-latency-us =3D <10000>;
> +				exit-latency-us =3D <7000>;
> +				min-residency-us =3D <27000>;
> +				wakeup-latency-us =3D <15000>;
> +			};
> +		};
> +
> +		A55_0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x0>;
> +			enable-method =3D "psci";
> +			#cooling-cells =3D <2>;
> +			cpu-idle-states =3D <&cpu_pd_wait>;
> +			power-domains =3D <&scmi_perf IMX943_PERF_A55>;
> +			power-domain-names =3D "perf";
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			d-cache-size =3D <32768>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l0>;
> +		};
> +
> +		A55_1: cpu@100 {

labels are always lowercase.

> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +			#cooling-cells =3D <2>;
> +			cpu-idle-states =3D <&cpu_pd_wait>;
> +			power-domains =3D <&scmi_perf IMX943_PERF_A55>;
> +			power-domain-names =3D "perf";
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			d-cache-size =3D <32768>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l1>;
> +		};
> +
> +		A55_2: cpu@200 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x200>;
> +			enable-method =3D "psci";
> +			#cooling-cells =3D <2>;
> +			cpu-idle-states =3D <&cpu_pd_wait>;
> +			power-domains =3D <&scmi_perf IMX943_PERF_A55>;
> +			power-domain-names =3D "perf";
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			d-cache-size =3D <32768>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l2>;
> +		};
> +
> +		A55_3: cpu@300 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x300>;
> +			enable-method =3D "psci";
> +			#cooling-cells =3D <2>;
> +			cpu-idle-states =3D <&cpu_pd_wait>;
> +			power-domains =3D <&scmi_perf IMX943_PERF_A55>;
> +			power-domain-names =3D "perf";
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			d-cache-size =3D <32768>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l3>;
> +		};
> +
> +		l2_cache_l0: l2-cache-l0 {
> +			compatible =3D "cache";
> +			cache-size =3D <65536>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <256>;
> +			cache-level =3D <2>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2_cache_l1: l2-cache-l1 {
> +			compatible =3D "cache";
> +			cache-size =3D <65536>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <256>;
> +			cache-level =3D <2>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2_cache_l2: l2-cache-l2 {
> +			compatible =3D "cache";
> +			cache-size =3D <65536>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <256>;
> +			cache-level =3D <2>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l2_cache_l3: l2-cache-l3 {
> +			compatible =3D "cache";
> +			cache-size =3D <65536>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <256>;
> +			cache-level =3D <2>;
> +			cache-unified;
> +			next-level-cache =3D <&l3_cache>;
> +		};
> +
> +		l3_cache: l3-cache {
> +			compatible =3D "cache";
> +			cache-size =3D <1048576>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <1024>;
> +			cache-level =3D <3>;
> +			cache-unified;
> +		};
> +	};
> +
> +	clk_ext1: clock-ext1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <133000000>;
> +		clock-output-names =3D "clk_ext1";
> +	};
> +
> +	dummy: clk-dummy {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "dummy";
> +	};
> +
> +	osc_24m: clock-24m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "osc_24m";
> +	};
> +
> +	sai1_mclk: clock-sai1-mclk1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "sai1_mclk";
> +	};
> +
> +	sai2_mclk: clock-sai2-mclk1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "sai2_mclk";
> +	};
> +
> +	sai3_mclk: clock-sai3-mclk1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "sai3_mclk";
> +	};
> +
> +	sai4_mclk: clock-sai4-mclk1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <0>;
> +		clock-output-names =3D "sai4_mclk";
> +	};
> +
> +	firmware {
> +		scmi {
> +			compatible =3D "arm,scmi";
> +			mboxes =3D <&mu2 5 0>, <&mu2 3 0>, <&mu2 3 1>, <&mu2 5 1>;
> +			shmem =3D <&scmi_buf0>, <&scmi_buf1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			arm,max-rx-timeout-ms =3D <5000>;
> +
> +			scmi_devpd: protocol@11 {
> +				reg =3D <0x11>;
> +				#power-domain-cells =3D <1>;
> +			};
> +
> +			scmi_sys_power: protocol@12 {
> +				reg =3D <0x12>;
> +			};
> +
> +			scmi_perf: protocol@13 {
> +				reg =3D <0x13>;
> +				#power-domain-cells =3D <1>;
> +			};
> +
> +			scmi_clk: protocol@14 {
> +				reg =3D <0x14>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			scmi_iomuxc: protocol@19 {
> +				reg =3D <0x19>;
> +			};
> +
> +			scmi_bbm: protocol@81 {
> +				reg =3D <0x81>;
> +			};
> +		};
> +	};
> +
> +	pmu {
> +		compatible =3D "arm,cortex-a55-pmu";
> +		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIG=
H)>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LO=
W)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency =3D <24000000>;
> +		arm,no-tick-in-suspend;
> +		interrupt-parent =3D <&gic>;
> +	};
> +
> +	gic: interrupt-controller@48000000 {
> +		compatible =3D "arm,gic-v3";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		reg =3D <0 0x48000000 0 0x10000>,
> +		      <0 0x48060000 0 0xc0000>;
> +		#interrupt-cells =3D <3>;
> +		interrupt-controller;
> +		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&gic>;
> +		dma-noncoherent;
> +		ranges;
> +
> +		its: msi-controller@48040000 {
> +			compatible =3D "arm,gic-v3-its";
> +			reg =3D <0 0x48040000 0 0x20000>;
> +			msi-controller;
> +			#msi-cells =3D <1>;
> +			dma-noncoherent;
> +		};
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		aips2: bus@42000000 {
> +			compatible =3D "fsl,aips-bus", "simple-bus";
> +			reg =3D <0x0 0x42000000 0x0 0x800000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0x42000000 0x0 0x42000000 0x8000000>;
> +
> +			edma2: dma-controller@42000000 {
> +				compatible =3D "fsl,imx95-edma5";

imx943 or imx95?

Best regards,
Krzysztof

