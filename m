Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84A620
	for <imx@lists.linux.dev>; Mon, 24 Oct 2022 02:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC996C433B5;
	Mon, 24 Oct 2022 02:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666577665;
	bh=kHPSCAbZORyH0ev4XBvQydhrlLgY6qm31vjdGV8AlbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvOgMiBIS8b8Ez31hV5gkLK9X3dQzCH4QyI2TlJqB6Ljjoa2J3cF33tNR3BYB4YIl
	 SuYudKuVMhJAhSklxliW/xohxLhloGkXmmfzp39SIOpwewFfAlSptzIdNUs40Bvbd2
	 xzQmMxuHWPxuOoSKfR6nb4hEVA0KyEVtSfbxFG5vz2Afh1L8R6iUy89NPQ2jdJkOZt
	 8Ra8KD5GnxTcq65R4EaL5E3xg87ws/gPs5RManKrE9Pj117nlR9KdPwN3Fm9v5uo0C
	 KpjhlEu3nQ9Rp1RtIf68THI29ypnv7Bq0ULEZNTev9hsNO4miJgDWjPEmJfjIfOeh1
	 M8dKCzCtoGyHA==
Date: Mon, 24 Oct 2022 10:14:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] firmware: imx: scu-pd: add missed USB_1_PHY pd
Message-ID: <20221024021417.GA125525@dragon>
References: <20220930183426.1130641-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930183426.1130641-1-Frank.Li@nxp.com>

On Fri, Sep 30, 2022 at 01:34:24PM -0500, Frank Li wrote:
> USB_1_PHY is not defined in pd driver on 8DXL.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks!
