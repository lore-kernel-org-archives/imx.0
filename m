Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F932E62A4
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589575; cv=pass; b=MPjTsWuZkSTbmMgRokwc1QsjcbIrzFOc5Vh1+qezpid7bRQ8aq0f9I/xg9DTQTaZvZRAshWKUUBFWPGnuCcC90JIJ1siWSvV3cb/FzWBSBLXURc84t9AapcxMTGws8ReFYNONOxf97SSoFj4M3LpaaZLDD2LbI5Mx61hnH6qSxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589575; c=relaxed/simple;
	bh=gGE2lZbNShncu6x47TBaOZt0HX0D2dy620kD7U47i8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O642XflP/OEt04SlbwrJoZGmevdKw65oTTR/ho8yJssnN54OXeex8wXP9jAAPiCkWYehpTdW8s5VOMDuGcAsKDU0EBxzc2Uq+otNBwZoSRg922OmTW2pLlMlyX3uGqiQk1kTdFjtzaJ/S9FK28MNOnzfHB0xJGJbV1ki81mb4dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahZPsMhN; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahZPsMhN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4052160f8f.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 00:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769589573; cv=none;
        d=google.com; s=arc-20240605;
        b=RNJ9JMkKTfD9rt7OXvCMaIZU/3ltikkNgz2vmJhVEt4W+Thj8a9R4Dtt9UW4ED7jXQ
         zabCLVQ4RKMxdEoCJ0HCUU4/RNQ+09nNHodL1HcUDSaIAm9y8MME3CBaA8uLFIsCiA5p
         7SNTAQb1jwb1hZ/sI8Hh9X9bVWdqs0HEMNXzq3bk1dSldqLgUqFA4md8E4MaIaMRYV1f
         s80vzxcAbIMrD//zw/CSm4WbwlhrYjeRBlK9FHO5Nigp3GzJ1dpONLxHnokxm5HL/99p
         CCc46Knl1mfCvQjkfhTav7dJxLxhOLVQ7ZR0BC4oKQUzyN4GpMoBD1q8FTfzaNHElcWk
         eivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        fh=WpTD7dhCW7LZpaL+FICJtTHv9ubxuOGarEntxihS7GI=;
        b=DjPM+4z5AqX9TusrkZuZKraX8kwuSvbLe4iMG3izGW2YJfrfGCWtXayKbWROqnhNtl
         3/BbXX5tu8lblERqyqFCc29AB5wcz/Mv1Behq4umAAJjuLljy3M8ZXuQXvmleF4EScQI
         sHlwr+nRN+fwUnCSG7GB6ODNKXSGnrN8wv7Id67td8DfQ3agHCR1a6/ttPsEQlY56wNp
         reI3S+We7wpEVhN7uTQKpvDgsh2Cm/HbfeWeSZ+Lhi4DTNSigxEJYp641NdfuW9gnYVf
         fOygPF6Ei4o2y9iFcNOW8tHrPIeickKhhMpuIrOQrk31RMBngoG2lkiycohepM7aSi1x
         WWGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769589573; x=1770194373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        b=ahZPsMhN1vsDAgb0vmgx2I71BsLkUt0aO7a1KvUME0Ro/YRyr2Ja6freGLl6qouZfX
         Ez5m9PHqoehSwmzgyZ/3nGD42kZcQIkO4v60FdHyc9+/FPlwyQ1t2X+xdr8uCY7QMs3z
         zdq27afI76v17BCTocOypLIDFmkuWxMETQSLXzWZ0gHjRgGDdOyEts/uIE8nmoAXZ4bz
         cE2coXMySMv6XFxchpxJLo3BulQ33YdCf56eGEY2BUmsJJVVAqYYN4aAVh8H7l/ufep4
         rTvZqThlUx6/xQlQ0lwW56TU36NUae5SONqLoTkgMc1yTsI6ROzSZz1z9FtixuD73cz6
         d7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589573; x=1770194373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        b=UKyHyU0vC8pkMiCA650J+KGVy7sT8X1405AfjzVuV0KAnf6n4/gtuF+Gv2JTVXAm/w
         dnSn6ODMYQ1G1hLxiiy4Qb+DNneoFq8cAovkWrRWXE8I3EkaEFmDZUPjqA9uTBx46Rnn
         zaKJJoxekYWIjsl7wsbxn1IZ1YULteP38RRYlhVrmTJKdWe7s8EzLkSAswHwBFrhx/C3
         VH3zsszbk457IzhRmondiVEXTEYM8YqvPQfEGjm7mqpRFIKpDcJthQVw+bgWwsbf49mV
         h8H4LS+j/KoJFiD6J+z197Scdqis7vs73lh7N161/7drwNgajt0rz7rMZd4/Jn0CT+6E
         5p1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIII5e6CRHnf1SVHMBo/UeIxQFPOrjmHU81uvj4yAoW94p1qmp3nucg2mfxZ9B+wn63NA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb74eRRCmvd4XGXugk9hizPW6w1nn4e5VU0aagWo7icCxmab3V
	nMhs+VJ5uwoCnKd8H/uLIWiHsdL7EfhER/UMO7UpvRKtgoK6EkFSlV03prTvilD0CP0z6bU8K0S
	uOjDFpLMYBxHhBGLL1Y+mlTIJEo+7P74=
X-Gm-Gg: AZuq6aKM/1MwcQq1oWdklrbKBjnFUf7oa2dXQeRlKO7c3cKotIyR9QGr9y4pdMtOv6W
	QeH9oSdhhl82rVORiQn/skv4HlPCb6CWulZ332hNYSx0Gv7TH/VxvB05855ykAbS6t6kjZwHcGY
	6IT/14mVKOSexvI/gc+OleccmFj7+jwnbM4gnaMTJMLevcdxXPXqBgCwtRMxiyrXYjcN6vfN5qK
	kUpGfDRhS9bsOvFOfQ6rNPmlYrHB4BSe5/7GIRIQMKC85Z6JVBafwk3mXHQvWc+x491gCxvdk7s
	OMkdFR0=
X-Received: by 2002:a05:6000:2906:b0:432:857d:e425 with SMTP id
 ffacd0b85a97d-435dd0a40a4mr6149417f8f.30.1769589572469; Wed, 28 Jan 2026
 00:39:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com> <20260128050549.3337279-1-onlywig@gmail.com>
 <20260128050549.3337279-2-onlywig@gmail.com> <aXmsbbt9T5ZRGtES@shlinux89>
In-Reply-To: <aXmsbbt9T5ZRGtES@shlinux89>
From: Wig Cheng <onlywig@gmail.com>
Date: Wed, 28 Jan 2026 16:39:19 +0800
X-Gm-Features: AZwV_QisDOJPdzB7hBtncbVdr6RMWIjbixaTB16D-guHWsWAMozPqEa1RjRA1NY
Message-ID: <CAPStFe7-1++d79LEnh0=ozkZrU7n8_FWx_cx8_YUc7UhOt48hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peng Fan <peng.fan@oss.nxp.com> =E6=96=BC 2026=E5=B9=B41=E6=9C=8828=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jan 28, 2026 at 01:05:49PM +0800, Wig Cheng wrote:
> >Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
> >
> >Signed-off-by: Wig Cheng <onlywig@gmail.com>
> >---
> > arch/arm64/boot/dts/freescale/Makefile        |  4 ++
> > .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
> > 2 files changed, 55 insertions(+)
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpa=
per.dtso
> >
> >diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dt=
s/freescale/Makefile
> >index ce8f937c2315..c2727f8061e2 100644
> >--- a/arch/arm64/boot/dts/freescale/Makefile
> >+++ b/arch/arm64/boot/dts/freescale/Makefile
> >@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-i3c.dtb
> >
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm.dtb
> >+
> >+imx93-11x11-frdm-pixpaper-dtbs +=3D imx93-11x11-frdm.dtb imx93-11x11-fr=
dm-pixpaper.dtbo
> >+dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm-pixpaper.dtb
> >+
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-nash.dtb
> >diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dts=
o b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> >new file mode 100644
> >index 000000000000..1111503b08af
> >--- /dev/null
> >+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> >@@ -0,0 +1,51 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper displa=
y
> >+ * support on NXP FRDM i.MX 93 Development Board
> >+ *
> >+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> >+ */
> >+
> >+#include <dt-bindings/gpio/gpio.h>
> >+#include "imx93-pinfunc.h"
> >+
> >+/dts-v1/;
> >+/plugin/;
> >+
> >+&iomuxc {
> >+      pinctrl_lpspi3: lpspi3grp {
> >+              fsl,pins =3D <
> >+                      MX93_PAD_GPIO_IO08__GPIO2_IO08          0x3fe /* =
SPI3 CE0 */
> >+                      MX93_PAD_GPIO_IO09__LPSPI3_SIN          0x3fe /* =
SPI3 MISO */
> >+                      MX93_PAD_GPIO_IO10__LPSPI3_SOUT         0x3fe /* =
SPI3 MOSI */
> >+                      MX93_PAD_GPIO_IO11__LPSPI3_SCK          0x3fe /* =
SPI3 CLK */
> >+              >;
> >+      };
> >+
> >+      pinctrl_epd_ctrl: epdctrlgrp {
> >+              fsl,pins =3D <
> >+                      MX93_PAD_GPIO_IO05__GPIO2_IO05          0x31e /* =
DC pin */
> >+                      MX93_PAD_GPIO_IO06__GPIO2_IO06          0x31e /* =
RESET pin */
> >+                      MX93_PAD_GPIO_IO26__GPIO2_IO26          0x31e /* =
BUSY pin */
> >+              >;
> >+      };
> >+};
> >+
> >+&lpspi3 {
> >+      #address-cells =3D <1>;
> >+      #size-cells =3D <0>;
>
> The above two properties are in imx93_91_common.dtsi lpspi3 node, no need=
 to
> duplicate them.
>
> Regards
> Peng
>
> >+      pinctrl-names =3D "default";
> >+      pinctrl-0 =3D <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> >+      cs-gpios =3D <&gpio2 8 GPIO_ACTIVE_LOW>;
> >+      fsl,spi-num-chipselects =3D <1>;
> >+      status =3D "okay";
> >+
> >+      display@0 {
> >+              compatible =3D "mayqueen,pixpaper";
> >+              reg =3D <0>;
> >+              spi-max-frequency =3D <5000000>;
> >+              reset-gpios =3D <&gpio2 6 GPIO_ACTIVE_HIGH>;
> >+              dc-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> >+              busy-gpios =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
> >+      };
> >+};
> >--
> >2.43.0
> >

Hi Peng,

Thank you for the review. I understand that #address-cells and #size-cells
are already defined in imx91_93_common.dtsi for the lpspi3 node.

However, these properties need to be present in the overlay file for proper
DTC compilation. When compiling a device tree overlay (.dtbo), the DTC
compiler cannot see the properties defined in the base DTB. Without these
properties in the overlay, the build generates warnings:

    Warning (reg_format): /fragment@1/__overlay__/display@0:reg: property h=
as
    invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1=
)

    Warning (avoid_default_addr_size): /fragment@1/__overlay__/display@0:
    Relying on default #address-cells value

This is a known limitation of overlay compilation, and other overlay files
in the kernel tree follow the same pattern. For example:
  - arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-lte.dtso (line 78-79)
  - arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtso (line 22-23)

These properties in the overlay don't conflict with the base dtb, they are
merged correctly at runtime. The duplication is necessary only for clean
compilation of the overlay, thanks a lot!

Regards,
Wig
