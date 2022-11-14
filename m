Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56651FCE
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 08:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A6C433C1;
	Mon, 14 Nov 2022 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668415761;
	bh=/QzUFljXoJhTjmUgRPnur7acq4R1l8evJRFwDjdzdpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNEhNDn+WkFjLIx7U/8ssLtRl3Xo57rK/6ekbxK89pSQDZ/BG3liclMoyMWXiSEax
	 CsmBAl/S7u3Ir4l6PZeykx58ZWXgua/MT5i7wMPxgIFPrOKSJUmdBH4HuvO7cje6IS
	 mo0B60Ddm3E2mA3Fu+ylexMuC7clFi+DCj445QJX38e99kuUtsq5m5ulI9XaZ9k76H
	 Ogx4f+2E7qlTUiNYMrNJuikCkCtbVC0ggXC68KjtzNocJkYBLS9eMMi9w40tO8pDtz
	 gYpX+4lC6dZpM3AI/150xS+QezyewtQVMsoCNhNaXr69ntpKACSHCOTb9Xo0hL1ES1
	 hhHWZomijy0Lw==
Date: Mon, 14 Nov 2022 16:49:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, festevam@gmail.com,
	han.xu@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, robh+dt@kernel.org,
	s.hauer@pengutronix.de, shenwei.wang@nxp.com
Subject: Re: [PATCH v2 0/6] add adc0 flexspi lpspi to 8dxl evk board dts
Message-ID: <20221114084913.GU2649582@dragon>
References: <20221111154742.2753318-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111154742.2753318-1-Frank.Li@nxp.com>

On Fri, Nov 11, 2022 at 10:47:36AM -0500, Frank Li wrote:
> Add adc0 flexspi lpspi and adc to 8dxl evk board dts
> 
> Change from v1 to v2:
> 	split SOC and board change to two patches.
> 
> Frank Li (6):
>   arm64: dts: imx8dxl: add adc0 support
>   arm64: dts: imx8dxl_evk: add adc0 support
>   arm64: dts: imx8dxl: add flexspi0 support
>   arm64: dts: imx8dxl_evk: add flexspi0 support
>   arm64: dts: imx8dxl: add lpspi support
>   arm64: dts: imx8dxl_evk: add lpspi0 support

Applied all, thanks!
