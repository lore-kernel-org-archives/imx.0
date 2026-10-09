Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70424FDE63;
	Fri,  9 Oct 2026 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575374; cv=none; b=R8SAHx40x93axOz6vCYSbruNlR9OI1SBc8QlPoUewUbndRnxZ0BnEyyJkqHlyyHig8pXAkph6KOto9/3dBq3kkymtopJFWyU6D87Ci7XCB8VK+xdo7oVqU4RF27qIKRru2WTM6YAA70KKZyGqrpA1EDLR2rn9RDyGIQXGpDqIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575374; c=relaxed/simple;
	bh=n3D4RFgaM/P0KaH6DwkxRmJ8Dh/7th0XmRMcB8x/CfM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kUiI/+9EqrYeWYJdv7UpqJxW7TxpasG/n4zU8+TMRs5QzmqASBY/HCa5T58KAZBC5LH6pjtkWv5p7bel44rIY+7uDHbqUEDlq69zmtGS9d/ee6qUOn8yvMcgqgoDXws/gmAMJ3sBS2JHKbOw5u7sypmBYWyMOLWW3XomjpKXCzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIehNiUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIehNiUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244B41F00899;
	Fri,  9 Oct 2026 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791575368;
	bh=UEkhAmmcyEyhXQ75+tckaYleuolYdZaIW7A40KbYxw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIehNiUm0GxYQ7CcZURzcZQ/+alJyg3hPTCYimVEO7UQRHDss+mbdJvpJLO+NoO4+
	 DvAvQlENsY+2Y9oglNPC6LL0RopLkKedGK1ArCpVh8HB7PPejm6lEHk1P1bVuvyS3X
	 4GkVbsa2FYj8lITHLZQm7gCDhRI9niTHT3XqJYAreIQRlJVLhUOSLkXm3cK9OdfxVj
	 P7kybV2viNCIA5jwUtEbvJDF8WlTlHy1AbOX1DkGZZuxnZGZ2nqa0s856kkymRgZPu
	 conwJEnFeAUVfSo1Vimd2GBtAid9ghTJ/TQ+rnz9HhgU8dSe1bWdQzmpmpJuoNXic9
	 zX5zXy2GtEjAw==
Message-ID: <sashiko-outbox-166018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/13] ARM: dts: imx6ul: Extend Variscite carrier
 board descriptions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <c53a23adc1e3e9ae7b8c8ffe9e080d743b7af8db.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <c53a23adc1e3e9ae7b8c8ffe9e080d743b7af8db.1791487179.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 19:49:27 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: Missing vmmc-supply property in &usdhc1 leaving reg_sd=
1_vmmc unused
--

commit f482087d41ff9ef7afd90e49e664cce4877e9d8e
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Extend Variscite carrier board descriptions

This patch adds and extends several carrier board descriptions for Variscite
boards, including the introduction of the Symphony and VAR-6ULCustomBoard
device tree files. It also refactors common pin groups and peripheral
configurations into shared components.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcu=
stomboard-sd-card.dtsi
> new file mode 100644
> index 0000000000000..f6cec58f5a4e4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd=
-card.dtsi
> @@ -0,0 +1,31 @@
[ ... ]
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Low]
Should the usdhc1 node include a vmmc-supply property referencing the
reg_sd1_vmmc regulator defined just above? The regulator is declared here b=
ut
appears to be left unused, which might prevent the SD card from being power=
ed
correctly if the MMC subsystem relies on this supply link.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791487179.gi=
t.stefano.r@variscite.com?part=3D9
