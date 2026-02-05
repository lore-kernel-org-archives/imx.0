Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE826AF4;
	Thu,  5 Feb 2026 22:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331261; cv=none; b=P5++mcjEgupq+DEAXtR2ZB/SvioQSJraYc+Uen9zNg6QuAuyWuhVM10gB7LIiP+mUukP36Y0GtNvFJ9mxBtisKMMMcIirZiqlwU4craeouTwdSp5UoD4tK7da5lvokWuczzYvbzNPRMWj2qe0xodnLi+BQFjj2hHxwY2xp53y9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331261; c=relaxed/simple;
	bh=1QH77lN80Kres8OgN/Z7IXiB0dr9VvTvVAnf9VM/fI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fJ7yjI8Pe0dlJylnAHfAUskS1OpJNSF5z1XZpQN4KpN+ZHK8blJfUR+WbmAuSSUicaWqGHlDwtHQhgNT3gbLdt+PO7iG1t92oY2xES5thuNnCPsr6b6WLOTdqQzzm283+2pfyTIaR60SJAT0z1I+HGNsBLMa2PDHUenqJ0J6iKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXubLqiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXubLqiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DBFC4CEF7;
	Thu,  5 Feb 2026 22:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331260;
	bh=1QH77lN80Kres8OgN/Z7IXiB0dr9VvTvVAnf9VM/fI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BXubLqiAttaMUSHV+NfdZ+g5tJ3ciMr5Z+t5viM96e/rmcM3vwWJgObX4Z7u3Ln07
	 99QwnpBcPTaNZ2msannroEA6RPs9O4mHfQ6VTjKMB0bAfuu52US4PplQPIdzzz1vfx
	 52m4efwIkCwC4232WrLokp6LsVblt/2PR031ty25QIeic7XLNRb72l3VO34B77HUHj
	 67hfRc5x5+WXy7PE2/dIuRHiSjc1/NnfCFN+3qjX0o1umib1tWN0v1ZgBzIYwN4r2Q
	 lbcd4UG4rJ0cSyx5+SN9Ovc2A1pKlXE3bkXB3bYpmoIjDSrR3vVfCFZEtuHU0CQjjO
	 ngNue4RAlvgug==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 kernel@pengutronix.de, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
References: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl: imx-rpmsg: use
 snd_soc_find_dai_with_mutex() in probe
Message-Id: <177033125765.213903.15587934334040553214.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 22:40:57 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 05 Feb 2026 05:24:29 +0000, Ziyi Guo wrote:
> imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
> However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
> indicating callers must hold this lock, as the function iterates over the
> global component list.
> 
> All other callers of snd_soc_find_dai() either hold client_mutex via the
> snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
      commit: 84faa91585fa22a161763f2fe8f84a602a196c87

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

