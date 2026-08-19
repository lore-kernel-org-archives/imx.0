Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905F47ACE4;
	Wed, 19 Aug 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151846; cv=none; b=lC98WfZ94I8TMjfFaNo/VzVTjtXKV16ToONEtRbF7KB5d3Vdj8KEpRhT9kEkkBBG7GztrkFys/Lve05Fc7I+69atJM3HMdLw2C0VHeoZPMveEC5wNqgSUdp3WX9+bvHi45TgE0m+jy/2pMJ7cC3SqsPZBuHPIWrGzV60GbGu7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151846; c=relaxed/simple;
	bh=7QdD/R2/Ni19ESzuiAq7R+6orA6/0Ys88l7g3rJ+pOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=muJb+jYGbVRdvphtimCpGBENn2DVWrQXd5a813VAYUQq9ytr55yN5XCkiw8nL8ZiHqziOrd+RFMwqxkkgjEzWwdWvg91chZzZLP3mqZNGPSv37GvBUQPBfKBxT0IwRLTVvhNClhH6t/PdixHrxXL35kiHcfwXeCbARe7cNdebmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXIa/MV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXIa/MV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1303E1F000E9;
	Wed, 19 Aug 2026 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787151843;
	bh=tkPA0TI7btUaiTvMRtGoAK4eeT9XTWXseBvKEJHkhjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DXIa/MV/8w7X5p3gmxz5ubL3XVkgLGYNMNsSZO25o8cH7HE1CCjBiJgZ7KNyXAJON
	 6kFlgjfltwKGf2QC7jCizelxxoOdK/h+wzahpkBZaA0OvQ9p1dUNu6QnER7XwDpanV
	 xclDm+28UtLfzTWTQMEqe+0WdQw+fQ1OOoT5kjLM8SEbACVMJO7sAKPAbsN3hMpQPM
	 vmk8sOl4Rkz6eD//Z2ZgceVRqfsaZCsY6sF40wQafX3mDqd1mGVCSEW5EwZ50wM4qJ
	 LBQLp1KKJKFXwW9LB9x/p2KjdO5pmZYnsDf7m+XJ0DJvcPIpRINgQ4Cg4x33OxTYdQ
	 A70KrIwP/8BJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB
 Type-C orientation switch
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
 <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 15:04:02 +0000
Message-Id: <20260819150403.1303E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The GPIO hog for the CBTU02043 XSD pin incorrectly drives the phys=
ical pin HIGH instead of LOW, placing the switch in shutdown mode.
- [High] The `pinctrl-names` and `pinctrl-0` properties inside the `gpio-ho=
g` child node will be silently ignored by the `pinctrl` core.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB=
 Type-C orientation switch ---
commit b6ef05965c4d69ccad672c2aa85487746c77918d
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8mp-evk: enable CBTU02043 for USB Type-C orientation switch

This commit adds a gpio-hog to keep the CBTU02043 crossbar switch always
enabled by driving its XSD pin low. It also adds a pinctrl group for the
XSD pin to ensure it is properly multiplexed.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index 7bdd641292fb6..dc3baeac5e3d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -935,6 +935,17 @@ usb3_data_hs: endpoint {
>  	};
>  };
> =20
> +&gpio2 {
> +	cbtu02043-xsd-hog {
> +		gpio-hog;
> +		gpios =3D <20 GPIO_ACTIVE_LOW>;
> +		output-low;

[Severity: High]
Will this actually drive the physical pin HIGH instead of LOW?

In the gpiolib framework, "output-low" requests a logical 0. Because the
pin is specified as GPIO_ACTIVE_LOW, gpiod_direction_output_nonotify()
applies an inversion to the logical 0, resulting in the pad being driven
to a physical 1 (HIGH level).

Since the commit message notes that XSD must be driven LOW for normal
operation, should this use "output-high" with GPIO_ACTIVE_LOW, or
"output-low" with GPIO_ACTIVE_HIGH?

> +		line-name =3D "CBTU02043_XSD";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_cbtu02043_xsd>;

[Severity: High]
Will these pinctrl properties be silently ignored by the pinctrl core?

The pinctrl bindings are evaluated by the driver core via
pinctrl_bind_pins() only for nodes that instantiate an associated
struct device. A gpio-hog node is parsed manually by gpiolib as a firmware
subnode and does not instantiate a device.

Does this mean the MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 pin will not be
multiplexed to its GPIO function, preventing the hog from controlling
the actual physical line? Should the pinctrl properties be placed in a
probed device node, like the parent &gpio2 or &iomuxc?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx8m-type=
c-v1-0-befc92ecb70a@nxp.com?part=3D1
