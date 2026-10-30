Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367877;
	b=ZH53KzShXcp8QsVEzE0bS0fnzgkff1cO2YlMPcY4cbhabXp+or8jZwk3he5mf40VK5BS
	 Ri7s/yjea5idE8VpAPSTPTsJt8NXE2t7roqeJvAr5LKBTVAj0NhGiQpOuNpu7Sd7xwjXQ
	 f2RLpHmCf7N0qjg6zJ1GO/OYSjoXBiMc4C63dAr7YVm6d4VQ/Z9/Tb/87oKsKlLDhkNda
	 x/Tuml2jO6/9yCzEXcHoy0Z+PNGuBs/BArRVgIibFzyAclwx3pSeNRgIbDDY0ZZgRt7+v
	 ahdM+UlGFMSts091WCxnOETSzZF6oY04m0S5j7FmqgEITqlEvvwwVB2axBJRaUWEC6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9x2W01aRz4G6KbB8eeH8oE0Yjk/vl7mEqYf5cAkJXaI=;
	b=UuRp+g0MG+darsBkxsoDoaDwhog4lNCGVGz2GGJc9gI1GE64zZRIAvoB4QpTnVDuA8H4
	 twAC++yuqoj4g7uyTxO8EU96iVP9TOKUQVSOtOc7ewYxeXgKxRYqZ3iziZqHhUzg1zvOM
	 e0V2v4iyO/vmfiTWRG1AYc6vNnlXw6HbiBZvx6+s4sWdGYPbYhx4Jl8ZSATezHXFBjmFZ
	 NDwD5ZRSDMQnNcZLNa5iwubK3phIJPiQG1Y4iULWkUy8Uk60RZT5K0Cn5hnQZSYdg7JKm
	 d53ZhS0yGEptatfHu2WL6mObTYfXM+5DmdmkphOqGwqzE8zsB4hw7yYjltVyreA9QKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URmPcG2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900F606A31A;
	Fri, 30 Oct 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=URmPcG2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83CE1F000C1;
	Fri, 30 Oct 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367877;
	bh=9x2W01aRz4G6KbB8eeH8oE0Yjk/vl7mEqYf5cAkJXaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URmPcG2lmEjcnkTscGR8tXpP+QWBEwHSdsJRiQUc3mN95n76oQmh07oY5zRC3G7AI
	 ZoP7AumKvH530rjd3xBhXd1cKlF6vvNRit9XX9ROPH9uRrlfiBdme8BQ/sVO4+x/VN
	 Ph2ISViv3GoB5fFDmjD79PQEqrvNtcAec0k6Xv2fFT35afKd9CIljfil+0XATyfS7W
	 BRlDZCh8uXVZS5MpZJc0oNdggguGYVKRtLjQncf3/8xY+jvcqvnRADQ9Ms1NTwmVn9
	 4mhcg4i+vD0IQJ/GKotYGk7s8Tirh2k2olWxTcl2jOneM+VFEeus4yJ1qepe4OkWPy
	 wdpCTfYE2EDWw==
Message-ID: <sashiko-outbox-191079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] dts: imx95-phyflex-libra-rdk: Add overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-3-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-3-1c1cebb5be99@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:44:36 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx95-phyflex-libra-rdk: missing OF graph link for M=
.2 BT pwrseq
--

commit 214248ffcd9454f4e28fccad2971f5e7db77d114
Author: Benjamin Hahn <B.Hahn@phytec.de>

dts: imx95-phyflex-libra-rdk: Add overlays

This commit adds devicetree overlays for the SoM temperature sensors and
for M.2 Key-E Wi-Fi/Bluetooth cards using the nxp,88w8987-bt compatible on
imx95-phyflex-libra-rdk.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-blueto=
oth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bl=
uetooth-88w8987.dtso
> new file mode 100644
> index 0000000000000..1601e04b3940f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w=
8987.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&lpuart8 {
> +	bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +		fw-init-baudrate =3D <115200>;
> +	};
> +};

[Severity: Medium]
Does lpuart8 also need an OF graph link to the m2-key-e-connector node so
that the M.2 Key-E Bluetooth power sequencer can deassert w-disable2-gpios?

In arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts, the base
board defines the M.2 connector without OF graph ports:

	m2-key-e-connector {
		compatible =3D "pcie-m2-e-connector";
		...
		w-disable1-gpios =3D <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
		w-disable2-gpios =3D <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
	};

When CONFIG_POWER_SEQUENCING_PCIE_M2 is enabled, pwrseq_pcie_m2_probe() in
drivers/power/sequencing/pwrseq-pcie-m2.c requests w-disable2-gpios with
GPIOD_OUT_HIGH, asserting the active-low W_nDISABLE2 signal:

	ctx->w_disable2_gpio =3D devm_gpiod_get_optional(dev, "w-disable2",
						       GPIOD_OUT_HIGH);

When nxp_serdev_probe() in drivers/bluetooth/btnxpuart.c probes the
bluetooth child node under lpuart8, it checks for the M.2 connector via OF
graph endpoints before acquiring and enabling the uart power sequencer
target:

	if (nxp_m2_connector_is_available(&serdev->ctrl->dev)) {
		struct pwrseq_desc *pwrseq;

		pwrseq =3D pwrseq_get(&serdev->ctrl->dev, "uart");

Without OF graph endpoints connecting lpuart8 and port@3 of
m2-key-e-connector, nxp_m2_connector_is_available() returns false, the uart
pwrseq target is never enabled, and w-disable2-gpios remains asserted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-wip-bhahn-=
imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de?part=3D3
