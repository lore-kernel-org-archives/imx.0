Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDA4B66EA
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870079; cv=none; b=uUU9qrKhQkqSIA14nGLFotEFIMBFeuch3RNZKl1wlGh66kmNZVrh3S9OXAmncLXOYhXRbbY4CQ/WhQnwsJiI31erBQyMGDSidAqnve0eBjhD+3sfdmGxdhsxFod6bWkGbt0JgKwKDVmj3etVPKGqtXjVeE+oltlrMXj/caa5CxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870079; c=relaxed/simple;
	bh=PhXO2h9hJyvfdLdh0Yyx/LnJaBorua355HD7gFfHQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKClL3sJ2HZyA8N1OuVAuEH1jp0b1Fm1CjjFHPlsQIwcwNIaLjRky4Fy0foLBOuU4gdIpo/GN6GureqkStcd30axDpfewZ8wNmMhOTMDAI8m7tKkrzaxEc/LW52WWq/z1v4hVsYfs8+H032gzLdP8o5MdOFSWqw07sj2LbxtUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR71wYwB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR71wYwB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4168167f8f.3
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870074; x=1791474874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=gR71wYwBpP452E0PiSCvCaStn35zo1jvBFrpB9ynCpXKhkBOz++kqIczUgA3E4MKBa
         E3VZnu1bvWYd2oRSENuMW5Cb6i6EvlGsYqwpdjJe0Njao+7i5C3e/zrDnL64xFHsw8ur
         N3Mn7mP/ngLzJRFXgb52jxY++yZ9jzk0RStnbxXq985CjxpzVUhYLnsFTO8DFQAZqt3P
         Qd36lJKAkbcZkGrILsYPSiWGle6CT1vYaLNW32JY1lPABp+UWuNXHEYusrkFQetnRYMH
         +eRybGv7KrbaSaPO2kpVqBYR2VJagBGbH/Aeg8rxSZEfY+Dm7zdHfCqEb66UfK1mZ0PR
         nBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870074; x=1791474874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=IFwHsn5u3VZpQK0yq0//8ki17/YHtuhfGPfcgzJTjWGXp1RDIUwdKxxHIFsENQqoK/
         rxb8gwxyG+PxItzTbV0oD0x1j0EPqjO6R5Hy0EFtf9I+2flBTTeaqQ3iKJjL7wvAmvzL
         2XSDQp7ayre0zWsZg9Ei34bAMDaIIMKtX3SXQOAi23UJ5UNwhiR+FKJCBZQH0BKf3qvY
         ZsLf5/sR2J7NX3e/BQo42EOEXvBfWbarxqZW1uovOBva1ryhtc8hsJxTKvhQ3agngyXL
         e5Myzx2oNYTV4IpWvmFa6u5f5gV+XcxZAGGjhlQRswsSn1RRG3u6Rl65RV2h/NjtYA7V
         s3vw==
X-Forwarded-Encrypted: i=1; AKwUvBzkeT8l5uwmcL+uswn/+T8GWMMDofT3d/LjU3Hou2PwpdOJxi7hJ8n+/7zsN6dHyYoY5aU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLoJhWmlkvWpL6u4hJvXi8+YbVczjGBqUFkV5r+ZbJcl12ywpNs
	VWNEHTn4mjK2yL0zE5wxV1+d3JQDyNxgEWbtOaI3y3eOlPGqHVRWLuCp
X-Gm-Gg: AYBFou0HOyBEdPp3MUj1NUpIbVR0jjodO0Q3WA/9wVOpgFQcR/eaBo6EmSzE9RrqwyI
	diiNMRH6pc5MyNUjpT50hM8ZY6TEZdRGzKFDxPbnXd6aEuCS93c0nkZwsbp9YLkz3fYZ1x2eJvy
	u+3uJB6bZfu8MILtIHp6qn4za32szGPY/bngny07N3IoQTgCkjmEOqWDj43Iz0bxWH3kq7AxrTg
	Y9aDM90dvPGe+3ROvpOmCJO1mW3mNU7kvMDIeFxbYIlIaYeplDr2gxhe0IozGjmhiy11epl7dsl
	1LIGUwv1BFpLxe5JM6luQXZ255oGLhr7nHt4Xgy2VXDkG3X1Z9AWNFvpoNb/UTnVBvffX2hD3Cp
	qSdxeKGPnHgFvabsSCs4k/RXuQoC5XvW9KHJ5uOm6ElIr6ppdF31VR+rQEAdRwUOOrCSNIW+7zr
	CpF9RSHWZYAVVuerTqfqbqeOtRFDRuSI91VbhqXEBD9BeJk20yN8gj8jdl80OMcDz8IVyWhjmXA
	whYfdvW3izCDx+gWffyXw+AMg8feVMuT0QMB0a1ZGKtyEqhq92Ghppwtrq3A9YfDA==
X-Received: by 2002:a5d:6f10:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-48b12741278mr19738f8f.24.1790870074388;
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
Date: Thu,  1 Oct 2026 12:52:56 -0300
Message-ID: <20261001155412.3177428-7-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                |  6 ++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd1b095ce06f4..cb2ad0756e7fe 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -87,6 +87,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-hdmi.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
@@ -252,6 +257,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
