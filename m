Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586611;
	b=JcltDyMauNpwupsbRuA4WuFqHXAJbEE+3QABOcrt2rA6xR5I5U26MCiN0CGz1Nj3v/nf
	 e3QGe0Nzj20vNIvJPFVzjuwkL8egyvHj7BgShDTonD4jAKDBFMq8xfjy5FRUkHaOehWnk
	 zF9e1Wl9CjC5x5KbeAd1Obxx+sMW9uFGiOzxnKmCU2Xu1neq/hqQ9QwwUT40WoT8zWqkP
	 9ZKHD1JRn7yHpzaV1siAzkbu/nYFTBe0yfYwVXM/pLMAX9wr30fAbGjBOiLAk3jEEyvWf
	 WsvTw3kKYPi9BpZOC7KrtOCCetHuXjT5pzXcttm34mENcNoQHL0S7muiDgrll549NHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+kZRE2fV4+maK67LLBkbZIEaFidBfTZvwC4U00nmb6k=;
	b=SuWOAw9GnR6gx0bptYCVWrPzuSLl94PTzxOws8YAPZZVgMd/suACHoMocJnzL+qQSPi1
	 LQJ9P62grC7BUTFNukoefqvQbCkmQXBSGiFz4hwzXp6RcZGMu1irBpuH9O8gv9H0dnX4U
	 MH2nqA57bJC7gw+EyFaBwFCgmXJ5uzaKwIuJQwwYvtdLvURjgDw+VCV6t2DWD+pQt6mC9
	 bFO+v78/XhTUYZFcX7iiZzovkHkq23F0pOHH9oPAtxlo/bA4vnUa0MmPcHOO3O8XKMhgi
	 Vqbk1kFNQAVYqRB0V/Z0+9vQm/AZcOS7crLm/C09gMEpdgWWQmtSyx+Z3DX9AdRyJbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXTl1Lw+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2A606AE01;
	Fri, 13 Nov 2026 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXTl1Lw+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22BA1F000C4;
	Fri, 13 Nov 2026 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586611;
	bh=+kZRE2fV4+maK67LLBkbZIEaFidBfTZvwC4U00nmb6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZXTl1Lw+ZJn9KvKJCMoFTx9n2YfqByZ2mFd+JXwY9s+WPnarbh4uKrw1xtrF9krm1
	 Ll+YSm1JtZ5mWFoYTYEmNI34db9cWQEwYwQj2KHMxkocEc955y8iOdKHvmBJ05rYmv
	 Vcod+Orcc420voN4xB2abO03q2H9nPMiVuQfGRRkV6YpToxg3MQySDAJyKt03oV/zf
	 70GInAuxV496wni64jWu7pQFEl4A6SQ80vnE4guKkiImssjBvW8fQNYLtgSqVr+mGq
	 BmHlm+O0gX52BQQJtidxeDDr6kLoWyrIvnWQxtcCHkInVtnE8sie958WJ3J7N1IV1S
	 V7n7hEnpmNS3w==
Message-ID: <sashiko-outbox-213180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: imx95-phyflex-libra-rdk: Add
 overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:16:50 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: imx95-phyflex-libra-rdk: missing OF graph link in
  BT overlay
--

commit 924f1473173fca2dbc62cd020eeba54504832201
Author: Benjamin Hahn <B.Hahn@phytec.de>

arm64: dts: imx95-phyflex-libra-rdk: Add overlays

This commit adds devicetree overlays for the SoM temperature sensors and
for M.2 Key-E Wi-Fi/Bluetooth cards using the nxp,88w8987-bt binding on
the phyFLEX-i.MX 95 Libra RDK.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-blueto=
oth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bl=
uetooth-88w8987.dtso
> new file mode 100644
> index 0000000000000..1601e04b3940f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w=
8987.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&lpuart8 {
> +	bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +		fw-init-baudrate =3D <115200>;
> +	};
> +};

[Severity: Medium]
Does this overlay also need OF graph endpoints linking lpuart8 and
port@3 of m2-key-e-connector?

In imx95-phyflex-libra-rdk.dts, m2-key-e-connector uses
compatible =3D "pcie-m2-e-connector" and claims w-disable2-gpios.  When
CONFIG_POWER_SEQUENCING_PCIE_M2 is enabled, pwrseq_pcie_m2_probe()
requests w-disable2-gpios with GPIOD_OUT_HIGH, holding the active-low
W_nDISABLE2 line asserted until a consumer enables the "uart" power
sequencer target.

In drivers/bluetooth/btnxpuart.c, nxp_serdev_probe() checks
nxp_m2_connector_is_available() and calls pwrseq_get(..., "uart"), both
of which require an OF graph link between the UART controller and the
M.2 connector; without it, W_nDISABLE2 remains asserted and the M.2
Bluetooth radio stays disabled.  Adding the OF graph endpoints in this
overlay rather than the base DTB also keeps lpuart8 exposed as a normal
TTY device when the Bluetooth overlay is not applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-wip-bhahn-=
imx95_upstreaming-v2-0-3ef58af5e689@phytec.de?part=3D3
