Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED080286439
	for <imx@lists.linux.dev>; Sun, 10 Aug 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863814; cv=none; b=DDAbCpUM39nJ9yr/3SRqC39ZkWbmaZKonAPEvHezppJ0u+XCX1hXVljHveOodODfzkOU9/DjW5GEoHLKn2MM+/h7keaSpfP7AOQnoXWfJrqMvfUacaCOEIlHYfH3QrBiNqasmP+BAknsbdF1UKQjWOUxRKaPUlt97afMQP2bOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863814; c=relaxed/simple;
	bh=zfXiCN4Sc5sxH2sEYuITnhrGRhNh0qIrkLrr9AP7o74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LplgZiO92V0fVlTNFtDPWWC7nlPyxb4pRiubZV2h1qICrRh/JADEG5Xyc05gf/RPltL9h2x4ZbMCHYjvgP5fmxaHoAnNorKESpLsEvhuax56MK9wsfAmvYy0VuytAJznt3BpNGa2YsvFA2JadSoG9LPoqxkEB9FGvYwhFX9xJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3218283cf21so1881567a91.3
        for <imx@lists.linux.dev>; Sun, 10 Aug 2025 15:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863812; x=1755468612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uihwsc/0/XJ+PKMiZipIM8BQRMntIvpw4hWPIZoG7Ek=;
        b=Ke5AmpjAd7zLEHHd9wxOFvuToT7m7kutDoEcWb32lgRqt7KAbTSBse4zfQIwFKa53a
         nLrrdZiAelaz62UvsOqs1yMt4jMuAf+pTOKOpxDaddhZ96r9FIVMbE4qCDfZr9Sl8dxr
         wf+TL6acj+yl+/tKUme0jWFlO25W3DVVa3ma1giMM/iJOAIPDwUdlxXrLi46armUJ99q
         nfZCmRdMyD8pYn5z1gZNzrAbWJ/T1xSzZUlpebjpK4ffUBp87bcFNCEDpod72TDfCAhe
         XfwRaTyh/EjYXZumRRhrV4qCafoHITdCZEcP3hJghRgekT97t5HdmCl4Kq5W8YwyfYF2
         6www==
X-Forwarded-Encrypted: i=1; AJvYcCW2/HMU1yd2TLHCFzrcEAQOOCc7e/zFuJNoX2E4OyDPnAKDcx4swiXPvQRUP9MR+VmkZGk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUUQh1JpSOUrGvYprCj+mXoEVrIB1ha3FMaRE+CV7tpeZ7RgAb
	1oic0UxNmdvjHPGHu/3cd7pvH4onrO+aIeVkvgV8MiHhqKuy7f+wD5fk
X-Gm-Gg: ASbGncu+wVaT0V0dQDXjPbQQw1Dkd5+xJ3GFkhMqzn/K8miwCwR1OejeUql8CaTDZnt
	yquw1kxTRYih4G3NeyuB5D8Z9EmBYxaSEdjcfSJR9AK3PPkGir2dLlOP6akP6M+e1I9MiQXyavl
	NFZV7PkNksq3tcuRjef3UhO0ER4P5QMoeS5vuVc1J9aZ8pXLkkM/UxQi+IkVv3BVehd4t14mO2u
	1znrFNfRtuyNjbByowUX78xDBE1xER/GC5owdbtm4JqnJVEk1Jm3PYco1kd6rLyBKNVslsUb0ab
	cLby6q0uuTcH5lAv+G6yWdBPFhvcYmUzfKtsK1vmcK4VqwMTLvYWGI2FM4hl+gmq3FgaNriQA1q
	heMMd/yhF+oM8iBzUTn4FQdMFIA85tmyGD0buoA6ZRHeVtcgNHBAWEmT13Q6m8JaH2IA=
X-Google-Smtp-Source: AGHT+IFCTQC9SdRJ5qPCgpZfyHqD6TscoCidyWxoSvNsuIOKQ2B/LiU7H3kp23xxyw9/Oo+plrMSZQ==
X-Received: by 2002:a17:90b:3ec5:b0:321:27d5:eaf1 with SMTP id 98e67ed59e1d1-32183c45f17mr13469365a91.25.1754863812200;
        Sun, 10 Aug 2025 15:10:12 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] media: uapi: Add custom IMX585 control IDs
Date: Sun, 10 Aug 2025 23:09:19 +0100
Message-Id: <20250810220921.14307-3-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve a private control ID block and define the helper enums
used by the upcoming IMX585 driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 MAINTAINERS                        |  1 +
 include/uapi/linux/imx585.h        | 20 ++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h |  6 ++++++
 3 files changed, 27 insertions(+)
 create mode 100644 include/uapi/linux/imx585.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ef04ee4ec..e6aeac0c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	include/uapi/linux/imx585.h
 
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/include/uapi/linux/imx585.h b/include/uapi/linux/imx585.h
new file mode 100644
index 000000000..30e12df88
--- /dev/null
+++ b/include/uapi/linux/imx585.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * IMX585 V4L2 controls user space header file.
+ *
+ */
+
+#ifndef __UAPI_IMX585_H_
+#define __UAPI_IMX585_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_IMX585_HDR_DATASEL_TH   (V4L2_CID_USER_IMX585_BASE + 0)
+#define V4L2_CID_IMX585_HDR_DATASEL_BK   (V4L2_CID_USER_IMX585_BASE + 1)
+#define V4L2_CID_IMX585_HDR_GRAD_TH      (V4L2_CID_USER_IMX585_BASE + 2)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_L  (V4L2_CID_USER_IMX585_BASE + 3)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_H  (V4L2_CID_USER_IMX585_BASE + 4)
+#define V4L2_CID_IMX585_HDR_GAIN         (V4L2_CID_USER_IMX585_BASE + 5)
+#define V4L2_CID_IMX585_HCG_GAIN         (V4L2_CID_USER_IMX585_BASE + 6)
+
+#endif /* __UAPI_IMX585_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9..091a044e5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -228,6 +228,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
 
+/*
+ * The base for IMX585 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_IMX585_BASE               (V4L2_CID_USER_BASE + 0x1230)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.39.5

