Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FF3371;
	Mon, 25 Sep 2023 00:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E55C433C8;
	Mon, 25 Sep 2023 00:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695602192;
	bh=4xkAHW62S8Jkq2mIRkEfwuSwQTNMa0OWS+USdel1b5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBgnLHgTK27vPl03/VdifTM25/q0DgZT7EznTt8KM1NjOMxty3vDItaHCa2+P6akj
	 XmX+/b4Q83VVI7CXYypr7uQaaRZnAYeRoPQ3uHVDQ/S/XBx8AAqo37aZVbS1fQg0md
	 7LdUcj+Cp9p2f01Iz5mFDT/6HF2ewLW3Z/a4oG5E8eTdS+BtwU4weC5kSMREf2lgoV
	 SNOFcBE72MKASSAobM4Yzziwn+taqsVtp6sSU44wjKFng/sGmNp0xJylQd0dsYFufP
	 bafBTKAUcDMPpZIwlraC77KooEezspuFTn6akxEXWi2pgiG+mA889Fu4CcXDON37K2
	 AIz+HUvKs6T9g==
Date: Mon, 25 Sep 2023 08:36:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: festevam@gmail.com, clin@suse.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, eagle.zhou@nxp.com, imx@lists.linux.dev,
	joy.zou@nxp.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, pierre.gondois@arm.com,
	robh+dt@kernel.org, s.hauer@pengutronix.de, shenwei.wang@nxp.com,
	sherry.sun@nxp.com
Subject: Re: [PATCH v3 0/3] arm: dts: imx93: add edmav3 support
Message-ID: <20230925003619.GW7231@dragon>
References: <20230824165753.2953431-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824165753.2953431-1-Frank.Li@nxp.com>

On Thu, Aug 24, 2023 at 12:57:50PM -0400, Frank Li wrote:
> edmav3 patch already accepted.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
> 
> Add dts part for imx93
> 
> Change from v2 to v3
> - fixed Krzysztof's comments
> - drop unused fsl,edma-axi
> 
> Change from v1 to v2
> - Enable UART1 also, lpuart driver will disable dma when it is console
> 
> Frank Li (3):
>   arm64: dts: imx93: add edma1 and edma2
>   arm64: dts: imx93: add dma support for lpuart[1..8]
>   arm64: dts: imx93-evk: add uart5

Applied all, thanks!
