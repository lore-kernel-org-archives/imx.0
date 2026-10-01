Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DCC5208D8
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870069; cv=none; b=KcFtuCRzXXtGE4PQ+QXmAECZxP3wMT1Vhd3iJ46hlhCcTy2Z+dS+rKR4bGbdtyKzI4LPtAUoEtms6PMm01ASe5+oCo+PlfWkxWz+rv3bpfAL9BtuEHsY1gb/QsbHfgSyICMuinEEaN4UAptqM6QvNwEFh6E3IDtVzg6BxV7nXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870069; c=relaxed/simple;
	bh=CSaJsaAhehHpcrg1vb5EWLRi8QDNWbVA/UD7yN9V9Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOD/GJfXDZlQEiv7t6KfsZNdWAoA3WO0HRgI2uVzvjQfSrIEDCzNu0amadBFvrHWAALm8w6Y8QTaUozNRva1VqXeFHNpP4V3D/wC5vEiwR8qXrvt6ZuuVMY1uOzPYkACbKyOwWby0XmeLSzvxBQvRNY6pd3sUQfGG+G+VQ7PY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9V07sic; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9V07sic"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1110595f8f.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870065; x=1791474865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=Q9V07sicGLTcJPifn274iLQq7xwJeaN2vNaUlByzZBxv9IeoOqBQTsAG64IpF/kMK1
         kMghS/lIFKC/cytqFiCh9VTGYq6cFtJkafUWvoLMUpzq5poOYlnHV8IWl/Mv1Urq2e/C
         UDFA10F5dxkDZVQ5+9NsU+E+Z9EkjwFvtuXMWPZHRM3KFwKF7s3GzChZbJs3X3LXYkZq
         n+IPVdC20Y/0k2cYoad0igVLRpy36AsxM30Txvd+92w/pugimAVLyyj43nnio+8K1XR3
         Ac9BdBOIVlL47iYzP1tlxbvjNARHhttNilQb+Nv1yc3sOldvD8uSieymK+qx58xTf8Rr
         8OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870065; x=1791474865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=CJwDblt6S9Nl1tA/m04zRCjiL8vj4J8hrrcnN1Jxzuf0iRejh02UWdjDOCrJwXpodh
         FDZCdVrXGkUpVKxKKyJ+cv3lSseJMyndEdwsFTrAc2V4WrQ+05u42+0yHXB/Zq4ZV2Wz
         t2cjda94Pbe4xHYAheHJ28nquHMxJEyKpdWIhoXdCcskQZrAoj+n9y+Qwu5EHyUanfJu
         pEZCnuKwYEn9T3rmlPeoBekZirg8nIA9h/s4/jiJB9XpdYDQ/ktbq9GMGnwJcZ5GjZqj
         wsU2O/W6qYgTIDLv5xXYj6YazwCrshGdqUlnCrjlxpwISCbicFUfy0HZNgckqs/AEd/a
         //aw==
X-Forwarded-Encrypted: i=1; AKwUvBwu1JyWQiJDLkMV0bHM88oQmibTNZkv9aKgxNTvBFUwVLbyQQj33QSgBsfN7m47WDkKtyU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKyMIkZZQdaARhqa8nK8iJDWrOUVwnyESCejs1ALxtYhhLxhtyi
	VWbjU0J2mWNG8FvIrs+MMf740b2qgvpxyo3czdzwF4WlP5SxGxfbZ0LR
X-Gm-Gg: AYBFou0t6bvt9PDvL7owZW4AwtFVDHHIgfiBLPl4xhOh30b12+ZOPUyYT1ECDyQFmzd
	qGRHhoUrGEkMrSUG1PurCCHlqdtMGrKrovJmf+uFkZj3LeI2ednxgUJIMim/jPmTkgzmCabPFWL
	RiZyquHYIdq9fqK+jrLkXSoIlaX1h7vIwQdTYgCQH32lB0B4IOUeoFnMWnF0Pd9LGxNN5llH0OL
	JSti0+1RU0STmdTC1ErA6EylOpllgrs9/ifMNU5bgEhuqBOmAAkyXAp5EhASBVlfT1mRiK7WWUm
	IvwFzcQcC2HHm3DkqFedJZs6iyc2OR/FNEjpWSZGdaMAgxEk79PCEIRA8E94Wt1fLcAtVmDEgsV
	2ANL+1Fgt2Gaoaq6E6H2PEOJg1IUsneQv2TSMVVB1ntNCn8T9+xQZ8jL0jTOcjUyCUJ+Dc9VEiM
	LAZnme+F03bzGRvQHvRjQw+9/iXtiGyued2gbmfyHKQiafzvuLePZs5ObWjTUBEaVQg3ecXQe66
	K8GLnXw1hFwoEaz3vpoROVTJAX1yJJzXGRJhRfW8aWJgCch2hlDoBzAtF1yZQEnT+Jv7ep6y9SV
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr24159f8f.28.1790870065261;
        Thu, 01 Oct 2026 08:54:25 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
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
Subject: [PATCH 1/7] ARM: dts: imx6q-apalis: Add HDMI Overlay
Date: Thu,  1 Oct 2026 12:52:51 -0300
Message-ID: <20261001155412.3177428-2-leoreis.costa@gmail.com>
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

Add a device tree overlay for the HDMI output on the Apalis iMX6.

The overlay is also combined with the various versions of the Ixora and
Evaluation Board carrier board device trees to provide ready-to-use
DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 51 +++++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10c..32d77a59c4358 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,46 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -183,15 +223,26 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
new file mode 100644
index 0000000000000..592bd366d94e4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable the HDMI interface on the Apalis iMX6.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};
