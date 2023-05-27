Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849932F41
	for <imx@lists.linux.dev>; Sat, 27 May 2023 13:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0A0C433D2;
	Sat, 27 May 2023 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685192469;
	bh=F9xTzeEOGRmn8fyWTyrhNj2/z4IM29BIWQUvrump24A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUv15hwoNzSd2m1ST90hEmDIneJiigCUL9psgX3zXM9pY+bPaC4ghmiKyDwVCuZbm
	 LleFQepS6oajbvJIv5wLMwQ+NQL9frkLRfK4ogFgR3c86m/vdlT77+ycmnqMMhO70a
	 PUqjt6rZI22OFFUjP4Wh+RQJMDlD6N1wW1BPgY5Rl3OjyU2z2NOzDoCCDeC/PdiJJi
	 OPuYrgJr26M78O6IXFLfo2bZLzReYakwgquPefzWbZKeuNwfkNXhKTWzUSQuy2AwJs
	 /oUai95zyo2XNckxAXnQxlPgM6YkgK2G4561Iu2jyoCC61k1c2GxFjyP9a/iCeRq64
	 qB0QnToSo7CEw==
Date: Sat, 27 May 2023 21:00:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate
 for lpuarts
Message-ID: <20230527130056.GW528183@dragon>
References: <20230526153854.469239-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526153854.469239-1-shenwei.wang@nxp.com>

On Fri, May 26, 2023 at 10:38:54AM -0500, Shenwei Wang wrote:
> Add the assigned-clocks and assigned-clock-rates properties for the
> LPUARTx nodes. Without these properties, the default clock rate
> used would be 0, which can cause the UART ports to fail when open.
> 
> Fixes: 35f4e9d7530f ("arm64: dts: imx8: split adma ss into dma and audio ss")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Applied, thanks!
