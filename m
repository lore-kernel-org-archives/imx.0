Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92337EFEA
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753040; cv=none; b=dWkJ9p458XM6VlF8cWWHOB01nrdA8Vj7qfYAR3+DTotqkRzU0Kjz1UpnwYqSp0OhqPN1Znm4Ot/ZOKZhCJOSmUkbNj2m27K/DDqdawl6HNihg98ArD0SiUep0ipSUEJQnEWuWhAqAn4DALqVUjd96C7s2nwRW8Rq2wOTU2FrakA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753040; c=relaxed/simple;
	bh=0nvF48fN+C8tctu1MyhoXyyj7WHBfBjgVUGhqPKvG0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6u2pARJesBTonFu5isJAR81WmoA3aiw2k3TIeHghYF7EQ0bhtFgjNPAiy9Na7MZ3Rsh9l7vIk2RYhQ+esF5Toho3i6x+0oDOXQbf9g0E9gI09+ynonWKNwXuA6gkAFYCiOFA5YdK9MuqpiuasgGT4IytD6itmCs8n0hBH4+3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avQBUmc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avQBUmc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF16C2BCB3;
	Thu, 14 May 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753040;
	bh=0nvF48fN+C8tctu1MyhoXyyj7WHBfBjgVUGhqPKvG0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=avQBUmc7p7W3RIeMQYBYssNNDTTMAs1cQtXDQqbeBprrUghXrwkBhNWEkQErZ5cxI
	 d0Icv+z3bfcshT22c4NDRDm0STd0FY6AAI+Hd1c/UBNLNILLn9TEiAc01an4+wI48p
	 FRmxVmA/XVBY1Z6Fex7iZ0PBbwA3TWLmtpiApnqLZ11EPBWkh/SPWYpFrMF/w7q8vU
	 mLr/C6G90uokmZl7DHFK2gTzjgfZ1bs0rWqHZVv5PxM1Dm8KNRXTDpmaQ9T9O94FjY
	 owNiDzuMrFG7q8aDZzLE96VTbhQzP0jdy3UUZchVIeOpjZqlgZHkMKmtCbDL93aMmt
	 Cl4QAMdoLk0Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clocksource: move NXP timer selection to
 drivers/clocksource
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enric Balletbo i Serra" <eballetbo@kernel.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com>
References: <20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:03:59 +0000
Message-Id: <20260514100359.8EF16C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] `VF_TIMER_NONE` is selectable on Vybrid (`SOC_VF610`) platforms =
but relies on hardware that does not exist on those platforms.
--

commit 7af32213cbfafc4c689a6d3a071f0b9a62837a94
Author: Enric Balletbo i Serra <eballetb@redhat.com>

clocksource: move NXP timer selection to drivers/clocksource

This commit relocates the NXP clocksource selection from the ARM mach-imx
architecture Kconfig to the drivers/clocksource Kconfig so it can be shared
across architectures. It updates the choice block to support ARCH_S32 and
adds a None option to allow using the standard ARM Architected Timer.

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44c..15c02d3e9dbff 100644
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
> +		depends on ARCH_MULTI_V7 && SOC_VF610
> +		select ARM_GLOBAL_TIMER
> +		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +		help
> +		  Use the NXP Vybrid Global Timer as clocksource.
> +
> +	config VF_USE_PIT_TIMER
> +		bool "Use NXP PIT timer"
> +		select NXP_PIT_TIMER
> +		help
> +		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.
> +
> +	config VF_TIMER_NONE
> +		bool "None (Use standard Arch Timer)"
> +		help
> +		  Do not use any specific NXP timer driver. Use the standard
> +		  ARM Architected Timer instead.

Does this allow VF_TIMER_NONE to be selected on Vybrid (SOC_VF610) platform=
s?

Since the choice block itself depends on SOC_VF610 || ARCH_S32, this option
is visible on Vybrid builds. If selected, it would result in a kernel
without a valid scheduler clocksource because the Vybrid SoC lacks the
standard ARM Architected Timer hardware.

Could VF_TIMER_NONE have a depends on ARCH_S32 or !SOC_VF610 restriction to
prevent creating unbootable kernels on Vybrid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-fix-nxp-ti=
mer-v2-1-533b99c57b67@redhat.com?part=3D1
