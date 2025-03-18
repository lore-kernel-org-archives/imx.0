Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CF212FAC;
	Tue, 18 Mar 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315347; cv=none; b=lVCcvNV+ThshYFGlDmSnavEDqUWoZ8Scfq1XWIqopcJic04lDsByST/Lqzslm/7xhUtkLgGZCQn9ca4gYuWpLqX2ieUxVkO2h6gOid06lRQeS5RpujfseAbE8oE2hJEtVgdkSmAe5tN2ipHWT0qIsCCWa2sHyhRtPUjl5znRVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315347; c=relaxed/simple;
	bh=CQkTVR5W6jN8FTtFT51uf7uIVr+B3UlEoOqBrGiOb7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U0pQjoeIf/E4cjs2R5ogPtYuSO7YzBuKcEna5QoPGNGDeGLYaxDCZ/vgpZjO5evQeBldm71Grvrk0efqhYAFkCtm5TikscqT0RBeE6IrynBURZw29I9RH8lBiCh7PFTJcVRy0Nsr+jcN9869X88c6S6cSCWS01hEIFCA2uehp7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8rC+aMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8rC+aMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F165C4CEDD;
	Tue, 18 Mar 2025 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742315345;
	bh=CQkTVR5W6jN8FTtFT51uf7uIVr+B3UlEoOqBrGiOb7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A8rC+aMSvzneKuAVXqlowQjEw7mMOE4/yL/vfEaKET0LPR91ma51QNlLHPWtzcks4
	 +dq6bkEy+qPOMq+nSVqZfAhnu2PUvSgT0+JRElYe88LOBhKHlpK6/UMiQXeQ8rG53G
	 DyLSHfS8W91e5XoTwH8PC994bEn/K3fIdRiRUokhrL1wSn/p8j3pMRx0zEeL1Tr2jl
	 Ooo1+6t0v/OjdAZIKud3IuNVceS+qBJG3ET+pwwpfnYRCArE7Y6JVce2E2frm191CL
	 T6NGdX83EMKP881E9Swm086+ITvUeXiXjUsCqWtdwFuHsKdGVxoHFb4EH0EWjzk4om
	 PrPEX6+lUYaIw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Subject: Re: (subset) [PATCH v5 0/3] add sof support on imx95
Message-Id: <174231534280.179247.7213620173027724495.b4-ty@kernel.org>
Date: Tue, 18 Mar 2025 16:29:02 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 11 Mar 2025 12:32:52 -0400, Laurentiu Mihalcea wrote:
> Add sof support on imx95. This series also includes some changes to
> the audio-graph-card2 binding required for the support.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: support imx95's CM7 core
      commit: 811944a790451169876947a89338d2b86ff9fe5b
[2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
      commit: ed92f40eccc801bd0e5dfd78b1058072638471f1

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

