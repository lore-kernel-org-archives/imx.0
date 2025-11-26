Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253BD2E228C;
	Wed, 26 Nov 2025 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194725; cv=none; b=HsPSydsJ47zLxU8J6FJ6psQxjF5zGAhM41kVmVHc5beeTAqpWVreXu/UnPuArqPsxzlzWWb32fn2pkQTWcqR2c6mztkibubG0Kk+wlF/N+4USIbfduBYZO1PRukQnQkxox2OYc84DgzIoFba7nE2sgl0nr6zMuMRxNyfN2yUYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194725; c=relaxed/simple;
	bh=qjypqAhSdHEv0LGJSOTuNEGmIHFAdFLubLTiD2vfKh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lHqs3JOgJ5UHN64cQzOeDO4AjJRJiYPMaG7BJ+CcaGMdBF/REvde63kSVxJKIW5QXehASFu2eIhnnjdjDThI0lD7Lbr4LhPzpuq1lK7ZBcle89ez8LHuacJSogW99i3LSvkrhzrPq+p0lQmL9prDng2Tal6d+64iY7issoa0sY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQjUTUTi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQjUTUTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DBC4CEF7;
	Wed, 26 Nov 2025 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764194724;
	bh=qjypqAhSdHEv0LGJSOTuNEGmIHFAdFLubLTiD2vfKh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hQjUTUTioHpjSn3KWvOSVDRP5yBj9Ei9rzYGZ02nf0cp2wYg20DdIRCiy3j65sm7/
	 2KcPaygyNgF50QidfArsgNDNi3xAlVju+aC9gOKirWUxzJNrslqqNrW2hz89Wyffgw
	 Sd67zPOe+jz2lw5C4bbvgel1bVz5m15SRo7KMupDqD8g0LyWbRvJWXjmYyzt0rp+oF
	 +pGtuuPCrukGrGXcy+h8EpLlwEYfeXocLfCtE4h949uXdYYxbljSkg6U+CaT5ItrH4
	 DO9I5QDSRnw0EqLtAR1fzZLutAZoEjJxYNUZsUQaigCohTRNfjUawP5Uw+pNR4RIpV
	 VjTln1jq4nbQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Samuel Kayode <samkay014@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] regulator: Use container_of_const() when all types
 are const
Message-Id: <176419472245.151653.5849861246383246238.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 22:05:22 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 17:58:43 +0100, Krzysztof Kozlowski wrote:
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.
> 
> Some drivers already have const everywhere, so container_of_const can be
> directly used. In few other drivers, the final pointer can be constified
> that way.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/8] regulator: Use container_of_const() when all types are const
      commit: ac1530cdea9846c6bff31827c0c4dffcbc186e6a
[2/8] regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      commit: 788915a22bdfde0925c074056056e7d408c242d0
[3/8] regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      commit: d02ea816cccae6c02c7c026b5a74bf99a784c9c8
[4/8] regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      commit: 7a7e1ed307de6cc68639f602f3fa247ec0903354
[5/8] regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      commit: 50011cacaeb9556d65067ec8e757e3987ecf0f2b
[6/8] regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      commit: 438e90a287c86253dbb47e7fa43c4474f91ee7eb
[7/8] regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      commit: 03c3bdebaad23d6698a3cb8a11a915d8bdebf28f
[8/8] regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct
      commit: 6341646f7225343f57c8cbcb6a4d25b3270f4111

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

