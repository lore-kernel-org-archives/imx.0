Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66BF38AC8C;
	Thu, 16 Jul 2026 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182488; cv=none; b=D4paqZxMkc8NvL7ccg/mfN/lVUZfpj1ppyyXpzHQPiyv8rKg6DRiTPOmuVRxMrcR0Du4Nv3XFfqB5D95ed3r6jefdWUHn234+w1FZ0GMTh7omMnANL7xnmdnpGsEeTt0nbso3gao6oY5Hqi95eqwx5MkEQx3vVZLmTKbnFNVWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182488; c=relaxed/simple;
	bh=gZHIGsbVCAH/9juShh9PTazUhA3F5WQ53zzUwWn2D+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gh+PoLefqrTqLJqCszvwpFHJpS+RhxcqNLPFOeIbNf4G69+cr1PgxuWY+Wk9JGwLvq2e/XicolKoQszxREKakws0nGMU0aMVplMCQibMNQjyc7wk0pKL5JSZSVAZ2IK1CFB+bxqIGbvnXJFb5ZwbhFE+8tIkbME8EAIqF3DhEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dopYfAzc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dopYfAzc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D231F000E9;
	Thu, 16 Jul 2026 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182486;
	bh=iz89qM5ZRR0KeyhZi0jO1JpPCY2KT90TKWlBUGHdlE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dopYfAzcIwuED+2Z/I4uEFv6J2T48PuaI3r5HjEAYfEnFlvTF4Qa/Z3WM0ijfhwhH
	 WBSFeZ6Ixk2MpI/aEHisnaYU8E9YkONtGFZXKB8hQqR6YOHbJUf5wkyYx7m24heL7o
	 9XM3q7XjP95Css+kUpxroziTo8iBQo3ZELNE6V1l3z2ni+mJWjBnAnhQvb0KdWXUJ1
	 39G91cJMMxBRKdIX63ZYnjFoabJbdfk9SwXkTSjA5QxWEx+T3QJeDRv9CcVEBEyss+
	 LXtQBcbQEAGGa6tKtM0td67d/3l/Khu1kFb8XqMPjrt5THhDmCJwonDNtho56Kckdl
	 /DugSQbqoH/wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] arm64: dts: imx8mm: imx8mp: Add legacy board
 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716055751.279033-2-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:14:45 +0000
Message-Id: <20260716061445.A1D231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Devicetree Makefile targets for rev900 and rev902 LVDS boards in=
correctly include the DSI-to-LVDS adapter overlay instead of the native LVD=
S overlay.
--

--- Patch [2]: [PATCH v5 2/6] arm64: dts: imx8mm: imx8mp: Add legacy board =
DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 9cbdc6e353675bf76d693179ba857291f2e7ba5e
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Min=
i and Plus eDM SBC

This patch adds legacy board revision compatibility DT overlays for both
i.MX8M Mini and Plus eDM SBC boards. It also includes adjustments to
support legacy board revisions.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index fbfd0e79f118d..09ea330884ad4 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
[ ... ]
> @@ -338,6 +344,24 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvd=
s-mi1010z1t-1cp11-dtbs :=3D \
>  	imx8mp-data-modul-edm-sbc.dtb \
>  	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.d=
tbo
> =20
> +imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900-dtbs :=3D \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
> +
> +imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902-dtbs :=3D \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo

[Severity: Medium]
Do these targets incorrectly include the DSI-to-LVDS adapter overlay
(edm-mod-imx8mm) instead of the native LVDS overlay (edm-sbc-imx8mp-lvds)
for the SBC?

If so, this might cause the LVDS display pipeline for the rev900 and rev902
i.MX8MP SBCs to be misconfigured. They might expect the lt9211 DSI-to-LVDS
adapter instead of the native lcdif2 and lvds_bridge, which could lead to a
display probe failure at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716055751.2790=
33-1-marex@nabladev.com?part=3D2
