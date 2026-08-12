Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37337F314;
	Thu, 13 Aug 2026 11:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621067; cv=none; b=VY4RKoq/sCJl6bZAWiximZojqpiyKM2+GF7WfNok2Vj6gkeGGkcCEkjaOgZLQOB1teYCt1Lf5dCKm69DPEruQpXpBRjYhrp1tx8slVLQQRmr+ByXiPXAw8cIR2R0PRxjTBYVxX80UvbmaLXqiukc3BTJZUJMc41mIxi6kg6zlhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621067; c=relaxed/simple;
	bh=YYBnUv6qdzX56esAR5zst0HHT1xQZW6e40uF451j4EQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U2vAjKoVNZUtlSxljNGXoAxlU0C7yNfNt5t4J54RqYC9fOUQXE5TWJrdb8a+wcRTkUXh6/YCE0zKVrlC5JC6YvDxhTn5vN+WHoxR3GpbB0PFq2HvVWR9VjhfAAVfAwwDO/7wmtjGdXupfpBzyyRXCyzLM/EosVWPbFF9E7jNp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2jRinvu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2jRinvu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D51F000E9;
	Thu, 13 Aug 2026 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621066;
	bh=/nKOXb11thqF/gUJpn3dQgk/iwZeR/0ericzfrjsocw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R2jRinvu3znaYhc7gsGUjrAk+/k1y7lEEo6yMZfJUv5FBklyHKZTn0CE3vwE84bmn
	 UcGc20yjyCDrlOLnq2qTisaVcQXV4Q+ndQrMFtqXT3/mDp3e+EY/5xKIQvdn+EsrG4
	 5qJ2VsicDHdG7YdXqxTiVwlk1Bi9hF6Kch8kmtf3q1Wns+FdgLXc1cUhafyg+XKD7U
	 Y42liR8PcCPV/UT+KrAhFYy5D9IykgaMIJxSzlgapO+oW4kKnCHRXE5unYY+pdKHU1
	 IYTS9BTXtuI77KgyuW5Hu2W1loi9sQopfWMLfoOyesoN2Mon2T4tzxs+i6Z97txhpv
	 rKfH1xVPre5qw==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, phucduc.bui@gmail.com
Cc: Fabio Estevam <festevam@gmail.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mxs: Improve probe error handling
Message-Id: <178655643965.342177.15378550063939908942.b4-ty@b4>
Date: Wed, 12 Aug 2026 18:40:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YYBnUv6qdzX56esAR5zst0HHT1xQZW6e40uF451j4EQ=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGp9rIWh6xTQ7WPfj3zThpUIuqEjMWG53Pd40BdJ+zxf4am83
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqfayFAAoJECTWi3JdVIfQAXQH/0HH
 EU1dNuux362PF5w+farDKIDNho9sBJoPXbuNA8/g7gnBkJSIiZ0jZ5wJ8hH7EuMz0xmmlb0CTZb
 oRxalWXG5wPknNvu+VX2WK/TD03WpP6fmeutio6kjUjaUKtNSkeGeGX9elyDLePD/WRlC6T2psV
 eyQiXycR4FmWPynU2th3Mu2rgQFgAt7AknnbnwRbtFuldo5ZrhULNwiU9b49um3HQEnyFT10IjM
 PNoRzw2vd0plBtwFguHujliFE87X7Qi6UFmIMDcQewmkJXdT4+KnxaPk+xPSkszd8bGcaFwch2h
 73ZZ3qUrsL+bnwMIbkd017BjsaV9FGmWxMVS4TY=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 12 Aug 2026 17:14:15 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mxs: Improve probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling in the MXS ASoC drivers.
> Use dev_err_probe() where appropriate and remove redundant dev_err() calls
> when the corresponding errors are already reported by the called functions
> or further down the call chain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: mxs-saif: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/b215caca714e
[2/3] ASoC: mxs-saif: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/f0701e5fc299
[3/3] ASoC: mxs-sgtl5000: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/e84c06775d4a

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

