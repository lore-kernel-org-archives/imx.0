Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EA32A3EC
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176802; cv=none; b=Pw1/Egf3pojsinCsZxm2sln6n3zGlq17W514LQs0+0yXp2qLa35PPvk4ZN6N4fxOF03yohFKubcd3o6f06ZGABfM57CYS/aqh40MvtSw9mQtPKrPtCE4pooG7G3y2wHlguo9YhAWyzsi8mIiO+6lEIvCD0FJ79ZLYXjsMUW+5bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176802; c=relaxed/simple;
	bh=0iOtoGnUSUjvt2LKf93Dwrwi1dtxs/VPwdcult4HWUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBbEZb8opRNO3McjQ9S8ZQH+54+hTygb7ZJC7axLYoPMUOBxSri8hUYUvPGRvuAJwsB1VSpwpjnfdScs5ZwdbQU1ykbjP27GfGTvmngmnwviJhYMH92VKCuXpJW483Td4LUJRDgD9BKwCCVxKEbaXpUabo7z0iJk6yOlzlHDRNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw0QHRK7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw0QHRK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368121F000E9;
	Sat,  8 Aug 2026 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786176800;
	bh=3lBRxUrEG7zO4LWvl4PDAJBlRl0+c+JP5cyDflU06j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dw0QHRK75ro9VcLTAIDdy47Ic+iCzpF3M8W28U/EzIzkk0JQ8gQKRSclmghHCbtEp
	 0BA6vaV+8MnaTCLRe2dA/DK+hIhBsn+RbPi9sGKZhMwAt5KUpKIRCeoOBCDhTu1XtN
	 AmF2GUGx2mMjoNChzzC9dLYSrAlVpdjqjjVv7S6Z9ySoLOQ5/2SlQAEkKxcOf56zR3
	 ++wI0CNProoZpRcVUdM4G55D+uMK2aZ/g1eBpiklcwsfNjynhUasVaGnCKOgR5fL3h
	 BsTQpmpm5KtVwfh9aqXOzplz3At4kxZD6hopJ6AjpFCwkXY1czkcP8WQYW9JDUuFt2
	 BnfziWrUOZBWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260808080215.2669452-1-lgs201920130244@gmail.com>
References: <20260808080215.2669452-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:13:19 +0000
Message-Id: <20260808081320.368121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing bounds check on `count` leads to a severe stack buffer=
 overflow when reading device tree properties.
- [High] System suspend causes a NULL pointer dereference or Use-After-Free=
 when the driver uses the legacy device tree binding or fails parsing.
- [High] Duplicate indices in the `clock-indices` device tree property lead=
 to a double-free and potential invalid pointer dereference on the error pa=
th.
--

--- Patch [1]: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on er=
ror path ---
commit 662987daf90805747f064d71045351ad4f076ebd
Author: Guangshuo Li <lgs201920130244@gmail.com>

clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error path

This commit fixes the error path of imx_lpcg_parse_clks_from_dt to properly
undo the runtime PM configurations. It ensures autosuspend is disabled and =
the
usage counter is correctly dropped on registration failure.

> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx=
8qxp-lpcg.c
> index f0cf6cf918992..fa79d52cbb36e 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platfor=
m_device *pdev,
>  		if (clk_hws[idx])
>  			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
>  	}

[Severity: High]
This is a pre-existing issue, but does this teardown loop properly handle
duplicate indices in the clock-indices device tree property?

If the device tree contains duplicate values in clock-indices, the second
clock unconditionally overwrites the first in clk_hws[idx] during registrat=
ion:

	clk_hws[idx] =3D imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
					    parent_names[i], 0, base,
					    bit_offset[i], false);

If an error occurs on a subsequent clock registration, the teardown loop
iterates backward and calls imx_clk_lpcg_scu_unregister() on clk_hws[idx].
Because clk_hws[idx] is never nulled out after unregistration, when the loop
encounters the duplicate index again, could it call kfree() on the
already-freed pointer, leading to a double-free?

Furthermore, if the failed registration itself returned an ERR_PTR that
overwrote a duplicate index, would the loop pass the ERR_PTR to
imx_clk_lpcg_scu_unregister() and crash the system?

> -
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> =20
>  	return ret;
>  }

While reviewing this code, I noticed a few other pre-existing issues in
the surrounding code.

[Severity: Critical]
This is a pre-existing issue, but does this function properly validate the
count retrieved from the device tree before using it to populate stack arra=
ys?

imx_lpcg_parse_clks_from_dt() retrieves the number of elements into count:

	count =3D of_property_count_u32_elems(np, "clock-indices");

It then uses count to populate statically sized stack arrays (bit_offset,
parent_names, and output_names) of size IMX_LPCG_MAX_CLKS:

	ret =3D of_property_read_u32_array(np, "clock-indices", bit_offset,
					 count);
	...
	ret =3D of_clk_parent_fill(np, parent_names, count);
	...
	ret =3D of_property_read_string_array(np, "clock-output-names",
					    output_names, count);

If a device tree provides more than IMX_LPCG_MAX_CLKS elements, will this
overflow these stack allocations?

[Severity: High]
This is a pre-existing issue, but does system suspend cause a NULL pointer
dereference or Use-After-Free when the driver uses the legacy device tree
binding or fails parsing?

If the driver falls back to legacy device tree parsing, clocks are
registered using imx_clk_lpcg_scu() which passes dev =3D NULL. This leaves =
the
device drvdata unset:

drivers/clk/imx/clk-lpcg-scu.c:__imx_clk_lpcg_scu() {
	...
	if (dev)
		dev_set_drvdata(dev, clk);
	...
}

Alternatively, if imx_lpcg_parse_clks_from_dt() successfully registers one
clock but fails on a subsequent one, the error path unregisters and frees t=
he
clock without clearing drvdata, leaving a dangling pointer.

When the system suspends, imx_clk_lpcg_scu_suspend() retrieves this NULL or
dangling pointer via dev_get_drvdata(dev) and dereferences it:

drivers/clk/imx/clk-lpcg-scu.c:imx_clk_lpcg_scu_suspend() {
	...
	if (!strncmp("hdmi_lpcg", clk_hw_get_name(&clk->hw), strlen("hdmi_lpcg")))
	...
}

Can this lead to a panic during system suspend on systems using the legacy
binding or when encountering a malformed DT?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808080215.2669=
452-1-lgs201920130244@gmail.com?part=3D1
