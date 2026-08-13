Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7F47ACF2;
	Thu, 13 Aug 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625493; cv=none; b=CDU6Pa4c+OdKE+2uEJqhjYFh062QgvGX3lzglrMUp/vITBq7dOSHMLsh4MUHCOOdaknILfQaYkxboJvoYyxM9hYI8TFp68TDzqbJaG9tiGxv9xCXK/yy899OuhD64PMvJazf+Vdi+mCY/s3cSBK1mwhfgmC/amS+7idyITym3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625493; c=relaxed/simple;
	bh=7RUpOEs5VM0Y6TdNlAzmXZekGPh9eEGRx5arh/HMmyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h5DI22pPj1oXmMmp5s/kzvNHDwUsx+5C89fXjM6jCcVzpwsiVwK9WpN0PPZ3S7roOIEElHojkRhtd/anY+N1ld10XoiUBw0a5/icVHJpUs+KSQplOfVs7mvC+FyFvlYwmg/WpJaAsrRQBZtZFaHdTaOC/dwaF8RNCxwrQycyCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr0khjS8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr0khjS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76481F000E9;
	Thu, 13 Aug 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786625492;
	bh=XCYdwxsmVJnMKoCibV6/1wBZWyWt0XBcwgGOIVfgO58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gr0khjS8rh9eMfKc74O0v34HSa4dXn38SBDBG/X1lvzC+fUKvO/wtCQBFSWmauXg+
	 m4UF/Ihqg/pjbKEtQNGLbr4q2aN09KCsaJAzU+gEPg6jguzs60hTiIwEsrQ447vio7
	 G/j7COhZUsScotko+GLjYFVUg0KttwEUYkGzyhqnPNENjAZcce7wp6O2WGY0cLIVbY
	 07myj8dKzU+LvdVV4H5p/kTHbBJMv7Xl3XT9P1Z8SE6JMzaYWZoUvf2zB2FJsSmJYV
	 9PTjeVr0OloYjvJ0ZrCNtnqxplIsYA3PVJPlezNuF13BmWvyV6K+upylb9Za/aicX9
	 tuMYxBinWtAxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260813121250.3993187-2-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
 <20260813121250.3993187-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:51:31 +0000
Message-Id: <20260813125131.A76481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Leftover `gpio-hog` nodes (`enet1_int-hog` and `enet2_int-hog`) =
for Ethernet PHY interrupt pins double-book GPIO resources.
--

--- Patch [1]: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt su=
pport ---
commit b452753cee9dad50d404387319c21ed7231c45d2
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

ARM: dts: mba6ulx: Add Ethernet PHY interrupt support

This commit adds interrupt-parent and interrupts properties to the ethphy0
and ethphy1 nodes in the device tree. It configures the Ethernet PHYs to
use level-low interrupts provided by the GPIO expander.

> diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/n=
xp/imx/mba6ulx.dtsi
> --- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> @@ -214,6 +214,8 @@ ethphy0: ethernet-phy@0 {
>  			clocks =3D <&clks IMX6UL_CLK_ENET_REF>;
>  			reg =3D <0>;
>  			max-speed =3D <100>;
> +			interrupt-parent =3D <&expander_in0>;
> +			interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
Will this conflict with the existing enet1_int-hog in the expander_in0 node?

Further down in this file, expander_in0 still defines these pins as
gpio-hogs:

		enet1_int-hog {
			gpio-hog;
			gpios =3D <6 0>;
			input;
		};

		enet2_int-hog {
			gpio-hog;
			gpios =3D <7 0>;
			input;
		};

Does leaving these redundant gpio-hog nodes in place cause the device tree
to claim the same hardware resource twice? This might result in a resource
ownership conflict between the GPIO and IRQ subsystems, potentially causing
the IRQ request to fail and fall back to polling.

>  		};
> =20
>  		ethphy1: ethernet-phy@1 {
>  			compatible =3D "ethernet-phy-ieee802.3-c22";
>  			clocks =3D <&clks IMX6UL_CLK_ENET2_REF_125M>;
>  			reg =3D <1>;
>  			max-speed =3D <100>;
> +			interrupt-parent =3D <&expander_in0>;
> +			interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813121250.3993=
187-1-alexander.stein@ew.tq-group.com?part=3D1
