Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419547D920;
	Wed,  1 Apr 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063975; cv=none; b=tP5fM454ApLqHdONhL4H6vs1WoDSAwKsx/6CjdYEpy8uPYKK18Krp2XWUKgVqUx0yfhIjPaJpVIVXVCQoOnwD991gahJMsDfnZh74S6FATyIDpt2AroPzx5n9uRHX1/I1B/YohKW3OuBLLZhvJ1tIba3yrZVcioPgnpQKFsGY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063975; c=relaxed/simple;
	bh=gZZ3am2l2BZrbiJy//1SPjpK35+k5Zv9qYgrBQJqKfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gW/+2rAy0wgKFA9FrXkOBARU/SQm1yDenEXIc465Shbezw1Qp280BrvKy/2zu1eaor/2RaJjnlNpaB3IfhQzq4MfbFbpR0/59M4WWZxyS7SUU/tVUWCP9A87Hf2oRgJN4sGvgiP3kk6vhOmsFRpTfb8kn4HJF0iGJgE5HD4rPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxc8VVB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxc8VVB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4386DC4CEF7;
	Wed,  1 Apr 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063975;
	bh=gZZ3am2l2BZrbiJy//1SPjpK35+k5Zv9qYgrBQJqKfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rxc8VVB8Y2b8ArlnVIh0Ip6lECvk0z+d3G6zra5HxDQF70vpRvd7yvmotx6O9rHpq
	 pcNoaW18ncjKuq6k+npNR9LOv/EywxO5Zlyvw+zc6PzBLQgMDCyMGmOiEZ2lHG6m9E
	 0FhbmxNJkEzqtGXP/Ivxk/GIDzsgognu/+0ESERuCrYyGby0M1K8u+RwS4dclGDXeg
	 ErhBoF307y0jZyTxMKG990fP38ZTsWW/GKVUAQiY3mTcTulXXHtWa2wy0xvcLCUaUa
	 yDqsSEPVm1zn3z4pKJAygaZKelv0jVgy156NPjuE+Az248kAhCybA8kz+rmPEX2WhD
	 4ZyvvcFrGBVsg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of
 mxs_sgtl5000_probe()
Message-Id: <177504863830.145704.3305961263269290101.b4-ty@b4>
Date: Wed, 01 Apr 2026 14:03:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gZZ3am2l2BZrbiJy//1SPjpK35+k5Zv9qYgrBQJqKfk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOkBGbGoFLNrIZfgTyoGw/FNHf79QE2+b+ia
 PY0vB4V+yuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1TpAAKCRAk1otyXVSH
 0PiMB/9gG2mtCNah85dcETfLIead592r338DaI7w8bdBS1zRFuo7pfDm5jNzx/33fSrOR9JCLHO
 1DAVogc2cRmWiOTK76gvHSj/iuWK18b4dT5Dx0wSgh136R+OPQKzWmdmK9qTbIjwwa1LnJbBuzM
 xjLow55F0ile4twIeWrw3MgCes0ECjfa8y3VHo1wYijIDjSToE+ThtyF8JNOVhttFOzqsVYL+R3
 CQvorE04EgvEdBZL4BlzaYHFfap2byflbmBFTvQe1/p3kfx72S0bKAUq/fzAA+hUyKCS2J4ByzD
 uj1iQFOobXaCd9R9/tgtTRyU+6JjdKIjVcfz58vxjdpgkFor
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 01 Apr 2026 13:30:51 +0800, Haoxiang Li wrote:
> ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()
      https://git.kernel.org/broonie/sound/c/c8ef13d692f1

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

