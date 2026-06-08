Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE433C195;
	Tue,  9 Jun 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994437; cv=none; b=Xy9fCTtu4EdlpztCrQrAjDZoxyYNXHoWGc0SHZxgKyAgIWd4VcTJivoIHz/npcX1439LcQE64y8NW0AX3C12vi228zWyWyHREWoR/XRqlbDxBFEjmGvjBPsu0QnNFd+l/Xxwy2CaAdwwuRVvFp7G2qO93AULg4cutES6Snpe8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994437; c=relaxed/simple;
	bh=XSjoHKs8MCMIjerSDcjBJdrB/+DJHhLIab/p1Ghmjxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D78vzRlbIvPufwAGxHrjVLk0RSxDSOxbKYdfSjg0I9YwMCqFdxRui5Rx9nqNF5HYIZIiBPNCQ6LJvqYslMwnEk2PRGkIJsZikPWo3L90PC9d/w8bNpvJuylppBNHGnXjfQgRnphOF6zAdQ8PycxG21Ufre4n77I8C0EcPPFnqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLN3Tz0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLN3Tz0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01CD1F00893;
	Tue,  9 Jun 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994436;
	bh=ogyh4wObZizXAya8DYDVQH81cbqfbWCBqwPAMYcZIC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gLN3Tz0CeLBoINPbLoMDEUIeCS40M/eztQaoXb2xOXXCuWH/8ntgJohyObvQ49N/Q
	 1vu3Qb/12zKwAVIoVIaEfG0NxUHdmW5xIwt6AYmcYQqhb/7ZS8P7VZlvkzuHG+81WE
	 zBsafO+3vZ4CFTAr/PkIfa3TnPo1G736JHlBBX2/FTwVZDKeB9VpMyyUvfwl58YDPy
	 p4derCnh8YJvfxsZaBUuaOqjHlp7BGDxE+Cbo+0O9Bo/cxQe23lKWqRQ9PpBk8KF1p
	 Q/HbK8FCDH/RjSQSV+WqD9F2nxhyv6gZkuPeP/bbJb5Uamr+iW8Qluy335nZegcijS
	 4FljBATGIB1Gg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@nxp.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>
References: <20260528020725.2265321-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection
 and driver_name support
Message-Id: <178094123266.20828.2548677822968710520.b4-ty@b4>
Date: Mon, 08 Jun 2026 18:53:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XSjoHKs8MCMIjerSDcjBJdrB/+DJHhLIab/p1Ghmjxg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9Fxq985rl6kfTLCWLnzgyx0mjqIxkqYD996p
 GmnbAq+9+WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRcQAKCRAk1otyXVSH
 0Pz7B/9FpjAQLHNUdUnnW0vYfUAIj7d1B+K/0BzPsIUnYoaLa/9/3mAYK+III9/dbbmJ5lIeciG
 BCywHAC0/i96S9Ocrz8FYBu6NXNozRr9GVGV2UrbqjjhaNKq/LI2fXnpYhPWj0jsPPWMX8/PPrr
 /c2nrMWRmZMhm2BrgvQI5FOyFqjMhAMl87ZfhHzxvvS5POknlQQw4Cb79LrELy2L4iuMgC+9PiX
 Jk121hJBNFh9wF4ozz83VsyVui5ZSg28uV+snrfVPV9/vm6E2w5RQMEp2zn2r8vAnllRum0htVE
 O2hed+mhbUu87ZlXDJavMdPzvvCturASxUp9R2Jsb2CnhHkr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 11:07:22 +0900, Chancel Liu wrote:
> ASoC: imx-rpmsg: Add headphone jack detection and driver_name support
> 
> This series adds two features to the i.MX RPMSG ASoC card:
> 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
>    device tree property and use simple_util_init_jack() to
>    register a headphone jack with GPIO-based insertion detection.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
      https://git.kernel.org/broonie/sound/c/1558039bea60
[2/3] ASoC: imx-rpmsg: Support headphone jack detection
      https://git.kernel.org/broonie/sound/c/ec74d4f934a6
[3/3] ASoC: imx-rpmsg: Set driver_name for snd_soc_card
      https://git.kernel.org/broonie/sound/c/af0d8aa7fcd5

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

