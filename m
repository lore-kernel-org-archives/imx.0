Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068833BE632;
	Sun, 27 Sep 2026 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507185; cv=none; b=vAqsvj0hGB6Y+cAV5/kS+z98VcmA+CrTbmhxXZoz3bOGLZFDoUexFPWXPz8cednDdwNedK8vpLiak3I45Vizl18X84t7R9tsipZ1WSCOx3A6y4j9Ai6M9EQ+uObygadAFstKN8D+YEbgDD+Q7k3xcjn2N3zKaZxpczTON6T2qns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507185; c=relaxed/simple;
	bh=KXLoC4LL1mPpUPnQSzg21e6mwJ/w5N1jBOm/WEkstvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EjC7UqAVjr67XvvvMNSRdr8keGoGOHQvpcv5f0KEBlTmaS29Wfw9Ep5I+dFeekMT9GObSwmwX/ZVHVettdKOSF3g0zgyFo10b9njtD1naR/CoWLDz318m9rAKGQLMiaim1pp+cOzdVEbAgmmh8Ujm+NvxRKyFEZlK8NILM0CBNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j54nFOQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j54nFOQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEC71F000FF;
	Sun, 27 Sep 2026 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507183;
	bh=cA45nWXK+4irbOr+Tv+2K7NBQOJpA0Z2nsd1r3vo7I4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j54nFOQvAmiY1crsGT1wOC+iO5Mqy9xuK9DgnmGeBLXXmV0i/7IHGQeSy85FmVKFY
	 s1YcJGTDGJtwXEdtZMLUcufyIUweYiyGnZTMg/0QITeAUxylaW3ga/091N2auvgyZl
	 P2uiCVuTOWOVslgQSRjdvRGHmTLRHZEUXCeQJRjC8rHK2GoUtQ4Lc4F5iHcZrOkAaW
	 Wk/UyBJX5hsBDTnATUBciLQiGpis2eorBxg+F36eUBRy54sG++aWfW97vUrFv0ySL1
	 h8IVnyzlTzpqS29kixAu4GPRDyIG6YRt9GjM7xK713eaDTREjyttUv9hcC5LqHan/H
	 CyqnOrz8RA3/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] ARM: dts: imx6ul: Enable Variscite i.MX6UL
 board DTBs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <18c922ead3419fbc68e88d3ce1233faa9b1a2e63.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <18c922ead3419fbc68e88d3ce1233faa9b1a2e63.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:23 +0000
Message-Id: <20260927110623.8AEC71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] build: Combinatorial explosion of static DTB variants instead of=
 using overlays
- [Low] build: Makefile DTB targets are not sorted alphabetically
--

commit 811039deaa62a10ae4930e5cd0e5773613e884fb
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: ARM: dts: imx6ul: Enable Variscite i.MX6UL board DTBs

Add Makefile targets for the VAR-SOM-6UL and DART-6UL board variants based
on i.MX6UL, i.MX6ULL and i.MX6ULZ. Keep the existing Concerto DTB targets
enabled alongside the new carrier, storage, wireless and audio combinations.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index c5caca92ea10c..cdca939b10a96 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -377,6 +377,36 @@ dtb-$(CONFIG_SOC_IMX6UL) +=3D \
>  	imx6ul-tx6ul-mainboard.dtb \
>  	imx6ul-var-som-concerto.dtb \
>  	imx6ul-var-som-concerto-full.dtb \
> +	imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
> +	imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dtb \

[Severity: Low]
Do these newly added targets skip strict alphabetical sorting within the
dtb-$(CONFIG_SOC_IMX6UL) Makefile group?

For instance, the dart variants are appended after the som variants, and
longer feature strings with w appear before shorter ones with 6. Could this
increase the likelihood of merge conflicts?

[Severity: Medium]
Does compiling all these base, module, and carrier board variants as distin=
ct
static blobs cause unnecessary bloat to the kernel install and Makefile?

Building the dtbs for i.MX6UL, i.MX6ULL, and i.MX6ULZ currently generates
around 90 distinct static blobs for all the combinations of eMMC/NAND,
SD/WiFi, and audio codecs.

Would it be more aligned with standard upstream practices to provide base d=
tb
files and build the optional modules as Device Tree Overlays (.dtbo) to be
applied at runtime by the bootloader?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D11
