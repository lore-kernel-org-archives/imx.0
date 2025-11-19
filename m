Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144AF2701D8;
	Wed, 19 Nov 2025 02:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763518199; cv=none; b=tKS/A0R0BNn1Tzxin1Wc70fm2zZSERWzS6Lsa/orrlEszn0pLiKd0qeJvPqzrBkBZKv6v3LFnDrgswiAUk6gysHULmFoeIDY2Lb+8sLV75eivd500MliO/ZhgZWpICeWoH5lo3Q41jpIHZG3YROYA/i7vK2s6fntG2mjPvSQhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763518199; c=relaxed/simple;
	bh=SpJRUPvyLTnvYIlkiszgR69FatzMOSlq2j/XN40yrTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hR3/UTP9zBtqjuhewzzEKdALhi2F2dUeifDmzMPbtZ8S2s8gyE6K87eVtn5M/COM7fzMUte7b+i00AQrScdImS5STOuA6kILIZN4qS/XuRvVXFoHBP4uHhn0MteWbsVDeFwXJost97x98Y3qya5v76E1Bv/evY5l00Fm0Cp3OcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asPh4N3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asPh4N3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62DCC4AF0F;
	Wed, 19 Nov 2025 02:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518198;
	bh=SpJRUPvyLTnvYIlkiszgR69FatzMOSlq2j/XN40yrTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=asPh4N3JW0VsvhHqsQhnyVr0qYwk4SFBTsivpRtYS81Tefwt7mv7dbQhKS/vD0vtj
	 Qsfkq87hCf1vDwTAtSVD3QinuxKtW9MHrR6O7rvxzo8qHAXYdggwsfdhT7ErVhxkDT
	 V6pIVyInCreKSKjAePq0ZyC0tyQ4DQsBRu1YV8Hwv65Nus8yqzNBKfM4i3SD6zfjUA
	 QRGXsULcMk9Oh4tjX//j0WQOgEYOaIgYEBUZ/amGxkcFVi3bXwg6Vgs/cqepGDtYw/
	 2tdpG/0FK6/CauBlp6xGQYQZcGCP6S90VJyj4yUlYrgIkNeQHbCivsGWYvuP1wjl2+
	 hZz0n/6pqeYTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
References: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
Message-Id: <176351819549.1795122.4050144756909085738.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:09:55 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 14 Nov 2025 06:35:03 -0800, Laurentiu Mihalcea wrote:
> Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
> API. The SIPs were intended to act as placeholders until the support for
> said protocol was upstreamed.
> 
> The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
> replaced by a LMM protocol command with the same effect (i.e. setting the
> boot address) since using the CPU protocol would require additional
> permissions (which TF-A already had). Apart from this, the SIPs are
> replaced by their equivalent Linux LMM commands.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx9: use SCMI API for LM management
      commit: 94000534e0883b4f4ba9882e4630cfcdf2af539d

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

