Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A44E308F2A;
	Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807125; cv=none; b=pIN+JoBeqgPhxUNGFijq6IOIM2meC5JHqV1RuhaL9cB0Vo8E7y4C40zffzCyGSl85M/3m0zP3RHdhGwKHEsBQ+8myNz8cb/CituS+2mzzvHmwJyGcToJC99OSsGDGFioLmsQIVRZYW/xGiAadrQildltzqaudx0nKnAJlM8t0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807125; c=relaxed/simple;
	bh=ObcPYFjOgd+e74qo34+MtvWuVotkWlvOL3RKKEDTZmI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OXRWz/hu90XTeK45Z2W3VNvBmsW+9g7hHbe98tJNajqCERIjT+BWSCb/7o9q6Dj4RemRZwMSB1yP4ZGKOuaBkwk8ftmAZFTT3VcTqbsfhPx68ARdHRAWWmsARK0WstDH80hP3Y3vrxnI93vFNRi9kCfILFcBKZHJq7eaaf9833c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7GH20J5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7GH20J5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A0AC4AF09;
	Mon, 15 Dec 2025 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807125;
	bh=ObcPYFjOgd+e74qo34+MtvWuVotkWlvOL3RKKEDTZmI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=g7GH20J54u0rCVGE8EBGLyIZGH8Hj7ZtySsDL4mUMySysSiFIH27khZ9Ohk/E6D/e
	 1PJqD9lrM68sZ3n9/Q1Og/upbwmdWu5gYKNM6Buwi3TVYgybxMkdkivkvZ2yCeoWBP
	 ClXE6lY9OERau/GW4JEHn94juCiK3mICNC5lpb58GCaEVtdME7Mep9+BQutIwyJ21P
	 s7prlYkwj/c9zfBY9tErNEWmERc/1pgSHJznAudsBHukGwBmQLeo3Jqvedng8IlIMb
	 PkvRaPQjQFXPfQqUvp4C8mMCe1zVcygOjIvukrA4Fvtv7w1CuBuiUVX5dRJiDwPL6a
	 ZhkOlT3ksRFag==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251210062109.2577735-1-chancel.liu@nxp.com>
References: <20251210062109.2577735-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs
 only in master mode
Message-Id: <176580712207.161056.14407929260579507141.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:42 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 10 Dec 2025 15:21:09 +0900, Chancel Liu wrote:
> If SAI works in master mode it will generate clocks for external codec
> from audio PLLs. Thus sample rates should be constrained according to
> audio PLL clocks. While SAI works in slave mode which means clocks are
> generated externally then constraints are independent of audio PLLs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      commit: 9f4d0899efd9892fc7514c9488270e1bb7dedd2b

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

