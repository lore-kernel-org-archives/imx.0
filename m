Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E67ED
	for <imx@lists.linux.dev>; Thu,  6 Apr 2023 01:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F808C433D2;
	Thu,  6 Apr 2023 01:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680745469;
	bh=drgpXKJ+0i0RnCQqppOYsWBMOPpTHwhRC91xcePhIfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lR7sXE7D2TE1JV0ZwCaWhqBsKFjdr2Hunvc9GBE4Iba7cegqS4JoYtKzjuBOjmhYt
	 uTOwt7RSp1JhL7cdj4/18XGaTYtSaGQ6UPA/o4O1bclvvTzlmIMUXq28s6BJbB8rku
	 x+Af5M153I2wJZIAI/KD2WUVIOksJMzBiLscLuYGex/bvjMgiaAAmmPd/Qo3/U8wgG
	 bGiANCHREKHoeqbKCr3NEo71ZPcvaAhmQUJqNBugVE6rKxjAe+8OthzaRC9pFwSD/O
	 Hqye4YT4BxMd7b0c4schKPjpR5M3x2pzREtHGQ6KHEOaWOgHH+6Z2YJW0T7hlAw8Dn
	 bLXdXJE0j+Tnw==
Date: Thu, 6 Apr 2023 09:44:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v5 0/3] dts: imx8qxp add cdns usb3 port
Message-ID: <20230406014422.GK11367@dragon>
References: <20230327145523.3121810-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327145523.3121810-1-Frank.Li@nxp.com>

On Mon, Mar 27, 2023 at 10:55:20AM -0400, Frank Li wrote:
> cdns driver code already upstreamed. but missed dts part.
> 
> Change from v4 to v5
> 1. using shorter clock name
> 
> Change from v3 to v4:
> 1. drop assign-clock in yaml
> 
> Change from v2 to v3:
> 1. drop fixed frequency clock binding
> 
> Change from v1 to v2:
> 1. Add binding docoument.
> 2. Fixed all shawn's comments
> 
> Frank Li (3):
>   dt-bindings: usb: cdns-imx8qm: add imx8qm cdns3 glue layer
>   arm64: dts: imx8qxp: add cadence usb3 support
>   arm64: dts: freescale: imx8qxp-mek: enable cadence usb3

Applied two DTS patches, thanks!
