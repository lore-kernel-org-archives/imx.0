Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040270;
	b=U41ddSIaDn/5U2XCuPaBrjLrNeyttksADTNgdMMB7gWwRE3KvtdO10C3wD+5c3Nulk9x
	 ApFI1d1xYsWRCLYq8rfuDHlLrWpUmGeEQMp2VLXHQFhKXEvcH9/w2NeYyfOAWwdoMkbCh
	 BZnCJH5niAlhE0uMnG8w2rzzCwm2uWEFPP5IqFFYRpARNa3ItyysR0OHon9Ezu4M6fzMF
	 96KF5Ru2QM8OorLpFQz4G/wQi/Ep1qcKEpFtvQg9sFjb7m2r8UP5BNDQ185xa/B/GICq4
	 wv8RbzvX3J+EWuYSqZUiVXd/dDva/NzD/bSVYssd3c810Oq5KToWW9Zrhx6ZANovBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040270;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8lBuZXiGsime6GuAhFzW7wfLDSihPi0qas0TmbLPKXc=;
	b=ObAwvn8lzPm1XxtgBU/ng+9UYHdZJCcRDnTTuwZ/AE1elV8bAUgKIG0aa1/o+ZGZF585
	 yf5F96eXjEcEMzZtWLTvrV2YFP610ngys5JyCvF8XxARAVRHVz9sJZbEW8B4IDHS/0Sht
	 PEJ+u1z/i6crOrDuxrceCVOZYIIDGfv7rf1I585VzJNnZON/qxuKAurUMJYOJ8NqHQZsi
	 Koj3MyrxFQAMWOPskz8WQ0okyjqAhcwu2q96voodVO4uG+ULFppdh7o09/CpZsW0WkUqx
	 5IVh0Rbo3itGwS8qRYpl38sk6+kYO9pu60GjG3AkA9C61IXP55ipnkH4jVcNjGcqxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNyZOmP3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE63606A31A;
	Mon, 26 Oct 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNyZOmP3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554381F031E1;
	Mon, 26 Oct 2026 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793040269;
	bh=8lBuZXiGsime6GuAhFzW7wfLDSihPi0qas0TmbLPKXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JNyZOmP3oY5pDBUzc5GCo7UBV6y3RTl740kmlokpMPCxeE//bDUJnwUbkOL0biwAi
	 pk/uYjAmKk2i2YvdXbo3Ud12cPCXX6KVobEfV5MTqAAS2MJBXltmMFlarMicUB1LVx
	 u1NbCr6hf77hNFyNNlO2dPzpz/2/BQqe+3YrW7R05kM20UzdEr9onaszvklhBCPaj/
	 hDigjOoHo0MmtRk3HDG8/bvtbWOeBlt46DTt2j8ii/AWXwyrw8pWgHQHNT2mgEKhGg
	 MlBUPwVmPtWmKWC93G/VmjeP3YvbVclV0i2+A1cMdLE0xpdtw4cQac6nG2XkTrVKx/
	 2Ye2FbI1IKV+w==
Message-ID: <sashiko-outbox-185636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
References: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 18:44:28 +0000
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
- [Medium] arm64: dts: imx95-navq: usb2 dr_mode =3D host breaks usb-role-sw=
itch
--

commit 7aa413a1299c4bee8b5a2613c0acf6256cd30c16
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: imx95-navq: add USB1/USB2 nodes

This commit adds and enables the device tree nodes for the USB1 and USB2
controllers and their Type-C port controllers on the imx95-navq board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/bo=
ot/dts/freescale/imx95-navq.dts
> index 7860c113e9e02..5fe245b623068 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts

[ ... ]

> @@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {

[ ... ]

> +	ptn5110_usb2: tcpc@51 {
> +		compatible =3D "nxp,ptn5110", "tcpci";
> +		reg =3D <0x51>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <25 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&pinctrl_typec>;
> +		pinctrl-names =3D "default";
> +
> +		/* no SINK circuit (EN_SINK1 tied to TP30) */
> +		connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB2 2.0 Type C";
> +			data-role =3D "dual";
> +			power-role =3D "source";
> +			self-powered;
> +			source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +
> +			port {
> +				typec2_con_hs: endpoint {
> +					remote-endpoint =3D <&usb2_data_hs>;
> +				};
> +			};
> +		};
> +	};
>  };

[ ... ]

> @@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
>  	};
>  };
> =20
> +&usb2 {
> +	disable-over-current;
> +	dr_mode =3D "host";
> +	usb-role-switch;
> +
> +	status =3D "okay";
> +
> +	port {
> +		usb2_data_hs: endpoint {
> +			remote-endpoint =3D <&typec2_con_hs>;
> +		};
> +	};
> +};

[Severity: Medium]
Should usb2 use dr_mode =3D "otg" here instead of "host" to match the
usb-role-switch property and the connector's data-role =3D "dual" in
ptn5110_usb2, or should ptn5110_usb2 use data-role =3D "host" without
usb-role-switch on usb2?

When dr_mode is set to "host", ci_hdrc_probe() in drivers/usb/chipidea/core=
.c
skips initializing the gadget role and OTG handling:

	if (dr_mode =3D=3D USB_DR_MODE_OTG || dr_mode =3D=3D USB_DR_MODE_PERIPHERA=
L) {
		ret =3D ci_hdrc_gadget_init(ci);
		...
	}
	...
	if (ci->is_otg && ci->roles[CI_ROLE_GADGET]) {
		ret =3D ci_hdrc_otg_init(ci);
		...
	}

Because ci->roles[CI_ROLE_GADGET] remains NULL, ci_get_role() never enables
OTGSC_IDIE:

	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
		if (ci->is_otg) {
			role =3D ci_otg_role(ci);
			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
		} else {

As a result, id_extcon.enabled and vbus_extcon.enabled remain false. Althou=
gh
the Type-C port manager configures ptn5110_usb2 for dual-role data and acce=
pts
USB PD data role swaps, calls along usb_role_switch_set_role() ->
ci_usb_role_switch_set() -> ci_irq() -> ci_irq_handler() will have OTGSC_ID=
IE
and OTGSC_BSVIE masked out by hw_read_otgsc(), leaving role switching
non-functional and the controller permanently in host mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026182150.1133=
0-1-laurentiumihalcea111@gmail.com?part=3D1
