Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890747;
	b=PY4PnhCZXazW9UkmU6NddkU4eEdJbFr46as34KVsjrwtHRQc2Lw88W7JBuDGhWLz2Hfb
	 1mEXeoAFBXLw411RgbY6tR9+yfdHhTklVpHyeOLmEgWlWzQk5irT18kWFmROiKSl1dDX7
	 MI0O2UMutHUeGN8TQyCQnk9kBC7Ww7tb6lMbZ5sX9YDUFzz0xDE5z9aydPdSvTUxLA0Hq
	 MVknA4InBiu5KhS0c/gsQcBVCkq1pKygeTk1KaF3HqjYQ5/JeoXq9s/EHv5IXaPg1b6FL
	 8Keow8euD4NcJJltY8ZF7yJWhnUhLkw7wGRxuLZdj2/wHjxM/VGSGsaCZ0VhcMezExg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890747;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XerAQQRSevSE4QkhqKdUzETATECEoWdnGYMmCc1jtYI=;
	b=EJ5eWF7ALMbHuqyjkrCYyN4Co8P8aCbK/OVFhbERzEeSQD4GO/TZIvgdc+1gfdZInSOH
	 ikcGjDHJ8pl0mEhIPfXZtJF6Zr4O2BTHFI6Qp4JfV78mJ1bv/A9Pg36JqqMcrefCU7Zqj
	 P5sGnp5wwgiqXykBOizW/SXReo6OyZO7sVr9qDWaf2UIoxCyh7vox6RzZLAXLTu36XCs8
	 DIpqsINOWNsmcDmyGbSNUeyo9/I10+wQaH2q3iqG3GSbuJuxTEENAxT6cv67yFyeZoPtM
	 pjvVmQ8XeifS+dx94zZ0/U+0MKb3qkvbPgM1Mr87dhBxpizn6HAJG1riwB++B4Raf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8xiE840;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64BE606A331;
	Thu,  5 Nov 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8xiE840
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27E31F000C1;
	Thu,  5 Nov 2026 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793890746;
	bh=XerAQQRSevSE4QkhqKdUzETATECEoWdnGYMmCc1jtYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8xiE840FQLwyfQlkNIO1LoZf24MnCFPpe9VpEJ5SZTmI3JXUoDlT1aL3+9hFAPb4
	 Ymk9yQBYhj0BZVGl0OmsqUM+v4QYh5g8wFVCClCNVxJtok3ZdO6py/PPzzp6ECeROn
	 hnvrSMtxpHwYWvi6jVi4ADgbFIxUMl+Wrj8bv9auypbJJdqB1gjNRepBtq1xkhdpZd
	 IoNvQeV/6evui9S6xUstZ12CirXjp9Mn8G493R+ss4Izs1ZjYz7bYorB9SUOYcgr7H
	 LkqwOvJJ8kGApVtD3mv6BceV3DOkV8d6r1UUQtLtcuCLCtAy/t/yFtGPB496wCVs8Q
	 85KLiGr8fYw+Q==
Message-ID: <sashiko-outbox-199279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261105144920.2796623-2-robh@kernel.org>
References: <20261105144920.2796623-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:59:05 +0000
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
- [Medium] ARM: dts: imx6: Deleting Dwarf and Nymph .dtsi omitted by copy-p=
aste in .dts
--

commit 22f4920daa7995325841819b6b25c37d2efd2b30
Author: Rob Herring (Arm) <robh@kernel.org>

ARM: dts: nxp/imx6: Drop unused .dtsi

This commit removes four i.MX6 device tree include files that are not
currently included by any in-tree device tree sources.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> deleted file mode 100644
> index 3a968782e854b..0000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -//
> -// Copyright 2017 NXP
> -
> -#include "imx6qdl-pico.dtsi"

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> deleted file mode 100644
> index 3d56a42164482..0000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -
> -#include "imx6qdl-pico.dtsi"

[Severity: Medium]
Should imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi be wired up to
their existing board device trees instead of being deleted?

Unlike the Kontron files, the corresponding board files for Dwarf and Nymph
already exist in the tree and are built by arch/arm/boot/dts/nxp/imx/Makefi=
le
(imx6dl-pico-dwarf.dts, imx6q-pico-dwarf.dts, imx6dl-pico-nymph.dts, and
imx6q-pico-nymph.dts).

When commit 98670a0bb0ef ("ARM: dts: imx6qdl: Add imx6qdl-pico support")
added support for the Dwarf, Hobbit, Nymph, and Pi baseboards, a copy-paste
error left the Dwarf and Nymph .dts files including imx6qdl-pico-pi.dtsi:

arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts:
    #include "imx6dl.dtsi"
    #include "imx6qdl-pico-pi.dtsi"

    / {
            model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf b=
aseboard";
            compatible =3D "technexion,imx6dl-pico-dwarf", "fsl,imx6dl";
    };

arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts:
    #include "imx6dl.dtsi"
    #include "imx6qdl-pico-pi.dtsi"

    / {
            model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph b=
aseboard";
            compatible =3D "technexion,imx6dl-pico-nymph", "fsl,imx6dl";
    };

(and similarly in imx6q-pico-dwarf.dts and imx6q-pico-nymph.dts).

As a result, the Dwarf and Nymph board DTBs are currently built with the Pi
baseboard description (which disables HDMI and routes the LED to GPIO5_IO18)
rather than their own baseboard descriptions in imx6qdl-pico-dwarf.dtsi
(GPIO5_IO31 LED, mpl3115@60 on i2c1, and pca9554 io-expander@25 on i2c2) and
imx6qdl-pico-nymph.dtsi (GPIO5_IO31 LED, adc@52 on i2c1, pca9554
io-expander@25 on i2c2, ds1337 rtc@68 on i2c3, and PCIe enabled).

Would it make sense to keep imx6qdl-pico-dwarf.dtsi and
imx6qdl-pico-nymph.dtsi and update the four Dwarf and Nymph .dts files to
include them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105144920.2796=
623-2-robh@kernel.org?part=3D1
