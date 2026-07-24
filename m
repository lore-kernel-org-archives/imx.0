Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF637F315
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910283; cv=none; b=FCam2Bi7K0HwrCfR79uvTFiNFLGeP2rIU4jcbJ5wSz3eXUhyS3NdygVkHGma4+N/kd2+cFwqkKl4S/YYkH2nQMYBonAoSMRUHnC8gQv+7aWkT+5g/ovB9kPdPOsDJDHNa5ZYLwhMtccY1mEwWgwfRKjmz/ft0KGbPmwjz739/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910283; c=relaxed/simple;
	bh=W4GflG547kCGGXAuWVfH79/VJBEGvcleAsQc8NOt4fQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uzpAVYPFeiYTBVFaMSMj+IzYNYa1+Kb8q1XhRE4xI85e51ZiA+LU1zsK+FFGzIS9RyZAap/kQIJSaCrSlC8Fz7WX5gRbOkddToQ4X37tZt1LTmvbEubqF8r3ryYNekdbxYoxnipxNPlW6KxjF4ExPvygCz/vFF2ur/yVuOWp0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIbcF/bg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIbcF/bg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47640541585so436685f8f.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910279; x=1785515079; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=CIbcF/bgj56qHRLVHJjjWHm+gpzkPEG5J660m5/TRw8mdIDQT3ut2trfOY4GSJzMGf
         j7xo8CxDYdTxr0zx4WEc2flmz45kbrb/9iZYRiLq4BEnxDEUr5Y9NVNRMWKsQIG11Pfp
         noFjeH51TIVF5XdrWLM8nGWxggbewhnCLhK/UgNP/rbNriuCsQZ7VQC7v2bf4lXE0sQ0
         O/LwiY0rgChyOT6YCiL1/N+LAV07B9Z5sXRWmbmOkUFSDoF64FTTo32J4t7G0+YhX1+0
         TTT5XojvkGepufjshxNkyNTuZGYOm8IDOz/GcVRT5V+E1tApN2+JbPUjTFQTlmY5I2GS
         ooDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910279; x=1785515079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWEo1m5U7JSWIhc+bgC37Go+1MRYNAMl/oywARAfabs=;
        b=j54NUqhamuwCOQ34GWV+vE8h+2WDf8jXfclOHrQTfsj4bIt95QYTIFidC75ZwB1KBO
         xkaSeI1mjmxGiz62Gij0BJxMTTNFOLCpsN3SEVqrmN1DuovxBPAIdHFdww291sgUTwdD
         k55Orj/BWnSKdqJIFSTLwie5rUFWMuOiAsgOSUqpI9GPoVhlkceE0nOqTV8Ok76o4I06
         tgEZZcoQPTjGgGcO6ITpShrwsBvD1TZCtX86bJ9Q/9rvO+IOqPpa+wEvngVEXeZLj+la
         58oYU71Es+ws3tf/DUA/tuHscp4Ch+3axjIpgqcCahudXHYaf6ETxbMU8/j6v1eDqdlq
         ds9Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro4E254QEYoqzeJPXU+hRbI9f9rgK7tQICMxwJ+f2gjJXem7ot76jjJXi4jJTLT1iw7AwI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMkXM9Mc+de8JfjfrLdjjD6TFXjPkh95WphWCmZ7eVUwWNS7yv
	72ZgBN6CCmrrbJpDsPv10RIh02Xzl7ZtSl+cNtDF2WeXbSRxwz1d4CB3
X-Gm-Gg: AR+sD12r+NDDdGfbrylNRaMtdvMFjr82gB+2oQSSjwQjFdBxSzLkXtq/u+R6TYgj/kR
	YIsoMdPejPuUJVvbAa2MrFV+EmPhzry/+qnoNKTspEx094osWbz1hAbJ6nknNKHMYUjQ1RSNdAI
	XLv1qG/CJrIsoiMtznqgAPDuEaUvsYoH+C94KaOLqtqlXpJTg0yCQ7YZ+m1e9MUmvyuVaZlthtz
	M/4/jCMj33MTWSs7yQwgme7ccAxRIpzD3z32PSgHMjZAAwEs2hxdID1rmtsI9OKjQfeVKw224sd
	kokq0C5PDCjKOhjLoDkL6tp7krElr1q7PPVLZn76FxlhHQhf4sv3MEwhI5gOF9cPxQtr1/m6qSi
	m1zcItxpj4w8II/HqJDiVIOqLymyzvaGwStdhzUQ1VHOTklvofr5LFX1NLaSguyjHlj/qcTvxwh
	c/1B4DTd47ggi1jTyFk0cw1lffcKNJAiY98h+FV9UU47zxO16ICz6jNjC3CirBNbxi5WPuilSNK
	31tYK2f9QO3iM0n
X-Received: by 2002:a05:6000:4802:b0:47f:763e:e03a with SMTP id ffacd0b85a97d-47f8dc7a25fmr9546533f8f.34.1784910279327;
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] arm64: dts: freescale: Add Verdin iMX8M Mini
 overlays
Date: Fri, 24 Jul 2026 18:24:26 +0200
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqRY2oC/3WNQQ7CIBBFr9LM2jFAkRpXvYfpgsJoZ0Ex0JCap
 ncXG7cu30v++xtkSkwZbs0GiQpnjnMFdWrATXZ+ErKvDEooIzrRYZFYKHmekcN6DQH9MsaMtlV
 GauOMchrq+JXowesRvg+VJ85LTO/jp8iv/SVl+y9ZtUBtnTetH/VF6L4WrKf17GKAYd/3D50fR
 OC+AAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Mini
SoM. The overlays cover audio configuration, display adapters, DSI
displays, and Cortex-M4F integration.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
  Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Cortex-M4F remoteproc support

Cortex-M4F support is split between the SoM description and an optional
UART_4 overlay. The SoM dtsi describes the remote processor and RPMsg
reserved-memory regions, while the overlay reserves Verdin UART_4 for
Cortex-M4F firmware use.

The Makefile entries build the standalone overlays as DTBOs, add
ready-to-use composed DTBs for selected carrier board and accessory
combinations, and add representative composed DTBs for build-time
coverage.

As discussed in v1, the overlays for the OV5640 cameras will follow
later and use the partial connectors model to specify the Verdin CSI
connector.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Dropped the OV5640 overlays, they will be added by a later series
- Link to v1: https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

---
Ernest Van Hoecke (7):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

 arch/arm64/boot/dts/freescale/Makefile             |  35 ++++++
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |  88 ++++++++++++++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |  14 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  33 ++++++
 8 files changed, 546 insertions(+)
---
base-commit: 4d0d3a3d1993a41b2bf8d28aa6c6071fa1a3bff7
change-id: 20260707-v1-verdin-imx8mm-dtbos-a326146c62c4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

