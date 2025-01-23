Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FB020E6E1;
	Thu, 23 Jan 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631763; cv=none; b=UzQUNmLO9XteqAaHWqbwAGVyclyGKXAnhOJm5RDzDGbqIs/qRs8sAvFq+lQMVhOMOWzzZZkTXfKrSOziwoiYEhTiMZW55LEbGzXY/8TRAAQkv8WFfeIMzktEF+cgsCKDuZwNDwNAHf5cZAwOzSsaQB4i3Q3SsQKeHGlpUrNIG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631763; c=relaxed/simple;
	bh=N8N3ctHTtc6q7q3Gx78/62AlZMmRCU/GFinMLLB39t8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FiGWKjjpxlT0eNUavljmZPvmyNVXJ9bSWd9t8YevbwGpyx7d0XIx5qnmJafbXU73YakxqJ63Mfa2v1dgopWXyeHMmlLAZ7RiYa32YyA1U2kf+swHaZDDBfYeiNAZiYTnbdhUDDW55/KBJ1Im1yMCOfbFshPjDeAxI0h7EjGFXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN7dbdCQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN7dbdCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523CCC4CEDF;
	Thu, 23 Jan 2025 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737631762;
	bh=N8N3ctHTtc6q7q3Gx78/62AlZMmRCU/GFinMLLB39t8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bN7dbdCQ6WHFkcTu2H04+SJFYDBuS+yrTayFFe3QPWgTPPkd+2DxR46YX6JlQiYin
	 myI2q9Al9P1EVxLqlLPhC5JvWxARt/k48SrNlyfJAvk29RiIQY+I2KapOHcWov5EkD
	 HmyUkcWgrJCrWc3qxwbTxdnwazdecIY9U0c5tCLYVot8sRhOZJXD1D3dDXbpC0Vve3
	 C+6DUVG9AI1P+8NmTsSV1fVlGjLS1HKASr3w7QBNGtdsVXcXna7P9fPSuJ0D3HqMV6
	 3rPB5zRdhg3W9CsL/QKcDY28omYSS8eL9fCB+dI93jKJdDvvczk5uKOaCSFXA1icyn
	 VR1bRe3pS48VQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 lgirdwood@gmail.com, imx@lists.linux.dev, 
 Alexander Boehm <aboehm@eurofunk.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250122082928.1321536-1-daniel.baluta@nxp.com>
References: <20250122082928.1321536-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx8m: add SAI2,5,6,7
Message-Id: <173763176006.25036.5796930390029675905.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 11:29:20 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 22 Jan 2025 10:29:27 +0200, Daniel Baluta wrote:
> Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx8m: add SAI2,5,6,7
      commit: b76b3ee5573fd6ff8761d82feb74d707eb2139ef

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

