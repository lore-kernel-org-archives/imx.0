Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D51D7E5C;
	Sat, 30 May 2026 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101945; cv=none; b=hiaeKsJx1DTzkPr1RiZ2aR+NHaCJIoBJlY8fJd27cvXtvSQCCFbSizX8VAVruKPiZpTvNjebObEkK4OxsygCKwjiMGz/jI813oGeYwd2W+HedNuo0TzgFXLP6IfMFLJRcOrDFMOytktYPVn3qQQlVGW7mzuMB0+F7yJVqH9pQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101945; c=relaxed/simple;
	bh=DiYZ82Ejy/uqZRxg4M63ZQrtIoAEkOIE9jpXY8WKtv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XqPjfEl6qqmslBOXSaaI+CBWyqOzgSJREK1KYru1eU73rst3f3pIzSks5JgOKW/rGK0vebhsO8akCGqIxJfnSynxh01ajqMlZuSu4V7taIroi6Wb/rXtG0BnG+uommBne+dcBQfJp0fYEaEex+Zyr9U/cXve9XEvWy+3cMZuNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbQaHfhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbQaHfhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4210B1F00893;
	Sat, 30 May 2026 00:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101943;
	bh=dyOuNZ7U/QCl4ZdxNOXAkQ6SJ0eXYsTFL/N4pkx9KQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZbQaHfhFT2iSMK5r6709XuKgpKBCQqQvaEr58w0xxF8c0jXZ+XWy6AAGL9vKRRVaq
	 9Es6z0YgrSGgH+ak0ZuOkLFgldryCFJrhmd8MSA4ODTArclLT5+lvONwUIPYTvH+Ue
	 d7JNQk5yCwdioB9XKYkazyDTifoVp6Zr3taCHUg3YYXx0/7J74fvrznWb2IVP6KBwP
	 BhGLH3FK3GKzCbvV13Cv9Wv6D2EPF6jfz3+CIX6ES91RIFOZsgiDcGClW3WK6Emg3g
	 p0+QwiiLcryEfGq6PdflGEIWcLoaBX5sgzuxU2niYnDj0MoFzoEXDyFuNHRTrGzpET
	 iPIX1bWn7j1iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:42 +0000
Message-Id: <20260530004543.4210B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Child platform devices dynamically created during probe are not un=
registered on error or driver removal, leading to device leaks, memory leak=
s, and a use-after-free of the devres-managed regmap.
- [High] Power domains initialized as 'on' remain powered indefinitely due =
to missing `sync_state` callback and missing `GENPD_FLAG_NO_STAY_ON` flag.
- [High] Missing lower bound check on the signed `domain_index` variable ca=
n lead to an array out-of-bounds read.
- [High] A potential divide-by-zero kernel panic when calculating the power=
-off delay if the IPG clock rate is less than 1 MHz.
--

commit b02126ed3cd782919c6e44b786dd9f03cbf6fa28
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

pmdomain: imx: fix OF node refcount

This commit fixes a double put in platform_device_release() by adding
a missing call to of_node_get() when assigning the OF node to a
dynamically allocated platform device in imx_gpc_probe().

> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab3..42e50c9b4fb9f 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)

[Severity: High]
This is a pre-existing issue, but is there a missing sync_state
callback or GENPD_FLAG_NO_STAY_ON flag for these power domains?

The domains initialized as 'on' (with is_off =3D false in
pm_genpd_init()) have genpd->stay_on =3D true set by the genpd
subsystem. This flag prevents the domains from being powered off until
it is cleared.

Typically, a provider's sync_state callback clears this flag, but
neither imx_gpc_driver nor imx_pgc_power_domain_driver appear to
implement .sync_state. The driver also lacks the
GENPD_FLAG_NO_STAY_ON opt-out flag.

Could this cause unused power domains to remain powered on forever,
potentially leading to hardware issues when late regulator cleanups
disable regulators supplying these forced-on domains?

[Severity: High]
This isn't a bug introduced by this patch, but does the domain_index
validation adequately protect against negative values?

Earlier in the function, of_property_read_u32() reads a 32-bit
unsigned value from the device tree reg property into the memory of
domain_index, which is declared as a signed int. Input values
with the most significant bit set (>=3D 0x80000000) are interpreted
as negative numbers.

The upper bound check uses a signed comparison:

    if (domain_index >=3D of_id_data->num_domains)

which evaluates to false for negative numbers. Can this bypass the
validation and result in an out-of-bounds memory address computation
for &imx_gpc_domains[domain_index] when it is passed to
platform_device_add_data()?

>  			domain->ipg_rate_mhz =3D ipg_rate_mhz;

[Severity: High]
This is a pre-existing issue, but could the truncation of
ipg_rate_mhz lead to a divide-by-zero panic?

The ipg clock rate is calculated earlier using:

    ipg_rate_mhz =3D clk_get_rate(ipg_clk) / 1000000;

If the clock rate is less than 1,000,000 Hz, the integer division
truncates ipg_rate_mhz to 0.

Later, imx6_pm_domain_power_off() calculates a delay using:

    DIV_ROUND_UP(iso + iso2sw, pd->ipg_rate_mhz)

Since DIV_ROUND_UP(n, d) divides by the denominator, would passing
a denominator of 0 cause an immediate kernel panic when the system
attempts to turn off the power domain?

> =20
>  			pd_pdev->dev.parent =3D &pdev->dev;
> -			pd_pdev->dev.of_node =3D np;
> +			pd_pdev->dev.of_node =3D of_node_get(np);
>  			pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> =20
>  			ret =3D platform_device_add(pd_pdev);

[Severity: High]
This isn't a bug introduced by this patch, but are the dynamically
created child platform devices properly unregistered if
platform_device_add() fails?

The child platform devices (pd_pdev) are allocated and added within a
loop. If platform_device_add() fails on a subsequent iteration, the
function returns immediately without unregistering the previously added
child devices.

Similarly, imx_gpc_remove() does not unregister these devices when
the driver is unbound if the newer device tree binding is used (pgc_node
is present).

When the parent device is unbound or fails to probe, the devres
framework automatically frees its regmap. Because the leaked child
devices still hold a reference to this regmap (domain->regmap),
would any subsequent interaction with them trigger a use-after-free?

Furthermore, does the missing unregister path now permanently leak the
acquired of_node_get() references introduced in this patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D4
