Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A803EDE6E
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855066; cv=none; b=h84wGRsQmv8XP0MDSNxtn5z1umIKX5rraDArPUXEIJDYoct2rtTS8pE5fmttX955P1zTXLN2kj3IwapJqelgeBa5x1yzyb3ymVBQkWmqdZ2KOetQC/YWPipW3B9sH/9RfS02kAYi2ZEcNrOwO700MC0I6RLU1Lh006dK1zwvxjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855066; c=relaxed/simple;
	bh=B7/Zzp8ZfXWYXqXuCHbo/MXPQqzP8n4gsFayDXYJig4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EI/qMSc5VInhrNAflPpDCZpW56hYS3XOCdAQ7eA+KTK9g5122sakzcb3WKkqsKzc5qYEZ4GvNG3Bcu2nAR2n/HVFQocsmVTRyxVSXurqdxXx5Q/KCU7lC7nvgFB7ce4IrNPThmsE5UNEfGmkUJAWeQXrIUC7DtPnuIUeUtKHyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbn7pBaL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbn7pBaL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so5684915f8f.2
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855055; x=1791459855; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qeEcgplDhumVXCH8BSWxsAV7lDTMA49CGGu0SDBqCI=;
        b=kbn7pBaLVZhY/ApXnusJBmSxeJeFF34q3HzPj+t/3Zt8k9Z5obFgrAECZnYbv0NJSS
         wNBIU7a4eKoH25kSiFFW2fGXWly1mQV9Goro+VebkO9xo2Xl0pxVk9XpN7qUjH08N+A1
         BvRAj8l/JZda8+HZYs/DUFdwzvZ0dLBvSg5toEnpkrc9pKzfFyI9UaFFM87g+GHkOzuA
         7htjGfBVRaja+QwM1uT6KiZf0qif5YN1sikj/LeH+q38jaYLdS/9QYzVMeoZ+ZD8XEwJ
         TH0vurrK1fJRalEm9TxXNOUdHco4xIkUs2ElreCHyJC26TsPd0kcbfGk16kGYpprBp0y
         kTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855055; x=1791459855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5qeEcgplDhumVXCH8BSWxsAV7lDTMA49CGGu0SDBqCI=;
        b=RdC0CvzEoPO2nq9crql2piKeiBdDO5H4RUed8ZgQd77FKQCe0Bxu/+GB0T4++l19MV
         iRQ3v4Wx8G7awkEIYzdHjFtTAVxWG1zsrdZY3s76VnqQgCzhtBoqtcg7QShk2zsd/KIu
         v2p1z4ElJ1EI4ZvHAns6NyPGWWj1kGxAD2tbVIaNN4ovosFdusmVgIadhEml7gLsFNxH
         C5KAt4TDNQ9238tRWcWA1fQSU1X929CeLVY18IGsCOFV3fxmg13hQG69dPkFKOpXgpWd
         vSSgwighWLslYdH2Y91S48hp74iAoNTYAv5zl4KOdIij711LnkYNuoCp6MGgikQRNDbI
         8wCg==
X-Forwarded-Encrypted: i=1; AKwUvBxxr4tILZjqAoK7TjkByKTKFPaUaLuFMlPE4j2orCBBeFBUdupgGOx4HbkZjZAOGkKkRoE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9MnRdQ5FyRpaTvSM7h6uDEteOMOPsaFfIA61ATaPFFnTjbZkC
	5vaWiqYBKPVgu/qFeCYG+HijmkmfHgxb8X+k72MvECqyu0+HU+j1EKtB
X-Gm-Gg: AYBFou13JXiE0eCjzk+Xv4ukZ2Sk1MT7YTn1PT5FOO6u6lqhhc3cCmGv4BsBgSd3K9J
	zD8w8jc3+E4PMBXi7fzr4NchsNCd+MYndCbvNHlhlUABSKVihtLqMM6UWBxuPLXymJ75yCwBNIh
	mSljV24Oqo/99Uus8NNyQ0VkwC7/iAQ0lkfEk/gqwfo9/Ne8EH0C2Byd2A1nkJHr8FSWb9Giv1a
	PUOIjIjGDJWKe/b21JcZheXUQvvbbuBcvFolhzM4vSQZ0nmCU1hspk4RfnOIpd83WAkYENxGes5
	Yig01kjVaq1+EmDrhysvyubCARoSvhh8R5f1zHgmXTvYbdFEYgcWUSD1J+/z3ueRSdWhs9+Xkge
	iN9FF8ALeqBZKG8STqqtbrea9RUiizc/324xZ+vKka+pD4uQc3wgGiy9z3fsnP+FHGMuMxV9YyS
	kr0lZA4qcrrNqrafDHml8U2qy5/UmVD0NI1ojdv67LdxXv6c9UlyVxtu3VCdmC8VnhsmrWxuntI
	hLPWllg/zoxGque3ZimxJbgswbzQhgGc2e5dahJ/zTTdzv+f8ITLOrH23BCtchXfm0ajtpZBA==
X-Received: by 2002:a05:6000:298e:10b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48b02a1e30dmr6435138f8f.41.1790855055140;
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:14 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add Verdin iMX8M OV5640 and
 Verdin iMX8MP M7 support
Date: Thu, 01 Oct 2026 13:44:08 +0200
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhHvmoC/4WNMQ6DMBAEv4KuzkXGIIRT5R8RhWMf4QoDOkeWE
 eLvcVD6FFvMFjM7RBKmCLdqB6HEkZe5gL5U4CY7vwjZFwatdKeM6jGReJ6RQ+7DilOZs4HEopD
 1G3bKd73Vo9KthiJZhUbOZ+AxFJ44vhfZzl6qv+9PXat/6lSjwsaZpjXk/NOM92KynvLVLQGG4
 zg+Vl/XTc4AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
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
Changes in v2:
- dt-bindings: Drop the unrelated GPIO controller node from the example
- dt-bindings: Describe the physical connector (24-pin, 0.5 mm pitch
  FFC/FPC) shared by Toradex carrier boards, following the discussion
  on the compatible name
- Keep the toradex,camera-connector compatible, the all-ones
  gpio-map-mask and the absence of gpio-controller
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com

---
Ernest Van Hoecke (6):
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 32 +++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 +++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 ++-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 +++++++++++++++++++++
 .../dts/freescale/imx8mp-verdin-uart4-mcu.dtso     | 14 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 40 ++++++++++-
 19 files changed, 583 insertions(+), 2 deletions(-)
---
base-commit: dc1e94bfdd3530e2fa75ae8fecaf8edb64813c3a
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

