Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7173B19D6;
	Fri, 19 Jun 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781888695; cv=none; b=PBetyZxtsiAKyFjJPTa4/3ihTQVPDzuo9V7viJuokgkqhUOG3EOveZ9MOjDqW7uzUxx9PPTm69ElP0cfKkyelfbzBzP7W7t8j+u/5xtS0hjGmGDEVurfpYRQshdz+/G9yUM/cNrpoCdwy+UbssLuuart0WZ3uCOaz+BNT2zL88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781888695; c=relaxed/simple;
	bh=gMWYyzvh+O5WxC0lqJU40UgjS0Jp+m4Ets9TTQHR9GU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hygPzZs2nQ2A6elR6mPNpc+m9WMuxiBglowgLNdI4+vWr9uUif53veMLbtItoABvpjc6jj3/XssixpjzKvCOajjfZHJjkl+9iXU0Sz/1QJsS2zZSPCGoeWSIKTvnoBFCvuYpM4OqRpsyp5F+orbLFuJtHF2Es53fzedECopDlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kISV+7Pm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kISV+7Pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC2A1F000E9;
	Fri, 19 Jun 2026 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781888693;
	bh=zbi8rSc2FDdyWUQFYogmRzkXBi+8xGOGjaODAlpUtM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kISV+7PmlH3Hw4rupuUqNIjhOFsIuxTStwkjMGhq4u5YjA7Un8glek8cOQk6ULpnN
	 A3EygQXYmh4LQ46inKL5T2mL7TCvA8wCgoYJ+3q3EJskAobx+bofUWbR53DtONdL8v
	 EG5/sVFfJPZkizIS85ruJxmX1qzcZwM01x/RwoIWXu9TkAX4gpg9RFuRkhaCsSp9VK
	 iqKzl2uWatNgLxY4YQCermXM5zN7GGb7dES0cF0AgIsqZzIw5V4ElEdjbN7ePuSRxO
	 EEPc4YnMWGqFoIgJeNPbjAx1CQxE5y/IYYmL2016uIsxf0cz4/Xo7v/lOFmnZMVB/C
	 hqDSU8b7ErT3Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>, joy.zou@oss.nxp.com
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
Subject: Re: (subset) [PATCH 0/2] regulator code improvements
Message-Id: <178181010967.62759.11331133508510663765.b4-ty@b4>
Date: Thu, 18 Jun 2026 20:15:09 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gMWYyzvh+O5WxC0lqJU40UgjS0Jp+m4Ets9TTQHR9GU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqNXazQXf4vpp6L8eEWKKt8fHpXy2vJUedWfAw/
 V3g4g1yyXOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajV2swAKCRAk1otyXVSH
 0EAwB/9RJD3Dxea0qgQPzWyiqlUW+nyI8+59NLTBIYh7mAgRJrE4yzfsmojGmJFXZ30V4eQbcwQ
 cXpu0NSEodovfSGVFDLt83YLpc1tRIm3RNnd88YYyH9gAPaZGNlfhBkXXxWCD/HUa2WOTQA+QJG
 7t+x7wwjKwt0Gn7pjMLxtcuWrD8J9drvgNR0c5ecnLAJMvxyo7CCfEKg6m475iPEY5WrgQ7AAYJ
 f2ehjk5V0UkacCaSlMYtL+grEaqTgq6J1833DtqlwndGFLfTfnlb/Cs2TTY7aqezN1dXq+XqQNC
 5u+8ByzcNwEuLSN+ZlnZvAh9ZjKfR7GgC6ty7rVxFE73hV2H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 18 Jun 2026 10:03:04 +0800, joy.zou@oss.nxp.com wrote:
> regulator code improvements
> 
> The main improvements include:
> 1. Correct the default toff_deb for PCA9451A and PCA9452.
> 2. Modify volatile register range definition.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] regulator: pca9450: Correct default t_off_deb for PCA9451A/PCA9452
      https://git.kernel.org/broonie/regulator/c/25c476711cc6

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

