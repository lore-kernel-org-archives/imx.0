Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680015B3
	for <imx@lists.linux.dev>; Sat, 29 Oct 2022 02:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88DCC433C1;
	Sat, 29 Oct 2022 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667011851;
	bh=Go2NAFfKH+IszxXHlhSkZ4Sh77SiywS/Y9CIxay8nh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7ptrbGJd9p9ngvL2l5noos2Z64pqhJ60ABk9sfob5k0uOHHApQBmM5BKmeyJspeQ
	 Ab8ILRcS2S5gnfIiMBSlvl1nBu6Ytb3cm066mhE2+513Rpz64fqgYrBZ325U3zIIpf
	 ikRvwkvkm6AnoIc5+daXQmTkRfwXrjjIOjdue1Lig86HDuS2e9SIp4WNBLSKWH2Ba2
	 Bqzk+HFFijlNR94m0/jPHr9l/nqvd6stbheXih0XJhT4RNCg+fsFHDDhvnYk/F47Jw
	 8sr9OkQUmdDDsyG2DyBnje5tGjidobsTT0kOwXYqkrz457nc/UGDWDZ0BTNLPpuqm6
	 UFQhY2t4M+/4g==
Date: Sat, 29 Oct 2022 10:50:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Ming Qian <ming.qian@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx8dxl: add scu_gpio node
Message-ID: <20221029025043.GJ125525@dragon>
References: <20221011194715.647439-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011194715.647439-1-shenwei.wang@nxp.com>

On Tue, Oct 11, 2022 at 02:47:14PM -0500, Shenwei Wang wrote:
> add scu_gpio node in system-controller.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Applied both, thanks!
