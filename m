Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA73E1D05
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087650; cv=none; b=EZ/lkeB2vOohs8n2SKBZXO4nKW44TqbMCiCSD9+yguSGVEphqaKtqqvNdmqu/Y9GKgISXr8qHQm9LsnkFQ9UVbuzb4K5hGfLD4lHWzu3X17+aIJJZbdW186JnxNefLtfkSXU83SXUh3I1bRgTvDfE+RFQz8XpK0e8TTUsxepxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087650; c=relaxed/simple;
	bh=VPVRIEx8azlGmyfEjloVEHGzIOKDIxuxh8I73jFmUJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRzm8Wg7P61MgMqX86x4MJut96pf4IH0X3f6o3YqQH/WGKW9yvEK6wh90N/glLLLxO8K2vEX7Y3Xz2k9BQpcYb7e3ryCxl6q4SzkyDIeD56thGFOE+KkGL7m+3H7Gj+gm3AuComyLmWdZdfM2k6uUzytvJwSTX1Gu+ZfCvRhLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rc8j1gDg; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc8j1gDg"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso647232266b.1
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087646; x=1790692446; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=Rc8j1gDgO4qXWtGjmpbxKmJALftRwjm0gTo1K1jo4JQ30Nc5M8DcnfemRDA1yzYYqS
         P0BiqjKnmMheRCcvJHR3TeN4z+wl0dVyvVxn826wAoy5f9+FoO00v6IkYLzxbnkPTE9Y
         VU30rv8tqzBpSvLWSAmyEGRgExW3OLRsxmBC3ZF7hh3ym+RyTx6UaHIo60Rf7hudLgUI
         sW+ZuLsazc0QmFRuuZsNzCOg85V10QNHrKxyP2Zz/HGCzp9fOvqc9kZNYOFHByLj4lXl
         FTH3YdKVi2YBOiCjf1bz87tlJJJAjojZm74UbRTfNKzNMW/edilpSZrJLNJUA4MuuIqb
         dQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087646; x=1790692446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=QW08VNA2u5M7zjq2vgC+YRVcSmQU6azKv4ZICfSD9r4DtaeS7TBgqyKER+210yWcJC
         UPs1RFLcipdFWqoW3gS/nidvJzOU8F1OZ968sQ0RPK34UMsqrZHpB2ztsC4VAsTHRfzR
         r4nDyKiPDH7h+2mlU4BSE7T7utVBEhHzD8bd5dlJVrYLrQDytEUuSXclUTYPklzNN6pe
         sv2dn0iBYuRphOmkOWGfcpQjStFz6jL/xFLJtOXATJdbAPsPDUohnl/yc5jpiOiS9wdT
         afe2Af1PEItG11Qvvjf0qJTRP9SJrrA2P75JSui8bBj17Qwu8g/6WMiBwzDX2kXOHZZs
         lP6A==
X-Gm-Message-State: AFuF++lI1QyWv633jVjmjohKLGOINQMdlOV/HIU6MkYWLKVinMvmzYmL
	oQmb4XlVa3Ua/QKlxW05J4/q1ulC5lU6nW+CCs4eZK3GlrBI7zMx58jE
X-Gm-Gg: AYBFou3GiwoJt8j96KbTsJU6l6NLHjeDtOic+s3h9vjs6+7q4UrKuc543eKbDG93Z18
	vIZ5IiH/8lUjrsK5mbDlX6+hSoIs3WmFkN3bx3ds65Ux9nACVplwIKq400ULoEQ+mD5Rt/rbYvS
	KZd5OC1ip9xe56BOOf+ZJtF7SiQqn08v4dKMUvnaf+k/XPvyMdRAAhovFtUcEaOFhXmf7dmr5aB
	BjW8YcwKYVoeFl16wzfPYShZdz1fP7MnC4zPGUup/LEXSjYF9XYOtHA2jwoLSuxg50jwJNJ/hCe
	KaJ5Mbda6tqu8fos7DBxBHlTZY2/jVZc8K0tBB8BtqZeuy54rw9WHkGGRtoDZi/RwXU/h3vR0qb
	RtuyuQUnqP5P4qFHAuedyxZbAJOfIsvTm1/swncuBrsAQT+zgevM4pytdjuG16wOHk8cwQG23TU
	1WKyNn6wv9vi5+ZMzaaWEM6jaQceVUkajA9fSZZwU8v0kOTwkh4uSVwOhkfroJhWGSDpdiW9pEp
	dr3vX1/8RVT4EELZl+Izn1avUz7YdRUTOJtSVOPN1ndSHaLdk+tu/YoA0ur3Z5OqE+iMFjDJQw=
X-Received: by 2002:a17:906:2090:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2a8e3b0af5mr219778566b.8.1790087646027;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:47 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-2-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a7ae74a706a8..c283c582d974 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -966,8 +966,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
@@ -975,6 +977,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..efe3849f262d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

