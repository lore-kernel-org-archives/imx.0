Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724254;
	b=iLfl/We5XiRc5vIWt/bWMzFBwbzxOIByxxsCpGVCbkMUDPPHpO44cwnw83CPMSO0D2Au
	 cm+1UZ8N3EKfO843pzLzpbhZe39pOVVdlFAeul+/If58QI6quCOVVJKb4XGsbaFEDQzt+
	 6R1OF9J+TPd5nasfSVdkSNCaYRC4z6cu/1SJjDeJtdedrhI1QAipTEO+F4HbZ7xxJoBqP
	 c5IuHHpqcHKMjj3Ak4TmflKXpD0z8RQd0ULY1phpp0GPH23OFBQGFr3mNAKcLSa7ATVdP
	 1KduuTjYYkMqtb6y59UT7mwUE94HC0Jb/fCBlkCpkbY0unmP2btlHC+03oJ6A3w5PFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724254;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+YqA/EUQPSROfYWDD2Mvnwhj+ldCwxHuIMAYVYFeAJo=;
	b=3+MwJVQZubz6nMfb9pCRMlCOY8gjKHsdn8JJXXOXbgCbYCsKOmguFDJqwbMAK0aSxrFK
	 AngkKDt9SQIvsTrG4iW9hmOXMKcPjm6EnRl3bh2FqBjCuVs0/oj4RauZb3MpnCvLME1FB
	 Gy6BeZKFT0frh2OxNAk7vwfigIsmCGjNlQQMGsFl3F+eSoxDbuSQvzbQTgDW2NppNEWVW
	 OcSGzQqZJ1qKEynpggi4HpIPvTmaRK4eqqrEyBMWQV1M2dzUvHGNUgeBKY4uLoXSdkZcv
	 ew5JHaYViZoxhKVcReK+D2d0YgsA5xEJyp1mGtO4X3cNw9US9PTbPhlZZF+jE4BLMMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m86bHrey;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B04606A32E;
	Thu, 26 Nov 2026 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m86bHrey
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32C91F00895;
	Thu, 26 Nov 2026 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724253;
	bh=+YqA/EUQPSROfYWDD2Mvnwhj+ldCwxHuIMAYVYFeAJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m86bHreyKf05alTxdTLfpkfpZ4/iohEt/1ajg350dyq1y9g0miHep87fG2nEkyt32
	 Xlvbf++C3rjA8sFUGax3rchbcF6/F4oRnA7ePWnHB1aTIVY+5U5CtkNcHmmyE7q9Dw
	 Hkr72NTQu/YJILk0Z1pLWMh1bXZ2aWbNIccWYCPYjBxglQPh2cDn7YDQUPfWg1aJwe
	 eLbNxStJ2vT1nWHK+9uzWNJ2BmLIrBR+iwS3EjEENj82nBNivaKqdFsU0oTe5uEj/h
	 ZNdehegeXabDpbXFU21ohmQDC+Krjl873lvbirL18IoAzLrOHO6jYDbNo4kTEzrj9a
	 uhBENFISGI9Tw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
References: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx8: Switch imx8ulp DSP control to
 reset framework
Message-Id: <179570816156.142532.252987832768462132.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:49:21 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fqUxoi0I4me6jqtgp/a5cIp3cTRehPE5dY23SN1KjSM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Jt94fGBx/r3sgj8XAo86ee8PPZD0pzWtR/Sk7SflL
 2b/pzqu6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBELroz/Hefluxa0rXxYdWD
 G1N/FMfLyLecV7ZT+XyzQdTc5cCeRysY/juqZuu6h6gEnXcvvBq5RDp7Ud7Bt6/YBBuPap85pvp
 nAQsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Nov 2026 18:25:27 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
      https://git.kernel.org/broonie/sound/c/50529c05b08b

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

