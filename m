Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B264611CC
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054687; cv=none; b=Fev3ggASfL3mHa9SQdj4nrQweXRfbloVuNKWu8yL8Gjmjis/g1yriPC4ilPKvmhEcGjmKBy7gi1uwH2BkN4CtO8wDj3pRki3MFv40MYLXIoEyfk+lzf8/K333EQtCqC9q2nnE2uSASZXqnU9HT8oYpHSgvrvSUSLxMZUSXnoFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054687; c=relaxed/simple;
	bh=sNaUGOPuwKSprBuDavzdl5xu7P8v1TvNRFYVBmUWsjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QC23IpRMg5RoCwiN7Q0E3Cw4TQZY18YWYaM4Mv592MMRZp83N/dTUz8yn/vtx7kAzoo3E4yNcPNAAtA1Wajnf1tDTdSWaEzFtPimIR9IDkVuwAdIEg7ba3P3ITPQetS8n2Wl2PaOyd/+lDtBIk8KFfT1eo5P5KmNt8Apd0IdHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue3cRcVA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue3cRcVA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so47027555e9.2
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054684; x=1789659484; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=Ue3cRcVAEZkQLPznQuTxLU9UlwT1Dz5Xi4CTqPL+Ufn/IwAYN30gnZ5ngfRWm96o2m
         kLOF0Ue7DahW//Tf19CdJ6fEhXTt/1XY+oeJwOt/yspAdcJ9v+GUH1ZVwrSX1K29X1pF
         3WsoKyML2rMTAn4XlF/bbnYYLxcaViHUllWkVTJ31hR9JaysRpR3lsIUNcR1mckYjJbQ
         FRP+jAPNuC3Yz+/d9NyHI8hQjNF3JGVyYtFDoyhFUUPA2gjImmQPWRxvQVArod2rKUsb
         zL0srdM/xTwZ2goMvCxpbOKKWuca7sQ9xQOgjMAwhXnTXenWFJ4NNmnHaefFkd4U9tIr
         VSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054684; x=1789659484;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=dTtAK7/QDp6pcCWTcNTvZwWrlrM++q1udljZnELIyUSKhu6M9Xs5usxtoCtVqGj15G
         f4P0K8GDTT/UdZlFt7rQxecFNg7D4x4K6CiZbSEY1Ik4/C+KVo2hB60aXzT12PRjcW/9
         7lJZ4wqLJ6lmM1kU2ds638trg5uTHCBHOmP944EINwEK/eagZWGiqsbWIooSik6Vzv6l
         VgTJF5J7aPIlIo5rxDy0pCUGuvusXhvEtt7QW0Xmn8snpDjmXJkPQxmjIfvD4ep+DlR7
         U/kWFFvBwbmMSmHRX3MbKDky2a5QXQPI4pKtNd5SOSUWFQLiOkGQt1mHuWssn2FcGLzX
         wmPA==
X-Forwarded-Encrypted: i=1; AKwUvBzM2hEly/2dtA51RzZOiBxRcmCU0NHqLLH6a7Vmc8lQbrGk2nbrb6kVc/BVfM+QxdhIoHo=@lists.linux.dev
X-Gm-Message-State: AFuF++ma0U2eCordRpMNhTtcRP/vJU0UQLfdRIo+pBgC1+fcM5HkIkdL
	wL7GkLhPZTLZIczepqM3ChEcCTHcvAt8lZakKYFrnIsnMXbuUgxRHxuqOZS1WUfY
X-Gm-Gg: AYBFou37BFjVoNFtch/SFM68oEiKzUB8JBcMO8mEvaBPkd1vvjrc57BIEj5SzfUNA6N
	xUPWkvgycWNhZtJmSs9UOUOMS7R7fDaGA20AGvLkic5CLE5euUbP5ueUtrR2XHOpL45MPY2p7MM
	oiGBhGqPhDXBZAiRwL0wIDIjAk05SM3h9uX6piweXKuPpAa4tPkoxBQrTt/fNbWASM2ySbn9Cxx
	PTjZJa7f4a55i0DsD+JE5zdlya26O+nX9KS/NVapp9oMIKfquVFqgUvw4OzA1r18chEKxD8X/aQ
	8btqnXvCrIdv9awSA21wa91FmI1/vZrCDi8ntQeSTvwZtqV+eCMIwGcSyfUfRU5bUdvXblmQ6iU
	sPTrKG/knlTbnaRLGqZzETLtMmAy/Ib5DxvJlCO3tSf2Fghp/SjfihwaHdAeBgDFTFzyiyzB4+U
	05cAD6Pk3iXcNeOK3EiSzzNrLBtn64YLxYQdpfK84iMTcP2wrMpFxoCsN6MAFWqklPv471dKN9d
	yTI9YAJBT3FCSRzzwrbRS4GR+09GMcb4HAHc6wMu13TFOu0XIt4kb/bI3KO+BE0IjwclDB6Pur0
	YT5rR0Uk
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr421096065e9.24.1789054683558;
        Thu, 10 Sep 2026 08:38:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:02 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/6] arm64: dts: freescale: Add Verdin iMX8M OV5640 and
 Verdin iMX8MP M7 support
Date: Thu, 10 Sep 2026 17:37:56 +0200
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTOomoC/x2NMQrDMAwAvxI0V6CKYJx+pXQQttJosBNkCCkhf
 4/pcMMtdyc0ddMGr+EE192arbXL8zFAWqR+FS13ByYONFHEXT1bRStHLBsunSRFXdBV8g8D5RC
 FZ+KRoUc219mO/+D9ua4b/aa3anAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Describe the Cortex-M7 remote processor and its RPMsg memory regions for
Verdin iMX8M Plus, add shared OV5640 camera overlays for Verdin iMX8M
Mini and Verdin iMX8M Plus, and support a second camera through the
Verdin iMX8M Plus Mezzanine.

It applies on top of the recently submitted Verdin iMX8M Plus overlay
series:
https://lore.kernel.org/all/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com/

Add the Verdin board description and RPMsg reserved-memory regions,
following the Verdin iMX8M Mini description. A small overlay optionally
reserves Verdin UART_4 for Cortex-M7 firmware.

The camera patches are the follow-up promised when the OV5640 patches
were removed from v2 of the Verdin iMX8M Mini overlay series:
https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

Verdin iMX8M Mini and Verdin iMX8M Plus can use the same 24-pin camera
connector on the Verdin Development Board, Dahlia and Mallow carrier
boards. The connector's sideband signals are routed to different GPIO
controllers, however, and the two SoCs use different capture pipelines.
Describing these details directly in an accessory overlay would require
a separate camera overlay for each SoM and carrier combination.

Following feedback on the Verdin iMX8M Mini series, introduce a binding
for the connector's sideband GPIO nexus. Add connector mappings to the
carrier descriptions and stable labels for the SoM-specific CSI media
nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
and all three carrier boards.

The binding intentionally covers only the connector's GPIO signals.
MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
existing bindings and are connected through stable labels in the Verdin
device trees.

The unsuffixed camera overlay describes the current camera module with
its 27 MHz oscillator. A separate overlay supports the legacy module
with its 24 MHz oscillator.

The Verdin iMX8M Plus Mezzanine exposes the SoC's second MIPI CSI-2
interface through another 24-pin camera connector. Its camera control
signals can be routed through either the default or alternate GPIO
jumper positions. Reuse the connector nexus for both configurations so
that they share one camera and media-pipeline description. Provide 27
MHz and 24 MHz variants for each jumper configuration.

The default GPIO routing is intended for a single camera because it
shares control signals with the native CSI_1 connector. The alternate
routing permits native and mezzanine cameras to be used together, but
conflicts with the Atmel MXT touchscreen GPIO.

The shared 27 MHz overlay was run-tested on Verdin iMX8M Mini and Verdin
iMX8M Plus. Both shared camera overlays were compiled, applied and
schema-validated with the WiFi and non-WiFi variants of all three
supported carrier boards on both SoCs. All mezzanine overlays were also
tested both standalone and in the dual camera use case on the iMX8MP.

When fw_devlink is enforcing probe ordering, camera probing depends on
the GPIO nexus support from [1]. Without it, fw_devlink can treat the
connector nexus itself as the supplier of the camera regulator instead
of following gpio-map to the underlying GPIO controller. This can leave
the regulator and camera waiting, for example:

  i2c 2-003c: deferred probe pending: i2c: supplier regulator-camera not ready

[1] https://lore.kernel.org/all/20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (6):
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 32 ++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 +-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++
 .../dts/freescale/imx8mp-verdin-uart4-mcu.dtso     | 14 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 40 +++++++++-
 19 files changed, 588 insertions(+), 2 deletions(-)
---
base-commit: b0d182093ef1e0693db6e40f576c6b6f5a52aead
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

