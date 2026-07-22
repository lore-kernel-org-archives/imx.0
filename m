Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C083E51FC;
	Wed, 22 Jul 2026 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691564; cv=none; b=uYS+0eBSyY5BKNGr5v9+jUg/pQUlwwpH3jXPoHKawpyD4daQePqy/dq8N1ipJ8dV9s98K79LfzpcQIH33qIkECXB91ixHAHKbFERx3uNKxiXf5nFL/b5IClJkUTS57Z7sPRhH3UlxFms9ICzJmRyZkPwO+sJYFpsXMVlh6HR4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691564; c=relaxed/simple;
	bh=fEroTalEbO1l8sx0P6NBeQaMyXoTWRy2oz/DyWP8oFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kIMQYcRbNwKZXA+HZ8vXwS6wFhZQ0GxpO2+dDdMGfFSzHEbk5gqN6ZP9mU9QLBQ2yjVqVJ8c7KPoWUS4/YPLFbLCzAdHsu85v2XcFQ53nQpafCH/vn6DymN4H87PqPc00kLk7pqOryIY6DCqnBlpsRGcpr+8rrU72bMeq6tu8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlAz3rQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlAz3rQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200701F000E9;
	Wed, 22 Jul 2026 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784691560;
	bh=KFaLkDqjUTH533a0XPYRKc4Lmx7Y2sIzo9u4BoBHOUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BlAz3rQzBjBYNsrhMXWGJHtUPzQ530DVlwM9KUY0FUZGjQQ5lhp//1Fk2nOFLAgtN
	 Q5MZuz0+WIoAsUBdQqrcR37h3Y2o1ZRDCOOaLPyvvVkx7KyG8hpz1R1poMCwvoaS+Z
	 a92GNkBfK404KDYFA9ivG9KlznsOwUGb8p/5Vd3Hw8YW9dG/kj3USZqAwRMiLXd7CM
	 PypE26LttCb5Gk9qhGoydwr8t0aXQCgPo+LSLOkmPVY3R/7CJRYolEDbX2/W3m1eBD
	 EsYLI8C08pjRgu20AGmTY+nLwjl9ruFJVyG24raf2HnLuNvmn/8lYCoq0Xp657Nr39
	 i49XbKyFqzcIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pmdomain: imx: scu-pd: allow building as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260722032321.2693300-3-Zhipeng.wang_1@oss.nxp.com>
References: <20260722032321.2693300-1-Zhipeng.wang_1@oss.nxp.com>
 <20260722032321.2693300-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 03:39:19 +0000
Message-Id: <20260722033920.200701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Changing IMX_SCU_PD to a tristate exposes a critical probe order r=
ace condition with the SCU clock driver, leading to unpowered hardware and =
system crashes.
--

--- Patch [2]: [PATCH v2 2/2] pmdomain: imx: scu-pd: allow building as a mo=
dule ---
commit d3bf08bb865becc5d6316a0d9e70a9dbcc5e5ef3
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

pmdomain: imx: scu-pd: allow building as a module

This commit converts CONFIG_IMX_SCU_PD to tristate to allow building as a
loadable module, which is required for Android Generic Kernel Image (GKI)
support. It adds MODULE_DEVICE_TABLE and a module_init function since the
driver cannot be safely removed.

> diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
> index 00203615c65e9..472e9dec6bd4e 100644
> --- a/drivers/pmdomain/imx/Kconfig
> +++ b/drivers/pmdomain/imx/Kconfig
> @@ -21,7 +21,7 @@ config IMX9_BLK_CTRL
>  	depends on PM_GENERIC_DOMAINS
> =20
>  config IMX_SCU_PD
> -	bool "IMX SCU Power Domain driver"
> +	tristate "IMX SCU Power Domain driver"

[Severity: High]
Does allowing this driver to be built as a module expose a probe order
race condition with the SCU clock driver?

If the power domain driver is loaded asynchronously after the SCU clock
driver (clk-imx8qxp), the clock-controller DT node lacks a power-domains
property, so fw_devlink cannot enforce the correct probe order.

In this scenario, the clock driver manually looks up the power domain
provider using of_find_compatible_node() and calls of_genpd_add_device().
If the power domain driver has not probed yet, genpd_get_from_provider()
will fail and return -ENOENT.

The clock driver ignores this error in imx_clk_scu_alloc_dev() and
registers the clock device without attaching it to the PM domain. When
the clock is later requested, the Common Clock Framework's
pm_runtime_resume_and_get() will succeed passively because there is no
attached PM domain.

Can this lead to system crashes or hardware access faults due to
accessing unpowered hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722032321.2693=
300-1-Zhipeng.wang_1@oss.nxp.com?part=3D2
