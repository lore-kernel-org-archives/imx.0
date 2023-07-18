Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E191FAA
	for <imx@lists.linux.dev>; Tue, 18 Jul 2023 06:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C8CC433C9;
	Tue, 18 Jul 2023 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689662628;
	bh=9K1oNze9pt6AtdqjgxNnclXiPcumaT+jibKxRxXWzoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJhUh32gvfcTMRXBulIgQBSF0mljPh5MMR8mNAba2IpM3/E3qX2CIKUEe0AO2TRwa
	 wj84j2vC+CGk/8oUJ4XmpteVVRfrdrRaNr9MvJCSrCQQLoeSclfGw3zOupqiNetBiM
	 0CaoJ96dMzgXqynFuher99MB/Kecbp4aDPjPhlFtHuBPwVuSRXMd1RigIQXvk2au9R
	 H0DBiKP6gQr9Fj29q7bqRikcTCQKFSyCWgGy7G5L1o4iEV0ZsDlU9afYHNOhYzWRVS
	 sHd8CqLcPIdI3/QwBUoKT39PW4cxULysomSHEDnlgKBX95vRdDYjPJ128VJk9NwxSM
	 /i8krr3J1JWTg==
Date: Tue, 18 Jul 2023 14:43:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org, imx@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: remove arm,primecell-periphid at
 etm nodes
Message-ID: <20230718064332.GM9559@dragon>
References: <20230705205954.4159781-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705205954.4159781-1-Frank.Li@nxp.com>

On Wed, Jul 05, 2023 at 04:59:53PM -0400, Frank Li wrote:
> The reg size of etm nodes is incorrectly set to 64k instead of 4k. This
> leads to a crash when calling amba_read_periphid().  After corrected reg
> size, amba_read_periphid() retrieve the correct periphid.
> arm,primecell-periphid were removed from the etm nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
