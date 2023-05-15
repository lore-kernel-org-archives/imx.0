Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74B10EA
	for <imx@lists.linux.dev>; Mon, 15 May 2023 00:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC775C433D2;
	Mon, 15 May 2023 00:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684112261;
	bh=ZlJ0oVkgI0zlprQ/KHy+1dFyoFMssfZ33Pdw+Ts3G5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NazBCmbOxlej/wvIz8qbl8Vl8u1N4E+MVuDyllmzUCkJBHkRKtjOpeTrtuHS+9U6U
	 sKkDVuCzNZ9wYbF1PU96UaKmk9B6bo8SdwABM/sT59ASkK2uw8dK9kr8l1G58RMkEq
	 BOdUUGbcla9igZeBjsD52hXm405Vf+npEz1abrw2RHSlePy5WhVJw9/x2Fg1b+ODkw
	 u/cp8GeQiFIpqKQDBwpe/MsAWOzSR5yxaUxck3cXDNDfkBzg9E+fY1DnGd0+hHj9vR
	 VntNfymGXOFd9EypCsX5qoGw+BME3kmeqP+Qf21k+Qhda5ZXiklRQA075Z6zc2t5M3
	 qutCYEtL1P9yw==
Date: Mon, 15 May 2023 08:57:30 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	coresight@lists.linaro.org
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Add coresight trace components
Message-ID: <20230515005730.GB727834@dragon>
References: <20230505195151.1874071-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505195151.1874071-1-Frank.Li@nxp.com>

On Fri, May 05, 2023 at 03:51:51PM -0400, Frank Li wrote:
> Add coresight trace components (ETM, ETF, ETB and Funnel).
> 
> ┌───────┐  ┌───────┐  ┌───────┐
> │ CPU0  ├─►│ ETM0  ├─►│       │
> └───────┘  └───────┘  │       │
>                       │       │
> ┌───────┐  ┌───────┐  │  ATP  │
> │ CPU1  ├─►│ ETM1  ├─►│       │
> └───────┘  └───────┘  │       │
>                       │ FUNNEL│
> ┌───────┐  ┌───────┐  │       │
> │ CPU2  ├─►│ ETM2  ├─►│       │
> └───────┘  └───────┘  │       │   ┌─────┐  ┌─────┐
>                       │       │   │     │  │     │
> ┌───────┐  ┌───────┐  │       │   │ M7  │  │ DSP │
> │ CPU3  ├─►│ ETM3  ├─►│       │   │     │  │     │
> └───────┘  └───────┘  └───┬───┘   └──┬──┘  └──┬──┘               AXI
>                           │          │        │                   ▲
>                           ▼          ▼        ▼                   │
>                       ┌───────────────────────────┐   ┌─────┐   ┌─┴──┐
>                       │          ATP FUNNEL       ├──►│ETF  ├─► │ETR │
>                       └───────────────────────────┘   └─────┘   └────┘
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 179 ++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index a19224fe1a6a..0fa74477b9e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -304,6 +304,185 @@ soc: soc@0 {
>  		nvmem-cells = <&imx8mp_uid>;
>  		nvmem-cell-names = "soc_unique_id";
>  
> +		etm0: etm@28440000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x28440000 0x10000>;
> +			arm,primecell-periphid = <0xbb95d>;
> +			cpu = <&A53_0>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";

Have a newline between properties and child node.

> +			out-ports {
> +				port {
> +					etm0_out_port: endpoint {
> +						remote-endpoint = <&ca_funnel_in_port0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm1: etm@28540000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x28540000 0x10000>;
> +			arm,primecell-periphid = <0xbb95d>;
> +			cpu = <&A53_1>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			out-ports {
> +				port {
> +					etm1_out_port: endpoint {
> +						remote-endpoint = <&ca_funnel_in_port1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm2: etm@28640000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x28640000 0x10000>;
> +			arm,primecell-periphid = <0xbb95d>;
> +			cpu = <&A53_2>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			out-ports {
> +				port {
> +					etm2_out_port: endpoint {
> +						remote-endpoint = <&ca_funnel_in_port2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm3: etm@28740000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x28740000 0x10000>;
> +			arm,primecell-periphid = <0xbb95d>;
> +			cpu = <&A53_3>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			out-ports {
> +				port {
> +					etm3_out_port: endpoint {
> +						remote-endpoint = <&ca_funnel_in_port3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel {
> +			/*
> +			 * non-configurable funnel don't show up on the AMBA
> +			 * bus.  As such no need to add "arm,primecell".
> +			 */
> +			compatible = "arm,coresight-static-funnel";

Ditto

> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Ditto

> +				port@0 {
> +					reg = <0>;

Ditto

> +					ca_funnel_in_port0: endpoint {
> +						remote-endpoint = <&etm0_out_port>;
> +					};
> +				};
> +				port@1 {

Have a newline between nodes.

Shawn

> +					reg = <1>;
> +					ca_funnel_in_port1: endpoint {
> +						remote-endpoint = <&etm1_out_port>;
> +					};
> +				};
> +				port@2 {
> +					reg = <2>;
> +					ca_funnel_in_port2: endpoint {
> +						remote-endpoint = <&etm2_out_port>;
> +					};
> +				};
> +				port@3 {
> +					reg = <3>;
> +					ca_funnel_in_port3: endpoint {
> +						remote-endpoint = <&etm3_out_port>;
> +					};
> +				};
> +			};
> +			out-ports {
> +				port {
> +					ca_funnel_out_port0: endpoint {
> +						remote-endpoint = <&hugo_funnel_in_port0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@28c03000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x28c03000 0x1000>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					hugo_funnel_in_port0: endpoint {
> +						remote-endpoint = <&ca_funnel_out_port0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					hugo_funnel_in_port1: endpoint {
> +					/* M7 input */
> +					};
> +				};
> +				port@2 {
> +					reg = <2>;
> +					hugo_funnel_in_port2: endpoint {
> +					/* DSP input */
> +					};
> +				};
> +				/* the other input ports are not connect to anything */
> +			};
> +			out-ports {
> +				port {
> +					hugo_funnel_out_port0: endpoint {
> +						remote-endpoint = <&etf_in_port>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etf@28c04000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x28c04000 0x1000>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			in-ports {
> +				port {
> +					etf_in_port: endpoint {
> +						remote-endpoint = <&hugo_funnel_out_port0>;
> +					};
> +				};
> +			};
> +			out-ports {
> +				port {
> +					etf_out_port: endpoint {
> +						remote-endpoint = <&etr_in_port>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etr@28c06000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x28c06000 0x1000>;
> +			clocks = <&clk IMX8MP_CLK_MAIN_AXI>;
> +			clock-names = "apb_pclk";
> +			in-ports {
> +				port {
> +					etr_in_port: endpoint {
> +						remote-endpoint = <&etf_out_port>;
> +					};
> +				};
> +			};
> +		};
> +
>  		aips1: bus@30000000 {
>  			compatible = "fsl,aips-bus", "simple-bus";
>  			reg = <0x30000000 0x400000>;
> -- 
> 2.34.1
> 
