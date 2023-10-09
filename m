Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357618035;
	Mon,  9 Oct 2023 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCs4bRIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CB4C433C9;
	Mon,  9 Oct 2023 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696858119;
	bh=pGZdqxaNbSq8zH8pddJczhlBAt0WXXUqziSW3uxHY+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCs4bRIUD+5WgYumsAXYu+nalONVyN4lPVv6fX2VhweZRjn18F0q0rCk0+07kBi9b
	 WM5891lcDys06zCyjAQehaq6wO87hxXPJIyttyB2Jya+BXeeV3A9tcuvpfwRBkdxGK
	 GOszUBSXUcNBF7Z9p42OOIE9tJwtmEHH5Idwm2nYAfdp8aD5pUyfeSJUejeyB/zu8U
	 6D4F6/1yI1w7YVJGxX8ETgaWquzkGyXfVvpfY79EW3uk/KKO+jHhlVPETMUloExr0u
	 kkkGunMavXEAzDUEuqOgKCPeVZqOnQtq3jHA3CIXwP7ShQHWr6c/1PPTs5XjSSXgrU
	 TqCLFyA3XNCqA==
Date: Mon, 9 Oct 2023 21:28:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: clin@suse.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	eagle.zhou@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	joy.zou@nxp.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, pierre.gondois@arm.com,
	robh+dt@kernel.org, s.hauer@pengutronix.de, shenwei.wang@nxp.com,
	sherry.sun@nxp.com
Subject: Re: [PATCH v2 0/7] arm64: dts: imx8qxp add emda support
Message-ID: <20231009132819.GF733979@dragon>
References: <20230925204913.3776656-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925204913.3776656-1-Frank.Li@nxp.com>

On Mon, Sep 25, 2023 at 04:49:06PM -0400, Frank Li wrote:
> eDMAv3 patch was accepted.
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
> 
> This is dts parts.
> 
> Add 8qxp edma support and enable lpuart1..3 dma support.
> 
> Change from v1 to v2
> - rebase scu-pd.c to 6.6rc1
> - change "F" to "f"
> - Add 8qm edma dts change.
> - Add lpuart0 dma setting (console tty will disable dma)
> 
> Frank Li (7):
>   genpd: imx: scu-pd: fixed dma2-ch domain defination
>   arm64: dts: imx8: add edma[0..3]
>   arm64: dts: imx8: add edma for uart[0..3]
>   arm64: dts: imx8qm: Update edma channel for uart[0..3]
>   arm64: dts: imx8: update lpuart[0..3] irq number
>   arm64: dts: imx8qxp-mek: enable 8qxp lpuart2 and lpuart3
>   arm64: dts: imx8qm-mek: enable 8qm lpuart2 and lpuart3

Applied 2/7 ~ 7/7, thanks!
