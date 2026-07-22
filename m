Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD96349CD8;
	Wed, 22 Jul 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709312; cv=none; b=RqMsjy+vJde9gaI+Hhlzuqegcr+41OibhZBwMi+4hKfFp6C9irzbW9pwvSbCuSACDcrFvU1NFYQBLeWwraX9VUQ+TATDBclFp9X33O/UMS2bHNzhEHvUirLeg3Ejs3jGK/KaaVORf2W3v9nOI0MkKo6Kxb8s1O73rJYU+mJ9TXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709312; c=relaxed/simple;
	bh=GOKybl2XcGuvPxJY1F44NoewJfLup9LXrHb8F8AUJms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZ49mZA491C5cDJO+32UD19fvN1Rgn2qvVopSa6QPHor9jn3ZgweoRzjlT6ZxCQv6ZiaJ3vtaNMQWy/C5RCxmkZHvpH7Pe3TE2tG3D5fdE1T5zm8Jfmto4fl36KrU0+uotyrAC9WskwM9vX5WPEtHhbMZjwh/URKiZH6aceM8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drJ6HFKB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drJ6HFKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500511F000E9;
	Wed, 22 Jul 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709310;
	bh=GBEx/RGEkGmxZBOJo6zho7OT5jBHay166HFhc2fafjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drJ6HFKBPoMinNBTgGJlv6q1VVXQdsXVuzW/aPc/kGs/nztu2p2uLKFCPYMNHD/ol
	 UV9cHtQ+DayJwo36p2cGRunDQB2KaLILpH4FawGV5LiKKS9eM+RDXkXhWoy4JBRNvC
	 uZ8WoeoMbU99W2U4ApCSmnQzabAYMjPCICoftIFKyXqI1tZcCW8tqww5p4cSu3T7Wn
	 yUwaQo2fQE43T18avE82GzeBRV3PB/mdvF5XZYik0gy8fTR6DOyfYOGSu1673VHzCM
	 xu78k96rtzYKjCqlKQk5c17AYH1BfJiVFr+nWXb7AbCvFKBfaQc9F2eMGjmbbM/a/V
	 vZzjeIcurfM6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260722082522.3747962-4-Zhipeng.wang_1@oss.nxp.com>
References: <20260722082522.3747962-1-Zhipeng.wang_1@oss.nxp.com>
 <20260722082522.3747962-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:35:09 +0000
Message-Id: <20260722083510.500511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `MODULE_SOFTDEP` declaration specifies an incorrect module nam=
e, rendering the fix completely ineffective.

Pre-existing issues:
- [High] Ignoring -EPROBE_DEFER causes silent device registration without p=
ower domains, leading to hardware exceptions.
--

--- Patch [3]: [PATCH v4 3/3] clk: imx: imx8qxp: add soft dependency on SCU=
 power domain driver ---
commit f47fec3b0de49112a338b6cde236c5713303a35f
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

clk: imx: imx8qxp: add soft dependency on SCU power domain driver

This commit adds a soft dependency on the SCU power domain module to ensure
it is loaded before the i.MX8QXP clock driver. This attempts to work around
silent failures when attaching power domains during device initialization.

> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index c781425a005ef..23ef6b959dee8 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -373,3 +373,4 @@ module_exit(imx8qxp_clk_exit);
>  MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
>  MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_SOFTDEP("pre: imx_scu_pd");

[Severity: High]
Does this soft dependency specify the correct module name?

The Makefile entry obj-$(CONFIG_IMX_SCU_PD) +=3D scu-pd.o typically results
in a module named scu-pd (or scu_pd). When modprobe parses imx_scu_pd,
it won't find the module, ignoring the dependency and rendering the
workaround ineffective.

[Severity: High]
This isn't a bug introduced by this patch, but the patch relies on a module
load workaround rather than fixing the root cause of the probe order issue.

In drivers/clk/imx/clk-scu.c, imx_clk_scu_alloc_dev() silently ignores
errors from imx_clk_scu_attach_pd():

    ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
    if (ret)
        pr_warn("%s: failed to attached the power domain %d\n",
                name, ret);

If the power domain provider probes after the clock provider or defers its
probe, of_genpd_add_device() returns -EPROBE_DEFER. Because this error
is ignored, clocks are registered without power domains attached, leading to
hardware exceptions or power leaks when those clocks are accessed.

Should the -EPROBE_DEFER error be propagated up the call stack instead?

This would allow the standard kernel deferral mechanism to reliably enforce
the initialization ordering, handling manual module loads and provider probe
deferrals gracefully without relying on MODULE_SOFTDEP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722082522.3747=
962-1-Zhipeng.wang_1@oss.nxp.com?part=3D3
