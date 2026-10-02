Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C0481FC9;
	Fri,  2 Oct 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932487; cv=none; b=kZUBZkhGwiw1sHJBthFtick5g5v3k5zywhcZLyF7FXWllKd7NZUp3n1uH+EwT/33LbW6yQdzjEIKSEmIcLrqooyt/GYt8QBsSEVh/vYB2XWvJRuDviFrS5zqTY8NqxRmHZEj47akn6IuNMTDMPe1TVbiziKEaDXTUL3NOSjiYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932487; c=relaxed/simple;
	bh=mNY1GhZdMD/QzAAvmD4cs9DHkhxptWcprAOgSvmqmoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTLEGfaHUlfzAlmc31taODdOrlakBwoTncyJNqd6xb14wtaEBbWTR3l2l2gWpB5D5BDVjB86We+So/Hn1sxoES7tgzWUAI6Abi9gfzLW4T3s2tMUKMOLKKu178/H2uGOVFv8gC5Zc4BexZ9JK8MmX1QW68oMnCg6sPYFhbp4wbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8autgxm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8autgxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3571F1F0089A;
	Fri,  2 Oct 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932486;
	bh=tIULx+afzsI2uPO6CDkGAfC1C6u7ffhXnrvOppjENmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g8autgxmHfFQ5YJfdMDzEF0NzXJroghcYj0LqEg67zDwrYK7t8v0YvlaOF/cMb+4K
	 zC3d4BMZv6XUTnNQyvVS3alQ01InMF6fdLJNaSZbr5KeH9ARSe/3yv5rr7wbN59jE0
	 JniYsJRmcIg2sxw/lEk7YU/39XQByEEjNjFCNa4IrmoPyg91kC2iGfBrlBD/4Bl/hl
	 hwNcsYQY/IVHaXem6cF6HUYfoUUXismZ4DvX3Ug20zX9Dj3VjQvDr/aO0Ot3MZ12Xo
	 IpW+EtKtC7jalMgnbtfgKpdCU6JORU/KB28W/DYfhAIpX1estScJ/KHvYWQ8yvNvio
	 Cq9GVI0YdAZwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] ARM: dts: imx6ull: Add parallel display DT overlay
 for TQMa6ULLx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002081417.2092471-8-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
 <20261002081417.2092471-8-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:45 +0000
Message-Id: <20261002091446.3571F1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: Makefile: incorrect dtbo included for fc21 dtb target
--

commit bc626d69455423e37445a45960310a9fe70cea35
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLx

This commit adds parallel display device tree overlays for the TQMa6ULLx bo=
ard.
It reuses the existing .dtso files from TQMa6ULx for these new targets.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index e86b9c1a63005..5f190900904ab 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -427,6 +427,8 @@ imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D i=
mx6ul-tqma6ul2-mba6ulx.dtb im
>  imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44-dtbs +=3D imx6ul-tqma6ul2l-mba6ulx.=
dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
>  imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21-dtbs +=3D imx6ul-tqma6ul2l-mba6ulx.=
dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
>  imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ull-tqma6ull2-m=
ba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
> +imx6ull-tqma6ull2-mba6ulx-cdtech-dc44-dtbs +=3D imx6ull-tqma6ull2-mba6ul=
x.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
> +imx6ull-tqma6ull2-mba6ulx-cdtech-fc21-dtbs +=3D imx6ull-tqma6ull2-mba6ul=
x.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo

[Severity: Medium]
Should this target use the fc21 overlay instead? It looks like it is
incorrectly including imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo for the
cdtech-fc21 target.

>  imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ull-tqma6ull2l=
-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002081417.2092=
471-1-alexander.stein@ew.tq-group.com?part=3D7
