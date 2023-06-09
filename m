Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CF747F
	for <imx@lists.linux.dev>; Fri,  9 Jun 2023 14:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E87C433D2;
	Fri,  9 Jun 2023 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686319845;
	bh=pWEvgK5s7smvq54iBHJynBKQ8jT6malI3eJGPkwkTt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfWNj8U0zLfRvld8k8cn1npbE2heCFn3Y2u9pryCgAI04EjV60/1jxNC4GUJMRCgK
	 LrABEUbPTvUD+SUrBbVi+MbIf+2UPyi6ScP+BxLMX+7S6sxXS/BM474LPT0FG2zeIk
	 6W3wkly4oHISXpiYCCcGZTfUrEeJ42hJpAOBsVg3mfHm2xw61IivYD3CzGzloCy/Ux
	 pMbxee1rz/B4mEW+ezPUeQ/IRbflEuGsGAiLqyETry2bSQsmgqk/xEc3obAJ3ab/oO
	 2S28HWvjhAI/oibV+GH2jEg9K6wz8wi5gbvEx36HKtgUNKtYiYEPAK8Um4sp6s4Wvf
	 e3JfPz1EZBuUQ==
Date: Fri, 9 Jun 2023 22:10:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mp: Add coresight trace components
Message-ID: <20230609141025.GW4199@dragon>
References: <20230515150149.2790189-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515150149.2790189-1-Frank.Li@nxp.com>

On Mon, May 15, 2023 at 11:01:49AM -0400, Frank Li wrote:
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

Applied, thanks!
