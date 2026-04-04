Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D481EE7B7
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775313280; cv=none; b=CizeUIEvdLBpREzwyJddaWjNb6QGBMDD0bBpeKkh8pfiMEbiovOfYhRaFTyURW6synHRbi0FK75X+oaosisU+6Zq3BVGV9giQbs5VjvMQ9vMGkuwnuDaG8ZwO9BWe5Hl/5/ubAQbydZQ548BtF52wUSJ8/apCWenR3AjkCTC5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775313280; c=relaxed/simple;
	bh=2xgJUGK4xs2Z/4HKoiHpphCYn8IFg7c1x66ai8aA2zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3cOef4+z4rGHnkkc7K0XJCMiEwmlIUjKfIaGHEj7NAMEfQ2aEVjQHAItT3MShWHCoIhVpZW0UsEnhiLh7mEamtMLqKL4RhmwdxdzorpxqC5V2/NrcdKLzxQcrzLEOMXwH8rHuivD2gxBEsM5+A6ZoXqCb6h7LIMkFDhnwgaNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwwXma6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwwXma6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5669C19421;
	Sat,  4 Apr 2026 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775313280;
	bh=2xgJUGK4xs2Z/4HKoiHpphCYn8IFg7c1x66ai8aA2zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwwXma6JBk61kxPVjXRQAQafGrGyW9yj/VSpsgw13z2oBkjQQ8WffLdOBmxczJDfB
	 y+VG3GBfItG4zWAlA2luC87AoDmSA3lHJOQXMfvp3uNeradx6x75x0rFYubP4z/tvd
	 LNb/UevxA5bVcpnx7oetaEwwSRbt6CvB/U8TZ4s0LUkSAnUmOdJO7cUv+jjdu6wUDU
	 gMjZpW/d2rFpmesHfHOs4Oj4+8kmXTFgeCrfz9CGErOPYlTMa0hkRdtsAVIpzdZ9uH
	 FV1ZqdLpQCDjuIk/tOpwVBexjTjBwWhu3soNc2aUx6jrijVB88qpdNPewWT+lx8rNj
	 GHJH8SWpWYSbg==
Date: Sat, 4 Apr 2026 16:34:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] i.MX arm64 dts changes for v7.1
Message-ID: <20260404-practical-purple-jackal-8e250d@quoll>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330141444.3789193-2-Frank.Li@nxp.com>

On Mon, Mar 30, 2026 at 10:14:37AM -0400, Frank Li wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.1
> 
> for you to fetch changes up to 825b8c7e1d2918d89eb378b761530d1e51dba82e:
> 
>   arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual (2026-03-27 09:53:32 -0400)
> 
> ----------------------------------------------------------------
> i.MX arm64 device tree changes for 7.1:
> 
> - New Board Support
>   S32N79-RDB, Variscite DART-MX95, DART-MX91 with Sonata carrier boards,
>   Verdin iMX95 with multiple carrier boards (Yavia, Mallow, Ivy, Dahlia)
>   TQMa93xx/MBa93xxLA-MINI, SolidRun i.MX8MP HummingBoard IIoT,
>   SolidRun i.MX8MM SOM and EVB, SolidRun SolidSense-N8 board
>   Ka-Ro Electronics tx8m-1610 COM, GOcontroll Moduline IV and Moduline Mini,
>   NXP FRDM-IMX91S board, i.MX93 Wireless EVK board with Wireless SiP,
>   NXP i.MX8MP audio board v2.

You do not have any bindings for these.

I found them in driver bindings (!!!) pull request so completely
different branch. This is wrong. Bindings come with the user. Who is the
user of board bindings? Not a driver, but exactly this pull request.

This makes this branch full of warnings which is completely unnecessary.
Plus this will spawn multiple checkpatch warnings if tested. It must
have also cause warnings in your case, so probably you do not test your
tree enough.

...

> Marco Felsch (1):
>       arm64: dts: imx93: Add parallel display output nodes
> 
> Martin Schmiedel (2):
>       arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI
>       arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT overlay
> 
> Maud Spierings (4):
>       arm64: dts: imx8mm: Add pinctrl config definitions
>       arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
>       arm64: dts: freescale: Add the GOcontroll Moduline IV
>       arm64: dts: freescale: Add the GOcontroll Moduline Mini
> 
> Nora Schiffer (1):
>       arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
> 
> Peng Fan (4):
>       arm64: dts: imx94: Add V2X/ELE mailbox nodes
>       arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
>       arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
>       arm64: dts: imx943-evk: Add pf09/53 thermal zone
> 
> Primoz Fiser (1):
>       arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery
> 
> Ranjani Vaidyanathan (1):
>       arm64: dts: imx94: Update pin headers
> 
> Rob Herring (Arm) (1):
>       arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
> 
> Shengjiu Wang (7):
>       arm64: dts: imx8mm-evk: correct the spdif compatible string

This breaks users of DTS and explains nothing about impact or why this
should be changed (corrected). It should not pass review of two people.
Also I could not find explanation of the impact in the tag message.

Device was apparently working fine, so it should have been made
compatible. I know that 10 years ago we did not care that much about
DTS users, but that changes for a few years already.

I am merging this but next time I would postpone the pull till some
clarifications are provided. Please pay attention to OF_UPSTREAM and
other users impact next time.

Best regards,
Krzysztof

