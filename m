Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A23B1EF1
	for <imx@lists.linux.dev>; Wed, 13 May 2026 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651854; cv=none; b=aTDh/0+dQH5wtmBvyB0kLjST6rug3dMMSJzudG1CyoTKTW5KhV30s0IIvulSBSYrPL6pMqQexP5X1dvtfYR7yL1VLAYO9LLJOgGx1o3cClurjMkjOxn9Le4uh66wa4j60ErOiZDBpPjqGW/GmbZCpyaenJebpKoQ3bDCBQ5gmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651854; c=relaxed/simple;
	bh=Vx1A/dhZ77S1g+ESyaJKDLLH2C9WdGxPJRMnRBS+sZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QsDPcMDb55tKxRgx0ou556COpiiYNyFEY+/5y7RXObZFF5IlVEvIbT4VgVyJqlZlTKJaOlRq2GYctojd9Kml0YaDLsaMQg9eI0dsvuLhj8Y47zzArqXqShifrCnh+kPNU48SRCMEsXW0pmqGVbUR+67MI06doh+oa+x60p8271M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABO2FbmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABO2FbmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE2CC2BCB7;
	Wed, 13 May 2026 05:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651853;
	bh=Vx1A/dhZ77S1g+ESyaJKDLLH2C9WdGxPJRMnRBS+sZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ABO2FbmG51azvWkMUKtZmbV5Amg5+eRGtDtMbf0JMWZTrEWfdYqb0xLIty+rDwAo9
	 kWIFCA037J8AntK2zw0Pcrp0Pt2/JeOH2sxLqOqq49LD/OVLjRWqy+dUmYkUier1eq
	 EisC7AedZiBMFxo7/rruWesf6vLq0GuDkNlxjv6WsA0CiFagIXLOyoNjnIGq6fdnQr
	 aqZI8ZvL6dp/fNo4KuiL1ftRbCRm2qZHHOPnu1uqvEZlbRFt738TL27Pq+hkzc0aW0
	 YmZ9k0/7h2CiJ45H3eXrpzrOVKvROYX3jnlddKJgpgd7jvZRwVv82iSTjGNGFTsBk+
	 6VQ9UBc8bMtgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] clocksource: move NXP timer selection to
 drivers/clocksource
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enric Balletbo i Serra" <eballetbo@kernel.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260512-fix-nxp-timer-v1-1-565e13ef3e46@redhat.com>
References: <20260512-fix-nxp-timer-v1-1-565e13ef3e46@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:57:33 +0000
Message-Id: <20260513055733.BCE2CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch incorrectly broadens the dependency for `VF_USE_ARM_GLOB=
AL_TIMER` from `ARCH_MULTI_V7` to `ARM && SOC_VF610`, which breaks the defa=
ult clocksource selection for Cortex-M4 builds of the Vybrid SoC.
--

commit cb813057e5be52d91a25b9ef118dc8090d04e9c6
Author: Enric Balletbo i Serra <eballetb@redhat.com>

clocksource: move NXP timer selection to drivers/clocksource

This commit relocates the NXP clocksource selection from the mach-imx Kconf=
ig
to drivers/clocksource/Kconfig to allow sharing across architectures. It al=
so
updates the selection to support ARCH_S32 and adds an option to fall back to
the standard ARM Architected Timer.

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd91127065454..b5c88ec658025 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
[ ... ]
> +choice
> +	prompt "NXP clocksource for scheduler clock"
> +	depends on SOC_VF610 || ARCH_S32
> +	# Default to Global Timer for Vybrid (32-bit)
> +	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> +	# Default to None for S32 (64-bit)
> +	default VF_TIMER_NONE if ARCH_S32
> +
> +	config VF_USE_ARM_GLOBAL_TIMER
> +		bool "Use NXP Vybrid Global Timer"
> +		# This option is ONLY visible if we are on 32-bit ARM
> +		depends on ARM && SOC_VF610

Does this dependency change break Cortex-M4 builds for the Vybrid SoC?

The Freescale Vybrid SoC supports both Cortex-A5 (ARCH_MULTI_V7) and
Cortex-M4 (ARM_SINGLE_ARMV7M) configurations. Previously,
VF_USE_ARM_GLOBAL_TIMER explicitly depended on ARCH_MULTI_V7. This correctly
hid the option on M4 builds, allowing Kconfig to fall back to the PIT timer
by default.

Since ARM evaluates to true for all 32-bit ARM architectures, including
ARM_SINGLE_ARMV7M, this option is now visible on Cortex-M4 builds. Because
the choice block defaults to VF_USE_ARM_GLOBAL_TIMER for SOC_VF610, Kconfig
will select the Cortex-A Global Timer by default for the Cortex-M4.

Will the M4 core fail to boot since it lacks the ARM Global Timer and the
required NXP_PIT_TIMER driver is no longer selected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-fix-nxp-ti=
mer-v1-1-565e13ef3e46@redhat.com?part=3D1
