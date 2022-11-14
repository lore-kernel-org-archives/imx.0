Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120561FCE
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 08:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F974C433B5;
	Mon, 14 Nov 2022 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668415954;
	bh=LQSh5XFPUVPh99Anhh3nKbvcMi1wckZSME6gcm6RrHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuvFX8AODIi1lKFWgWS5wvt6tI6YOUR4iLQQISE9agW6bUQoLALtLOHqHa+/2g+lS
	 I6bmSVxfnaDnGpNnMw95jB59BWXGXfdHU+YkeDD35Ou6xP3njWgvvJh9etEcA11b9K
	 TsfHPoN2U6LPYtM7VA07TWU2/k6BZbgRXQoyH+7wBWqS9hY+aG4S3xlDlqSwgwgT48
	 Q8Cqny2CAAg71koBXfbTXw/HzXIr5C1k6fnvFD69j6oaBr45uYfoz5GF37sVcps8wf
	 MfrPpeZnkXapyhnrtsc/CE5wFifsbi5YmgMjQyfIwxgxtGfiRM2Ih6eI3Jf7bBIsZg
	 PF8MSBl2b9p/A==
Date: Mon, 14 Nov 2022 16:52:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 0/3] gpio: add suspend/resume support for i.mx8x SoCs
Message-ID: <20221114085227.GV2649582@dragon>
References: <20221111155016.434591-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111155016.434591-1-shenwei.wang@nxp.com>

On Fri, Nov 11, 2022 at 09:50:13AM -0600, Shenwei Wang wrote:
> On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> the GPIO block will be powered off when system enters into suspend
> state. This can greatly reduce the power consumption of suspend state
> because the whole partition can be shutdown. This is called PAD wakeup
> feature on i.MX8x platform.
> 
> This series of patches enable this wakeup feature on i.MX8QM/QXP/DXL
> platforms.
> 
> Changes in v5:
>  - improve the commit log per Fabio's feedback.
>  - remove the two patches accepted by Linus Walleij
> 
> Changes in v4:
>  - fixed the format issues reported by Peng Fan.
>  - change the return type of mxc_gpio_generic_config, and limit the
>    suspend/resume behavior changes only on i.MX8QM/QXP/DXL platform.
> 
> Changes in v3:
>  - According to the feedback from Linus Walleij, the wakeup feature is
>    moved to pinctrl driver, and the array of gpio-pin mapping is moved
>    to gpio device node and initialized via gpio-ranges property.
> 
> Shenwei Wang (3):
>   arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
>   arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
>   arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property

Applied all, thanks!
