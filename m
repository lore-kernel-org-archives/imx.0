Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076794B4044;
	Thu, 17 Sep 2026 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638752; cv=none; b=sdD2kYJx2dXEzOCk/oWD1WDHfhHKzaCBCg1+KgJ+ZgA+eKfAaLQaw+W0WWUxk0B3YPuwbXAGz2vlJHlyRQUZ6uO7bfq9R0HHbCJQ/zB6aA9omyXeAkasbGfcOJtb3JQSUWL8zWRcA+VOaYAUgWR+95HHYat1yCateyrv3CEdV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638752; c=relaxed/simple;
	bh=0KN3hAWqnOkI2mNBq3BVlHgwwiAE2fRfRh122yKQiXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f6fTcHtmAdtcTpJLFUZasSYGhEsmkfdLfh5zSuvIn//tRFV54ASF4/HBOOGbnZHR0UwMBBe8xbCgRq871nvPORVjngNS1QCZ6EjO8KhpzLBv2G9xuddDWBOg6ALcOrnjj70JojQNpw+4ASV9firaQsz+2cPD1BcZ+RnbocH6oi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZjn/3uR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZjn/3uR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DFC1F000FF;
	Thu, 17 Sep 2026 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638734;
	bh=ff1QuRy5Sfz/9AR+X5UMzFqHND2K00nuCKeEHHwSXyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZjn/3uR208+1xb0I57CXBBWXo819e1EOmSAig4JkdncgFZEkdyWqS8b00gBWaCYd
	 rbWhRd30+Mu3oechaPsgIID8TMsMyKq1kbnAsX4b4QOvdHg7sA0qJFRl8zzaIiP1fj
	 d4GpGFrEK4T+B+xafQfQWD8FlKjTOIMMc8oYN0UwWZxb3I1dvdo2SMjvEckZc7Brmn
	 /WSQbLxC4kRdPm4aC/Zc4eMjI/bqou1YusaIxorbRjiBQ/tiLFzB3jKyxLk3hXH9XO
	 4vehrNHRMyWFhv6+4yjnjjAsGQJst1cd2ssX56EtoZbMTImSnYbdHYA6Pjeu+BVp6i
	 eCZLJOfE3YotA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: Add Toradex OSM iMX95
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260917094217.59508-3-francesco@dolcini.it>
References: <20260917094217.59508-1-francesco@dolcini.it>
 <20260917094217.59508-3-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 09:52:13 +0000
Message-Id: <20260917095214.53DFC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: imx95-toradex-osm: pcie1 fails to probe due to shared pinctrl
--

commit abcd097ae33af8abcd2810970c485a8f38372ecf
Author: Antoine Gouby <antoine.gouby@toradex.com>

arm64: dts: freescale: Add Toradex OSM iMX95

This commit adds support for the Toradex OSM iMX95 SoM, based on an NXP
i.MX95 SoC, and its OSM development carrier board.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/osm-development-board

> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/=
arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
> new file mode 100644
> index 0000000000000..c804c32b8fb27
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
[ ... ]
> +/* OSM PCIE_A */
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pcie_wake>;
> +	/* PCIE_A_PERST# (OSM V2) */
> +	reset-gpios =3D <&som_gpio_expander_0 8 GPIO_ACTIVE_LOW>;
> +};
> +
> +/* OSM PCIE_B */
> +&pcie1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pcie_wake>;

[Severity: High]
Does this cause the pcie1 probe to unconditionally fail?

The devicetree assigns the pinctrl_pcie_wake group (which contains a single
pin, IMX95_PAD_ENET2_MDIO) to the pinctrl-0 properties of both pcie0 and
pcie1 in imx95-toradex-osm.dtsi.

Since the i.MX/SCMI pinctrl drivers enforce strict exclusive pin ownership,
pcie0 will successfully claim the pin on probe. When pcie1 subsequently
probes, the pinctrl core will reject it with a -EBUSY error because the pin
is already registered to pcie0.

Can this be updated so that both PCIe controllers can probe successfully?

> +	/* PCIE_B_PERST# (OSM L33) */
> +	reset-gpios =3D <&som_gpio_expander_0 9 GPIO_ACTIVE_LOW>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917094217.5950=
8-1-francesco@dolcini.it?part=3D2
