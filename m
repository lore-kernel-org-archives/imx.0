Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450433;
	b=slqoFvAY1VZrm3MuMvuTj3ctkihodLsRw52ZbkKK88OaxGrr05Ar4YhRO1zEds5Qn1Iq
	 527I7G8jDvxyrLvcCVZBvA+Aplh0qrn3IyvlgpTaZ8IvODNUSnUkswPU61pH6GAqyo2y3
	 kX5v04qoN5leiLYxEzih/duKgXrkm8++MXA+wU7MYQYMOcIvLn1JlNbWCjG0czl7kfbxQ
	 Q6K85EekbtmB7jl1sOC1RYI81qdQp2K/mowIIGurjhKXXZstsD1UwdwGB20qfjE5UWji6
	 G1+NQQnz4FRdqeSnZbC4N6Wf7d8HvtKI4YgvJRw+pjcmJhwwzHWDLsJr/AH4VAe2Low==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450433;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fJOKPES6EfNRlBk263JdcwhHP4l7tgpc3L2Hnean48g=;
	b=k9YiJaEWX7CYaATmQaHhWyN6fCA0zT2cKjciFwFMnHXw31RBvVVXy2tuha2EL3bvBVXP
	 vUAERlt4KiZBtatkpScjnb0sc0eU/Advuq7GgqlhEn159PFFf6pNS6EbIAAtinKVN1hHh
	 DxEZ0UualXutMr5e0Ng7hLbMb6QZSfbmrGtzT4Mx0y0ecUo4X22IO1t+W/qw0ozhW3Eq6
	 mfxwVHplZgQu6mZ5mvRGpt82SUwIjypXN41yep+YaGRduJ/vAViYv1H4h946F7JozHDD/
	 Mx3wgGBGio5eFjX52FLF3eV4pNZ65oh/IHdi2U3VRXLmpUaVvE4+UyN0fAPnziWRlRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZzfTLHC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24B606A31A;
	Mon, 23 Nov 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZzfTLHC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B31F000C6;
	Mon, 23 Nov 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450432;
	bh=fJOKPES6EfNRlBk263JdcwhHP4l7tgpc3L2Hnean48g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CZzfTLHCTlFoPjfw38gkT+cQtX4XshQDUmiNMjJOJhJapK3QwnYcXN5jkElWTFPxz
	 PYdac8Ih8gCV0CJvwxEpICnnc/pJnxTvsCI4zlHmXN+5WGRrcCgqI10m5ZL7ssj0Zt
	 SMtPr+iOckjkLE5Kh2ya+gBGSfAqkfknBJ3RjeB2O2ZCNzgPXWenYyLdrqDgs1PTYL
	 Z5Ku0Csx7cgSXjLPDGXYj5WGcaTeTO5YBCReUPAtDAPP7Bkzyb4hAkfLGdO0Dd24z8
	 gshhIJF2DLI7XtP4KoD9oWX3Sq59CbJbNsnn1hFOImlmihZzgImP7poHp+9joRX6gz
	 iieYXkIAvttmw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
References: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Balance SAI node references with
 devres
Message-Id: <179544446306.25092.17878563004182142170.b4-ty@b4>
Date: Mon, 23 Nov 2026 14:34:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IjdY+BmDoyMLbbgkDtaHI5ljGDk4FavOF8Hs2Z9fLoU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ0mzFmDmc/Sa+PjTjfc6puRuYTjX9/FSklilrxapbV
 Bp7+8yZjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkUxzDL+bdaXXGxkWvmFgl
 NslmCmXEswvKG04u1dr0erbj4gubvjP893fdxfFrxvqLSh6dyRZ8ryr7n63Pv71lEudEIeGD7Rs
 WMgAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:58:32 +0800, Zhu Jun wrote:
> ASoC: imx-audmix: Balance SAI node references with devres

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-audmix: Balance SAI node references with devres
      https://git.kernel.org/broonie/sound/c/0151278a98ca

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

