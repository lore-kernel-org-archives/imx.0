Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60C370AE6;
	Sun, 27 Sep 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507180; cv=none; b=IddV5Nv/zjs4gYiXsdH6JRSkyrG/t02E+/VKS1F557Z4MkrNAt7hbrI3iDylYUe6tlrfv/QU3xqZDjVc6L89a0Wdt5JXwYoyXhtn1mwHTvapeC8PXmSV0pJcCbv4/DjFLdEuyzcAXdlQq+Q/KVc5E3gkmh52jGzR2CpFsjG1Akk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507180; c=relaxed/simple;
	bh=4h9O/mP+IHhjssNlf+JKcrJQfx57DzUQrt/uVF/HtDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hg2Wio4hIloEiuEc522CJKGu/V5lUTLth46hm5079XLkd4Whho1hAB7/XHVVbLLYBpwEZW0UJSr+T5GKD64tTlF+9OjCIFTMOBGhiu933SwVPrUBS+srWgEhZk62j/q9LP31acaOg/T85sLXY6BtTGNyH1ZN92YH6ILGzxzFGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SF2rQVJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SF2rQVJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED1E1F00893;
	Sun, 27 Sep 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507179;
	bh=eaOpQpIW0Gfz+PtwPrCaFiguwStqjzxS/FcOo31TFYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SF2rQVJlCKoA9em1N8O1yUbYMYYGXagwcKn9HVWGG/RDKSc6MDODb4Uz1/KQSunY9
	 6iEPifw/HzEBLkLP6mM/03wwHu8I9EyDyUU3YaYKe4iMgAQZmnz9iYNUR7bq+zUVTR
	 dVd/5C8Q4l9t08ZIQyJHokaSJ3NJDU6nVUm8tWw4RRld2Lb/aNXl8YwqynLTE40VS8
	 FFEUWpaWyzsuNEWaZvSE+AVk2VCeAuGqFArKGi/CMFb6uiNd7Py5SF8CjHQ0ZthktK
	 uYThfRPl54hTu9wvwwmsbKBIJVh7Piv3jEFGcZ3mLF+UwFO/K3Gvqs6ISUFeyuWAmU
	 fjDeM3qVZBpjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] ARM: dts: imx6ul: Add Variscite SoM and DART
 base files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <888149bd87b619a1706d3befefa5f873d746a9dc.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <888149bd87b619a1706d3befefa5f873d746a9dc.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:18 +0000
Message-Id: <20260927110619.2ED1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing voltage constraints on touch_3v3_regulator break ADC sca=
le
--

commit 1c2bc49be02f8a5da660fe024ca1908ba6a36cd7
Author: Stefano Radaelli <stefano.r@variscite.com>
ARM: dts: imx6ul: Add Variscite SoM and DART base files

Add shared DTSI files for the VAR-SOM-6UL and DART-6UL modules and
SoC-specific wrappers for i.MX6UL, i.MX6ULL and i.MX6ULZ.

Keep storage, audio and carrier options in separate DTSI files so
board variants can include the hardware assembled on each board.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arc=
h/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> new file mode 100644
> index 0000000000000..3cbfea6e2b24c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> @@ -0,0 +1,205 @@
[ ... ]
> +	touch_3v3_regulator: regulator-touch-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "touch_3v3_supply";
> +		regulator-always-on;
> +	};

[Severity: Medium]
Does the missing voltage constraints here break the ADC scale?

Without regulator-min-microvolt and regulator-max-microvolt constraints,
the voltage is unknown and regulator_get_voltage() returns -EINVAL.

The vf610-adc driver stores this error code in an unsigned integer variable
(u32 vref_uv), causing an underflow to ~4.29 billion.

This garbage value is then exposed to userspace as the channel's scale when
reading in_voltageX_scale sysfs attributes, breaking functional ADC
measurements.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
> new file mode 100644
> index 0000000000000..7c778adfeb13e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
> @@ -0,0 +1,201 @@
[ ... ]
> +	touch_3v3_regulator: regulator-touch-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "touch_3v3_supply";
> +		regulator-always-on;
> +	};

[Severity: Medium]
Does this duplicated definition also miss the voltage constraints and break
the ADC scale in the same way?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D3
