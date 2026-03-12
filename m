Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF643FE35E;
	Thu, 12 Mar 2026 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336898; cv=none; b=arcwq61upK6N+HwDWlJsKCwEkA09JFivbpfQNZXrV3ABKzwJW7OjMrUWaAiVo5gyngZWFaKI4pfNarJTj3J3DrvQtejvcAX3ewSz79EoJuzjqcom6xjGPZEqCbrSG/QKu6X9vjUzNFsiiU6u8A8Y1PPUwTaRHQiLpKyb3DDpiy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336898; c=relaxed/simple;
	bh=0P/dqyhL6ojvP4AGUBfJlJt1KT2+Rv4AtgcInH/FTE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sq5EOeGZqZw+R7uE6PByAOsvh6zY0FkO1pXGg/1gXtJUtcnmUVEHTpFQ1SO7aqCrmXlgfAIC7KQXjt3Ql5rfWFXu0UACL/1pIR6Dx/IqyEmgysIVseaJOX0F1pVQaihF6iisFvrurLfuRfugr81J84+Gnkfw5Y6LCpSZiEklHaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=too9r9y/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="too9r9y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF17C4CEF7;
	Thu, 12 Mar 2026 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336898;
	bh=0P/dqyhL6ojvP4AGUBfJlJt1KT2+Rv4AtgcInH/FTE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=too9r9y/esGwSbmtchRIR+yZ0TyQCowQ1j1H0Zm5zjtBwfPCwilks245dcGTRn5dX
	 3FCq01xfhAn8z25mWd8PIprzQwQuTYRQmuSHfrtb+8GvyGRGMfIKJTi2hnPpXsJ7lS
	 NHP9WWed11BulIMeClHNcRw3JiD3MktP0yCESYWTd/xpO8dvjpI0qQgSc8htdam5zl
	 EVfQLuc1/VM5s/bEGgWS3gD6gbUj3GXHWe4irnfvikIHFVWmXprQiz7igd+TK0ab1Z
	 jKl1fPDgnWl40ri9TdFpakhtaz46JnT7TVcXshwZr6ynXP7uzWeNTBMkaG5cxTeC7c
	 K2bD9bAjVJY4w==
From: Mark Brown <broonie@kernel.org>
To: Samuel Kayode <samkay014@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Lee Jones <lee@kernel.org>, Felix Gu <ustc.gu@gmail.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260312-1550-v1-1-5a84b886ccfe@gmail.com>
References: <20260312-1550-v1-1-5a84b886ccfe@gmail.com>
Subject: Re: [PATCH] regulator: pf1550: Remove redundant regmap assignment
Message-Id: <177333689659.303201.6390758880128162232.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:56 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Thu, 12 Mar 2026 22:30:31 +0800, Felix Gu wrote:
> The config.regmap is already correctly initialized using dev_get_regmap()
> on the parent device. Remove the redundant second assignment that was
> overwriting it with pf1550->regmap.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pf1550: Remove redundant regmap assignment
      commit: e80c626ae06ed9c502ebda4a7e0b390af9ccf6b0

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

