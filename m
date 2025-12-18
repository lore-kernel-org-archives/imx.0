Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C952C11D4;
	Thu, 18 Dec 2025 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081877; cv=none; b=T8bITMLTQsmD2D73SPjkmbJMw4H2kVE/A70IqgaeeOWEGcZovZjrR/QktCPrmgI2BiatE/lCwJH38hMuhtfGd9394DbdDLnVPxlLtaYcKlvUd5OmnlVRV3x6gX9gXVrI0R2ojBGyvfMNiBeYu4Y7upDDh7dQGrfD+N6TkhGecfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081877; c=relaxed/simple;
	bh=pWxzxV2ERpNbrD9L8kun4z2fQ/h+mC0aWXfZj1yYrPQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OtjMHQ65qfijF6Fi0Ug0avZCLK+mxbSVFLeU+sQrdXAiFsaoFipdzXoSyZRk/2r6JzOIWQrUDHru2VJcq+qOjnSNCQHBwFKEs5Z82mpw4gx6CqD/hJLuqO3lqdH+Bq4RbC7cYWSIzOHAnQFXGWQcMboH17LIIQoGi6EwWHXFJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9MG8j3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9MG8j3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A97C4CEFB;
	Thu, 18 Dec 2025 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081877;
	bh=pWxzxV2ERpNbrD9L8kun4z2fQ/h+mC0aWXfZj1yYrPQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=V9MG8j3mb6EY3/o7CNWxaul3cOszPImUcKNbIxbU5vAHTZga4UXlQZsCUcNeFyO56
	 bg/26ZU7OBbsnAgL64+yHdBriENsXHAJeLWO8wmIVwqAgOgBc8KgLN/bMTithUftfR
	 lQGJgXzO7i7RFsr8tV2+fhH1v9yWEfIw6Ln4vgD6U2bsrralKt2ZuyDDAqz6Sn6/hs
	 tNDurw4NV9FWQGuKsmeHWclM5iangoulyqSv7dBNmArVKctQRyAw/Fw8NAOGEYjAbs
	 n/KNExArBNizQ8D3LAYoyJ9cyTe2KdCMBDEk8KPU+KtwrbANUF+Bq7fhLwAPkGlMlZ
	 GItvzLME36mQw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251216071656.648412-1-chancel.liu@nxp.com>
References: <20251216071656.648412-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for
 non-boolean properties
Message-Id: <176608187468.237766.15246617240590815373.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:54 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 16:16:56 +0900, Chancel Liu wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> Otherwise there'll be kernel warning:
> [   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios' with a value.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties
      commit: fa43ab13c59f4c047c479673792ed033ab567c65

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

