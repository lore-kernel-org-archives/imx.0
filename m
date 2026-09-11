Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D145C6E6
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160539; cv=none; b=RwGgnSShsRYumm5V7pilcUqfV8t8zQ501UTHo25161H5q2A0QdOp5CNcFft0MjimB6eskRk3G6LjyKDLphRM6eHXNvD6hE5d3SipBJavk21CarWfVx5DtL9wPk/u3hyLcKjVGrGlAet0a7rLPzMZXcaKRmE99fFotJOCIcXscX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160539; c=relaxed/simple;
	bh=lkRPl38AzXz0r4EnkN3gGDyUSIcPVQR3Yt6HAHpoWlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=feNtG53NlYeuXbn+HtjDG9cINgZy+kBz9GwJPvA2WIhSRt6Nzh3+NUgQzKmUt1+SzounMknNrnQiXXH0p+1W7uYWqHIWZVoh76Xo6E/bqrPkVxJCGNddmEbfXk+TLxlT5eB3nx3jCpjvAeNZgZQUDp8hmor7OSRI6CvoJQkyINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKAibcVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKAibcVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A088E1F000FF;
	Fri, 11 Sep 2026 21:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789160537;
	bh=FEN/vCAYKMg/PMrUZTh9zfoX5N/ii/OQ1cwB+CRy8L8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKAibcVTFPLuzVG1g2/cYQc4VwwOI3ehOYXPOsAPRh1l15yDKoZgJ9cwn9n7qOH+s
	 mn1quilVUTj75V0f0uEgjDSrpinPqY0yv5ZbRrflg1SE8x/1JVEwSIcs18liEaPBbV
	 nD7gt+h2WjKdmsDvS5lyjzppz9U/4LkcaNmR3sqVMU6rX7H2RqJF8kayHsn5xkNJCi
	 LyRk9sMQBzPPatfGjuUbxggH6ZyKeo1uz4N/i8TL2/2GPkwbSpfDSIkO4n2a/laPwB
	 Wp0D0j+tpbmDsbqjV2NbyTxSqbmarYyfsrU7/KFB++w3+rnyLD6HvX4pu8DCBGEPQp
	 /3KzaWXSTiMcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: imx6q: remove unused header includes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Heiner Kallweit" <hkallweit1@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
References: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 21:02:17 +0000
Message-Id: <20260911210217.A088E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing <linux/phy.h> and <linux/micrel_phy.h> causes a build fail=
ure because the prerequisite commit 8392af7be78d is not present in the base=
line, leaving PHY-related code intact.
--

commit a97dbfcf09e3d32d8bf22f55a25ab0c09018688e
Author: Heiner Kallweit <hkallweit1@gmail.com>

ARM: imx6q: remove unused header includes

This commit removes the includes for phy.h and micrel_phy.h in mach-imx6q.c.
The commit message indicates these headers are no longer used after a prior
commit.

> diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6=
q.c
> index 7f62009257526..8aa76f42ab76e 100644
> --- a/arch/arm/mach-imx/mach-imx6q.c
> +++ b/arch/arm/mach-imx/mach-imx6q.c
> @@ -8,9 +8,7 @@
>  #include <linux/irqchip.h>
>  #include <linux/of_platform.h>
>  #include <linux/pci.h>
> -#include <linux/phy.h>
>  #include <linux/regmap.h>
> -#include <linux/micrel_phy.h>

[Severity: Low]
Does this removal cause a build failure in the current tree? It appears that
the prerequisite commit 8392af7be78d is not present in this baseline, leavi=
ng
PHY-related code intact.

For instance, ksz9021rn_phy_fixup() relies on struct phy_device, phy_write(=
),
and MICREL_KSZ9021_EXTREG_CTRL defined in the removed headers:

arch/arm/mach-imx/mach-imx6q.c:ksz9021rn_phy_fixup() {
	if (IS_BUILTIN(CONFIG_PHYLIB)) {
		/* min rx data delay */
		phy_write(phydev, MICREL_KSZ9021_EXTREG_CTRL,
			0x8000 | MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW);
		...
}

Additionally, imx6q_enet_phy_init() relies on phy_register_fixup_for_uid
and PHY constants that are no longer included:

arch/arm/mach-imx/mach-imx6q.c:imx6q_enet_phy_init() {
	if (IS_BUILTIN(CONFIG_PHYLIB)) {
		phy_register_fixup_for_uid(PHY_ID_KSZ9021, MICREL_PHY_ID_MASK,
				ksz9021rn_phy_fixup);
	}
}

Removing these headers unconditionally triggers a compile time regression d=
ue
to undeclared identifiers.

>  #include <linux/mfd/syscon.h>
>  #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
>  #include <asm/mach/arch.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3cec5f38-e0d6-4d12-=
88d4-74cb0000a2f2@gmail.com?part=3D1
