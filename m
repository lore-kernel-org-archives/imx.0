Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEE3A872C;
	Thu, 13 Aug 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625544; cv=none; b=OrxjLF+/BkxLI4bttr0CY1HQGRZFIrkSII00SzkSWOGK3cDBpkngIfa/L08vDLTsTQmqnmqFjsJsl0Eu5lENTQHr4GnhIrlMGfWryQlYquyfhBOdJL7WA1Q5ac6TmoqApy5A79TeQ/ANmpu+jsrbhDjnIBnqTO2w2PG8EmjbjaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625544; c=relaxed/simple;
	bh=QYY2ie7zYEWaAwejEnDa3/Fa/F4ZSbe1MI8fpQByjDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9oiTYZQOozptbggrtIP3bmN0jxOXPS0T7w/YuY3e6sH6vQ/+YpooQFLpha6ic6X5xAMVmSuR07XyJ6Zd0rItN9n03pO7plxEoawmDnv0vES4R0win3TU3Bi8fGxTM9P/GI075tvQsl0uu7eeexVLISs5E4qf+lK0Tw2XYiQDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edKsLw8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edKsLw8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA121F000E9;
	Thu, 13 Aug 2026 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786625543;
	bh=fzZppP5cHZpR/ePSPovywfIqHUyD/7/zmmCnua6V1OI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=edKsLw8dpSo0BzZdkIhXxIbTErpAhoL3dUiQMoSwKgGmK+cOI84mBBDXtIQcJWDl5
	 ok8/Whwgk/T+/LN7D+B/2lxIyfH2xcL6uP4IeTbK6lGJIPnjuSreWRBxcY7F3vbuMu
	 ECHkRcHhPNoM9Vpqzb39dnOHXGQlArVu0MfPOpsCPlHyN6Q4c+03ZEd0OKYyslJ8Pz
	 f99nI49F+XEOSz2JhZf+cJNmlGSAv827VtCn0wiKW5gptoWi3cDdFpt0nIlR7WHylR
	 dk0WKKxtgAlvsSYbsikdgkReBuIZXklg/dS0Oy/TtwRm6AioQgs/tkGKxsD74uBshx
	 jIEJkA4t/tyuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260813121250.3993187-3-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
 <20260813121250.3993187-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:52:22 +0000
Message-Id: <20260813125222.BDA121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] I2C GPIO expander used as reset-gpios for onboard_usb_dev causes P=
M phase mismatch, breaking reset timing during resume.
--

--- Patch [2]: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node ---
commit 52d9db850f98165215d9ab4ba1bee0bd2993c73e
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

ARM: dts: mba6ulx: Add USB hub node

This commit replaces a fixed regulator previously used for USB hub reset wi=
th
a proper onboard USB hub device node that utilizes reset-gpios.

> diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/n=
xp/imx/mba6ulx.dtsi
> index 244376b38835a..322fbd82531e6 100644
> --- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi

[ ... ]

> @@ -379,10 +369,18 @@ &usbotg1 {
>  /* 7-port usb hub */
>  /* id, pwr, oc pins not connected */
>  &usbotg2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
>  	disable-over-current;
> -	vbus-supply =3D <&reg_otg2vbus_5v0>;
>  	dr_mode =3D "host";
>  	status =3D "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible =3D "usb424,2517";
> +		reg =3D <1>;
> +		reset-gpios =3D <&expander_out1 0 GPIO_ACTIVE_LOW>;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does using an I2C GPIO expander for the onboard USB hub reset cause a PM ph=
ase
mismatch during system suspend and resume?

The onboard_usb_dev driver uses suspend_late() and resume_early() power
management operations, while standard I2C GPIO expanders typically use norm=
al
suspend() and resume() operations.

During system suspend, the expander suspends first (in the suspend phase) a=
nd
puts its regmap into cache_only mode. When the hub driver suspends later in
suspend_late(), its reset GPIO assertion is merely cached.

During system resume, the hub driver attempts to deassert the reset in
resume_early() and waits for power_on_delay_us. Because the expander is
still in cache_only mode, the physical pin remains unchanged.=20

Later, during the normal resume phase, the expander finally syncs its cache
to hardware and physically deasserts the reset pin. This entirely bypasses =
the
hub driver's power_on_delay_us wait and causes a race with the USB host
controller, which could result in enumeration failures upon wake.

> +		vdd-supply =3D <&reg_mba6ul_3v3>;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813121250.3993=
187-1-alexander.stein@ew.tq-group.com?part=3D2
