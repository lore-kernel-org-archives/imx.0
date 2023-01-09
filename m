Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8628ED
	for <imx@lists.linux.dev>; Mon,  9 Jan 2023 09:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F00CC433EF;
	Mon,  9 Jan 2023 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673257301;
	bh=QF4ZJReaQYBRFbMV6685kSf7SQRUb2qQBc23gK9PSyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKtnQHwZLzMDsuoCgVBQuwnbW2HoawmAyFtHO1US7G45IhbSC3Nm1Dwpeqrdta6iS
	 xfuLy0TZBmVopBkRgB74ijrCPRp41HOVAxenKQebnuFLilvN7Y1bgxE1FGwXr9OD59
	 PfXEP4lculUns3IV/WtUc2wVfk0L9oigVhiWMpSfpmkX8H49puPA/x+cq0n0IaUZM4
	 9c6Rq3emIXk4poc3gKNRlOvFpPqWh9K613ivnlBDb+1kaXPHkp5Pc+uaCqronfI/WS
	 OqFMQropL9HjPZ64PooPGBuQ35tvk5H28r6NWA66BJALtU3r5yltLxq65G/byx4PPO
	 R/KbhFSIe7C2g==
Date: Mon, 9 Jan 2023 17:41:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Han Xu <han.xu@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] arm64: dts: freescale: imx8dxl: fix sc_pwrkey's
 property name linux,keycode
Message-ID: <20230109094131.GK18301@T480>
References: <20230104210744.2357777-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104210744.2357777-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Jan 04, 2023 at 04:07:40PM -0500, Frank Li wrote:
> linux,keycode should be "linux,keycodes" according binding-doc
> Documentation/devicetree/bindings/input/fsl,scu-key.yaml
> 
> Fixes: f537ee7f1e76 ("arm64: dts: freescale: add i.MX8DXL SoC support")
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
