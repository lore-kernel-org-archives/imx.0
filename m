Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108308;
	b=kMVHtw9iIFgesPR4YCSqHrP3sEiY8Qv6AIR/2k+UqcKJ6lEZBwvNDguKB12wURQ1FTfN
	 xfRC6QGwHtROZXsxnuAsvqoydj3m1S1EAieTBdL1EYB38GlIbngzZLWyti0/4cGdsFYB1
	 UXZoXxG+cq7IE0B7eJYWdwPWt8ua44i1ShrJji9FYW323Vy3TZSEw7izKjcHHp1TR3rXb
	 R5tUpFTb6NNEkaZaLnClZQClA9AYCexwRb04gDTjhEBicroadHPznHBSlovfvL1ZSej3A
	 ONtMlAhNs09wFbxoFYta8j3AVwKiFVoJXj4lwpcWAvmL17GBOeHpKl0/e/fpaf8CgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108308;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/n+SVRcGCIVq1grnDfeU7pYAqvyi2Iz3mQM8BARWJk=;
	b=Y5CIBO0yIGU6vEBvg4zzkCoQYmqnn4nwh2UzPtewUH5skVLWSIhLxs/mLFLJfT3KB+F0
	 TFTz2usL+N88y3kvdCBNJ9ObN9dk/6YFSFs5DAVF8zm23GgG8rK0lv4G9R+aj3vPFJu/C
	 A01tgJksgq3HbgclP4PDo3vx+sxzZQ3BiGP2M62Les6HQNJd4jbN9AMuJg9JH3S96Ty8f
	 u3ayOvgOCHeB3KagCmjwLEOpB8ySiPR+9vJ2mRx+vvBH1rz0aDbcx9ke5UJZQaHyX5xIJ
	 M+SWePrKe6vjs96347x2thCHslXM1fifm7rHwHePfgdRe0sGex79PvB7+q6EBkhqcRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irxjzqty;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22FD606A31B;
	Tue, 27 Oct 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irxjzqty
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADAF1F01825;
	Tue, 27 Oct 2026 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793108307;
	bh=y/n+SVRcGCIVq1grnDfeU7pYAqvyi2Iz3mQM8BARWJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irxjzqtyhJ7sSySlz4JIUUrYlyKHsckrRU9FCjQeryxHlbgihbSeaodZkeZA4Y4CO
	 KAhsl+UoPJFwMHtiFNijv6XEZp8p5v3R2kYSQEdf3fatS+uqefjfJ2Lw07/S6qF+zh
	 ePgIadlS8A4mKqhEydWpqbxmzV8eaIYCto74nMd3bRfXNkCqNPZOU3TRDFy84ub78m
	 GxnrjqintONU5lw5W0MvRyFYj+ohEaK7Oz+St36+lPnaRYnffusbo8X52Ht8J6zHYs
	 ukSiXis48ls1ubShtUC1HHt6s+Qe/gN3ENOMRl+0ioSxe8+TNbokAVuQfyFRAYAThG
	 Gkl2HmvQ6uSDQ==
Message-ID: <sashiko-outbox-186658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx95-navq: add USB1/USB2 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
References: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:38:27 +0000
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
- [Medium] arm64: dts: imx95-navq: missing OTG capability disables on usb2 =
node
--

commit 1ff89e7196fb33692fe862b6274ad535b519c7f7
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: imx95-navq: add USB1/USB2 nodes

This commit adds and enables the device tree nodes for the USB1 and USB2
controllers and their Type-C port controllers on the i.MX95 NavQ board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/bo=
ot/dts/freescale/imx95-navq.dts
> index 7860c113e9e02..b668c752905bf 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts

[ ... ]

> @@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
>  	};
>  };
> =20
> +&usb2 {
> +	disable-over-current;
> +	dr_mode =3D "otg";
> +	usb-role-switch;
> +
> +	status =3D "okay";

[Severity: Medium]
Should the &usb2 node also include adp-disable, hnp-disable, and
srp-disable, matching &usb3_dwc3 below?

In drivers/usb/chipidea/core.c:ci_get_platdata(), when dr_mode is set to
"otg", the ChipIdea driver enables hnp_support and srp_support by default
before calling of_usb_update_otg_caps():

	if (platdata->dr_mode =3D=3D USB_DR_MODE_OTG) {
		/* We can support HNP and SRP of OTG 2.0 */
		platdata->ci_otg_caps.otg_rev =3D 0x0200;
		platdata->ci_otg_caps.hnp_support =3D true;
		platdata->ci_otg_caps.srp_support =3D true;

		/* Update otg capabilities by DT properties */
		ret =3D of_usb_update_otg_caps(dev->of_node,
					&platdata->ci_otg_caps);
		if (ret)
			return ret;
	}

Without those disable properties in the device tree, hnp_support and
srp_support remain true. In drivers/usb/chipidea/udc.c:udc_start(), this
sets ci->gadget.is_otg =3D 1 on a Type-C port, and when CONFIG_USB_OTG_FSM =
is
enabled, drivers/usb/chipidea/ci.h:ci_otg_is_fsm_mode() evaluates to true:

	return ci->is_otg && ci->roles[CI_ROLE_HOST] &&
		ci->roles[CI_ROLE_GADGET] && (otg_caps->srp_support ||
		otg_caps->hnp_support || otg_caps->adp_support);

Entering OTG FSM mode routes role changes to ci_otg_fsm_irq() instead of
ci_handle_id_switch() and ci_handle_vbus_change(). When TCPM calls
ci_usb_role_switch_set(), both id_extcon.changed (OTGSC_IDIS) and
vbus_extcon.changed (OTGSC_BSVIS) can be set together before invoking
ci_irq(), but drivers/usb/chipidea/otg_fsm.c:ci_otg_fsm_irq() handles them
in a mutually exclusive if / else if chain:

	if (otg_int_src) {
		if (otg_int_src & OTGSC_DPIS) {
			hw_write_otgsc(ci, OTGSC_DPIS, OTGSC_DPIS);
			fsm->a_srp_det =3D 1;
			fsm->a_bus_drop =3D 0;
		} else if (otg_int_src & OTGSC_IDIS) {
			hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
			if (fsm->id =3D=3D 0) {
				fsm->a_bus_drop =3D 0;
				fsm->a_bus_req =3D 1;
				ci->id_event =3D true;
			}
		} else if (otg_int_src & OTGSC_BSVIS) {

Could this cause OTGSC_BSVIS to be dropped on role transitions and prevent
software-driven host/device role switching from working properly on &usb2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131630.575-=
1-laurentiumihalcea111@gmail.com?part=3D1
