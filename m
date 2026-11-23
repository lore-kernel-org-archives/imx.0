Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523231;
	b=KqH3Amyjc4AeW/j9WeCtcpGG85V3rGRdZTiwHJHRB4AHyPvQ4QrvdrD8zdpKSegyj3j3
	 7NQI3Gwq4axWMMR6ffQDAMnW8w78QxJd0futYZqrAlDCd1C2v0aLXtZJwtMlDyw26VhCk
	 9sehaOR13q1y90NzPf3OjgPxTs7t9WnjewcPr9GlQ+Tm7cUSD3/r+LhyTRwQj0W0IxdgB
	 x5fU9z9nX4sr97uBELBTs34LhR42ivbcnFM6pO47i8JuYpxX4es2G9PagTy4SIY6nHANx
	 Y5YyXjQkhBUSQ2loDdFvr5fYgak6FGQDXkC0S5czqSZtjyauGAZOfP05rrctn7ZRnIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523231;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HRq1l3Ydlj8aIntOFOVF1MlM8ED/kUBZxp8/2wc4q4Q=;
	b=qmWdGpUgdc438q4I+C8QisXUdGYPig8fKxERlfD3odP8QuILKkvj3s17aY2sD5ggwmEP
	 ceoQaZALgD7RR72uD868jRqnctWFrsa9opn4c7hze15DDOeDTP59XFd6/836K8+56n4Qn
	 bGErGAncM77ZLtC2VLxh2pcUUkzgVz3lyKYFlWdbM7cvsCqdKklZe5VEG5SVc33pODDxi
	 hppF8NEGMp16VHuW8PWuQPwn6WI+Xu+RYESA3hf8E155IK/TLHhk8m7XRDSV8gvp+w/SU
	 OXCvFNrD4FeXpRjhyOu6z872ZGm2sCI6RW7zaEb3xW2MSehW8PcaC7uCkH4NvZKwmTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoJ63Ag2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516B606A31E;
	Tue, 24 Nov 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoJ63Ag2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C061F000C0;
	Tue, 24 Nov 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523229;
	bh=HRq1l3Ydlj8aIntOFOVF1MlM8ED/kUBZxp8/2wc4q4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FoJ63Ag2E0EHJSDA9U6Kzn+q/zQJKkgE/vOMd5amTzcmJ/S3b/ivzL5PHvkLx4yPn
	 s8Ij5TXdyC346x4zVCt2FVltjNVe395pXfSbn8z9W2Vjcl6teONLZ6/Y4wjPS/ecM5
	 1TuOjhXsY8ZOYeqcmRunF3tL37FH7VmGfIYQXt6M/rzFH9ZErl64j8+283CcTur45r
	 AOBBLunls2DGoSPN8vo4XNeddndlYwx+/hjqciBNbgUT5TEFOFSIGEUqXkxUEhYWeS
	 4FwJIMGsK+KVZ78ah6GflUgU5qyRB3TAxN2QTA5f5lfWSKYP2xaFIRyEgniwbac+Fv
	 nzN7tKuoCnukg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: imx@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH v2 0/5] ASoC: fsl_asrc/fsl_easrc: fix memory safety
 issues
Message-Id: <179545691274.25092.44359500270210733.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:01:52 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xkWd19CDUpGgislG7hlmubOrmWm8Glc9dEa24NfLhtI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZm2ZNeLHUICdgQsLfjy9/9360XMCeUaM7X+nAp5shv
 XP3TlSt6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE9vQz/FPmX7AixLfjzM3Y
 ws9+Vycc8hRwtVjVEHN59m6lSBndF4IM/6tOcS65kSkZmKKx1jwgQfvoqS2KT0Onmc+w3O2wnON
 zLC8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 11:37:46 +0200, Stefan Ghetu wrote:
> ASoC: fsl_asrc/fsl_easrc: fix memory safety issues
> 
> This series fixes memory safety issues in the ASRC and EASRC drivers
> that can be triggered by a user with access to their PCM or compress
> devices:
> 
> 1. fsl_asrc_m2m: the output FIFO drain can write past the end of the
>    output buffer.
> 2. fsl_asrc: a repeated hw_params() leaves a stale asrc->pair[] entry
>    that points to freed memory after close, and hw_free() after a
>    failed hw_params() can release the pair of another stream.
> 3. fsl_asrc_dma: DMA channels are leaked on a repeated hw_params(), and
>    released twice after a Back-End configuration error.
> 4. fsl_easrc: the same repeated hw_params() issue for EASRC contexts.
> 5. fsl_asrc_m2m: more than one task per compress stream leads to double
>    DMA channel release and a stale pair entry.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output FIFO
      https://git.kernel.org/broonie/sound/c/6b3f779dcac4
[2/5] ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
      https://git.kernel.org/broonie/sound/c/fbeac9352de6
[3/5] ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
      https://git.kernel.org/broonie/sound/c/0d02516a94b4
[4/5] ASoC: fsl_easrc: fix context ownership on repeated hw_params
      https://git.kernel.org/broonie/sound/c/f50dfefe6d4d
[5/5] ASoC: fsl_asrc_m2m: allow only one task at a time per stream
      https://git.kernel.org/broonie/sound/c/f0277994dbd0

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

