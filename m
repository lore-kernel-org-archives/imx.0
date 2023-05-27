Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C223212
	for <imx@lists.linux.dev>; Sat, 27 May 2023 11:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE3FC433D2;
	Sat, 27 May 2023 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685185952;
	bh=DHie1fsJ4lVJ6CPFrMrG9ZP2iRmTlEn7Qk6fw43xqrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Daca2Bu2NINYXEw2GJH+JMQnCNcxPOmhhHYW1c19rR6U509RWklMPTtwlrquPzGmY
	 HYvJkNThtBrSLwJgw6qPdhf3sLadxaeVG9Tv7uMu/cnc9r4EDy04BDNhiaazJ/A9zJ
	 C7ogE7Rt1ms1rNa2KD3+ejoQfg73gAe+sXUuaugUJsw7SFWpnhGaU+titzqNWf21cw
	 51OztUthrFnoRqnjEgyolrlW0yZVkbTXUEJVlwYwx7iU3QT0sJv1X3kMLuzrmIQ5vw
	 5EYVtI+dCuBPYEv20xV88843ESz7thkt2jmKiGneDCFkzn6tNPSnLOlFWdHH3UwMNz
	 4SUy/93WQOv8g==
Date: Sat, 27 May 2023 19:12:19 +0800
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
Subject: Re: [PATCH v2] arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD
 and WP signals
Message-ID: <20230527111219.GO528183@dragon>
References: <20230518135421.1905616-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518135421.1905616-1-shenwei.wang@nxp.com>

On Thu, May 18, 2023 at 08:54:21AM -0500, Shenwei Wang wrote:
> The USDHC2 CD and WP sginal should be on LSIO_GPIO5.
> 
> Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Applied, thanks!
