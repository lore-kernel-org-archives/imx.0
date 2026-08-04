Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8A47AF6C;
	Tue,  4 Aug 2026 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861743; cv=none; b=t7erzetG2wNSSIOp5KSXMH8h8pEoQeObuEKH37rTmJ5FBOt9qcebbxBC6W6abOu9Vmwjjr0dDlF5dwv1aCBRYYlKXSQdnSRD9GsiiDRKrS3oZ4d/+YoFS07kY1+IukH67ao2xCiIo8GjlOunsy4QM5Oz9q+t2RDxfgqp2wpAg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861743; c=relaxed/simple;
	bh=wryxQi+q/LXNVpzpfbIVRfWs4LLcIWICs/OobialYyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ull9cEd709KEXfofgVGjW7kwoum1Whpz+r4VO9kOQ6N4T05i0Bm8avab38lyoAHJrrS1p1WqyhC7DPSF7AoflhmzxA3P/TgdtmeLUY0ZIvFOEA5zJd+ozisl81wg4PR2uCSp/BiMDgP8PUU4zw3SswKWVjUC87kRiT20s076F7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsJcDBYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsJcDBYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F87F1F000E9;
	Tue,  4 Aug 2026 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861731;
	bh=SzzabY3hv5enl+59yJfPfSLwZJVnFhepLHEx+QSz73U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsJcDBYFqTlH3WdCXcoIylbAPxmFEDW2EifJZDKK0OwpEkSw8lRzj4vvjy/dmsRNq
	 HgjK4lRBqM3dRGi8KFb0/rtENctclLlJ5kjqh6/jbS4zsO3S5kSkTjlviKdbazgc3p
	 q2Gbx8DvByNNORZDPKA+2leRB1L7NZhFEtFMd72jqMz8i6U5zz3coo3U7fSAsTDOTN
	 F4HyxP8pwaKyKnO0EBZG1qfDrqoKjVaYPiUtgaFXUg77256W13Uj4FT9QRpfaWWqRa
	 bJIEQnSse2V86JlgG0r7lDawSHmShgnp+QltmwEOYb68B++RXUY0Y5IXhtDxIETbCa
	 Yngm4E4TBYYzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/7] arm64: dts: imx8mm: imx8mp: Add legacy board
 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260804162310.24374-3-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
 <20260804162310.24374-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:42:11 +0000
Message-Id: <20260804164211.8F87F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Disabling a supply node without removing the consumer's `vin-suppl=
y` reference causes infinite probe deferral.
--

--- Patch [3]: [PATCH v9 3/7] arm64: dts: imx8mm: imx8mp: Add legacy board =
DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 38e183a549e432bbb19f97500f860bf54f6c111a
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Min=
i and Plus eDM SBC

This commit adds legacy board revision compatibility DT overlays for both=20
i.MX8M Mini and Plus eDM SBC boards. This adds adjustments to support=20
legacy board revisions.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-=
data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
> new file mode 100644
> index 0000000000000..427585b78e45d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-rev900.dtso

[ ... ]

> +&reg_panel_bl_supply {
> +	status =3D "disabled";
> +};
> +
> +&reg_panel_bl {
> +	gpio =3D <&gpio3 0 0>;
> +};

[Severity: High]
Will this cause an infinite probe deferral for the backlight?

The supply node reg_panel_bl_supply is being disabled here, but the consume=
r=20
node reg_panel_bl inherits vin-supply =3D <&reg_panel_bl_supply>; from the=
=20
base DT.=20

Because the status property is ignored during phandle parsing, the regulator
framework will find the target node but fail to find a registered device fo=
r=20
it, returning a permanent -EPROBE_DEFER.=20

Should this also remove the reference via /delete-property/ vin-supply; in=
=20
reg_panel_bl?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804162310.2437=
4-1-marex@nabladev.com?part=3D3
