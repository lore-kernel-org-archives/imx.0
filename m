Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39D397332
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433399; cv=none; b=dYa/375EqO6Pk/S946xhnVZuMW9Qe9sn15zK38wCmc+VMc5LeDPUOsOkIJoiUicKW0blqBX1YKdsZhebwpFxjSUZfm3o5e3yWU+f5LQS6w5glaRWPpYzjVpul2gerVA424qm5LoWwgRw0X1c9aCDP3Xo/LMz5TBFLd45wcNvUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433399; c=relaxed/simple;
	bh=zoyXTz6LC1R6AOMtwoPutKdVQy/F8bioEUJwUg52RjA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kc+BCHShEmBGPnYRebAv7hEkkMoaiipOC2QqRIN2fDz9gho0ePjJ5O9BJIHGP5BEhgIQ3ksma3rwLHOr2sS1eZR/UL32Kb8Dm9M84b800LTzVRoxAkIyuDJzvmRAaO2ZxDUwt7LxGqrfALnSQs2HQUJvP7qPsCMRiXhOBeBIffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9MJlD/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9MJlD/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F6A1F00ACA
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786433398;
	bh=umesvR1teUL1fcs6zCQaA4uwUSphr0DcLDjBnMFX9JE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h9MJlD/TMbk1yYwxU1auxF3+RTiscFC8LEVkGOBR3L0L5NnHKaO35NeHFQbkMq7+X
	 KpjM6059ZumPxL3YaJJ58W+d2plUYv4UhsRjmuO8c3PXeMRGCo+WjQwVyHS+HdmnaK
	 LESbW/tUZTbeRqV6Rk3F3JSfA/7Urk1eaIb/1Ty0XHB5rNkIVSx2kwVbMo1mRDUDw3
	 8o759Z3P0QB95srqkPVsv9lYLOwLewOTKZjSmDHfT2kiJ1N12/qyE9e8ikWarOH8nB
	 VB9Z+UoNQoVli6ZzDwo80aAOEb2AsdwLNGx6T1wTP/5l3SSeem4O5GSgqDCWkq7rGM
	 zcHmD5JC4udtQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2699721e87.3
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 00:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqugSWQJRfM2nLis3hbrv2h5qAVEhfiJt2a84AYboM2hZWimnRrb9t86UAEXfS9aDCGF+I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8FqAlI9S1dne1bpXoLHiUhNwqHPhZlFHrUqcC/+Agsg3U0hDB
	Tvz5lmZIPMmDCT5a/sgWSdhFmhoo/Q8THLs/LHq5wLOHPq0w/6ERNKz+OCqk+8DkKdlQmf28ZEY
	MRZCHBXkFu5A6eKKiZPvxFtsN5giFuw2w35gY1jDqsA==
X-Received: by 2002:a05:6512:3096:b0:5b1:5451:d969 with SMTP id
 2adb3069b0e04-5b448649002mr229675e87.25.1786433396689; Tue, 11 Aug 2026
 00:29:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:29:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 00:29:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810213456.1268831-1-marex@nabladev.com>
Date: Tue, 11 Aug 2026 00:29:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfnU5mJHsoJee-8-xy3e7vXE5yORfZRN9=Wom2-+ZocUQ@mail.gmail.com>
X-Gm-Features: AUfX_mw3-GSxONxlPDeIuQSCzqxdWbLCCFW-DmbFUzmLFDfvwVGs6ZIrWEPCMBI
Message-ID: <CAMRc=MfnU5mJHsoJee-8-xy3e7vXE5yORfZRN9=Wom2-+ZocUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Aug 2026 23:34:38 +0200, Marek Vasut <marex@nabladev.com> said:
> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Fedor Ross <fedor.ross@ifm.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..bc279b864d3cb 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -275,6 +275,7 @@ config ARCH_MXC
>  	bool "NXP i.MX SoC family"
>  	select ARM64_ERRATUM_843419
>  	select ARM64_ERRATUM_845719 if COMPAT
> +	select HAVE_SHARED_GPIOS
>  	select IMX_GPCV2
>  	select IMX_GPCV2_PM_DOMAINS
>  	select PM
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
