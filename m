Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF19330B38;
	Tue, 17 Mar 2026 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774072; cv=none; b=EmEL5g0NXlQogxysgGU0yXbKZ6/lt/C806qiwovv4lX/tetA4FAGY8gogccHSdc8sRTeCVuHM2EzmfEgou7tEt+dVKZf9qyld/9dep9OWIq8nKDe7XgWE0IG3JzzhfEqgONd7yW+beA5XCvQHCxvQ1rvQ0FzNvtjUUNDcT8Z72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774072; c=relaxed/simple;
	bh=RVHqat69wzKS/6FEWyeTvRo4rPXKFMfiSDhSqmXZMAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gNj982psR95vNgn03+0i/ywqfcnApRZoKnoyOPvi4hbrfqbSBeBAccas6OXkZZV0qf67jLeIr8Tb8fy4peQG3d+07U5XbQbct/Riif1pASiD0V/2cehFUvRelkyxlJwCSZyJuWbbNUeEd9jUcbHAxH7EH2qW2FLgICBriDCBk1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgHPD8lu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgHPD8lu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2475BC2BCAF;
	Tue, 17 Mar 2026 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774071;
	bh=RVHqat69wzKS/6FEWyeTvRo4rPXKFMfiSDhSqmXZMAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sgHPD8lu+6Q6TpBkccf5XI4Z9XaFoPJkKhxKSuAVT2TlCGQ0vlAPRb8YvWkPaTW1u
	 V84PFsgdInLgBQTpalfk5AhYmzq8FNGAaR8GRgBRtQq5nvt/YxW6inJkheUTxQ70Qo
	 +PIDNB7V1rACEKhMd2gA46kN1ck5Y6HjKA+pPqUn1nB9pxLr3y0VJbxwkH/598pReP
	 8E2eBfw/NwZ0ve4QhRMdJKyPB0YI9UkGRM5HLfII7I+VtUbY5xexWKY6HJfuaV8Sr0
	 nLG/AY4S8Kz+KD0i3YLcb+n4jjsmOQVeuIS9yvA1kNRibCyIXpgP5Oz3JC5OcADydW
	 zOLIAIMXk9hIg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andreas@kemnade.info, Robby Cai <robby.cai@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev
In-Reply-To: <20260313133102.2749890-1-robby.cai@nxp.com>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
Subject: Re: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Message-Id: <177377089890.409229.768616051787626910.b4-ty@b4>
Date: Tue, 17 Mar 2026 18:08:18 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RVHqat69wzKS/6FEWyeTvRo4rPXKFMfiSDhSqmXZMAk=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGm5pPWhVbK7StGPBrWqKDwctQPorOYqvp4inmw7uk15aqYq9
 4kBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpuaT1AAoJECTWi3JdVIfQ32kH/3Uu
 0T9zWRvtOZFgEPlWcAMP1FKfQ0dNbcJ96Kl6IDDvH/VbvCJnn8KiK5uAwWn1zipCgidjPvnTCiY
 muN763XJjer7CX/LbHHmUj7LsF6H2NefDqhxuC2RubUAnzsGs7EX2uR1XO058CUIPF5r2XozYCt
 AQFntnPLjWObA8dKcU0V/1FVVEZyjyI2aY9ziNC8KKZQk4Rk1+OY9Hh2RosjnHlTc38Qc0qoNpK
 aYseTxKNomsAFGAwEmqHFOKZZEk8Hqe+/sK+gbHvyxDskT6YDeJqjaK+Pz0ru2P4u52rJKpn5d6
 pYk3UmFKOpOjFdOMeiTwrec58FJR2cYXk0JaKuE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Mar 2026 21:31:00 +0800, Robby Cai wrote:
> regulator: fp9931: Make vin-supply mandatory
> 
> The FP9931 regulator requires a valid "vin" supply to operate correctly.
> Therefore, the driver should treat "vin" as a mandatory supply.
> 
> This patchset updates the binding documentation to mark vin-supply as a
> required property, and modifies the driver accordingly. As suggested in
> the reviews from Andreas and Mark, v2 switches to using
> devm_regulator_get() since the supply is mandatory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] dt-bindings: regulator: fp9931: Make vin-supply property as required
      https://git.kernel.org/broonie/regulator/c/d342f5e355aa
[2/2] regulator: fp9931: Fix handling of mandatory "vin" supply
      https://git.kernel.org/broonie/regulator/c/58068932402c

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

