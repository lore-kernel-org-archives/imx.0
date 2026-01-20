Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752338B98A;
	Tue, 20 Jan 2026 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936904; cv=none; b=KtImM446sDyVBHfEyfgzAH4wLEgIW562O+hAgVzQ/fhSnN75oamaoU1yP1vMsYvnWTVITBjs0bu/YzaViRAbhyDHEn1RFbhtHHMZ/nFD2sv+nt14fsILkmKq/XmZOBp9IlQU5cbZ1fjpJalnjr9Ke2ESpUTQAwmdv4LOpA2q0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936904; c=relaxed/simple;
	bh=1sn+JESYsGbOQVrg2FdMmLiKmgF9OvuYdvrpp6ndyz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uT2zBxN0Nds0X2LjCp/lH6IgPe1Izi66VbAr6gVwVdkye9rnV7y2/tRBqEI3IzwrcU27Vzh16sL3hloBUAy97r8a600Z08MuPgPsMdZj/s6QoZ9quCbvhOU4SoHp+v49sM5IubhifTCCLiltjXIzABq2ZdGIEZ/AgvoynJdl2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVjY7nRq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVjY7nRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC854C19421;
	Tue, 20 Jan 2026 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936903;
	bh=1sn+JESYsGbOQVrg2FdMmLiKmgF9OvuYdvrpp6ndyz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DVjY7nRqtNJpdxO46UhkvzcpzUG7eFsGBNxeNafEMqc/0JMgTis5DEYWF1li9lQfp
	 XKC7q+gZ76HuX4wOMZyI7gtHXQgtxe5N1GXBVGuBOajirNmkO6ar2wvcSJbnME07/i
	 FB7WSuzXEnPK6ItLNPKL0fDNXAv3K3xU+LQspe/4n1mLXqkv+PkoFUQgFhHosDfngS
	 Cu1FbxT9JyedPFBtmLMOUK//DPhDIn9EwKNMlOrk/8GmH5c+OOLT0MJ2r4JzMIC+NP
	 CuxpAwwjh8TkRj57XORz559NShhifXCpIR9KFi22qpu6xaij+i9iri2+whotlhba/B
	 b8Ih6N93rJSiw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20260118205030.1532696-1-festevam@gmail.com>
References: <20260118205030.1532696-1-festevam@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: fsl: imx-card: Do not force slot width to
 sample width
Message-Id: <176893690263.777973.15824025295964117427.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:21:42 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 18 Jan 2026 17:50:30 -0300, Fabio Estevam wrote:
> imx-card currently sets the slot width to the physical sample width
> for I2S links. This breaks controllers that use fixed-width slots
> (e.g. 32-bit FIFO words), causing the unused bits in the slot to
> contain undefined data when playing 16-bit streams.
> 
> Do not override the slot width in the machine driver and let the CPU
> DAI select an appropriate default instead. This matches the behavior
> of simple-audio-card and avoids embedding controller-specific policy
> in the machine driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-card: Do not force slot width to sample width
      commit: 9210f5ff6318163835d9e42ee68006be4da0f531

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

