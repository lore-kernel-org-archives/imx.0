Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AA1FE47B;
	Fri,  3 Apr 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235165; cv=none; b=iIo87X9vMua3pWdQaQEfoRugSFhwtF0Om9StmuAopty96Ah5s0lDi0AZ2qURLBaMmYL6HA3I3MPmmH/IxKZfJ7RFtDhmc717T/yqxckm67hD2mN5CvLO/vPjQkFCGbQtzYRRYTz51pWC3EJ0FjoNpDqe/WuMj5ama+xXLEPoo/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235165; c=relaxed/simple;
	bh=YRveJVZCu8GDGV3bBJZ/v1pJiWaRn6WEGXVvRMAeJ9I=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u3Dx7c6uEhKHevjPtHtTfo5dlN+5dO0ZKb1dY/N125YsNli3YMgpo1LmKb7K3nxp93bAPks8Hu/lA/GFwM0wJ+g14j5nnclZUNIBKaPRypxse1ESyDCI5fQeehgpKfPRr6r319FIxODBGcpT7dxhJLBg95iIGl80w+mOLAWqaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U29NGLna; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U29NGLna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C8C4CEF7;
	Fri,  3 Apr 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235165;
	bh=YRveJVZCu8GDGV3bBJZ/v1pJiWaRn6WEGXVvRMAeJ9I=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=U29NGLna1TugWKaYx1hSqQYPS4LcIP8K7XlUqdSh3E61Lv4CTXYohzIUMSem2MY2S
	 9IrNsow63DN3BAKQbKKkRCy4l1hEe6UxPBuzRyDBjrZRiJCiSb4Oq8zA1SDccry/S2
	 66ysEQ2FRNyOw+ud/hw8JTmnq1LB9Frc2sEgLOZ47bdemzkMo5IJE/NAtHvQHnMfOv
	 suvgN7PW0y6e9y8es+t8OaRXHhDxibFECuKitFRDpzn63c6VfbP9DVWlnjZwlyby2q
	 fKxu6twCXWSCVKuCihudKP8MJl+fyLFGnAcYLaNfeJMAgFIj/inPlGw3OQEIPBy4op
	 AHXO0hVXumvog==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20260326055614.3614104-1-chancel.liu@nxp.com>
References: <20260326055614.3614104-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Add DSD format support with dynamic
 DAI format switching
Message-Id: <177522560849.52946.6682860027345640594.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:13:28 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YRveJVZCu8GDGV3bBJZ/v1pJiWaRn6WEGXVvRMAeJ9I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/BZjF5/dR+mfS9bVnwsI6rH+fG7++qDr6DB9
 tPVDW3SuEqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wWQAKCRAk1otyXVSH
 0Dj3CACACwFyTyL3B80o6GL+XDzhZs9Js2nU3MCZD6GOxiGo+q2C18nuoN+b483KQ56BH9uAkVu
 SAYCSNd07/9j0DTvcHSMZFQY+2GxbAk7KO6ZX6IdnqmjRCVl0WNT5vjSUbDXEAHyWdv/qaVd2xi
 gTViu52u5ePDcratJ3DcnWWUQiG370nfnVgFTsCzRppH5JdLcLRM9kIlWjq3FSb0VgcND1tFXsH
 3dg+rtbO0nzM+xe4ybjFj9IuToYATdGkNfUq5AWTNbQYMNP9qVVAlACGT/2unUcFEQjrnHAUDFU
 FIlpjlPw/sszdhTFI9ynKQo37UDd1OoJC2eGSnDD5HMfb8xd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Mar 2026 14:56:14 +0900, Chancel Liu wrote:
> ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching
      https://git.kernel.org/broonie/sound/c/ccd7e53b7d6f

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

