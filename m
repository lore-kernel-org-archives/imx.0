Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F18420463
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693631; cv=none; b=up745t8eTzdluMiUC/ucBXVvenyqPSNVu5RaziPVDZJfJdwhSN/75/vsJ15xN8URx1faKP7L0NiQDKHk4eOLIsoh2fQVK3qUEzSYOVd1KtJD9MiNg3G1rHy7oW4E+gG5IRSdGOqcHvZQHS800kmmPtvC3kmIYEL1/WscBuNT8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693631; c=relaxed/simple;
	bh=6nVCymDshiLBnvd0Lbn5kEqBkJVHBIOcBWVQLVhrldo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gV6KNrjlpX+R6puuLXOK7UrWengKRiTdo/I80eip5sg4qcEVPY5ILhDmMPzglNdHoBtVL8CpzxYJcHWg9yydl/XZrVEV1XHqOBaP3NPCkOJkEo+On8VNy6ocFE6FFJhid7Pq3cuDYNITcmRatS2RAPQmigjIt+i9mfUp/anvrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8kmz8WA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8kmz8WA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so400011f8f.0
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693625; x=1787298425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=C8kmz8WAwwC4arqvW6Gw98Wzf/elnnbOB9xlFrhqk6Xf1TWPdvIKnGv+YMMfnwXmVK
         i1rw3IcDrw0/FLCQKSRS/4PjhsN1816fYqo58S3zi3ic53ma5BH5lbHl+cT8CAypZy+8
         1lQCmGJMAOFu/IvN2wMwBjEpH5bvo6/ehFc0qwpiLRQv3mZjjO5ujn5FIPOXa3ADALwc
         D1+DLaeY7xPHnUFsxNHU7WPepHYRo2mPu/fY5cX8XBqJrgG5N6g0fYLpBPyCKchb5rIe
         qOPZr06HM/X8hN6TmDJYypkVrN13K6itY5PeIPG1SJl6cIaY7bG+AWIRxqL7cTKBD3Pv
         gLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693625; x=1787298425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=QXvr8iQUfalidGsec73UVkQt72jW59w3jC/rS2NpZLNKViXcZGJVUFZGTN6oyvNOF3
         VoCNCZS7SlHKjcSTYp73Zbp75wi4KeELpE42FVXyivnRbMN7X3TtsUPeKC6K+LVgNgOb
         zRYVu31d+Z304YoNi30XzE99TDLje2vMCE+idTnHs5uf08DWz68RKJfdIwV0aML0Z6n6
         yl68G8AvrTnvFmLVKS7Vil+4qQ/evnUgZPYfQhYLmZbxanFpjL26e3P/plw73QWXtq3D
         aXrv+uNl7Ak0tzVXcaJCvzO4wzSzaCkzAapvAFBlD6IaZJQdDof6iamn6r0kGAF9ANo4
         KlTA==
X-Forwarded-Encrypted: i=1; AHgh+RpTulf7zoAqRIF7WJfySl5mrJPTzsrQOox/59xSGkPtDKFjeES/DRU92DvBBh2x6TSoE1o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT4G2Lvx5yo749jXQHUb8VlqKzHznKD1dBI7r7Tk8MS2b1WutE
	HOJdTMra7TE8AI0Y+yXjOeszkLIbsf3Zb7BC4yejsF3SkUSQptU/1kd4
X-Gm-Gg: AR+sD13N7BgswPM0vBMCRVz5TGaVEvsbn5wMsWyQm1S2i9Zvdz9Csx0pXS1MBTaW0+D
	JZipSiMNe/d1EsVswDqvZfKAQKLnoloMa33nIzxi87CBbC3qDeDrqxTKsAAgVjVRrMZ12CdSd5j
	g06KBrXe4C6E0WJLdBpuEx88Yk9hh4vVKaFh5bb1VLz7Y2qR9oGDHjdsZVm6oD6i5/2Z2ExKIh5
	UFNS0XouE/iBWeLVfFmHrI43NfraaQUN9TSE9bvtAmoPvyXh8KAuGp5GDBHLlXm1gaWpWddMTov
	LW+X3OjFwi28aAxjoP+ep7CCMeU2tQDZ+E84baVn6B7OhCnfBwCi1EaEiG7hHZaTEpUsMysxFil
	Enelb5SabBD2BpQalddzFxBQhiXoOvRrFC00QbH70W74S6/aF8rN2tLIuzznUDUdyB6XZE1NsDg
	VyvOeHIBMmTzLbQfaTQ9LcEUmnDoQ4kaicm5zTV+hb7K2x4xWZrhyd3lWTlkfDB0a4OA==
X-Received: by 2002:a05:600c:468e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-49987944202mr40781705e9.1.1786693624449;
        Fri, 14 Aug 2026 00:47:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Fri, 14 Aug 2026 09:46:58 +0200
Message-ID: <20260814074700.2491256-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Colibri modules expose most of their GPIOs on numbered SODIMM pins,
and the i.MX ones already carry those numbers as gpio-line-names, so the
gpiod tools print SODIMM_43 rather than a bank and an offset. Do the same
for the Vybrid modules.

The 99 names come from the pinout table of the Colibri VFxx datasheet
(Toradex 101355). Verified on a Colibri VF50, where gpioinfo now names
every pin the datasheet lists.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b0d74b..a9269857df2c 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,44 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "", "", "SODIMM_89", "",
+			  "", "SODIMM_102", "SODIMM_18", "SODIMM_134",
+			  "SODIMM_16", "SODIMM_14", "SODIMM_23", "",
+			  "", "", "SODIMM_47", "SODIMM_190",
+			  "SODIMM_192", "SODIMM_49", "SODIMM_51", "SODIMM_53",
+			  "SODIMM_37", "SODIMM_29", "", "SODIMM_30",
+			  "SODIMM_20", "SODIMM_24", "SODIMM_21", "SODIMM_19",
+			  "SODIMM_94", "SODIMM_81", "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35", "SODIMM_33", "SODIMM_27", "SODIMM_25",
+			  "SODIMM_196", "SODIMM_194", "SODIMM_63", "SODIMM_55",
+			  "SODIMM_65", "SODIMM_45", "SODIMM_43", "SODIMM_73",
+			  "SODIMM_77", "SODIMM_71", "SODIMM_98", "SODIMM_101",
+			  "SODIMM_103", "SODIMM_79", "SODIMM_97", "",
+			  "", "SODIMM_85", "", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105", "", "SODIMM_93", "",
+			  "", "", "", "SODIMM_95",
+			  "SODIMM_22", "SODIMM_68", "SODIMM_82", "SODIMM_56",
+			  "SODIMM_131", "SODIMM_44", "SODIMM_144", "SODIMM_146",
+			  "SODIMM_52", "SODIMM_54", "SODIMM_66", "SODIMM_64",
+			  "SODIMM_57", "SODIMM_61", "SODIMM_140", "SODIMM_142",
+			  "SODIMM_80", "SODIMM_46", "SODIMM_62", "SODIMM_48",
+			  "SODIMM_74", "SODIMM_50", "SODIMM_136", "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76", "SODIMM_70", "SODIMM_60", "SODIMM_58",
+			  "SODIMM_78", "SODIMM_72", "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +215,15 @@ &gpio2 {
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69", "SODIMM_99", "SODIMM_104", "SODIMM_107",
+			  "SODIMM_127", "SODIMM_184", "SODIMM_186", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_38",
+			  "SODIMM_36", "SODIMM_34", "SODIMM_32", "SODIMM_129",
+			  "SODIMM_86", "SODIMM_90", "SODIMM_92", "SODIMM_88",
+			  "SODIMM_133", "SODIMM_135", "SODIMM_188", "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0

