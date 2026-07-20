Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372942BE8C;
	Mon, 20 Jul 2026 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558237; cv=none; b=YxOwqiHiH1+UzNOaXXd+3nvpKtF5iFXPe5eel1u2NN5/2AYy2dzoq6+ZBzPJB2f+Jx8p7MarRvf1aFDLDNLJs10SWiMzl1fny8CwwU1/0j5hOT71eLKLXq4ATxNUzdYZaXCgka4uNU60mVvCDIu86/uBi3JioEiF4EK78AwxBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558237; c=relaxed/simple;
	bh=W2a85uqSm1iGkIpchj7uEMfvZmmrVlJ1Ch/KN31aSnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VPHYm/q2GiujopF+y/bgh4+J8S1Adc9Yn+Hxra3IwDZ+SdtuVcTCUGdM5PNXQJ0hh3bVtVxFccVpZNRsYeKW3m5jIdjduK6dnjrjo1XfioP4/Obn6OjOMb1Q7gJQBkR77Ta0sJc3Mh2IjvgO1B7YNNkeMeOD6o6HC/P+5MhIOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+dzFxJE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+dzFxJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036BB1F000E9;
	Mon, 20 Jul 2026 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558236;
	bh=G3eW8RXFr5sGu7wwLHNytlZz4pYAZwSqroG3KZnwBig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+dzFxJEifELmaWfticJSgg68LFmrAbebS1SGLEU+3jI6pZe96tgSMFHojcqxkOvL
	 WIXgHet5vTkD7Dw9K7TlTFwvHYciIv1XlnGchwOxWpLQdYpjDnVh61tl1I+7BBuiXl
	 gXgQIDaceoDsAzQH5lFcpDJ7YWZEhKZlGnIAjvTszkTikdyvJZy1hXgSQJpdO1kRXz
	 QKG4gH73BxDGYiHdwxln+AUYIUilXSIfM7Zy8BHMp2wzT48YxpWw2yTgJ2ZDEG2ytw
	 5WsORPoHJz0V6c8kiScKyBGyFCADndTngconi/evxrO9Z8YqZk9o+oYTRZVjK9VfkB
	 u185SQY2gJ15g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for
 power button
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-imx8ulp-dts-v2-5-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
 <20260720-imx8ulp-dts-v2-5-d05c67676f53@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:37:15 +0000
Message-Id: <20260720143716.036BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The power button lacks the `wakeup-source` property, preventing =
it from waking up the system from suspend.
--

--- Patch [5]: [PATCH v2 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node f=
or power button ---
commit 7fed30ac7ebed8088b601492b14b387b09c09f46
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8ulp-evk: Add gpio-keys node for power button

This commit adds a gpio-keys node for the power-on button to both the
imx8ulp-9x9-evk and imx8ulp-evk device trees. The button is mapped to
report KEY_POWER to user space.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm=
64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> index 5497e3d78136f..af8f0d6087f71 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> @@ -10,6 +10,18 @@
>  / {
>  	model =3D "NXP i.MX8ULP EVK9";
>  	compatible =3D "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_keys>;
> +
> +		button-power-on {
> +			label =3D "PowerOn";
> +			gpios =3D <&gpiof 11 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;

[Severity: Medium]
Will this power button be able to wake the system from suspend? It looks
like the wakeup-source property is missing from this node, which might
prevent the button from acting as a wake source for the board.

> +		};
> +	};
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8ulp-evk.dts
> index 5dea66c1e7aa0..6a92c5ca9a412 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -20,6 +21,18 @@ chosen {
>  		stdout-path =3D &lpuart5;
>  	};
> =20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_keys>;
> +
> +		button-power-on {
> +			label =3D "PowerOn";
> +			gpios =3D <&gpiof 31 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;

[Severity: Medium]
Similarly here, does this button need the wakeup-source property to wake
the board from sleep states? Without it, the GPIO interrupt for the power
button may not be configured as a wake source when the system is suspended.

> +		};
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-imx8ulp-dt=
s-v2-0-d05c67676f53@nxp.com?part=3D5
