Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA532AE78;
	Mon, 25 May 2026 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723483; cv=none; b=ZAiR2mksU5h/4II0v6BgQPcoEzT1yP9kEwBbumspXtR1NAuWg4aaSeiB5BHTmV5TRvOy2y58UEQGyKq2+qTd2maNpr5jT4pPExilsoB+tg/XiTclkaA/cbu5QAuDgIIcJDwLZrTZuPSRzhQlt3NK74HPfKh22GyyM65WJL2ybhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723483; c=relaxed/simple;
	bh=mfakf2KSCdA6oLTC+W7ozYHLNIjtRk6O1EZB6UlOvIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eZh5cCPeadvJApbKKzH5XCPH8rGoMSBd7bgwnGGwTF/TGRZlNpBkZEAYiZ5rB5Y63/D7fsj2bx5tP3CfY7O/i/k5sKWDs0dpTYqIxiqLMkuyp8P4T5peRflj/B+ystNm9KW4u+HT9NBKuqwVh/RGtGSq6E+leVJkc7HTLXrUer4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPbQoCK8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPbQoCK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1F51F000E9;
	Mon, 25 May 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723482;
	bh=Rlh+oYV+P/+1/m8THqzUSHnl6pvPwf9k2pk0kwC/skM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CPbQoCK85r7KVUyfv4U3p2wcqp9owjOmyyO5fAqYM2oPq1FvX/QfiYrcOu+6W1AM6
	 UFXIpvmpla6okI91+txKBJ71yoCQi1BdW2gPI873OlOou83eA/4uOJsY/6EUvIbMTe
	 WyMJRvI5im7SPPs7bIx2eD6O4AHuYgB9Bczn7wN+LA52Fae4HIWthuD0huHKBMV24k
	 bEncvArhH8VmdBHA6Qacw4ZsAvNHA3V+Mm1K8qTxLy/qFdt/8RETG5aGikb+aNinRs
	 qoxwhCyF911HpF7YSpddwUDmZREhFaD+Ibsgpp/Gc/fAYbAEu9brD7RZ9XfUKSBmnl
	 lwAXCSo8nnZKw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 Chancel Liu <chancel.liu@nxp.com>
Cc: kernel@pengutronix.de, shumingf@realtek.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260507013654.2945915-1-chancel.liu@nxp.com>
References: <20260507013654.2945915-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v4 0/3] ASoC: soc-core: Add core support for ignoring
 suspend on selected DAPM widgets
Message-Id: <177971268540.58460.7539013149269437135.b4-ty@b4>
Date: Mon, 25 May 2026 13:38:05 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mfakf2KSCdA6oLTC+W7ozYHLNIjtRk6O1EZB6UlOvIQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFGzWus3H0DiqbvYsMNr6AhAn2YhKG9F0iSV+B
 32wu4npHTKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahRs1gAKCRAk1otyXVSH
 0KcuB/93oLl8Dd37RwlCi7zKXZ0udVgDD24fhItx7pWfOYBluGwUA3VTRlqk9uLajf0/rCnks2L
 x9cGZE2Yc44RmIsPZH7pjx8YRINcTUTnPYeAZzZ11pKZbIyEXofmxlGuullQ943JHpvSPmAfpBO
 pZzP/ksFkeSGl+hejU+Akib6DfjYbibr21CuVMf4aepOEfYIQeHub25jopsyAPWNIhSgdkfxqsg
 OxlHe7xIKOqgpD37K6zXN/LcsDJdNn7aEl6/hFg7185XVZdRKT/7aeJbRxTEjmpeOWUmFDuXfX1
 Q/Fu1mdF+RWX0wrtIVCNhCjnZxtgz52tMLU6dlP2rF4QRTFF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 07 May 2026 10:36:51 +0900, Chancel Liu wrote:
> ASoC: soc-core: Add core support for ignoring suspend on selected DAPM widgets
> 
> Some audio systems require specific DAPM widgets to remain powered
> during system suspend. Introduce a generic and reusable mechanism in
> the ASoC core to mark selected DAPM widgets as ignore_suspend.
> 
> The unified mechanism consists of two parts:
> 1. Parse and store the name list of widgets to ignore suspend in
> struct snd_soc_card
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: dapm: Fix widget lookup with prefixed names across DAPM contexts
      https://git.kernel.org/broonie/sound/c/8468c8aafe8b
[2/3] ASoC: soc-core: Add core support for ignoring suspend on selected DAPM widgets
      https://git.kernel.org/broonie/sound/c/51271184a06d
[3/3] ASoC: fsl: imx-rpmsg: Switch to core ignore-suspend-widgets support
      https://git.kernel.org/broonie/sound/c/68bb9a7f557a

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

