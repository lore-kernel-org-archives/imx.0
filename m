Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C681A4F19;
	Wed, 28 Aug 2024 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862614; cv=none; b=EmkMWin6BHtbx/CPYo4zLMnlw1bd+KKCkeOB+WSy0T/Z45gdIFdHbq9bMekMng6oK76ulht6ux/nGZ7XYsM+690d2YqXoWNWv7zg/qgkOfUGYrQtLpVTcWWG2aug0QgD1uzIjyzk938RYM/Ob8fkCM662uuE6ABCSR5sl8CIY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862614; c=relaxed/simple;
	bh=EIyUsxVuPHc/tqcz0RsaQ8+ITlHog5y4TAfKd9yah2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lDCucVlxlNddk7PFe/pt+tSoUyn8PnIfb8c5A3hT14SyYdu0uTy8ZHs7YTJidWzX8yIm0TQeqz8BCQJ+vzpHhx9nH6ss6HeEXNtwUO9W6HGdrS3Lg7PNeqXZeYJnVDzDQ9kIjgyg85Pg1A818foO+9oEolfd6/aj5xRjSjZQalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvgpUUY+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvgpUUY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9C7C4FEAD;
	Wed, 28 Aug 2024 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862614;
	bh=EIyUsxVuPHc/tqcz0RsaQ8+ITlHog5y4TAfKd9yah2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DvgpUUY+kYyFG1F8v+X3525YnuA0c4vSYiwiq7vpmtkvnZ4ysuCzYA2rp7hB5qhKw
	 jhQwAuncRZerJ8XdHI3LnWcUEWL6T3ritlIS9lP43+gZtJRAajLBfuTrpt1l0NjdGT
	 vKFv4L2AFial1S9wKaZwU7pWe8B/WcpMpd9lndcpadRMySaU97DFIiBJ1NfY6ottQE
	 F0uJ51F7F9/F/X28GIOaxBxtsYAdEx8gTMhyGhYobww1gWCCL9rMxsxsqRMjDHDcfJ
	 sIxyr6EOkX+sXhcuozZN8z/QgpMCvFbxQDf3EjPOfRwzRX3IRHcZnFS/xSbxgzwlfS
	 6Nx7vMXjealRg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Maso Huang <maso.huang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, imx@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v7 0/4] ASoC: grace time for DPCM cleanup
Message-Id: <172486260397.92851.15087271444395174116.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 17:30:03 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 30 Jul 2024 01:01:49 +0000, Kuninori Morimoto wrote:
> Cc each ASoC driver maintainer
> 
> This is v7 of DPCM cleanup
> 
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
      commit: fd69dfe6789f4ed46d1fdb52e223cff83946d997
[2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
      commit: 12806510481497a01d01edd64d7bb53a4d9ec28d
[3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
      commit: 46fb727a28d8c7195f915150a669d927d463069b
[4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
      commit: 61e1f74f739546415570ccc1ac14e1b26afe4705

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

