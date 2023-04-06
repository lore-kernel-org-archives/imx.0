Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C587E9
	for <imx@lists.linux.dev>; Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F76FC433D2;
	Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680748218;
	bh=3vmq/aqfbwSmZiecl7SOMVN6Ty8I+cMF/5ynkmxVNAM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YOekC06V9atZffKzhqsJmRk6ZWz90aLzTAVi1gs16VFOtF/fJ0Vp9MVVKJJzzDdhF
	 pHFza4svN2bQkN+IwtbG96WpFaZ7lNgFDh+buM9ykcz9LOP8dwBv3xope/BdkHzWtj
	 4wEU72ubxe5q1tPObJA0W/OgRangwbvH+xRadUe/K8FygQuAtczQm3Vhxgo2nc4kHq
	 SZiDnU9f6hfalpV26rUy6vvy4C9lYAq4ydYZWAzZvzqUV0N841Y6mjUhbOdmVmvyll
	 4RcJxr4kyUv6l7tklgACppZeVcFsz39A3wtZrP+4Lmj1o52gQhfrir+mTIkTylyxL6
	 l2R/qyrSxTFsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03682C395D8;
	Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 1/2] net: stmmac: add support for platform specific reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168074821801.25080.4300121511824003788.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 02:30:18 +0000
References: <20230403222302.328262-1-shenwei.wang@nxp.com>
In-Reply-To: <20230403222302.328262-1-shenwei.wang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, veekhee@apple.com, tee.min.tan@linux.intel.com,
 kurt@linutronix.de, andrey.konovalov@linaro.org, ruppala@nvidia.com,
 jh@henneberg-systemdesign.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  3 Apr 2023 17:23:01 -0500 you wrote:
> This patch adds support for platform-specific reset logic in the
> stmmac driver. Some SoCs require a different reset mechanism than
> the standard dwmac IP reset. To support these platforms, a new function
> pointer 'fix_soc_reset' is added to the plat_stmmacenet_data structure.
> The stmmac_reset in hwif.h is modified to call the 'fix_soc_reset'
> function if it exists. This enables the driver to use the platform-specific
> reset logic when necessary.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] net: stmmac: add support for platform specific reset
    https://git.kernel.org/netdev/net-next/c/10739ea31328
  - [v6,2/2] net: stmmac: dwmac-imx: use platform specific reset for imx93 SoCs
    https://git.kernel.org/netdev/net-next/c/b536f32b5b03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


