Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386163;
	b=5MDFywhB0XNIGt7FUwDY/x++G2Rzl7FnXicrAr3IHrPDunzNfbwWG7LQrqVRHouRUwIt
	 8DW/4lLTQJtABF4dfFsATQYn+pa8CLTZvGcmNRtq1wxV+hjn7/bH0QdWS4YoDPNrQQ2Qb
	 EN9rNjI+MzE/oZLWCjSbvIE57pYAo+mvwV/9MLDN0VWmtXNfFuVOoldGDMWSFAocN5+lK
	 5ZkE9jVWOLLApPgZceb/kuuRtCAajaWRP6rvU356l3ntld/fcnmuK6V3JfvNN/rGIF7/k
	 fliBFnogl5CUHKpxh+0P6kvQj20qLPK7l8JHO8SNyDEvarHtNQ15XcaV6h4eq1UdPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1HIxbApyiQowjnqXKzbDN9ZBPxizvL+h7XM8y3qOXtg=;
	b=VrRISIAxaFP602Pt9Gb5GKnIV7DSTpKrreAjYeduXuu3n6Z7CDIasvPsNzj6tTJ9M/tp
	 /dVDHbAiR52Yc7fbSvo9PzYYZMdXikJNu02VCWbw76xb1jDS+N0cB23FtCS7dWSCk8ZkG
	 KAsIuooKOZeHCeu+STOGmZhVuyH8t7nIhamiN6A6EMa/HtTK6rP/T+tcjPPqg6ZmSaX5/
	 NKGvGC+GkiCQSybaRCYJLFfGXBnh/7qGJiys48JDaBxOdUFQDoYMEaA+DOJDV6rEh7L6I
	 o6pHkA4Osf1CavWCrOUjRr1ft1kN2dF0mDTHImbiMHBvVQzqCAGSgm5KagPWM6UlQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g41N13ax;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389E606A320;
	Wed, 11 Nov 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g41N13ax
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EA11F00A05;
	Wed, 11 Nov 2026 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386163;
	bh=1HIxbApyiQowjnqXKzbDN9ZBPxizvL+h7XM8y3qOXtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g41N13ax7LWYuSiy2cZUZ5g76BmT9hEApXcB9HVrLpffGlmWxGZCPNPHnkvOKQvjY
	 7LIhW4QAwCs9abDs4rnlFVDTPZGFItf3dovagjVz5eUErxzyVHRYu2Jg1BrugRWM/X
	 kzreTQFuLN6HDP98JpTy9fCTttDNBRg3dviLK0kiA9nmw1b48FvwrokOe81mDBga5C
	 KpA6RwAoB3zZVVKGf71ztYv2iG9LpYBH+M7F+eIL0LlzVe7xFsSRpsWugtBaGY6tGH
	 eNLKxNEWx3dBwE/CPiGdwslx5UfFsOd52GgLryNjnau1ZuxazRTfGpw76tWTqZlxu8
	 BzPWv0cFGQIbw==
Message-ID: <sashiko-outbox-208621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: Add support for
 bytesatwork i.MX93
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Obergfell" <frank.obergfell@bytesatwork.ch>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
 <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:36:02 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: freescale: imx93-bytedevkit: unused backlight-lvds
  left enabled
--

commit c60831b496cfd3af119e905c5fcb49dc6905f857
Author: Frank Obergfell <frank.obergfell@bytesatwork.ch>

arm64: dts: freescale: Add support for bytesatwork i.MX93

This commit adds device tree files for the bytesatwork i.MX93 byteENGINE
OSM module and the byteDEVKIT board.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts b/arch/ar=
m64/boot/dts/freescale/imx93-bytedevkit.dts
> new file mode 100644
> index 0000000000000..cb5d17c8444c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts

[ ... ]

> +	lcd_bl: backlight-lvds {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_lvds_backlight>;
> +		compatible =3D "gpio-backlight";
> +		gpios =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};

[Severity: Low]
Should backlight-lvds be disabled or removed while the LVDS display
pipeline and touch controller on lpi2c1 are disabled?  With default-on set
and no panel referencing &lcd_bl, gpio_backlight_probe() registers an
unused backlight device and drives GPIO2_IO26 high at boot even though
only the MIPI DSI panel is active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111081150.9502=
72-1-frank.obergfell@bytesatwork.ch?part=3D5
