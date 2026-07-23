Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5E459AF9;
	Thu, 23 Jul 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805082; cv=none; b=YU22hUsTclBrCxZlUMu8jcG+RmB8hYMLwGNaiDUIV51a4Vpbi1xQBhgVQD1yYRNdJ88kl526yNrFsa02LNPW1zHjCxKquW+4FiHbQ9GPyfKwHwm7G2aXvADxLFCpAJNbLiJvjRvmJy8hKj7//0gaqA8XVc2BxjwvgA942f7nOiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805082; c=relaxed/simple;
	bh=BIVCSZRUkvAJHwRPvV1d/uVyJKXptWQhbPGE4/SVO/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=orvg3ZCXG+1+tEF2KutKJhAO13jHeZw5Ix2H0Wb9h9hGQB5If1TrDIQpFpm9i3JuJvBZcr6PmfRmDv79g8fVAYYL89Q2k/sZdj2hrH4d8SxZLkXhdTbix7771kisPZq0Mro4RCUoWkSymJKGYHAN/MZfSc3bNYr5UoBCvQSkqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GF6w8VRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GF6w8VRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20AC1F000E9;
	Thu, 23 Jul 2026 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784805080;
	bh=AQBVX9HzESPyyYEd9Mh8adYQ7dnbZe395IG5PCp3qAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GF6w8VRf5ulnqc+P3pGN8BPPn7dTU3GJnspn11QJxf+YDPbJvAPLEF54LIPfOjuzx
	 B84dn3lWl7VOkwZVw84EgzmQh6Adk6cVDbwEbQLxj5fg4nwquZfGU6Zr5Kyf3CgjX2
	 xJcmj8ueUmxfQY+fdDV5XCCI7oguil4nCbxPNr7jnKR9V/lw8Ax+ffOtNT5BQ9e/AA
	 /KsAaIgT/njkt6VX2NLRhYrTyz5uJeJiEMCL6RJIYm4wNTKjljYNZt4zQfmzbUlzH6
	 yLwoGoRxFwkvtjfeD/2V/xzqgWxZVu9XPMb1PuoYreuvs37pIo38cg7EZs1rCP3Rpo
	 n3BSrUQ3ZzEGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex
 Resistive Touch Display 7" Parallel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723105225.194366-4-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
 <20260723105225.194366-4-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:11:19 +0000
Message-Id: <20260723111119.D20AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The standalone device tree overlay `imx7d-colibri-emmc-panel-res=
-touch-7inch-parallel.dtbo` is omitted from the `dtb-$(CONFIG_SOC_IMX7D)` l=
ist in the Makefile, which prevents it from being installed by `make dtbs_i=
nstall`.
--

--- Patch [3]: [PATCH v1 3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Res=
istive Touch Display 7" Parallel ---
commit 0cb2a23058bf12eef57014cc393c2263436c395f
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parall=
el

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX7 parallel RGB LCD interface. The overlay is combined
with the Eval carrier board device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive=
-touch-display-7inch-parallel/

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index 3c16843c30714..e9f95c3b83534 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
[ ... ]
> @@ -442,6 +446,7 @@ dtb-$(CONFIG_SOC_IMX7D) +=3D \
>  	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
>  	imx7d-colibri-emmc-eval-v3.dtb \
>  	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter=
.dtb \
> +	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \

[Severity: Medium]
Should the standalone device tree overlay
imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo also be added to
the dtb-$(CONFIG_SOC_IMX7D) list here?

It looks like omitting it prevents it from being installed by
make dtbs_install, which might break the ability to dynamically load
the overlay from a bootloader on other compatible carrier boards.

>  	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
>  	imx7d-colibri-eval-v3.dtb \
>  	imx7d-colibri-iris.dtb \

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723105225.1943=
66-1-francesco@dolcini.it?part=3D3
