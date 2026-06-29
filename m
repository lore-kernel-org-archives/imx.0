Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE03F7899;
	Tue, 30 Jun 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818201; cv=none; b=SteLX1rZ04/5okTMwaGnReUPQq25Jcz9n3l7Z+sEQ+IMJMJIyEOrmb40AXo77ZQ5TMbONt+vgjYD8PCSzRaF1ej0dxukp9x+wGfjkJxPgvr0wb7ubTWgwqcLXgLc151i5H4kCF/e0TOcRemP/XKobfX0dVO01SCf6C2Uo8E1Tcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818201; c=relaxed/simple;
	bh=suxmd7hBx6haxwfUYdAMlT9JDpZz5886NYdo7Mep1MA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LuqoO38IC+nqC1F0lnF7ghPF9IEPNCEL5mNh3Rtt71mHZkgJK+GcBty28sNSDVokYp+9RTRO/SCo5HUuBBZsotuQspV5jGRUsmI8v6mfuMAo5+j3eHSoFet4lq7UDQkNhC8SXsP5fTROIoCRYVrXOEeZGIEVQx/jBsBjhHydh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/b/6v/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/b/6v/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD70C1F000E9;
	Tue, 30 Jun 2026 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818199;
	bh=1JPnrdxJvL0WFN5wrOSvEBToBxSFJluscDvZ5wP//rQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a/b/6v/GIOOHx3mkurLDiSwCYEV+FaF40ZarjWBYs9LAk/x2Dab1vbwzWPBbXumSY
	 qCL/R4hpI/xR+csPkyDFeDvW4uWAciPLePWgJiybdXppe5u25pNrNFO4tn1dzd3v3v
	 kC6+KrIIGd52n54CP2TaUk1hT7OeTv7S2pKHfi+YAo9wHuuiDJxubujr9JwfkcthuH
	 qCTk6N3IiLNlrXU3sJcZR+gK9/ZuSgJY1RV8MfARE0y6eRBx9npsHpyXb96vPKEeik
	 8JCRbFXSCYsoI7lIBSyw4rxO1bn3/GJeaS+q+zB4cPOZNcw+UUdVipomdASSnvbce1
	 t6tWQb7qzWNGQ==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Message-Id: <178275717908.47562.6018027459951398381.b4-ty@b4>
Date: Mon, 29 Jun 2026 19:19:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=suxmd7hBx6haxwfUYdAMlT9JDpZz5886NYdo7Mep1MA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WTVpXn+QGYzZVDWj262eDQ3hIPy1Vgt4Fm/
 PIjKaF1pxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlkwAKCRAk1otyXVSH
 0AIZB/9pCqWJBKcMORA4HBEEOe7lHfNBdFAzXulEYYl+5A2SiJEdEPvc4Ga9EUUxHrNPS5I4j+P
 deSVsyW0G3OLOTfvVl532NgIvjBtFV3RUjyR4wbrfKtabENJsnxhC0WD40xWSRfVA4ZuzoFc7Zi
 f0qBGcqMWEpTLSdNMPURlZEfhPDctucv4ocZA8ajy/rGXo8Uy+dxI5D+VZq/04pUhz08nU0DCSJ
 +ZIRf3WapsbVH1DdZhOGB6IevhavBKBK84tajirZ6/6E/qraFYdDhGzKHXSOhsqshuzC796HZX0
 WXOBmsq8g0rx9F6D5E+sms6w0i+dK0mbimBO9/HarTYFVEPS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 16:38:13 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in the FSL sound drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/11] ASoC: fsl_asrc: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/d7e261b7ad1b
[02/11] ASoC: fsl_audmix: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/58712476dee2
[03/11] ASoC: fsl_easrc: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/48d84310be60
[04/11] ASoC: fsl_esai: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/cb87bdabd341
[05/11] ASoC: fsl_spdif: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/a1b865cff274
[06/11] ASoC: fsl_ssi: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/4d748e7082ec
[07/11] ASoC: fsl_xcvr: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/94b0cb1dd6d9
[08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/929d412fdb0d
[09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
        https://git.kernel.org/broonie/sound/c/11ce4dd4e7be
[10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/caed9fb2e428
[11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/8a2d7e46317a

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

