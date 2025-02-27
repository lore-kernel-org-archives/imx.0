Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716861D5AD3
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675976; cv=none; b=jOsguDp+NEpEdXwiIsssXS+VgNcMYWEVjrc0Q/z1Im9kKT/iF51jGo/qTs3h4hvMS5EyfAPW7xDO6W4XyvB7OE/MZEC2nEdCz3cTTUXmIhyMKzMfcVMIweCxrh9fRpWvOnlr8pdh+F4IzTPXZCgphfefdVOgz4yn/3TAqMitG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675976; c=relaxed/simple;
	bh=TAnqKm978WmKQiBBOY5vk3Al1dmAZdwFyuzuE1ROnQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/w5oPI2M8rdFecYLazo/0wRxcD2NgwPO4FVRuyX6ymYzw3n/Ck9KMrK97MZMVm0LQguRYYT/R0tG/lN/Y0LAcWdCAZtDbY5rw9zGAAoeLGTDpOxJUcyAsYlsFAixcR5HHs+z0uE6m5ftBBVSiDOr7NUXyib0oeY/weatcGwtmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+TS59fT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+TS59fT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so12092135e9.3
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675973; x=1741280773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDITHZykvJgRGx/AG29j6F4v8cMHufXuXntyHw4dwLA=;
        b=g+TS59fTxZCOKNZ1WVEp1MTq1s/s587co6ziRgKaRE/4NnMYEwjG4ChDG6i5fmCNJA
         r0YTVlEYO3mD0jxHaG4kl+RwDcm6/NmJxUX2Ez+i6WMb93S50ysdai5mD+xHpf1jbWSN
         VxwJ0Zs3sV7Jhj0qAVCQL6kOBDKbvSAfPfumuWogz0swlmTHsgY6INAsxPZ0l1NfaVNG
         5wguI0ApIw0uv+3mLiV12lMFnxNk18XcAURGoTAmzDFOFkgyqfm+aTzYL+53aMtH2Fg7
         DS0j9kSJvZQZcHLagGFVpTWpj2Zdj7ugS9wdYn7ELGHwDUOcf5lUOZprG+eib9/GhSWu
         HuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675973; x=1741280773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDITHZykvJgRGx/AG29j6F4v8cMHufXuXntyHw4dwLA=;
        b=G03PH3jqenne/bKYAkQjDCOUWQ0V572eLeuWs5h/RJ5R8mF0ZQmlztAVN1XXNKPFO2
         RCUyu7GiFkUmA1u6GELIUjz7CfJOjRpeKxNjYR7eMSFKMuqY2k0t/25VCkecJWTqjmsm
         a+4IpaafuRga/ApE4SaFluhDoXF6gHzghOFg7YZk9egJE6y1DfVTaf5/AADiQB96tDeD
         gZLL2EUNQ5cKMfk9JgOlDGWIumO4LCenNvSEdaky2Y9TvcipH66OZv/zd12bgaIAmk+T
         jwPGhsEayvh8hpzyoY0mH0HY8KOcjpjd9UN5NcT2r7gimNr0OmGdGZ2ao3L2Rjx1k0ev
         1fzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVXqDV12Qto6oyoqlb3UxEsXWRGSSgY7Xm6q7xgVwyE3brL7LdGyKvALS8pxYot3Woo5E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVkesfmPygYIbJfVY55jzrkDo77dr4WkZ5XEjs9OaAb4EJOfX7
	al+GgGSaH+4ouMqbd32rot6gEzwC4lB+Rx+hrjOQx77CGulsgKHM
X-Gm-Gg: ASbGncsZpy5daPNOAfq9TnyMKYe1Ilz5+XppmDKR7EAtAO9aOvCnhSl36OuIXqwSdPs
	V5Z4rYQZfukyP6gIbSQzaZk1dXxDE8RWDoZcIGBg4uo/+7rjEBgTpHvq7KEkqFXzDRR8oq4MADq
	PHcwyeqQE3zgTKtyoCYNN9qsDOzBcJ7Wg1QbMBBv7eR2qNQoB69O89DBGbRgPYSWKpQTKagTTNZ
	43lG1Fr12QQOFKGmbJ0aFyRUGNrYEUDmTIAa4/sBHGVIHhuMvPj5zsCBUGfcro2cCiNos9EidIr
	jHJV3M+c1vRsmUVBrZK5C1zD737+1pgBjZg0rBzx4J94q1ypap50DX9mqVNqf6u7V/7LODTVdHT
	uuo6g
X-Google-Smtp-Source: AGHT+IHP18MKChfeAp7UDygXb3/Zzoe0rSxaWJhwSK8PncRr8rL+G2mA/AWIG8esd4/iEPPoh//NZQ==
X-Received: by 2002:a5d:64e8:0:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-390ea4b18afmr1317093f8f.39.1740675972395;
        Thu, 27 Feb 2025 09:06:12 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:12 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Thu, 27 Feb 2025 18:04:53 +0100
Message-ID: <20250227170556.589668-3-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 12 files changed, 222 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 39a153536d2a..81b6a96e28da 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -69,6 +69,10 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-eval-v3.dtb \
 	imx6dl-colibri-iris.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
@@ -158,6 +162,11 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
new file mode 100644
index 000000000000..44c78c07f431
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-aster.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Aster Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
new file mode 100644
index 000000000000..93fd0af53a3c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-eval-v3.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Evaluation Board V3";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
new file mode 100644
index 000000000000..92d41fc9a13f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-iris-v2.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Iris V2 Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
new file mode 100644
index 000000000000..c8957948c887
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6dl-colibri-iris.dts"
+#include "imx6qdl-colibri-v1.2.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6DL/S V1.2+ on Colibri Iris Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
new file mode 100644
index 000000000000..908dab57fd87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-eval-v1.2.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Apalis Evaluation Board v1.2";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
new file mode 100644
index 000000000000..5463d4127382
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-eval.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Apalis Evaluation Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
new file mode 100644
index 000000000000..84eabf81ba84
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora-v1.1.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board V1.1";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
new file mode 100644
index 000000000000..d7cfab4de457
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora-v1.2.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board V1.2";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
new file mode 100644
index 000000000000..189b074e31ce
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+/dts-v1/;
+
+#include "imx6q-apalis-ixora.dts"
+#include "imx6qdl-apalis-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX6Q/D Module V1.2+ on Ixora Carrier Board";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
new file mode 100644
index 000000000000..83fa04fc9f18
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+&i2c2 {
+	/delete-node/ stmpe811@41;
+
+	ad7879_ts: touchscreen@2c {
+		compatible = "adi,ad7879-1";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch_int>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio4>;
+		touchscreen-max-pressure = <4096>;
+		adi,resistance-plate-x = <120>;
+		adi,first-conversion-delay = /bits/ 8 <3>;
+		adi,acquisition-time = /bits/ 8 <1>;
+		adi,median-filter-size = /bits/ 8 <2>;
+		adi,averaging = /bits/ 8 <1>;
+		adi,conversion-interval = /bits/ 8 <255>;
+	};
+
+	tla2024_adc: adc@49 {
+		compatible = "ti,tla2024";
+		reg = <0x49>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Apalis AN1_ADC0 */
+		channel@4 {
+			reg = <4>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_ADC1 */
+		channel@5 {
+			reg = <5>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_ADC2 */
+		channel@6 {
+			reg = <6>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Apalis AN1_TSWIP_ADC3 */
+		channel@7 {
+			reg = <7>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
new file mode 100644
index 000000000000..d11bf911b728
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2025 Toradex */
+
+&i2c2 {
+	/delete-node/ stmpe811@41;
+
+	ad7879_ts: touchscreen@2c {
+		compatible = "adi,ad7879-1";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch_int>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio6>;
+		touchscreen-max-pressure = <4096>;
+		adi,resistance-plate-x = <120>;
+		adi,first-conversion-delay = /bits/ 8 <3>;
+		adi,acquisition-time = /bits/ 8 <1>;
+		adi,median-filter-size = /bits/ 8 <2>;
+		adi,averaging = /bits/ 8 <1>;
+		adi,conversion-interval = /bits/ 8 <255>;
+	};
+
+	tla2024_adc: adc@49 {
+		compatible = "ti,tla2024";
+		reg = <0x49>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Colibri AIN0 */
+		channel@4 {
+			reg = <4>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN1 */
+		channel@5 {
+			reg = <5>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN2 */
+		channel@6 {
+			reg = <6>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+
+		/* Colibri AIN3 */
+		channel@7 {
+			reg = <7>;
+			ti,datarate = <4>;
+			ti,gain = <1>;
+		};
+	};
+};
-- 
2.43.0

