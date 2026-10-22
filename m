Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682184;
	b=Kh97uHJ6aVChhV+qlfQBwLpM3+xnJKt/1Y9Suwejw4tQcGOLUXbpJ13oY2CnMl2etuoP
	 cLJTypbGboQWm+m+6kTqUYGXoFQEYXl1wzr+6V6hwfiX2LTwlzEWr2T0TQuk2MARpYaA5
	 W5MJ80EFWnSzJNHUvc632mRaTWtDbj2JMdIa3Y/mUeUghnmmO9gysionlqKE04I04NrBC
	 JsA/XFQvGjfb1ttHcuoeJQPl8+hspkXTFRN1ZcGobNyCV9A82oG88JPorfEkwG4Hqkgkl
	 n3UJJcZQU0lphabRs0LOZHEZsLmwkg20RztW1LFRR1hJ+1puo9mu5rgJgCBxPVm04gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682184;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8H6+UE0okItxfC44yLRwjAt7ioe2opIB/iP9myL0jXQ=;
	b=E1yk7sZ1hZFKHD7x1z+WIwlFWvbNhXpEmSOVDqfoatpNQVeSkQ7x5ssla0onMrgOfZlf
	 7teNvE2JPDxIwIn0gAoEvBkochlRw6LT8Ox+RTmXuyX2rzsYEV8QZmNPB+/yKMw6G1kbO
	 TP2vLlEf/25aptjLoAKJHU3ROK3yW1HIG+zYsl0dPQYIfG8NPOxRKvzZ7/BeBUN2qoQ+l
	 WWN084WtZzu7cdKCxZrPi57kmlu2CgPi1W2CR8HLFsVnoejG3PUgOUiPO6qCoWCAt1EG7
	 LZf83oqOXTsS/Irl/9k6TSEfkXFHhamXwK0TjFJ/6ns1FI9lGCc+zvMmjyf86S8zEoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVgDs6VB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E9606ACE3;
	Thu, 22 Oct 2026 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVgDs6VB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82E41F01825;
	Thu, 22 Oct 2026 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792682184;
	bh=8H6+UE0okItxfC44yLRwjAt7ioe2opIB/iP9myL0jXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVgDs6VBpL20xZweONWdFzP9lLLdk31LTKlxd1is87mOc6GeEpVm5/XJuW0y11med
	 VcqF3oq7YiQU1Ugn5mS0S42fbsxm/DrWmCPpaeR1IsYLb4dCTEG7kcSYoWcp0j1jzZ
	 7VR3+5HlVsRgwqQ+juR4PH68VvLdNPJ+mWLM1JuMMpu8+JwJxlvJ2n1/8lGSvbboT7
	 Dq8Wp7eBa4Gy9Kx6fdkLWNQpW323JZavcr+vG3GqtngqQ2zlVf2Im92kT5X/9dN4XJ
	 FHa0ITfdlKJj03RW8Hb7vRHUlnOHzEUb7geYy4lu28ietNMD3miyzMJXxWplE04VWR
	 ZHzzNlVWmumbQ==
Message-ID: <sashiko-outbox-181685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
 <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 15:16:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: imx8mp-toradex-smarc: camera-connector nexus breaks fw=
_devlink
- [Medium] arm64: dts: freescale: undocumented toradex,camera-connector com=
patible
--

commit d093f7d003a6a1108921f20ccc8a5a3a82a991c7
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus

This commit adds two camera connector gpio nexus nodes to
imx8mp-toradex-smarc-dev.dts and adds labels for the camera i2c buses and
mipi csi receivers in imx8mp-toradex-smarc.dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b=
/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> index c28d63293149b..e0096388fbfe1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> @@ -13,6 +13,32 @@ / {
>  		     "toradex,smarc-imx8mp",
>  		     "fsl,imx8mp";
> =20
> +	smarc_csi0: camera-connector-0 {
> +		compatible =3D "toradex,camera-connector";

[Severity: Medium]
Is there a devicetree binding schema documenting the
"toradex,camera-connector" compatible string used in camera-connector-0 and
camera-connector-1 in
arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts?

Neither Documentation/devicetree/bindings/ in the tree nor this patch series
defines "toradex,camera-connector", which causes dtbs_check validation on
imx8mp-toradex-smarc-dev.dtb to fail to match any schema:

Documentation/devicetree/bindings/submitting-patches.rst:
  6) Any compatible strings used in a chip or board DTS file must be
     previously documented in the corresponding DT binding file
     in Documentation/devicetree/bindings.  This rule applies even if
     the Linux device driver does not yet match on the compatible
     string.

Should a binding schema be added before using this compatible string?

> +		#gpio-cells =3D <2>;
> +		/*
> +		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
> +		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
> +		 */
> +		gpio-map =3D <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask =3D <0xffffffff 0x0>;
> +		gpio-map-pass-thru =3D <0x0 0xffffffff>;
> +	};
> +
> +	smarc_csi1: camera-connector-1 {
> +		compatible =3D "toradex,camera-connector";
> +		#gpio-cells =3D <2>;
> +		/*
> +		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
> +		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
> +		 */
> +		gpio-map =3D <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask =3D <0xffffffff 0x0>;
> +		gpio-map-pass-thru =3D <0x0 0xffffffff>;
> +	};

[Severity: High]
Will routing consumer gpios through camera-connector-0 and
camera-connector-1 cause fw_devlink to block consumer camera devices from
probing?

Because camera-connector-0 and camera-connector-1 are top-level nodes with a
compatible property, of_platform_default_populate_init() ->
of_platform_default_populate() -> of_platform_populate() ->
of_platform_bus_create() instantiates platform devices for them that have no
matching driver.

When a consumer device (such as camera@3c in the ov5640 overlay) references
&smarc_csi0 or &smarc_csi1 in reset-gpios and powerdown-gpios, fw_devlink
resolves the supplier through of_link_property() -> parse_gpios() ->
parse_suffix_prop_cells():

drivers/of/property.c:parse_suffix_prop_cells() {
	if (of_parse_phandle_with_args(np, prop_name, cells_name, index,
				       &sup_args))
		return NULL;

	return sup_args.np;
}

Unlike of_get_named_gpiod_flags() in drivers/gpio/gpiolib-of.c, which calls
of_parse_phandle_with_args_map() to traverse gpio-map,
parse_suffix_prop_cells() calls of_parse_phandle_with_args() and stops at
the nexus node itself.

As a result, fw_devlink_create_devlink() links the camera consumer to the
driverless camera-connector platform device instead of som_gpio_expander.
When the camera consumer probes via really_probe() ->
device_links_check_suppliers(), it sees that the supplier has no bound
driver:

drivers/base/core.c:device_links_check_suppliers() {
		if (link->status !=3D DL_STATE_AVAILABLE &&
		    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
...
			device_links_missing_supplier(dev);
			ret =3D dev_err_probe(dev, -EPROBE_DEFER,
					    "supplier %s not ready\n", dev_name(link->supplier));
			break;
		}
}

Note that simply dropping the compatible property from camera-connector-0
and camera-connector-1 without updating fw_devlink to traverse gpio-map
would leave the nexus nodes without a struct device, causing
fwnode_links_check_suppliers() in device_links_check_suppliers() to defer
the consumer permanently with "wait for supplier /camera-connector-0" even
after driver_deferred_probe_timeout expires.

Could this regression be avoided by teaching fw_devlink to resolve through
gpio-map (for example using of_parse_phandle_with_args_map() in
drivers/of/property.c) before relying on a driverless gpio nexus node?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-v1-smarc-i=
mx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com?part=3D2
