Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004C64403
	for <imx@lists.linux.dev>; Thu, 15 Sep 2022 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C37C433C1;
	Thu, 15 Sep 2022 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663243462;
	bh=RIQem7khPhER0zIIsxM9+l0wsS7loevZzvbu+Al+lKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrmLhK57lFGnX+95oZ/W9QSJRrgeKHEC/x9Fbfn3HqyXDZ5Fa1EhFeYZybBH2Tb8P
	 /QO+23oASbYMOJ70/BcHUFE14fr+HfBJpDsU/nNLEYv4h94/RmL9e8k1dZGELXOr+1
	 paxCSJZYRI5VQovh8dMphoEhm/7AZTqRif1Tovl7R+3So3fi7CqFkBnU+lZE7UVh+G
	 ycicJTwEjVRrl5oBkZixATgd7D0oSQSmf5DCzzpOIeVpuFIHRTIPcVFsQzAvdGZ5v0
	 GgzlCsrQdKPq0iWcDHJ8JvbDzETkEVd1kjAAtZfUCYu8CpLc53KQFGOfo3q9X4oQDz
	 jCRjuYk8EzPKA==
Date: Thu, 15 Sep 2022 20:04:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Alex Marginean <alexandru.marginean@nxp.com>,
	Reinhold Mueller <reinhold.mueller@emtrion.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Zhou Peng <eagle.zhou@nxp.com>,
	Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v8 0/5] add imx8dxl evk support
Message-ID: <20220915120413.GL1728671@dragon>
References: <20220914135848.118616-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914135848.118616-1-shenwei.wang@nxp.com>

On Wed, Sep 14, 2022 at 08:58:43AM -0500, Shenwei Wang wrote:
> i.MX8DXL is a device targeting the automotive and industrial market
> segments. The chip is designed to achieve both high performance and
> low power consumption. It has a dual (2x) Cortex-A35 processor.
> 
> The series of patches is to add the imx8dxl soc and its evk board
> support.
> 
> changes in V8:
>   - change the flag of gpio phandle in reg_fec1_sel node to
>     GPIO_ACTIVE_LOW to match the hardware behavior.
> 
> changes in V7:
>   - move the fec1 reset gpio into its phy node
> 
> changes in V6:
>   - The V6 changes mainly respond to the comments from Shawn
>   - Separate the V5 patch into SoC and Board commits
>   - Remove the unnecessary properties of "max-frequency"
>     in usdhc2 node
>   - Remove the unnecessary properties of "clk_csr" in eqos node
>   - Fix several coding style problems
> 
> changes in V5:
>   - change the "scu" node name to "system-controller"
>   - fix the typo in the comments for imx8dxl evk board
> 
> changes in V4:
>   - move i2c/mmc/serial aliases from soc to board
>   - correct the node names to follow the generic names recommendation
>   - remove some unused nodes in the evk board dts
> 
> changes in V3:
>   - re-order the commit sequence according to Krzysztof's feedback
>   - correct the syntax and styple problems pointed by Krzysztof
>     (Thank you for the detailed review, Krzysztof!)
>   - remove the unused nodes in imx8dxl-evk.dts
>   - dt_binding_check passed
> 
> Changes in V2:
>   - removed the edma2 device node because the edma v3 driver hasn't been
>     upstreamed yet.
>   - removed the imx8dxl_cm4 alias to fix the compile error.
>   - removed the extra blank lines at EOF.
>   - dt_binding_check passed.
> 
> Shenwei Wang (5):
>   dt-bindings: firmware: add missing resource IDs for imx8dxl
>   dt-bindings: arm: imx: update fsl.yaml for imx8dxl
>   arm64: dts: imx8: add a node label to ddr-pmu
>   arm64: dts: freescale: add i.MX8DXL SoC support
>   arm64: dts: freescale: add support for i.MX8DXL EVK board

Applied all, thanks!
