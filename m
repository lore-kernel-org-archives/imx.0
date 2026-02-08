Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBD346E7A;
	Sun,  8 Feb 2026 21:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585693; cv=none; b=DYt8RJI6cKBVHOEdE0Vij88kgO/9es/7Byxprcg8cFC3cNcRHZEp9XvVZuolzAQILcXHFZ6ti7EFuEEdb170qGhxhV53OC48iZQWly8itU+wGnepJnerkLWy2U+dp1mqgj0yz0I9cYjsEVUH3fbhDmNTumpn5l31lsEDR0pi57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585693; c=relaxed/simple;
	bh=WniId9rylPyWCg6DYb8OFQ8yG1Mf1fld/+NjW0lsf8k=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OiozTt6rC/ypISXz58bbNVtfLzUzj1i73KUoSlHjvkz20+NAyNjpoDrtlCKGLQ6MkLFQDGp1eoLfRG0wPFmNFBwGozqF66uj/jNNKW7jGDdjH1TJyGnVJfolFzTk9Un1w8dnKTXXrLVkgqbLOLcILlEDOQaAtBb87BLsmgPwank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL0cmPMG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL0cmPMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A8BC4CEF7;
	Sun,  8 Feb 2026 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585692;
	bh=WniId9rylPyWCg6DYb8OFQ8yG1Mf1fld/+NjW0lsf8k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OL0cmPMGq5hb4ML2UnBGJ7XL+Cd2QuvbF2LHCwzNxbt2D5NdVfL1HUi1K2BJFm7qe
	 FO6ErvhzO/VPNdM00QJdKkXJThRqPgNp7pgtPAQo/is0wG00tWKu3YsT/8AmKsB/1W
	 Zi1lF6Y52pNAoJeqjcGO58ozFPqmmkB78ZPpN5gF7Rm4ov7vZt63BXQhH90d9GhH+x
	 H91figU7ZpSIpGrvLTiHduM/rwS4K7YyONIs7mDupxe+jsBe89IhoDPyt9tfHYoH1B
	 st2sf9XgeYYZK0mZpaXpkvQ6oZ9d6j8K+a05oJGBzVFy/Pwc3s2M24i/5M6I0M6eHX
	 rdhZtuE3oXrrg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Message-Id: <177058568882.654564.1085917355716546232.b4-ty@kernel.org>
Date: Sun, 08 Feb 2026 21:21:28 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 06 Feb 2026 09:48:01 +0800, Shengjiu Wang wrote:
> Update dt binding document and update driver to suppot ASRC on i.MX952.
> 
> Changes in v4:
> - add Reviewed-by from Daniel in patch 2/4, 3/4
> - add Reviewed-by from Frank in patch 4/4
> - update the commit message for patch 4/4
> - remove 'retry' in patch 2/4, reduce the threshold for timeout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
      commit: 37bb773b4a5a5107b92beda3447a7c6c0cfc1237
[2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
      commit: 83447a38ba9abac52bc110566d3e117753899f69
[3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
      commit: 6a8c6f5587337eceb387812b6f47bc16c125b883
[4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
      commit: b010c782341b79edbeb80706360b772db908daa6

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

