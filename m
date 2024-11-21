Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17051885A4;
	Thu, 21 Nov 2024 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732203611; cv=none; b=K6Gu3GSPnPe2kuRKSjmeF4RzArNcBJ7OHted9/rUlhMa++DLz3drbHyxwEafCEb5BW2P2MkNGf5Cwjl+0VZdJRMcXgqqq0keFS7d1IWnz4gOu8Qwz+fdmwbsIMBSHg0QQX+TnYlz5sz4/5DtKI7dDml8vAB7vMXwfxAU63XuCv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732203611; c=relaxed/simple;
	bh=YZe6apbPywKnuBiI9kxysJmS1YErPglRXgh3hvEaPok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MNoRKMrw1BgCdwiSWA8TVtEROikFd3i5Tk74ORiz21LSXxmLaK6XmjZMn1pAgvwOQYh5grUJie1FTZLYwVhdhsh/ouUzPO1CLbECLdhQsln1r0fvz7tldnHJwud5pyyBd4B4u6DOKwH+DyvUCquK04ZVMAc9EqqoHkOzv1trhkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1b6A1RF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1b6A1RF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FBAC4CECC;
	Thu, 21 Nov 2024 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732203610;
	bh=YZe6apbPywKnuBiI9kxysJmS1YErPglRXgh3hvEaPok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U1b6A1RFgralOmM19lP5XHwjJ0A03aSUPZw4sPL9upf57JHyY05sHjPS1NH5uDW+Y
	 sbHQTnfyVrOmRo04vlwUhcauTfhOFX/NpnVM1/oHgzHJTfw+917DgvtBTDq5DwBmlK
	 VJMa6A90tZ496Ol8Xo+I+NPOvzdLH91MdqbUX1gMMXrLXkor5zCehGCTQ+dbphjpAQ
	 5M37ZYqjfXRk0SniQCXrHOzSsC05dDDECoyykZNtpgP7SYSFOu4yEN1eWdjE7uso+y
	 kSMvxdochZXrFrwJg1gF6Zw2gKr9uxZhjh8uBIoYAqpwA3/UxqZ+mBoJdkA0yKsm2O
	 kjcdxOnsb7+8w==
From: Mark Brown <broonie@kernel.org>
To: viorel.suman@nxp.com, kernel@pengutronix.de, s.hauer@pengutronix.de, 
 shawnguo@kernel.org, tiwai@suse.com, perex@perex.cz, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 Charles Han <hanchunchao@inspur.com>
Cc: imx@lists.linux.dev, inux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241118084553.4195-1-hanchunchao@inspur.com>
References: <20241118084553.4195-1-hanchunchao@inspur.com>
Subject: Re: [v2] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
Message-Id: <173220360795.62732.11682946245448931724.b4-ty@kernel.org>
Date: Thu, 21 Nov 2024 15:40:07 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 18 Nov 2024 16:45:53 +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in imx_audmix_probe() is not checked.
> Add NULL check in imx_audmix_probe(), to handle kernel NULL
> pointer dereference error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
      commit: e038f43edaf0083f6aa7c9415d86cf28dfd152f9

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

