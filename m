Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F445A285;
	Thu, 23 Jul 2026 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804958; cv=none; b=QXXZvNutJZfQCau5h3ZMwxKYgqmBKWUJ2oznoeBYBhS89NBKBJe5n9Ec2hTc/gH74XrUzcAATyLOP6kjgvyi0L4ySvw920LeMa1jh0JMMfX4WI8LeGBXJvf42g7cxuNew4ycHi5xeId9vTN1y2EBuEhe4JEH4DMxkgRh9z/nRtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804958; c=relaxed/simple;
	bh=FGv+PQeMvxPU/8rlRdrGTiazhthKL4O5u/LUcNQWJ4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qbqK9Jq2cj2Z89R+1HrnVOrhKmOhIadRohXLEKSKkN7bnX0TvX8VVzkqChvoX74fj2qMh8qNgY5TWL4owtz5bxOk4xaY3PRn6XFycUXZT9QRXekG4eo7npEA1xc2Jb9izhHrcZcwnJu+jVgBREM30MPcGpULKKNy0WsC+nZjFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KV/SruV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KV/SruV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77AB1F000E9;
	Thu, 23 Jul 2026 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784804954;
	bh=UXfptY6Btj6y7FYQdat7WWaNaNKnk8KLtRlGIWsRco0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KV/SruV5d95XPpzBAAdEtOMhYv7Il46i8Qb9abSNmA6maijELMNLWU6PkwxUbb/el
	 ie5Cn7ssiNvvc7FmHl6acyifxE2vWEHyJGkfvmWgLhEO7nKLp+SaslD6DGYFL1dSp/
	 Ul2JjI9C/m6HeXKi2MkhFJ04xVXGKds1AhEid9j+5CwO8pJuaUJjMsLTGtf+Qu0hDv
	 NxWOSRVPsmbER23ndfi9y9Ap242iYlI/ESH6nX0lY7E16DXrewaUlqJRFcWdw83/s3
	 WpH9uGuyrHEyHlfl/2r3/eoZnKoDlB8OMqaXWcM/K2wYWk6RwnM0EuHr2Bs7NyEU51
	 0TJwYTitThiyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ARM: dts: imx7d-colibri-emmc: Add Toradex
 Capacitive Touch Display 7" Parallel with Touch Adapter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260723105225.194366-3-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
 <20260723105225.194366-3-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:09:13 +0000
Message-Id: <20260723110913.A77AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The standalone device tree overlay `imx7d-colibri-emmc-panel-cap=
-touch-7inch-parallel-touch-adapter.dtbo` is not added to the `dtb-$(CONFIG=
_SOC_IMX7D)` list in the Makefile, preventing it from being installed.
--

--- Patch [2]: [PATCH v1 2/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Cap=
acitive Touch Display 7" Parallel with Touch Adapter ---
commit b48f5641aff3d40650a9c65a6f89f2a646bc3e83
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Paral=
lel with Touch Adapter

This commit adds a device tree overlay for the Capacitive Touch Display 7"
Parallel on the Colibri iMX7 parallel RGB LCD interface. It also combines
this overlay with the Eval carrier board device tree to provide a
ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive=
-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pd=
f [1]

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index 4d27300002025..3c16843c30714 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
[ ... ]
> @@ -437,6 +441,7 @@ dtb-$(CONFIG_SOC_IMX7D) +=3D \
>  	imx7d-colibri-emmc-iris-v2.dtb \
>  	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
>  	imx7d-colibri-emmc-eval-v3.dtb \
> +	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter=
.dtb \
>  	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \

[Severity: Medium]
Should the standalone overlay
imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo also be
added to this dtb-$(CONFIG_SOC_IMX7D) list?

Without it, the standalone overlay will not be copied to the deployment
directory when running make dtbs_install, unlike the sibling overlay
imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo which is present
just below. This might break the ability for users to apply the overlay
dynamically via U-Boot on other carrier boards.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723105225.1943=
66-1-francesco@dolcini.it?part=3D2
