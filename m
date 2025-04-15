Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6E2192E4
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737663; cv=none; b=OyulkaeMbhvrECkBoExItY96zbMY1/u5xPgwpuY/lLzejFS6CZ8QP8kvA46mc15P8BrVCeugbyeDFhlITqG9SIENM9T/G86m89+VtHuIWs8DJw7VH6IZvS5zAeY6mdSTMgA604fSMxUwSKetSUeJp2kq9JYRM0Dy/HkAWB5iVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737663; c=relaxed/simple;
	bh=0fGCIqu/Bwscnu03galgqtMBYdQgXx11Gd/hfh74P7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iGqeWd0GuRv4SDoXIxUpEOWQlo9+s3rpgoi6WUBpz8TnQF+qvA6BVmzT4CscbiAvmAVjLd+PHndAVe6nrmSdIaz/mUS/zL193Cz5FjLgtp36RgLNmZpjBoHIFzGz34LsbwSIKv1BjHR/mIW1JJ0wZD/K+S0/GR4lNOI3jsBb66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7SNeooM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7SNeooM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39129fc51f8so5107625f8f.0
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737660; x=1745342460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=a7SNeooMmQfHlLE7ooAmZyaetQN+TfGGhxNmAy6sfprm76YAzzQOSQpY8YD27ItMMC
         duhdo+tNRW/kp3qxgXd6KIgiYT4BfRjvVFIwtaRI3GmROG4TXzHd1xPqsOL10J/WtDQ5
         QKdnNQVj5285q1AW009c8wUJTlXZO75PYB4BzbBE5r2Htj/IzOWpRO9MXyJhebkiBpEo
         1CuBzT2sz2chqRfQZwrZxE/Px3Y4+T0xNKzsKbczWBdX+4ANhqQ/u+0441DRRzojTt2U
         rk4qO1uAIAAIa8/aB3BE4TBnJVz6e6Lo+76dg8FH3V83K/WlnJ2+Uy8V0V2MtlQbiCtY
         fLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737660; x=1745342460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=T3syEGzCc1tdtXI+Fg/aLXupIQnPdPiv7/zzt+PlN95uCPeiJfWJqhmRg270nXY0vb
         cCCxUwTB4qlcOlpgK53SoSiid/dhgLUs1+RikhvDDtvDjrjPUZxijKN5ERCkFBEYPa82
         bGKOfjNKY/AD9IjObfT0KxzctWx+VvWev82H4guaEG3eONADOGaHWFN+CgQX9SLPSGr2
         rryrU72taXiZif6ik3FS4GRfpaKRlQULrW+PQAhfOzt8fZlcBnERByRzoIwDH8hNCxhV
         jchHZciCCM3LFjuwd6jGCVaClggPzyKZod6zLUwdwl+srhKdnVWoYbiJbJiAZKVTHZDj
         uGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDG0D63EUrwE5Z97DTspnNrCSNW0rFZBDwBeWjGPiGDZdpU6qjbHaMGhw6gR+wRQY4Hno=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD5FAPVELqlIwtWxc6++4D+yvc3HR1LwlwrV2SKyLKOT1TQGDT
	vrpnY7Wp6fl0XyzkNgmLBO+WNZn13LDzYyZm5+XPip8XdtO/9M7F
X-Gm-Gg: ASbGncsv6DIKx1LJB97VMqqGOlvz2wAdcjSoyCYsi5XrRe4jL0SvegdbVV921FQ8QGM
	6FfSYEBQxi8Uxt5OdKitJsCJg5Z49b8rQw+E8RaGPf6bblpc7HPxNvbdBO3p/wLXHN5qTkwsOvi
	k++sfG7YneyrA7BOoYM2ESfCcuxnXYM6NRWMaHQvjMon8t1IhzF5Q9rP31XzPS0/JblilFXAvOH
	/+VxJBptARMmEMFobWmU17i4Eg//3+regkivjy05JHeIL2Y+QLLA4y+qdXrp3FfeuHY9I0zsb0l
	PF3+myGP3qxm7JQVucGI4fG5khhNMYEmszos8PXJQvZkSIrn7jaFPoNzsYwUMs0bqI+Ug+RjZq1
	/xug=
X-Google-Smtp-Source: AGHT+IFveTd1X/FP8Y+9djpXDnJifllwkbUHPK6roLTIdhPqtEzLH3suojD3NXCb7qJOyhKvVVigCg==
X-Received: by 2002:a5d:5985:0:b0:39e:cbd2:986b with SMTP id ffacd0b85a97d-39ee2729edcmr254216f8f.7.1744737659862;
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:13 -0400
Message-Id: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v6:
* drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
help with making the DTS more readable but if it makes it look worse
then there's no point in keeping it.
* use consumer ID as first AC cell and consumer type as the second cell.
Better to go with a format that more people are used to as long as it
still makes sense.
* pick up Rob's R-b
* link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/

Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 251 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

