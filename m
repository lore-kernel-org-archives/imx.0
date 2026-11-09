Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251395;
	b=fyca46AZbPYXrQCzov8l9GLPxxpS/BDyEDvPrJIJUIRKsLCiXNfwVNJEfWfMcfNW8CcJ
	 acEoC3vzNtmLSq2OaNZciEqfm3ZKGkps1JuCgfdPxmlj15pk+5HE56/ixKUdMmON3lyHw
	 qERo6Lw74PxCjzxuDclyEgaDgP5tDRKBGqKPp0yt3CvNFD/q/nDYhikq0mxQFujHmVxZz
	 zNzs4jZeCefJNyD9a1uWtnCXOGIqXa5yE3SH1ldLrC5hCpoHQwrdbX2ikOBtd/corTUCD
	 3ryO3ikRgoTWPf2pvAz4lYzedqxrQzARXJdZ8zyNvi4u54C+Ikw+0kkJFGYC/Hlc4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251395;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bXeo00zC+Fz/YIEVBhgtInz4Kk8T6T+8sTaeNUk6/H8=;
	b=kZpu6CaYRIwyDl4Tb/wsRUMyuJE2b/ksZ9XI0yH2i+nfHEF4qsKja780C3Say3f8ZXgP
	 7YNFKe88OL4Kv2tkh0fjPdFvVYbMmpeCy6bqJ4mjTxz9ObdC9zuzbhHwOcCPL+rHMTxjf
	 dZD5hWswts6jdEI4aX/4xrI5WaJgYD3EbwNlXFoBvfYROQ7GnVONkmq2UFuWl87zk71/1
	 3tJdQLoNzjMv5rjcT6QVHongxBUYVhJa6si4rZseXaNfV0+cymjPaLmlcMdiKqHAavb0g
	 PDS8OXiioYTlqSVY1SxJ3H6c3LpODHlAzu4lIBuHDjAclUFWqI5icN8WS6YMrvtaLhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FY2ih7k7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7379606A31C;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FY2ih7k7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496461F0089F;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251394;
	bh=bXeo00zC+Fz/YIEVBhgtInz4Kk8T6T+8sTaeNUk6/H8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FY2ih7k7jZW05Nq+r2TcqolJl5AWk95Qz+JIpGAwh4gjHH93hf+tWO82G9zEarTg9
	 CCjmyPFKTLcrDsBVh9B2u800wiH4ryuUaWjJreMIsUSO8fRW8+nHFaUhzsq16KTUM+
	 OevrxascLS29HAk8qeqx3hzYHOD2+Wm7OJ3yzdR4G2A3Fm7Y+7CeKnGYD5j3CGmme6
	 bYrfFcqaHPkjUrB/k37cRkH8nep1sno3pAPpor1HpwJkkwYdJT9FlBXDEtEtEZur6B
	 tzxsb/idzrgsrYbcmLgxpDVv33c/ppsF+Mz3gXiFnsdvC2v2D96zDhevo2FSyZApq6
	 lJqWnOTfChSsg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 1B85B2F707A4;
	Mon, 09 Nov 2026 19:09:41 +0000 (GMT)
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
In-Reply-To: <20261104024045.1508542-1-vulab@iscas.ac.cn>
References: <20261104024045.1508542-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl: imx-audio-rpmsg: unregister platform
 devices on probe failure
Message-Id: <179424330240.3711751.6306163881108747732.b4-ty@b4>
Date: Mon, 09 Nov 2026 16:55:02 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jg+mpLiVJDLq2jsfv+zC4pV1nIIzTvOIydQhC3VcHjc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+SZW8+H/+//4LLXvaLs3eKLxjEde+o+822z/YeC70S
 enkR071XzpKWRjEuBhkxRRZ4rK4X9aXvF7Dd3BhG8wcViaQIQxcnAIwkWN/GRnuPNW+UZ2+gG3T
 dk9JCTWG479KdZdJPUs48vPR/PuJ6nqxDP+T2coU70SdsJ7x8nXmtS6uJUtTt733SrtsKiauY8U
 pZccAAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:45 +0000, Wentao Liang wrote:
> ASoC: fsl: imx-audio-rpmsg: unregister platform devices on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-audio-rpmsg: unregister platform devices on probe failure
      https://git.kernel.org/broonie/sound/c/a3aa7ec56c14

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

