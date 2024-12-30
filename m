Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9631A10E4
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 03:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735530611; cv=none; b=WNUnOtckRR7LkPHLvera9LxujQR+gu4l8HycSnF/WaGrxYUzWlrF/BEia1cX6GDkNt6Y0vDVwi2zExUZtHbYD3tASHjNtZhkc6Ep9va6bkuN0Vzc2jI+ihNyULG0Jf1LIHBJbMSlIdMDvNpEV+FkVkDXl7wF6QgVd65e6HH0N9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735530611; c=relaxed/simple;
	bh=E8gH2VVa0NDRa+XNzvORofGyAnDXKP4eUnrNVlm/nt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmOXRpbksVrPPaGZWhQ54ninnNtitCNxP+nBuCFPz3sHHGz/UJ7/iHwbzuivPc5lTNd/91krnG35xdEEXXgm9Uug06v32rIqynsWHhxfaFBfAhh7wUx3dNhXQ4H3JqP8ECwkvlmO1Cfw/U11TkQ7usOJPYyTUjYZnCuON0R+eBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eULHdMTy; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eULHdMTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RbKh81WgtbyngPn+SsJDB5TvtHitA1PETtGCx7cSW5M=;
	b=eULHdMTyiAHyXRKyuZtEFCOaDPu+KsJ8oRxJ9irgKnhh0kFJ4qPzmulCLfcQj/
	1i6w3OIoqM5Ewn745smuCbDZow6NkiLlXABGesulR4lFwT2XUQZFbN5fc3sjyQrb
	0f1L9BeDf14rAhjjYTQzFMgQqSIjwdrOScGqcve9LV+xc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXXKWPEHJnMwscBg--.61926S3;
	Mon, 30 Dec 2024 11:16:34 +0800 (CST)
Date: Mon, 30 Dec 2024 11:16:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com, marex@denx.de,
	hvilleneuve@dimonoff.com, hiago.franco@toradex.com,
	peng.fan@nxp.com, frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com,
	ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com,
	carlos.song@nxp.com
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: Add i.MX91 dtsi support
Message-ID: <Z3IQjz9XAKYm/pCm@dragon>
References: <20241120094945.3032663-1-pengfei.li_1@nxp.com>
 <20241120094945.3032663-3-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120094945.3032663-3-pengfei.li_1@nxp.com>
X-CM-TRANSID:Ms8vCgDXXKWPEHJnMwscBg--.61926S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWxKr1DWry8CFyDXF1UZFb_yoW5uw1rpF
	ykCFy3Wrs7Ka48u3sagFsYgrykJr9rXFW09F42vry0yws3Xr1xta45KF47XF48Xr4rWw4S
	gr1aqr4ftr9xuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9Z23UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRjBZWdtNPG7vgABs+

On Wed, Nov 20, 2024 at 05:49:43PM +0800, Pengfei Li wrote:
> The i.MX 91 family features an Arm Cortex-A55 running at up to
> 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> along with a rich set of peripherals targeting medical, industrial
> and consumer IoT market segments.
> 
> The design of the i.MX91 platform is very similar to i.MX93.
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core
> - i.MX91 has different pinmux
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
>  2 files changed, 840 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
...
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> new file mode 100644
> index 000000000000..be923e5076a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include "imx91-pinfunc.h"
> +#include "imx93.dtsi"
> +
> +/delete-node/ &A55_1;
> +/delete-node/ &cm33;
> +/delete-node/ &mlmix;
> +/delete-node/ &mu1;
> +/delete-node/ &mu2;
> +
> +&clk {
> +	compatible = "fsl,imx91-ccm";
> +};
> +
> +&eqos {
> +	clocks = <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +			<&clk IMX91_CLK_ENET_TIMER>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN>,
> +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;

Can we align the lines at '<'?

	clocks = <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
		 <&clk IMX91_CLK_ENET_TIMER>,
		 <&clk IMX91_CLK_ENET1_QOS_TSN>,
		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;

> +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> +				<&clk IMX91_CLK_ENET1_QOS_TSN>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +};
> +
> +&fec {
> +	clocks = <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +			<&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +			<&clk IMX91_CLK_ENET_TIMER>,
> +			<&clk IMX91_CLK_ENET2_REGULAR>,
> +			<&clk IMX93_CLK_DUMMY>;
> +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> +				<&clk IMX91_CLK_ENET2_REGULAR>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +	assigned-clock-rates = <100000000>, <250000000>;
> +};
> +
> +&i3c1 {
> +	clocks = <&clk IMX93_CLK_BUS_AON>,
> +			<&clk IMX93_CLK_I3C1_GATE>,
> +			<&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&i3c2 {
> +	clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> +			<&clk IMX93_CLK_I3C2_GATE>,
> +			<&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&iomuxc {
> +	compatible = "fsl,imx91-iomuxc";
> +};
> +
> +&tmu {
> +	status = "disabled";
> +};
> +
> +&{/soc@0/ddr-pmu@4e300dc0} {
> +	compatible = "fsl,imx91-ddr-pmu", "fsl,imx93-ddr-pmu";
> +};
> +
> +&{/thermal-zones/cpu-thermal/cooling-maps/map0} {
> +	cooling-device = <&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};

Could you add labels in imx93.dtsi to make the references a bit easier?

Shawn

> -- 
> 2.34.1
> 

