Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909204D09EE
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408728; cv=none; b=Un/omdLS2CYcddorih+vMduu7AyyEXKo3TSZidlIcxD7Bnr6bpvgTzQo4BxP9ULDapNBkImXz+Mlz4Ble7exeBamnRbBZUSe7WsNt7E4LK2jj2mXQKr5rRhv284HSOVBTykP1X+oH3fbMFsP3UPzSkhA6pfEv2WfsyxQtoBVKZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408728; c=relaxed/simple;
	bh=RfBLLOh94BtLVbLF6KHF/BrUBoofDZxASNA8DXSRJo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eqled3pvmRS9z+AgVbTBRocxEUYYFU4Vqgr2Rc8PwCPuCxoJBheyxqbGh1irvEFfNp7wqAhT0Pk/12bUSl5KYSISuD23fQYekYXdMn0DLRrPu97IeVEq18PVOlAi6psyT5aTtQwFSD9iotFkgqAigplzg8TN8CGvMmy+k6w3apU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yy3tZXGk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yy3tZXGk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so26703115e9.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408723; x=1793013523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P33hVjpKh+xrbXa1Sk1QVICLUiF0MUyjx6lsJrB21Jg=;
        b=Yy3tZXGk7nzc21QA00AlRrmBxAj7DVzLRslpoTnvFJdRSyDXIFPcQ3U4z/7w4A5ouk
         GadZLQx4PsXuOvT3CoFVLqEP1XkCi+jZSH1nie8B4HLeiOrKFMO1180LYw4l0mGN9uEb
         72Yzm/hK3BUJ0S1j0xRK4NLqqaYS5GyTpx9a1clQWGMqYhgtTWeQuEUNh1xwsLJHFbfe
         3w7WFUUO/nfLKOrkTZ3OGdgIpRSmoWADtjBJZ4Xueu/FydapVk0EuhRa0lMeWTt4vUzT
         3YTn6aiOtgDjTKpZHFsMfxD7f5hAthIXiM5s9EAvRZOrfkdDhe6lQmtmCp/oA0uU67k/
         Y3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408723; x=1793013523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P33hVjpKh+xrbXa1Sk1QVICLUiF0MUyjx6lsJrB21Jg=;
        b=qVf7jJLvDn+bBDC6Np1h1yd23Te5YB0eq0scrHwpwRgY417/oZ+f5w9mhfCtpA27Ua
         /HrAzOb3dcSJQUMDdoRTgKmvNiV9M/PqJjArywmtZO+PGtuWJfcOur7HfHZayt/Dljyn
         6pxbE1t9PazHZV5MWRdhqUs4LQEDn6NfovsdIgPkAuEE9gMN3b+/1M9MaG8ZKkyQT+5/
         bqIyYTwmIJNbimVC1imwSf5TfOthOTHMiYj9/iu6tE9UVaYsrozAI3WEcGW2I8PyS7mr
         Sz39fqIlDHUkuIIBOSPx3J5IbrJv+vXWJSQiLvHfensbwuSTk3bPnjXxfp+5tVJ/cx5d
         pxyw==
X-Forwarded-Encrypted: i=1; AKwUvByer5zCJPnvc1F2ThfihK/szeti25v1aQezjNVtvzKdETofoHU/OdV4pJkPj/WE7Ld6NxQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYINzNGdujihZhvkKMksMu5xcPbc1dxhxmv9GTG9FMLkVWyES+Jl
	KcLlHQ6e6IyaaliPI7lEZD+D4HOrpExONGeKklr867CcroqK8YLHooTn
X-Gm-Gg: AYBFou1Xxlg1BTXmalFiA9GxabQhQEJTMsfHATRvMvrF8nPRKv/BBV6zex0AZpop0Ow
	a9/QPNqZg6mqnsRtYnrfBB219DJPIh77Br6xuL42H8/dSGTdWAjY4EHnK12U/1XtbBuG9pfOUHr
	ZwEhDqW9FUpgDZoNUeh6S9ScwGimekzpHAysq1erwYmHL8j1Oy++jIwNjgu/fUlUoqB6uspEJsk
	K/gGVJ8fUwtRPvFKPM9KpenlZIV+XqgFb7T8ErW+2PhQFlIEvbDTYxtZw9k5/MmBB8OV0DAGilk
	FnaaUJ0lwvs59E+daSAnqiGZ6yKd7CQPJVq5trUriaJG6QuK5dILg3jCAotfTZJ/WG/2SqCeSvG
	hCNjMZiICssBvxlBDixj+EXp9kpj29Gw7LL9LrQadECpF+l2GZibVavzxnyWBXvFKVg+oMCUhQ5
	sy1Wxm3Yjh+hpLwEtqtuKFLfBHxIDc6WQ9cyeZAnKCICt7gwfGSN4GUf3q0dnX+3/N86+MBz6tE
	/GaSfZCN29ONd1ldPMTj9HA20+SQwf0yiPjpuQf/6JnweWEh/gAX9o56tGuFdvk6C76jHitGkHQ
	nbWd7yQNtYzEzFFUIGyr2g==
X-Received: by 2002:a05:600c:4e03:b0:4a1:d292:9d9d with SMTP id 5b1f17b1804b1-4a1d7644192mr172008035e9.35.1792408722619;
        Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:30 +0200
Subject: [PATCH 1/5] ARM: dts: imx6dl-colibri: Add HDMI overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-1-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4908;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=eyuD5YVz5pZ+6iyFzhrdCEKyd+hrUtsb1l1I7V+Ycuo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qev/uAKYfWaIK3U8Phv7yfyhHzh45PsWi/l5Dmvg
 ++7Rf+ljlIWBjEuBlkxRZaMJ6qCfAohsh4czckwc1iZQIYwcHEKwES+nGb4X6R1p3Zj/ylHVRmh
 HykTfttdCNgutEn0uMJ7231RBjXSugx/+AImKrs71azQkihaKrR5xY/vSzdFOhkfXnDQQknzsLQ
 tMwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay to enable the HDMI output on the Colibri iMX6.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The overlay is also combined with the various versions of the Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees,
including the Colibri iMX6 V1.2 variants, to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 41 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso | 27 ++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..76e2ce85a4d3 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -92,13 +124,22 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
+	imx6dl-colibri-hdmi.dtbo \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso
new file mode 100644
index 000000000000..449476f9c417
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable HDMI output on Colibri iMX6 through the module's dedicated
+ * 24-pin FFC connector (X2), separate from the SODIMM connector.
+ *
+ * Connect the module's X2 using a 24-pin FFC cable to either:
+ * - Colibri HDMI Adapter X2, providing HDMI output on X1;
+ * - Colibri Evaluation Board V3 X6, providing display output on X5;
+ * - Iris / Iris V2 X2, providing display output on X4.
+ *
+ * The Colibri HDMI Adapter can also be used with carrier boards without
+ * a dedicated display FFC connector, such as Aster.
+ *
+ * https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
+ * https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
+ * https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
+ * https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0

