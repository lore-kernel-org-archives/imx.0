Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199588;
	b=kqDQYfD/7YDrj0zKf3jz19A/rZ5KUw7gCWBdt8nrZ0BckkxsB42gD6Z9FEHidwEDhNTU
	 IKYlu2oAWKjSzkArHUyAE25RcESk6CwzbvDiF8t9uTE675ZwwDZSW6ZRpvk3Y8JcWP1vY
	 QZQJ9Pt+GSpNFUb+ylpTYkfZ43jraiRIfsbNyvm4T414apsndLPKB1+8opNiAdCYgKbqE
	 DhEQM+lysM3iCwBTeXTbCfhP/jD7DILdyc/AxniqbgYX2KdvNt2qRn7ko7ZezzTE+U8vw
	 XHAOchwtA/UdcXUp5yCET0hWw/qM8XodNFIbH1RyHNaLxXWh636ESkAV9DiogQu1BRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
	b=p3n14A3wE9rl28CxApkQgZXnAeM9NnBP04J/0m7AsOV8Nse8BiDrxKBGyXYhh/3qR/p2
	 w0hcFYPFlgkhLSAo1Y49MhzKZZJl4DR1AqQPWEYGg9se1Tu5tgQJKCXStMlXD+D0j6VMj
	 WjMgC69yNJSeQhc/Uf09f9xw/S+l0ydYem2QTCxGm5MIC6TmSpz2IQBePCrZ4RaNWUXNV
	 BdrJYdOIrYeKFvfyqucM+PbiCbs8+dMpiTkjTS3SeBvqhf1OtLY66uWZ8tndFsapk3zeH
	 3bWHydHhxvJ/XyVywuZCHtjKpCkgq/Q0ZaK95kHAhyUTtKWgLykA6gOUfk0vbt5+Qag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHvHyOsF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928E960A2606
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928E960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHvHyOsF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1535331f8f.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199585; x=1795804385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=XHvHyOsF6G+Mg5KikKCOKc27VMyNGjcRaEd3ILNSvZ0Ev+6X9MyVowK1bFfwkzvlfD
         gx/9QjPxIt4G/VYici9RMX/92T0UDYuVpb7Sl+5d5i2us1XdDbx9Nqvr+qjQ0uGtEppS
         s8fbgKLVTFYOwruyUcdSPozwyCno5PStWoupQKd+PS/u3/GRwnBF5LhNMd+pgg3KibMW
         hHuPo6EwDj73arr98XpsFgQS2OMXOaO0IofaurI8iz/Ud3IxX+yhtb/eUzLZ1QplvxmP
         seFYvuEB/YQ3h2sjuilgaCEtBTM1Xr77nN3bdQbgHAqurG+DLrQppx00uGs8hZt5kLxG
         tz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199585; x=1795804385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=iAl0V/76HTGhh/bfJwfI9HfNxOCdpEUBOz7zDqaotdYzYFo/zxq4Qvu8N5juzi9Zef
         //P5KZISnMhn9rUHbkEGKVQe/ALXQrc1QtyQBb0vlvaOUipBn7vaw1GXXfFbW70e3aAj
         UwGxCdHuWvDJAilmeZLfgNpXsELl9aNMYFokd+pA6SkAFTfBAnCayxxdecN6u9DzwoXm
         26fbxPHRUQe7D/3Q9ak1srj4mYZ0Rw3AAv0xdZo4kswHwnGkey+/X6liXbxRyyz2ynfz
         FrDS3ibHvku2AP34n7Xv3XjSsR+neEzCOl9C897Lk1DIbaZ2elXvdcEhDzD3xo2phtbc
         DLug==
X-Forwarded-Encrypted: i=1; AL+hErGeWwXV3JJOcgCJsG+RDJYPH0vH1U/Yo35H0lWjVYywGdSFGsb2++e/yG/9xNapNoICMe0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8uR946l7qUFHpeJIaAetsK0szbKkXar3R/6C2hz2PWQYUyO2cw
	7ucnka88+HFI54UwO9pmtNYKbhE5agecKxSd5ugMe3hXhcRYa6CRgxIh
X-Gm-Gg: AYBFou1TDVLwYcGtCzmpI9UeiigR8ih66fMsYgXCKjtXFsAj5xVbpakKOtwbLUUN9UI
	OCivGU4cwtori/+CSnp/xp3cC1kYKnpTtTUhZfhxh7xX/tP42l3Kxq5zr+I8U9dIerjlA5Zk25K
	W1A0UjKV3lKMYP6UOi/lge3/+0q+PUG6g8T0Hu/933gGME2TrxZTidVgU1HI5f/PkL6bli8tf5h
	oP4RPQ1dzuPL82UkYsiP3oT3tlu5TZK/l7pdhB9+XtEzkbTx1QDhWdOcQ0jp5zsOU5FH8ixwcoc
	+3HWgCTiF3ASJNtKlCr7afN2mpe/rOt0n8pZGvcnPPQpJdKMXVf7bguVRey8jrEC/8UOew7jmYD
	mwh7SNwlqtqat51OF9KdMxhC5GypkoRKkw5nLlj+D7vEuA9EmxQZheddYvQKN+nH/HEi47HsHVN
	yJM9Tnm3/jRfruSob7iR5zn7oerTHPyvs1uzGi16ob/mLSuW+Kjg4b1P05UPCXQR30FatwnNj1V
	DkvyIuQWeam5a0catuAsdrKlmTPOZje+hN+Fc3iTCu1UJ8HOcVhxClcAMfYoDAXOuvvywPV0502
	cq5TdHrLnLffvsWrELaYDmNY9eoIA+k5dbMHWrHJ33Bc6lD5imHIHPwrIxZtIzBW8uVX9JBFwOb
	j6og95BzibGGXcPV3hIgVCjdbjGiUb/F55v59ni2abSOs2Ng=
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr97174585e9.4.1795199584794;
        Fri, 20 Nov 2026 10:33:04 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:27 +0100
Message-ID: <cover.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch corrects the Symphony resource table address. The second
moves the M33 reserved memory and remoteproc configuration into a common
include shared by both modules. The third adds the M33 overlays and
combined DTBs, and moves the common include from the module DTSI files to
the overlays. M33 memory is then reserved and remoteproc and MU1 are
enabled only in the M33 variants. The overlays also reserve the firmware's
peripherals and disable dependent devices.

Changes in v4:
- Add a separate fix for the Symphony resource table address, changing
  it from 0x2021f000 to 0x2021e000 to match the firmware.
- Move all M33 reserved memory from both carrier DTS files into the
  common include, using generic memory@ node names.
- Move memory-region-names into the common configuration extraction
  patch and include the common file from both module DTSI files.
- Let the overlays provide the M33 memory reservations as well as the
  remoteproc configuration by removing both module-level includes.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Stefano Radaelli (3):
  arm64: dts: freescale: imx93-var-som: Fix resource table address
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 ++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 33 +---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 ----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 ++++++++++++++
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 7 files changed, 180 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

