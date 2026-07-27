Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25E3EAC71;
	Mon, 27 Jul 2026 22:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192890; cv=none; b=JKPwL7bBbfg4avfWNKYZzB0/zTdj3tqhmEykexaFE8XpFFMeDjNNrqpaeHksDUGnxZygpml7SP1n5MIOh+yQEkNMAZ5r6ZVzvAzkqrRu5ERDuOyKA+A+imMlusS6q4UMdWM+NkuZhKhulgplzbIrlp2jpGA1HbvJBxg7Xipg/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192890; c=relaxed/simple;
	bh=69hDR+DY8ZeCV/rIqXH9gllORsldT9/k5hnIwqieRvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XXKx3LoFsknJNgQCyKj4yEZU5Hz4s5i7EzEbXP9OT08HKn51MO5GavOvXlfI0ZLuWdbbK7jhyYD2+0hYRROoBAaBObR+iQA9iqkdOM9TbaWIq0kCYs+uaR2Wy006JQwL4JGXI3BFkrWfu1S+0w7B0v9N3KNMpon7g1W08s2JiP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJwBbj9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJwBbj9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7D11F000E9;
	Mon, 27 Jul 2026 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192889;
	bh=RIniAWP8PYf9xS4bkvFeXlVjV+WdK8M7nevYPAXtPD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MJwBbj9FGT2UAy5LQWeZBtP9lsENNtCRVSVQ0wlZF/YgLN1jROOTxrnhLPzfK7jOm
	 w3rI0cU6x9b2R71mbTO3DQgtn6qGugraALpS49B/utQnmfb0mDVoxSzzrWwn3YS8fd
	 ZudZ8r9P8UVTXRNBQHsI6rT6bdZV6GTwIzdFtheP/Uw+Aob+1H6J7TEMrUBePM2/46
	 3WSBXSksfBJJzKmS37E4CaN3Vql/lklbu4L4i+aWEDJ784Uic3dqdo1PbEFmsvdXPe
	 7zRY54gVrO+4YHPS81eOo+dh//u/TPNnDCtJJYAUlcxvoEqY6HQ8eiuysltpwmO7fD
	 7CaO4FfYcy+4w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev
In-Reply-To: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
References: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH v4 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to
 yaml
Message-Id: <178515437896.50339.10065240640963936652.b4-ty@b4>
Date: Mon, 27 Jul 2026 13:12:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=69hDR+DY8ZeCV/rIqXH9gllORsldT9/k5hnIwqieRvU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+G2n76fQR9/PuurmNtjfxbSytVmjXRhX28jz
 DEbFrIksRmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfhtgAKCRAk1otyXVSH
 0CHTB/9liW+m8jwOHIn3sktDdFTy9PZIKWNTb8BB4f3BlxN9RetJBkqPpXWcKUpKEy4xRpSD9DC
 b3W50XywHJIk+FLAEuFsfOMkAVTNPd7jc7Dm94LKhLic7yoDR3FDdCQsxrZ8GzY5biBIixwRexx
 3YubQ3XfitwQ3Rg2VpPriUUPI4AJOS7DIwBuoxZElJ/qzK1simqCoc9Qg/GNfOnroztMK2hZPay
 9/phIJzQbt3Y8ID/ZU+5dTX8lBAzwVbdUYNj186Lo0dl1Xo2XyZN2KQ5rb9Nz3kRGpPiXrHLL8e
 y1i7xG1K+h5rjGxuLCAgPEI2+S1GDyhA0mzCgzd7KyUZlYBX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 15 May 2026 10:52:03 -0400, Frank.Li@oss.nxp.com wrote:
> ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
      https://git.kernel.org/broonie/sound/c/78a9d1426416

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

