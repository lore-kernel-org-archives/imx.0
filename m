Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6784DEC16
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408730; cv=none; b=pMYinVBumKNQw3uX3XjnM82wmg+nztNsQQpSstkuHEwOhKwFWNqrRETX3Ko9R/g9QD3NYcs6UD2JvOVctR1B3efIgXynI24VN47NdNRvgTMpRxBUwY+oR4rfg0UJUwzQ1nWEmC+6KvJrbPR9A5pYkvZ4pb3f5ud7EIsFYXT8k0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408730; c=relaxed/simple;
	bh=zFQNhdUL4WPcv9nvazigfdpHJRQ5vHZMaw6uqlFCKZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIIQkPJ1qVFDUeZfd+TvKNxFP+N8dMsZwhlkZN7nbIIxkIs3rMtvDodeI/eEMjgo24A0hVEATDBl+KV8UUMaloT+9IeCpdooRrlH4v4d0dPqDR2AUfpctNWsfSrKgY4FLVCbrMZ9swhndkfgc3r3dGdbiB7B56OLJJWISp4Z14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbHaSgfG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbHaSgfG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso10676825e9.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=rbHaSgfGto7H0zWbgWLJ1x86QCYv4VhfLMo8WjgjKekK9ok19m0TqEu8sa8L+EtcKp
         VK1f5G1XBvxO8Buic1FJI12UFnHGd+LS8KDqNMjcUZ8gd4rNcBXIXs4F58iNKaCzeTP8
         OuNcMUUfBs2/UDLNG9yF4A2QHXZBC9A8/il7y9zI9zVTnAN9x7Qd1UE/kXqvoTBW4FOp
         SgTetIOFlYzri00j7anyYnlJDk1h69NkDEegFkRAF+1bxWcpfe4fhEIRDHaiKXuH5sVe
         5iZleqXBQ48N+y8xESqiyVtaD20OrMBK/YH/CdX2SNgKcu6WAiYFy5nTsCTeHSz+fvZJ
         GAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJYLGc5QU3lpfwnSQm38v3uKx0dsa52E0YaGaSh3dSo=;
        b=OxIQ5+gcQbMoUp4IjOyL6/q+oSXssQuvSnCbfoHbQON6YxwDDA+VbaljpPL5qMbYao
         WdPrv+vIBJZp6TB0Q/1SywO4jmiQd6LvMmdEw9MAHFpLNQFOXvvVw0zlSu5XRaekSp/V
         CtpM2gnDQFOZ2qsHI5ThAZ36NVW3UETPOm9fWd8i8Ajwqh3DL33QGNBgS2fIuZHqovO1
         WEqZ/C/fdAc4AWpcWUspYw5VXDJlbU1SiJdjjZ4sCEIJJzaLUwoG5H5YdI1+4iOdKgED
         LofHb0iYcTZhYaJKfOizrkZqL2LSgLm2qKR0TzjYsvWpMQqOL2kjKid0dxvSZClzZjna
         W54g==
X-Forwarded-Encrypted: i=1; AKwUvBx4XCIwJZ/3jS4MTqYapVVixtKjVRUXmHCeJd5UOAnxF5kRf/vuL4OtWAsCm0r2v8eUOF8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLtQyT9UywfSWl/tfvcx2UUmCLy08/yDSg7pntPMZWsLK59VH9f
	qjLGa0n87FJ+6iVcHW1dDJ2dVjf3sMuyvk0sVRGhMjZfQhBNXbIaYk53sWXehcyC
X-Gm-Gg: AYBFou2T5Tqgc0G6SHUP9i5fpz1INSeFTv+BlsWEEC+4uGe7e28GHPSZCkTwGgQcdiw
	vKJiauAdXoklSlMuPowG9ne0B2VUDxTaNyuX0RyxagVe/Rx/M3N5VRF/u3H8GV7+8p3l6yLm8k/
	Yu0KUKuWpmkn+R6YXOKLknBIhV3gRgAwlrw+4QO/ZrfS07oREd84Kj39kS0dXG/wTRyZN+q5OCj
	gkOQWESOSc8J/73mpzL3V3adHbCFdUuu65ZJ2MOY1jiRucEfCyCPG8G5763hP5w18+feBCzlF6p
	Ka5taXNUxn0G+8OvkaRjc7nzkBCmxLwSF8aAbGN44rKMhx28aUY2MzWF/TFbILjDM8sFJN8dUxZ
	s4ucnnKDFjC1hUAse1C7/P0w2C1WZM5aQ9hdlt7IWCAbnzxetLlJIVAAVfbPAxm5d5cNjSUaRoF
	J/1wHMuuJhLWzAYE9yRjPTpa/jprOsClDrjbtmgsKecNNrCXnSRux0tx/X8hhu7erK1deQYuw97
	BXHpva5pfCiTw2M+KhoBiBC9rmHCYRjQXCEuPVvNyIXetHFDyUfh7s03sLYIYx3uRqhIdyNvHA6
	uBEHpZT+SVHRe6NG+UTAfg==
X-Received: by 2002:a05:600c:3b92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1d76315fcmr190697755e9.25.1792408723519;
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:31 +0200
Subject: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=myClqR21JNubd0OB2mhh3+DPt2M98s4uE3+qZ2frpw8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qc/6F/bmfCcZQVfJk5IePZU4r54OsPGNIPuf6d2p
 T7S/cq9rqOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjCReyIM/5TuX7M8cKc1nSOx
 n+dkZcXVIw+2aM3OzrHSnZw5X+QKKxPDf4++DRPMb6pVXhCy0F7fcpbjYpKTn0nRxwTRpSI3WHx
 P8QAA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 76e2ce85a4d3..7897d9dbdfac 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0

