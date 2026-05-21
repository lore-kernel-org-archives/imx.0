Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E308F3CCFD4;
	Fri, 22 May 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445285; cv=none; b=ESbgLXhGKFjXBSpHTJ7i5fxVqvsrkv1GmcnB/Zp2580C+gJaK3Rg1mDAJSjCpl+p94qZhPcmcLb3GlITtq32upjiiM1hzX0JM+/BRpoGXtJx9UrYfLCAwreczScaAmoj5dsr7Zf7/ADdncT4SjxN9VkY5pxUYY8V/GU0sctiaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445285; c=relaxed/simple;
	bh=hQbgFnBSRPPGLtJDVSn8W1/x06HNaDFZgo7K4RTCvJY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=szxpyWCx0xU8/CwT/m5/w7uBJY8ogKwRluv5XFksxFQq5NkbxfzJOBxNw+cgJV8utAN4CgXUKoJCQ6y2xuGxnRz5HCWT/aHqxkgOtgvs02cmUJbdsP/DwEQ1+ZZ9R0hBRnvPslGMVwZXTUL/LhBqczzPkNNuMscKx+xmDbNA0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of9edK5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of9edK5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B561F000E9;
	Fri, 22 May 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445283;
	bh=fKVEdOr2RzcA3rdMqyuatu+3TO4o4RuODlSYsnlMFys=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Of9edK5nBIMY0lUHir4lgmavX7OoGGXmzTVbsJgWQYq9atlY2kfvJ9nZ0Hezhfl0d
	 qRit2yxmN/VOmQ9g7FarBlVhLVb68/JDuPTUktILE6lel80+rthUWRw1jxTm7UtlJP
	 Qyk0xpfMf0/NAORIbqelImtm89qYxDXpW83ORhSTbt8Gu2mI2OxBWz0Bj1LeYm2O9A
	 gsDhn14l5bRuKbgJToRxngKlvNlu5GrqgQeOln1x33tVkJh0tnwcO3W6jd+S0IOzvp
	 yPJc7/kLGJ5xgD6xuLgZDbP1D2L513wwfQW9ioUKMbdz7uDc9bf1++90NMuRgySQIa
	 PmJvRQ08ZGE3Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20260331012450.1298115-1-chancel.liu@nxp.com>
References: <20260331012450.1298115-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: imx-card: Complete the full list
 of supported DAI formats
Message-Id: <177940550339.58022.2317951355365638081.b4-ty@b4>
Date: Fri, 22 May 2026 00:18:23 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hQbgFnBSRPPGLtJDVSn8W1/x06HNaDFZgo7K4RTCvJY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4gILdOGrZTLWv2gfMWgPbwRQgjUIjNKTW51
 0aTiuTo2fKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuIAAKCRAk1otyXVSH
 0PpLB/0YSaPGbRAdXB2fmsDzvAgb1YXEmRPNp0GMA3E+OKtbVXP/w/vZB3pTHbHqCr5IkdyNB7v
 qTnRjqFZs37mpGSxSuYV7RDpJ+TQsjeBvB5gApzbcR7wUvfrJAdC430fr+Uu5vIcSJg2PlcsW0/
 wDr8wx15L5FNcmgISfStNgsbZf0e/ARVF9mX1O4UQy5ew08FeETxnGn7TAIU3+s1WvJI3BxKEQY
 2i0AlRbqlnWcPhCdw68fU4n/CQ5v8Svd500VGMWQrDOVkIPHA6tLrOw2AdxsKkeynfGog0j6FoE
 OWKiOVZC02iWbRmlaOjeV3HtKddGtfLyVRJOBQqvutPugS4w
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 31 Mar 2026 10:24:50 +0900, Chancel Liu wrote:
> ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats
      https://git.kernel.org/broonie/sound/c/caa7a3711862

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

