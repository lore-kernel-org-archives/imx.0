Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF23DBB6;
	Thu, 23 Jan 2025 21:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667263; cv=none; b=hRwPQwN3EAKsT0nttpaO/71Vllpg3hP83AdT2EAkcWPksStjeBngRc/uukvofXhDb4HSwun/IGMm6ALfRsz+Bkxhj5aqeUA14a4NEbZfy6TTaDwVSf0hgS63ANUJ1fmKrSTISPXcY0M2SJKuq5JL/8tXcv2zslabrTxXZPB+khY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667263; c=relaxed/simple;
	bh=tuOw4Ciq0xOtOTUjc7Zy0bF2QdZE47PH3/38Axm4biY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EsC/R/ORWRHkIbqhQrNWgK9T8+zz4BqRC7OcgQ2DnZ4bHQsBYFJ+XNxHiBgTt8iqj1FvsKb3LWr0W7f/GPTwzz3ABXAGZvrr8L18JWhfiFxgFZ57hDOMsWAL7Mkc4HSgQw3XQpTvOB3k0vqe5fvUxScAbbbb7nw/RngbW0UNT/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDCqlbBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDCqlbBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CA1C4CED3;
	Thu, 23 Jan 2025 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737667262;
	bh=tuOw4Ciq0xOtOTUjc7Zy0bF2QdZE47PH3/38Axm4biY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LDCqlbBpMywyho8D7bVAM3BuKtdRQ9aZKRnL07ogUXrKZ/fFZx/HeuK6vYOvkXNHo
	 gj1e8sLvbyjah0IIo632PPoJ/Sww5Od0JKOGdH/fnEBByh6qcYUfVHdFjE1ix20x3T
	 k7t+1sG7atIu+D24kwIN0GQmMqGpJ2ZfWos3YZRgkFAw5m31+uHPV2Gv3kujbd+fDR
	 UV6CLignNxnwx1C7p+Av3dX8ATJSbTU6hwz6cqstmWgGR/4kZtgavE2r56QPMpN25M
	 58XsWrlMVvDk5zuIt6IJxqFxo0ceIC/sBN9cInPbX47Sfc9rqwtEkUYfprM29tZiLP
	 5UKGKgSdSZkDw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, conor+dt@kernel.org, peng.fan@nxp.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20250122163544.1392869-1-daniel.baluta@nxp.com>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH 0/4] Add SOF support for new board revisions
Message-Id: <173766726032.133083.14869968684527769407.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 21:21:00 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 22 Jan 2025 18:35:40 +0200, Daniel Baluta wrote:
> We introduce SOF support for new board revisions for i.MX8MP/QM/QXP
> which wrt audio they replace wm8960 codec with wm8962.
> 
> Also add support for cs42888 codec on i.MX8QM/8QXP baseboard.
> 
> Patches 1-3 are already merged in linux SOF tree and they can be merged
> via asoc tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: arm: imx: Add board revisions for i.MX8MP, i.MX8QM and i.MX8QXP
      commit: 4b24c69af9cd5bd8fe98ab2ddd822d73f5e20a00
[2/4] ASoC: SOF: imx: Add mach entry to select cs42888 topology
      commit: 66084793fac9c8b841f65da1809ad0ad398f9f2f
[3/4] ASoC: SOF: imx8: Add entries for new 8QM and 8QXP revisions
      commit: a9f54c7fbd2edb28c8d4d812be3d0129167f92d4
[4/4] ASoC: SOF: imx8m: Add entry for new 8M Plus revision
      commit: af65d7d041d486cc55530e14d806e16143037962

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

