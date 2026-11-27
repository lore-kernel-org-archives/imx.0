Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747144;
	b=xafcLj32KOU1/fVzxILtPyeyCyGUJLgxZIgwfgIEjSRdFhXgDxJxcgnZrCnKpX6GqM0Y
	 x760hvNkJQ1ovgesRpn8lTRTuq95fQnOUDx2qrXp5hW/dL8T8+RyMezLDbw1ENDs96iGF
	 Hjwd8xuZcwfXtm9t+MP9edUHPxdrwqRVZxVPq5g+BL/rm3OrNuRX2yKSoFJz/38TpVKww
	 deyhz9/lZR1BQJb2Q/kZJ5ZUTZGP8RdFR6Zeg7TIwpmpmQ1ovmqhnDxOzH1tYBes1nqA4
	 fUq/bgwHcbQ3BasDl75jN2iIMbz8hDb/tpwk2F30BxTdddDrSfR9F05Oxvtx2p8CcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747144;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oGd50g5o08JPxcNGE0WIJIlu9E1Y0uUS2DPxcUBSf60=;
	b=Z6drx32S3imjDhB/ktBTUhZJalAUQnlO3wbMcLqRTbRe37x+DAyXtPptnesu8GM8jAfB
	 EPutbC9s4n/ALiQQ27riKVEdYkMyuavjdMprPyk3aB3olqDAbf812JeRkDHN47B3WTS8K
	 JvDS+9SWqqG/XUmlS/wnAjUZIUchxe6B+pmQUMyojxryg5sbPju9xuu9x4swioCP2nZRt
	 J1wRi4aZcUKLaWOLS6WhavzO/vr+1k5R4Wd00ukg5h1lzYBcxnVZIyQnoS8kaIzmjVXRa
	 ioDaJqNNZ6aT5DbORp6zIQ5Nm549OC6xjhUu+Zw706+WdVLuRZoI7tfLLdrSUbSglng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHom19kF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB5606A31C;
	Fri, 27 Nov 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHom19kF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04AE1F000C1;
	Fri, 27 Nov 2026 02:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795747143;
	bh=oGd50g5o08JPxcNGE0WIJIlu9E1Y0uUS2DPxcUBSf60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VHom19kFh9mS7761/vdL+Jkeb7YmQspR9FrQTkJcnoHYbec4daq38/AAYG5e/pjoC
	 a82gU1ClCudXRW9ugz8yWiV43y4Azpws6cyN1vISiVqyeCMJ9PNBdiTOvqiu3zuJMr
	 l4iq9sZePePxmXbK/WCzE/LrlC2i4qXqzPo7Bbx8OaLNrqvUVIOW4HX8zGTa0sgAFx
	 TE4Cg39YYY01rHdGYNFURdf/nqYHXIe7RGZPLhUSd3YalWDCSZnftqkI+HBMa7SLmN
	 iJb9JKhIiN94BdGuwgiyZ6yfyovWSca/zDyzPvBsvrgBBQOne6aRid55gie44bD1ja
	 +d4u3ejUwXPwQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
References: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: fix kernel-doc
Message-Id: <179574323628.838304.16154354505846881981.b4-ty@b4>
Date: Fri, 27 Nov 2026 01:33:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aYCkCEky3OrVydiPJIsbcM5fL1XrqTwwc6hTqbmIseQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI53jofNYptM21xz7088UhV6VrfsMKjLMEZ25a2nvwfy
 PDJqsCxo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPxvs/IsLJz4ZNXqa2Vaq5y
 zl+EP/zY/mOV9MGAO1mGL5PP7BNM+cLIcOzhpf702U++zZuXkqbqs89p+59bWRfdYzX+uy00fBO
 Uyg0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Nov 2026 21:30:39 +0100, Manuel Ebner wrote:
> ASoC: imx-pcm-rpmsg: fix kernel-doc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: fix kernel-doc
      https://git.kernel.org/broonie/sound/c/2d69cae40cf6

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

