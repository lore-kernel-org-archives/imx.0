Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758402641C6;
	Wed, 19 Aug 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151970; cv=none; b=UNXzknMJCAmegSCuf4jEmXZguESPNjTIjNL1avVxaQpzuRLR0cpjMaKfn7guD+Ukm4WoDPsAK/9Wc+WhrfCovInh0or6ZCrkVIm01z7Ri7QTAA83+u1GlI5vK7xzV6HKMHrJ5Bbdjxys6cgvW0IrwqD27QTtGFanbY+GQaqo08g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151970; c=relaxed/simple;
	bh=H6BU+h1pFhfj5L6jkcbg2CDt93nEiDUpfrVr/mHHFDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LD3rsvkndVK4qsbfoKThSmWOBs3AaEOwN3fEVRL9k/+RiN27mxf1vCPjtk7Xkh/RTRDNxaxdgG/C0zLR81JUHw19ikvkYXXugD81VTDrc4EoekyirPZL/XOpHNy27vNwIH5/XaSNUt7lF0Z5MYo2B3MbLz0pFBl4AYnkrV7Q4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fi/s5QQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fi/s5QQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178931F00A3A;
	Wed, 19 Aug 2026 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787151969;
	bh=uAJXCu4gg+8Rbt7yPqzaLEtYj707BRnO5GCYL91lqvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fi/s5QQ39Bz+SWJSGN3uzFUG6Z2i3XYWDVUQVAOV8UfklQmBT0S9Ujsn3pvbuzsg+
	 mv+JoN4c1bYdVdPA4b7PmUvfAPcHMFRrC5yGAzJ2Pnu+2/9Oxd2tlfEFBDHtwxpGzU
	 skY/8ZSI5JLUb8d6aOG6/+LKonxuM5e13tPo+PzTA13yMKGzT5/opuXfF90jvmwq82
	 X5MS4zA7UsvxlCta4fsGEilb37sLJNrndkuyD4d/cuuoe8mK2Jajg7RqimPO7/teg/
	 GzP+bCTmemVKNanGRGzaHF/MZBwsvLDlVa16aqTh4UNnWMQ4vSSdDtcdIz/T5SbDtQ
	 xVda6mLsXZ09A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-ultra-mach-sbc: fix CBTU02043
 USB Type-C orientation switch
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260819-imx8m-typec-v1-2-befc92ecb70a@nxp.com>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
 <20260819-imx8m-typec-v1-2-befc92ecb70a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 15:06:08 +0000
Message-Id: <20260819150609.178931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The GPIO hog for the CBTU02043 XSD pin incorrectly drives the phys=
ical pin HIGH, placing the switch into shutdown mode instead of keeping it =
enabled.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: imx8mp-ultra-mach-sbc: fix CBTU02043=
 USB Type-C orientation switch ---
commit 9b2cdf94fea52f7b5503f6d6e284f01ff2cf262b
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8mp-ultra-mach-sbc: fix CBTU02043 USB Type-C orientation swi=
tch

This commit drops the gpio-sbu-mux node, replacing it with an
orientation-gpios property in the ptn5110 TCPC node. It also adds a gpio-hog
to keep the CBTU02043 switch's XSD (shutdown) pin held low, ensuring the
device remains enabled.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> index 3e6f9c88cc200..7e0550647751e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts

[ ... ]

> @@ -217,6 +202,15 @@ &gpio2 {
>  		"", "", "", "", "#SD2_CD", "", "", "",
>  		"", "", "", "", "#USB-C_EN", "", "", "",
>  		"", "", "", "", "", "", "", "";
> +
> +	cbtu02043-xsd-hog {
> +		gpio-hog;
> +		gpios =3D <20 GPIO_ACTIVE_LOW>;
> +		output-low;

[Severity: High]
Will this configuration inadvertently drive the XSD pin HIGH, placing the
switch into shutdown mode?

The commit message notes that the CBTU02043 XSD pin is active-low (LOW for
normal operation, HIGH for shutdown).

However, the gpio-hog node specifies both gpios =3D <20 GPIO_ACTIVE_LOW> and
output-low. The output-low property in the device tree binding requests a
logical 0 (inactive state). The GPIO subsystem evaluates this against the
GPIO_ACTIVE_LOW flag and inverts the logical 0 into a physical 1 (HIGH).

Could this be resolved by either using output-high (to request a logical 1 /
physical LOW) or by changing the polarity to GPIO_ACTIVE_HIGH while retaini=
ng
output-low, to ensure the physical pin is correctly driven LOW?

> +		line-name =3D "CBTU02043_XSD";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_cbtu02043_xsd>;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx8m-type=
c-v1-0-befc92ecb70a@nxp.com?part=3D2
