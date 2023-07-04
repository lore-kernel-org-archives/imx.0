Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C407567B
	for <imx@lists.linux.dev>; Tue,  4 Jul 2023 15:20:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D831576;
	Tue,  4 Jul 2023 08:21:04 -0700 (PDT)
Received: from [10.57.34.139] (unknown [10.57.34.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0DCF3F73F;
	Tue,  4 Jul 2023 08:20:19 -0700 (PDT)
Message-ID: <33362029-3d5b-b16a-27e7-578df34f0ede@arm.com>
Date: Tue, 4 Jul 2023 16:20:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Add coresight trace components
To: Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: coresight@lists.linaro.org
References: <20230505195151.1874071-1-Frank.Li@nxp.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20230505195151.1874071-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/05/2023 20:51, Frank Li wrote:
> Add coresight trace components (ETM, ETF, ETB and Funnel).
> 
> ┌───────┐  ┌───────┐  ┌───────┐
> │ CPU0  ├─►│ ETM0  ├─►│       │
> └───────┘  └───────┘  │       │
>                        │       │
> ┌───────┐  ┌───────┐  │  ATP  │
> │ CPU1  ├─►│ ETM1  ├─►│       │
> └───────┘  └───────┘  │       │
>                        │ FUNNEL│
> ┌───────┐  ┌───────┐  │       │
> │ CPU2  ├─►│ ETM2  ├─►│       │
> └───────┘  └───────┘  │       │   ┌─────┐  ┌─────┐
>                        │       │   │     │  │     │
> ┌───────┐  ┌───────┐  │       │   │ M7  │  │ DSP │
> │ CPU3  ├─►│ ETM3  ├─►│       │   │     │  │     │
> └───────┘  └───────┘  └───┬───┘   └──┬──┘  └──┬──┘               AXI
>                            │          │        │                   ▲
>                            ▼          ▼        ▼                   │
>                        ┌───────────────────────────┐   ┌─────┐   ┌─┴──┐
>                        │          ATP FUNNEL       ├──►│ETF  ├─► │ETR │
>                        └───────────────────────────┘   └─────┘   └────┘
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp.dtsi | 179 ++++++++++++++++++++++
>   1 file changed, 179 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index a19224fe1a6a..0fa74477b9e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -304,6 +304,185 @@ soc: soc@0 {
>   		nvmem-cells = <&imx8mp_uid>;
>   		nvmem-cell-names = "soc_unique_id";
>   
> +		etm0: etm@28440000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x28440000 0x10000>;
> +			arm,primecell-periphid = <0xbb95d>;

Why is this needed (and for all the ETMs) ?

Suzuki

