Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17A369D62
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188861; cv=none; b=lhVrH6+lNt0aGwE43qFRQEMIGATBr8+i4BjkqV4c7iUzQmEHB60UTLx3viEU9ElYahuUtDgK7nZ9V5YZJFrOwz4MOhdOZZfDdeAsd/MXXbdiduS1UtktnJouZDD24PoTFv5ZgoAEc3rsU5x9PSsPc/2fmMAIyFXIXIHqAcgyiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188861; c=relaxed/simple;
	bh=Qf3bAbZwtREEBJj5qSMLwdtShZW3yIoVvpJuaji+xiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qM98KbOxJmvBUmO/1JmchFbeCilKiVhoL5CHGg1tkE/z4YIjss+8Mp8fwy68UJBxItbTdGA3ZmUExyqOAyjUK2U8n8QsxUtMwUDLkWbOUrUVaX/SPQ2Ewr32t0ppe3SLY4h7aNTMbKPHAXUHDNxN8T6wOAddNVs3BVxSS5AY0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWSVVnWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWSVVnWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7203C2BCB3;
	Tue, 19 May 2026 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188860;
	bh=Qf3bAbZwtREEBJj5qSMLwdtShZW3yIoVvpJuaji+xiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IWSVVnWN0Td4QZRuATHFShwbZtk3RK3OLtOAmzDIWN9jCyV35fDD/Ht6SeRyb07so
	 oSwQ3A6Ufgj+nChTWjLUgnYyY0mkHz2L6NX+PLkVj/3WRjq7gx5ozU8AQaeaggM0Cl
	 yyR0TmhC9t2RSXJepzc7gdNd2M3SuHdA5uBrsUtZPap83pFneRm4HdKahjS7XrN+2W
	 wI8S4CMA1AZCG+1KjXHNvNSxNPFueb3ePuyHpKKyCAJXvoHfX9yxrDctcQfNDvLz7A
	 AsGQgkxizGsCMVBlHKJLPyBoQJW8SX7eD393JTOT55LeDHAl42TA7+XKC0rk+1OicP
	 pV00kIw/5V/XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/37] drm/mipi-dsi: turn DRM_MIPI_DSI into a tristate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-28-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-28-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:07:40 +0000
Message-Id: <20260519110740.B7203C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing module_exit() routine in drm_mipi_dsi.c
- [Low] Linker error due to IS_ENABLED(CONFIG_DRM_MIPI_DSI) evaluating to t=
rue when built as a module
--

commit 980deb1ce9940525b50bf77a81377ee0a4c56aad
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mipi-dsi: turn DRM_MIPI_DSI into a tristate

This commit converts the DRM_MIPI_DSI configuration option from a boolean
to a tristate, allowing it to be built as a loadable module. This also
enables other tristate modules to depend on it when it is built as a module.

> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e730e04447418..6a14bb03607a7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -43,7 +43,7 @@ config DRM_MIPI_DBI
>  	select DRM_KMS_HELPER
> =20
>  config DRM_MIPI_DSI
> -	bool
> +	tristate

Since DRM_MIPI_DSI can now be built as a module, does drm_mipi_dsi.c
need a module_exit() routine?

Currently, drm_mipi_dsi.c uses postcore_initcall(mipi_dsi_bus_init) but does
not define a corresponding module_exit() function to unregister the bus.
Without this, the module will be permanently pinned in memory after loading
and cannot be unloaded.

Could this change also cause a linker regression if CONFIG_DRM=3Dy and
CONFIG_DRM_MIPI_DSI=3Dm?

Core DRM code like drm_of.c uses IS_ENABLED(CONFIG_DRM_MIPI_DSI) to
conditionally compile drm_of_get_dsi_bus(). IS_ENABLED() evaluates to true
for both y and m.

If DRM is built-in and MIPI_DSI is a module, drm_of.c will compile
drm_of_get_dsi_bus(), which calls of_find_mipi_dsi_host_by_node(). This
function is exported by the drm_mipi_dsi module, so it won't be present in
vmlinux, resulting in an undefined reference.

Does the Kconfig dependency need to be adjusted, or should
IS_REACHABLE(CONFIG_DRM_MIPI_DSI) be used instead to avoid this?

>  	depends on DRM
> =20
>  config DRM_KMS_HELPER

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D28
