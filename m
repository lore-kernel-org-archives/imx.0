Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A11FD8
	for <imx@lists.linux.dev>; Tue, 18 Jul 2023 12:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6476AC433CA;
	Tue, 18 Jul 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689682203;
	bh=Bwi6+hxv+njlD1feI8RZMPqKlUapw7YCTAxkf6ATuhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SQVguFhEExz6ZaiyvqImE9Y5tzDDd9cS8Oqp3xWI+3BHvcZ1S/fWg0cp/zisODT8s
	 SUUXsPv2BtkZDB+sYjPd9PjuhZYBvsQwOxpbG15GgIklVR14n587oAkPMAuHW8VZQ+
	 PmlXbPoRw8M6On/lXN+aHXBsgJisTiaRkKrosKzxrQJPa1N+LqwvJVza33HOLxq8kU
	 IRhVJMecozYtWQG7uCc1Gehj+OPcIWCnMcWUuTcXBBH+ZgQoPWOaSVkXPat17eME5N
	 Exy1txTw1eU/j6dd+iiDtXvBYZHJUcGssUiePQlKIiq/y4Zj+kVgVrgxH8EJCMUCNX
	 XWyLvgN5p9Hcg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vladimir Oltean <olteanv@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Wolfram Sang <wsa@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, shengjiu.wang@nxp.com
In-Reply-To: <20230713222513.1636591-1-Frank.Li@nxp.com>
References: <20230713222513.1636591-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] ASoC: codec: wm8960: add additional probe check
 for codec identification
Message-Id: <168968220008.40723.6109543633673896312.b4-ty@kernel.org>
Date: Tue, 18 Jul 2023 13:10:00 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9

On Thu, 13 Jul 2023 18:25:12 -0400, Frank Li wrote:
> The wm8960 codec is not readable, resulting in a NACK for address 0x3d (8-bit).
> This can partially indicate it. For example: wm8962 codec use the same address
> but is readable. This additional probe check will help prevent loading the wm8960
> module incorrectly on wm8962 hardware.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wm8960: add additional probe check for codec identification
      commit: 8b30cdbe0b911562fc1496078162dc9547b69be5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

