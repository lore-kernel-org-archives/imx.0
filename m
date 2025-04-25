Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA4A274FF2;
	Fri, 25 Apr 2025 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602821; cv=none; b=tWzQikyaRgt+Msv5p93IwWlnEEZ7pr6suS7s1GmEViX8mR/RfKTfXVDp8PEG8zbvV52CG6Sty8fXu1229KKMtg3RdAVpzXer3RS7mswAwGTp4aL8183w8SKnuRum8EWWi7EZcMyUmR5FxMcTKb78L7rmE3JZgfoA7+6xgE17NpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602821; c=relaxed/simple;
	bh=Pt4ePEGku65vc6aGjaXg157Ybch7o3RgS9Ut7NT7bXA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YKZLCM1B3OslR5+2QQ3OoH/AmBwJpHjmTSTWEvgxYm83jEBlm+ZOilF80OskVyvCaRRfkoYkSMIhyzVSXmcVkqjZbGKW/XStCPXxPNcSQDgVMXmTNANSwmygm09sf2IwjtsYErMkMvX067A8yh7GE/e7Dsg4SjIxUJxpg16CHqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIhKF8Dk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIhKF8Dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C46C4CEE4;
	Fri, 25 Apr 2025 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745602820;
	bh=Pt4ePEGku65vc6aGjaXg157Ybch7o3RgS9Ut7NT7bXA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XIhKF8Dk1OC9f1BwKqTHuTEIhthTLTAg/rNmbGd4Gmh5TTZ/eKIFhRHuJryzG9hDw
	 IxcxRd3QPxVx/G38G42J2defSXdAoe/kFWVWGYoyUILLCwErn29Bu+uvZwy1oaEfq3
	 g7l1aWXQxN2Gz1Xr+aVhOV/6EINQaltyuEZA7032kp5JHmDlahFCfApmKsqEmlg5mM
	 4ivUDtLq6ME/WBBjVj9Gn26l1KM3ceenQqreQjfw/kAVhCIXfdeufxe0ctcFtfJDVH
	 bIGOwj9b14Pexo/YMrACFjIZJHZ+OP90cTgE8cx+0gq8eT7Bbvb+jWHLaPAU/R713H
	 5xRVyIFJLe2JQ==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, imx@lists.linux.dev, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cydfr1z6.wl-kuninori.morimoto.gx@renesas.com>
References: <87cydfr1z6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: fsl: don't set link->platform if not needed
Message-Id: <174560281830.225473.18413928583304613010.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 18:40:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 01:00:45 +0000, Kuninori Morimoto wrote:
> imx_card_parse_of() allocs 2 components for CPU/Platform (A)
> 
> 	static int imx_card_parse_of(...)
> 	{
> 		...
> 		for_each_child_of_node(...) {
> 			dlc = devm_kzalloc(...);
> 			...
> 			link->cpus	= &dlc[0];
> (A)			link->platforms	= &dlc[1];
> 		}
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: don't set link->platform if not needed
      commit: 4814a8e03a18d44ab4df77bd79a9fe224e0e2abc

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

