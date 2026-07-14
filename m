Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE940D590;
	Tue, 14 Jul 2026 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064239; cv=none; b=sNm6gbXu704+RnLLedHRQXP65zl8n5q6uvC1kKKvmyORZC6z+bIpuE1KFRUd4p14FwnjuzOWELtZObpDa42yJYv5zECRePFsdZLnSx3MoAO7G6oTw9YMOMgarXrdMlWm0o0obyZzONVuFln+mRlnlo5CG8pccx0bgKuCub846C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064239; c=relaxed/simple;
	bh=yYxJXTxhaaQyRSn8NksEr8C19bj4QNr6+gLFsSI9u3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=plto0N54X962pIp35qXI9VdZuqUXXx+E1z4bP6ou5brTZNHBozXGiiBSHlMARmN4n6JQcYKFhE4pzLJQd3sAAeXsozi1kJqDePUJ8uf3KOa/si1BeTpB6hf2ThRpFT/5Ew5etC7Ldh9AbRK2hKNtNGYCViZzrE2yr6kA/ruMpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHUcFRUx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHUcFRUx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA521F000E9;
	Tue, 14 Jul 2026 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064238;
	bh=jHird4lTGKKujgL5cT6Qpafb/+B6Eck4ummSsIgsDwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aHUcFRUxeDZAawLZGPJexmH6w7sd7RuSnzHwwRhBC+4YQsjsaGwe/rUlgQzHnqVMA
	 uzb8NrFU8y3LFZQYhRAoZupivh53DaPs1Q18cPmwSMEXI1tvTmraxduJAAEq0AXlQ0
	 aFU8vAFMHkgsLYQDy4iCNOHYszhQHfPJAD0dLbWaQ+YefYAZ82TehrIJ741FUoj7Q/
	 BneVHnaFupGJGnCkxPs84d+ZRJX03riSpUGSBVFworYVtQmS4MGfzNovwRaJ7T0C9E
	 ixrXj2IuxrATyrBCAYI+OMXyNgT8ju+y96rTKD1pvRq5YQ9ahaAHOWQSNyMifa6YwU
	 5ISJyl+7W18qw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260512224544.1223283-1-Frank.Li@nxp.com>
References: <20260512224544.1223283-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: regulator: convert ltc3589 to yaml
 format
Message-Id: <178402792058.7661.255387093870553422.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:18:40 +0100
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
 h=from:subject:message-id; bh=yYxJXTxhaaQyRSn8NksEr8C19bj4QNr6+gLFsSI9u3Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqjre36tpOXUHUcoJmenjFTDn8F0L1Mm4PQ2X
 apTWOrGmOeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalao6wAKCRAk1otyXVSH
 0LvmB/9E7wHiah4E0N/B3Mg6ZyV1c1O6bnWXUT1L7k6tZ9bDDZ0ENEvaDSil8ZhXwYBpkQLmYoK
 p5WiuvL7MCRwQ4JTAVU4zeW9E2WT4Xx4+Db4FHODzBG4hUa3E0fvymYnjfIZT0DX4mWr5ddmT85
 os/desmkfuNFSWu0lw8N/nfuJl8/lCfXTDbgx8+mNnWB/wACmHA5Dui5f9K+8gS43Qlg5QBFHKQ
 dKad9m17Q8UhcyHIWOw8XLTCmVdQeVlbhSTt+IFHAbhk+iYbHfCFKiNn63Uol9+689ld9F4NRRO
 MlVLSbN5zSDHiocKPKXUcG8uzrHMR2zi04R1+0NPXswLN3cd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 18:45:42 -0400, Frank Li wrote:
> dt-bindings: regulator: convert ltc3589 to yaml format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] dt-bindings: regulator: convert ltc3589 to yaml format
      https://git.kernel.org/broonie/regulator/c/c9b256e7900f

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

