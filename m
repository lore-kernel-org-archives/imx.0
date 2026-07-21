Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE1351C0C;
	Wed, 22 Jul 2026 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727239; cv=none; b=Mp6V1plPM/IzuueKY+gHYSNkZjw6s44WHnJKs8gHdiH/w6io6JQYXCrxyXf0arkuJBh3BPbet760xJf98evvXxKCZjgZ29eC7Pr1QUjFhWDgKwhyMSK7N5KNPZwNDLpNLSQPFOaTtkRwY8USUCbVyU5aeAtSpu7YUXE7aR8Z9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727239; c=relaxed/simple;
	bh=WSNQqABvK1jX2FlEJxsDHU6UC1mBUlCyoKOnSUdzrkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ij86z6zSOHyy6nL+yKb/VptFWroNdH0Fek6ZMi/ECwwYoRGO/Z8ZRH+c4Qp/yumnBGGa9Uu41J9ZjxF5HbSnXiqa9jW3x8CAIr4aSUKPYj6B6M/rDLASeRuFnF2vRz049zRlIr3tGa+8okyeiWTq9kjE7OrS0+lDJZVoGYTX+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjVu2S7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjVu2S7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA4E1F00A3A;
	Wed, 22 Jul 2026 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727238;
	bh=p+HJcxQQYXSoBZk90zH5A3BYZ3Z/MaPykkrnhlGs4ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZjVu2S7bXrc1wXrkLyDsedQuP9LkPJlalYhU3DEoR47uJ6Zd6vlhKgB2ioPaGdSpt
	 G8uz7kniuGiqxmT9OjNpcZIh+6dzlxvWJL1vGRSlE4tlPZMVSWzeXSzDnq1aE//XdO
	 4n88Js65a97m9HhL1j960BvH7RxEJnhvd/K/ut5+k1nvi/eeUlwnOoQpHnr5ya7FxD
	 AjyKSl+EflccilSS5UxkfX02GpuEWl4cH7ihqQlEZ7xms/GYskZOxx6309Wqnsh8Ls
	 dKbg5TeZHPfdHzGZn5kFYKsSHDsYnE3cscv/130pG+TXnXoJ3Kd4v6K0gb/BsRf2uL
	 QDSKCHRYmeVdA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.li@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260714160147.1641379-1-Frank.Li@oss.nxp.com>
References: <20260714160147.1641379-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH v2 1/1] regulator: dt-bindings: Convert ltc3589.txt to
 yaml format
Message-Id: <178467576256.260430.3213025150884467674.b4-ty@b4>
Date: Wed, 22 Jul 2026 00:16:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WSNQqABvK1jX2FlEJxsDHU6UC1mBUlCyoKOnSUdzrkA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbDY+cJ9e5Wu4XkSaqTTAiVSSmL6LH7Chyry
 Z0RVoqYYmqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDGwwAKCRAk1otyXVSH
 0GgIB/sFu0zd5z1DOY78RHmilO13IeQpDJzAo/yetgPo442ld38AIJCh0891aenWPk0AOfmLa/Y
 SlMb7rTZvWirzFTuG/flsvxSwwyzmdZaZBhsSbxOtGtBomTxt6QH6+dUk8mQ8nTXg5mLYtBYWXy
 jaz8Qpgtfe2QL0ZhilLWjLkZzePjVhWjNkvE85+qJYuAX0/yQPWXQ7r1uVcBfcDFFxdlEHF11Tf
 5JRqZWWdVI5kTXc0Nb61j3TqTblZDGx8smhirJFHGIUpTqb16uc/OGLBNVLLbNrtPgbHL4KuysN
 q2j7XUvWF1EstdKnddHXoTQXDZwua8sm6JhdGL8yudZr0y5S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 14 Jul 2026 12:01:45 -0400, Frank.Li@oss.nxp.com wrote:
> regulator: dt-bindings: Convert ltc3589.txt to yaml format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: dt-bindings: Convert ltc3589.txt to yaml format
      https://git.kernel.org/broonie/regulator/c/64f3d6f26652

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

