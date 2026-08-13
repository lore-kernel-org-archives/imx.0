Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04A483803;
	Thu, 13 Aug 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630760; cv=none; b=MHzxzikMs3eYu4KPqaPiLvH09nQiWwx/9c7zpqz8mg6CSx12lbfuPyAJJV+wIIvd83Xs6vyIRV1RV3IfVSVNQbFYsJHubhDtsBIXWKuu3lFu57G1IGoRHIVesZiHYmZM0rFs5HIWIRH8SpDllZYLFYsQvUv44H33+xe1/WWCMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630760; c=relaxed/simple;
	bh=WySSisgcjpeVBL9eG9AmIIiwZ4liW2jiLuJScN+p0e0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KcRzqv8yjgwXmZQVUjlQa3aNTC+Yi5PYChcumPktddVQtnw29nocTBjaiYN8RkM0AhUo44/StKlO+atEe22rmTpGP4Ey2DMAwRbJPfUnk/sDbt7tE50UTIp+ZLWljDnWiF4Ff/vcvLrNhHwz3tBytL+L/qSLDiTlyr3O9LroBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5Fygg9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5Fygg9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103531F000E9;
	Thu, 13 Aug 2026 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630756;
	bh=l4x2nI/OM1EHRjmdNrc5N6c/xC3t0bmLbBKZt7oG+KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5Fygg9YGPpgk2RgVNQUHlk751qzbPeNo5LD35lL/wHeA4a0c/lF1zQ7Sx226duwF
	 3qilsGQGvn9ry1KRG3Uprl8jYK1urqLaNkBzS6LgyMCc0XMcIuZYXgcJoUL5cmq7IX
	 nShMayrj6SMZSy6oYZTYyoiCimikvBWuVDQKBggdw3mVrHM92IcOTkcaTZAQJwnPJi
	 Q8LvWHu7enuQZ2kf3bceJeW6RGUkMGNI74kWv/JjgPlF8kLQPCHihMsyngf1va5DZQ
	 zt3MGz/AiVIY0T+1Mr2Jn3WSAsQwuj/X9zxvqPekfVD4YFgBBDzqT1HxP44vch/vo8
	 hQz31rRg2ERDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leonardo Costa" <leoreis.costa@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260813133335.1941580-5-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-5-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:19:15 +0000
Message-Id: <20260813141916.103531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree overlay uses an undocumented vendor prefix `optolog=
ic` and compatible string `optologic,scx1001511ggc49`.
--

--- Patch [4]: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Torade=
x Capacitive Touch Display 10.1" LVDS V2 ---
commit ae998202e5daf5ce215671d831b6ffc33e8604ec
Author: Leonardo Costa <leonardo.costa@toradex.com>

arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display =
10.1" LVDS V2
   =20
This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" LVDS V2. The display is connected via Verdin iMX8M Plus LCDIF
and features an Opto Logic TFT LCD with an ILITEK capacitive touch controll=
er.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-lvds

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-=
10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap=
-touch-10inch-lvds-v2.dtso
> new file mode 100644
> index 0000000000000..6b0c1a10ae2a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-=
lvds-v2.dtso

[ ... ]

> +&{/} {
> +	panel-lvds-native {
> +		compatible =3D "optologic,scx1001511ggc49", "panel-lvds";

[Severity: Low]
Does this code introduce an undocumented vendor prefix and compatible strin=
g?
The prefix `optologic` and compatible string `optologic,scx1001511ggc49`
appear to be completely missing from `Documentation/devicetree/bindings/`,
which will cause the Device Tree binding checker to emit warnings when
validating the DT with `make dtbs_check`.

> +		backlight =3D <&backlight>;
> +		data-mapping =3D "vesa-24";
> +		power-supply =3D <&reg_3p3v>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133335.1941=
580-1-leoreis.costa@gmail.com?part=3D4
