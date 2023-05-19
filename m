Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57312B66
	for <imx@lists.linux.dev>; Fri, 19 May 2023 17:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E54DC433D2;
	Fri, 19 May 2023 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684518267;
	bh=4g8OqdutIps7VawfkwADZsolWCHLUkVTD2tZ2EN5CEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDGdGSvnlVWsmUkEn52K7K/O5LispEQrhycaR9lIiZr/ew2psx/UIjRdWecIe5PIY
	 s0hjY27ZXZvxbY6F+a3mNdyF/BLDvgXG5SvATuaBt326RCmAvbJ6M/9gvaRrnRJBpy
	 Z+coKW6MGJXUeAAhAFXhHoS1XnqJ1Q2UdTR5FdQ4WzkzNJNUuPORw3oD72++KkcMJk
	 e8dhkpnKCG2vAV75yneUWoI/8hiDmDma0nBlcFBAg63ch/rCDa4ATyyONKA/3MFzkg
	 RDi89A/fmnD3nZJAq1he3sVixBfAz2JMmsCBzJ9O3cLlovAWSlSx14MKHHoyjvuJ1b
	 g8jlrkGBf4imA==
Date: Fri, 19 May 2023 23:14:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, fushi.peng@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, kishon@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, robh+dt@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v5 0/6] phy: cadence: salvo: some fixes and workarounds
Message-ID: <ZGe1d/8tGGl+rTNa@matsya>
References: <20230517161646.3418250-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517161646.3418250-1-Frank.Li@nxp.com>

On 17-05-23, 12:16, Frank Li wrote:
> 
> Sorry I have not realized some patches were missed at upstream kernel.
> Version number continue with previous
> https://lore.kernel.org/imx/ZGOCT0Mdg3Jtar6c@matsya/T/#t
> 
> Peter's Fixes:
> - Bist issue
> - fix corrupt package from devices when start transferring less than 20us
> - fix the FSM in controller seeing the disconnection at L1 use case.

Applied, thanks

-- 
~Vinod
