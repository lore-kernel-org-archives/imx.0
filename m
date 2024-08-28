Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355781A3BDD;
	Wed, 28 Aug 2024 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862604; cv=none; b=ZdxYtt0rz328P0mk79L/QiZ9T1QFWL/C+P0Ox08xBZZOVSgt/vJNffyRn4qAyi3/DBmQbYTfiGTX8XIYPMxpw55zkN7F/0oMY3tNYbY9zL8H1YdEkLGp9uSOk8MYHh06cucpdScnlqad706Pq6KZi0IoO9UiIWX/thBFTVXlk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862604; c=relaxed/simple;
	bh=j4jLeDpIzPZKbskW68/+PpTVh0tjaeer4IOaG6DDChY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NZQ6L1p7uMu+Evrd+ll+lvp9i3fvi/Y3v0kzc5Nd1WokmLFslUexdOaRU7t/Crvo2dXh5K78T9WjckpEdP0++iO20bEwOS3J5LAJHwqMXDeZzIw76vJgKWVBs98KEfD+3AcUo9HElYZZGk+nY8vXZVlGqzRrE+/3eOtPOFAWbXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZkPS99P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZkPS99P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50236C4FEA7;
	Wed, 28 Aug 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862603;
	bh=j4jLeDpIzPZKbskW68/+PpTVh0tjaeer4IOaG6DDChY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oZkPS99PMjSQDlmejYO5DOcf0J3MZYC6EnN2Zr6EL6r2frkfw+sOqhNkQxVgAz9pg
	 qn0oMddBruo3l7QFyqNFw3zET4JnpwOuAoVc3lf0QRdSisREGea6eSAbEPr78wfqku
	 tUF1pHngBz7YASQgcya4e+3DZGy5g8czchAMrwZX90O3khwNU4jTA7M/e9Mx4uS9Xh
	 pMAksliy4Q3mCZVMEZJxuq3Yf4Vo+atWiwCMzVfZG57a4GIci6M8lddceEAkH7IUiO
	 iv3MFi7T9DwTwyVMYhr7dotfhQjE6lPKxdnwvgwxfJEkF3NPoqIuldShLB9GEqa6/x
	 aIQxdccnE40Ww==
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
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v6 0/4] ASoC: grace time for DPCM cleanup
Message-Id: <172486259605.92851.6497771216257265041.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 17:29:56 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 19 Jun 2024 00:19:11 +0000, Kuninori Morimoto wrote:
> Cc each ASoC driver maintainer
> 
> This is resend of v6 of DPCM cleanup
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

