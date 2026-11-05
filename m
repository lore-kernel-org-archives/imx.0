Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879343;
	b=zSgUzyPbezYZ5ZDzRGkVDWa5czHCopTxlVA1hqoBhx8LJEOnWx6Ckh7MG2w+UmmAYbzX
	 +xlGmA0vbHh3ghEWzEbWMlvgMYbEIndi3T8dshYDkaa+TiY3fbFuQvrULos4GlAfEEX/v
	 +/GZ139sGxxNyOsyzUO3gHMU6FQdJAHE/Lp/X6ws2ybtEuyZiitjoSyjRJyRuGWjwNCos
	 TPGPaxv3LDqpI7T4ZcqQgo13tAjh97zlxaGT4f1BRrlgs8Z5ujXluuxHt/FNvhNRs8jkE
	 vr8R8glpgqLLvuOaDrf5Pukcgxh5Y6gUMmY7zj9oD6H87qaYZF5X2O3++cwN9PxKVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879343;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/jC5d0rS+q4cmxCF0m5PTk+OxcNoBs/3lqvduRzrOxM=;
	b=M9gjncFUWbljfy10N2gjzk8R+b7ChvyUNfWKXCZJdyKAGNb6a3mRtCbPJapbcTdDMZYt
	 uACjcAC/8qdLpCaiwzJcxOVmIh+Cci3+YoSlKdCR5Cxm+fu2T1y4ladQ2jSuIpEcHTapN
	 cuhbXwxXMe23ZE09uTtvUVsXcmMv94UPLwQ80Q3bCTYAFSiYOpLvTbgHjUh2KcMJ3Iz8Y
	 /hNfWYiBcCg+bZJID6bgzy0Ein07m4B7VJuThTysL3n7ZakCkgTiyTqKwwDO8GterE+Yo
	 RflznPChQ8BYb47IivONlXX8ir2vwIy6HynuYXgKD0Ba9Uk2kozqiMFXUE5rs6m1KbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAW1KUUe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1F606A334;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAW1KUUe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AFD1F000C1;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879342;
	bh=/jC5d0rS+q4cmxCF0m5PTk+OxcNoBs/3lqvduRzrOxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aAW1KUUemLZXtLiBscLQMkwARKKI2/aCuLMFxQSgl5oGf4UH7b0ZE5F7dgXXx+uZq
	 i1rn4ANcWOW1sksF9sSPcSWshA9NN69aiXUsdNheSiI2ynrZiP5znuFSwxtnxE5iQp
	 uwvI43SzVYNEwLfkjWnCWPfwnOhFqfI3W+XTr80TSQMuj1sYxnb9F3mCNXjLmOAmlI
	 1CGONkKd5v44c7O0aehmvrpdwY3YHOjbHhxnLq3A1IEH5fHUvwqSjXXFtFYcLMXHFc
	 vIxV65dXJY2lkNDVVKjyyi0YCUB0CI0umuMrVNpWIvnDtgRBuDAH3Ei+bfYsOuvgiK
	 Vtwfu4x51L8Rg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3C27B272EB3A;
	Thu, 05 Nov 2026 11:49:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104022815.1484320-1-vulab@iscas.ac.cn>
References: <20261104022815.1484320-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: drop codec device reference
 after probe
Message-Id: <179384023780.2186205.14628179165151508431.b4-ty@b4>
Date: Thu, 05 Nov 2026 00:57:17 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9xMAwbkFcOKEheJ4m/qgkj5cYKA3wwz80aPGGbWSH9Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe5OrMXRK/fmPJnCNHdi4wPSZSwylZPO1fVFHWxOZUh
 jP1lpasHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIhkMMf7j9L22TvfX1jODt
 4IVXlAuWOq+TdPVeuG7+5hAV6VKOvWcY/gpvZwzN+Bx3fkrxn5VVkl3zFZ+UOm8+rtk2N/HuUmt
 5CS4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:28:15 +0000, Wentao Liang wrote:
> ASoC: fsl: imx-sgtl5000: drop codec device reference after probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-sgtl5000: drop codec device reference after probe
      https://git.kernel.org/broonie/sound/c/53865f2d4974

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

