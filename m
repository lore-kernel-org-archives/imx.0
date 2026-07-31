Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FB367291;
	Fri, 31 Jul 2026 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528515; cv=none; b=Up7Ar/ocNJJpw2IO4wIuKO8CXUHlcIHWwDrVywS4qHC4LJ3jIRv3pASqhgSR2aAMYX7KiyqX7UDi4zL7s05/JFgbf/9iDFlpAU+KNTWnP2lPVRpWMsPyKtKf/J75sxr1/thL/lFMOijdpobY6oyvJHAtRBoWwcNf47nVitEIq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528515; c=relaxed/simple;
	bh=BHxONqPZchydRsr+c1Tkh7w7l4AfO7UEDJQYZt6tTZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXHzRc5J4MkdXaRqEiLGFnU1A38BG5Qsw4N6fJ5gFpqgP/BJhnvjGFu8dOIR0lSHFTxBvT6eCAnhyoJIlMlFkSC10LXRon4Xju1V18GfFuRZvLnv8HmcEoVwJQO4o0id3eRu0nOZPojl86t0Fl4Lf1UDZTiuKsHkuI/h+0Vx+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCaH56fB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCaH56fB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D735E1F00ACA;
	Fri, 31 Jul 2026 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528513;
	bh=SNvk/B+6AVkasRZGpQAzc16soOMOZoP5VAozQDwIVv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GCaH56fBoOyoEX7a8BwQZaT4gpqra7212LNCZdNhalau+OeVQT6Una+dcwuQQ6S9K
	 3VF4ddivxnU0aSXAC3P/1JLhhg9yRZoYHa/txKqmqz9WrqeX4cuKQ9v0VoN5Phvoxm
	 +WfgQYmg/zwPHHhZhWztsz3FLBHg6RgLxiIHE5vlW4z0zZSeYQkbSsS1srhOgQd75I
	 OMKnFMDFBqnqK+t2H3FyFDyzSE32vtoa3qy99xMGBrfBLX2CQWPZg3t0eGw6aA46Ys
	 8mvw019RfwYrtwIs9cxJUdte4fBLnNGhg8O7A2MEuklxNuPXXf5TU898S35mZFhH6w
	 i8wDC+6HjcjmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Joy Zou <joy.zou@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
Subject: Re: (subset) [PATCH v2 0/3] regulator: handle regulator late
 cleanup race with PM suspend
Message-Id: <178551457196.353541.951839175970173870.b4-ty@b4>
Date: Fri, 31 Jul 2026 17:16:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BHxONqPZchydRsr+c1Tkh7w7l4AfO7UEDJQYZt6tTZA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQC9nSJxy4yZhkHjtt/9hiFAOgestU7bciZN/
 i+RZtX4ay+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0AvQAKCRAk1otyXVSH
 0AViB/0bSJy/mKlpbQtL7wyz4h4X8EepNKUWwIPQXl9tlVxvKQ+Ry8ttomG/Z6rW9fh3r51BboN
 alt6N0oxkRzIombK7hRVJJz5+yPQZoCWwnTkE18ZtelVIi+IuMOZXKPO8m28fAvGME7LKzrvYto
 Dhifn2FAGbgov24f09x0pe5POofMXEmSMgnCErU8WXemgi2AC1O4wU/oQ+ibFnSAo88WIHihNMc
 qYXalElfzFG2hvI5w6mXu5Dhe5i5/nuXDaIuUkfPJxKTBzAKPBaN3rJzvT0HD4Msde+50io3Pnz
 4ZlsVMTCIxQE46755Ytax/I/r5LYHVj53jXteT/S59iD0LBa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 31 Jul 2026 18:21:42 +0800, Joy Zou wrote:
> regulator: handle regulator late cleanup race with PM suspend
> 
> The regulator_init_complete_work fires ~30s after boot to disable
> unused regulators via I2C. When this work races with PM suspend, the
> I2C adapter may already be suspended, causing a -ESHUTDOWN warning
> dump.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/3] regulator: core: use system_freezable_wq for init complete work
      https://git.kernel.org/broonie/regulator/c/03eab318cedd
[2/3] regulator: pfuze100: add set_suspend_disable for LDO ops
      https://git.kernel.org/broonie/regulator/c/7595f50ff822

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

