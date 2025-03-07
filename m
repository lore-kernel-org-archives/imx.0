Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4720FA99
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342701; cv=none; b=ClXQXwwkg5gWwjpHAxMpMccGkSfMg83NoaT5A4vrFQmnsnmyUyMMn/X09M+fnY0aXr/NS1TvxDZcV96LSrwU5HuZTuoKOIG0ZdNYBjKt8ea/dmiW3JLkT10dVM4xOUHS5wnWZ6Zpjvt4U/8fwyBHy0BUzugPfT6auxaaPVwmW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342701; c=relaxed/simple;
	bh=THNub4dW2r1h3XFBnOhkiBo9skIxEl99UaN11q092KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIf3pIpzPPDgdIYB5pUDN7XoxHYrEAdbF98/hIB0NJJKm0VHGilMs2w+DTImAwXHHFyvrbnyQMmFnEXjGAa5Yq0ApxTyJS78BSDXWoBk2JWz130+zE9ouZp/m4PrCXuKYuq05xkHyWqJMKoL2uaXPu7hYUukF416b46XBCn6G5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCi3Wae9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCi3Wae9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e6ac844fso1443551f8f.3
        for <imx@lists.linux.dev>; Fri, 07 Mar 2025 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342695; x=1741947495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brGJ0++22o4t57ItnfNx9mwtlw0zh9uLExgnV00v8+M=;
        b=CCi3Wae9yNOGmniAWY0VdIx0GJPtem9oTPe6PQuKRigsHAZW62tmuypBxtnVVyE7SR
         A/R9jBkhMuOhM1POZy0shy/rdpqVcUNgX7Wbia0m8NDv5kY4iNPa0d8B3IynHldg9FR2
         Mb+QL0MwXL247RY4etzc3iYOuiU0RcIp5QjNMLvM70XURt25ChIk0GzlFlBCpNabZaoG
         LljWJ8EqdGAk2qeO+66eRBbampyq0j3Cs/9qEsp6xSaOHt/PCVzmgCh3oAprblsGA4Qc
         bib7ZOdwuf5mSMgRiAXx5u9HsA9E0/zbrXG7H17bFhLiPtfqmlPLbQ0WTa2RQIzw3VvZ
         3VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342695; x=1741947495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brGJ0++22o4t57ItnfNx9mwtlw0zh9uLExgnV00v8+M=;
        b=LuJtq+r97bGbekAhEj8XFgKNqXdZepsSbd5NswqGGr6Kd7pNgol8lYvh6uLeD1CXO/
         APJmvW1YQ446UKx7eMxFXAXk5DWqhM4HzRND0PgzoQyiXrTgorqcOnxBj4FbieIdXxEM
         mvihxwXXt7tboyYjOBJp0qqjhv1806vcdjV5uSRpYKcsQ+QdmS9ozmxEj8lDDMdoCMtO
         mcSj8GGc6ofdVHE56Bx4qQatza0UF2FlxZAeEnKXEdQ4GDZuA4+lYfO26XGZCcK9ILyV
         9ERxV+uo9cUBO8vtUTQmGRsOgzLi+S+TR5gqdxxFmsXPe10MzysEd1rg2NWnoVn+smLi
         dsgg==
X-Forwarded-Encrypted: i=1; AJvYcCUdgp7ykWwQeXgaUpjoRi9r9+SZS8GXQ/nyZk8oM5QRkMVgwOBEOfyEYhaJBzYq5xtrS2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmKwBAigWyyVibNXdNvzpbSylnHVjnh3TFgVShZeLBoDTb5L+f
	fezGBINNmdXOEMcdZTcfbpUeQ/2utcCyN5faLRDa/R5ROLcKuntc
X-Gm-Gg: ASbGncsQf50cVCyQuyNVGg8uiqlwu3P3DM+0XgY5+kdcFEg08WAGFRo5iv74H1irikw
	4p/eolAJFTPJh6N0KE2NbPVqiWlWH+9F88QJ5n+AnZctdPqSzxjocidexKe5dyygaQ9KlYZJG7G
	Ih9SErk9AuB1zBG3t7jWKwrNqvqXyC9oYJU3RIftlZf7SZpwOIFqQsXylgaAcWcAdn6N1LJp1yX
	B9ODfTXQp6XCGVIV/UHZo7BIp/ZwufhLLmMsbo1jdXU480X7FDDexnp3j1Dd/FGR+RbloSRWlsD
	dScqAWjm/0GJE1UmpuKUfC589p/o97Q16P7/dvZBq+kg6aT61gmfjKDrUIKUW52OqqPi725AqY/
	9mJrWitU2MIY+PA4kyjB7XC0=
X-Google-Smtp-Source: AGHT+IE9lUI6KVxoDMo3xKo5g7N1PqJTOlIV+7j66eLIltbvNUJfTvQ7+Yxsj8nXHgBmQ0fwpI6xkA==
X-Received: by 2002:a5d:648b:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-39132d1fc83mr1434684f8f.17.1741342694709;
        Fri, 07 Mar 2025 02:18:14 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:14 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
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
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Fri,  7 Mar 2025 11:17:49 +0100
Message-ID: <20250307101758.27943-3-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
References: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

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
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-3-ernest.vanhoecke@toradex.com/
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

