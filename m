Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90931CB333
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683750; cv=none; b=Vm+xRPGiuwmlMZEQ4P31Nd8Cze7a+EkvFE/YRFVRD57YV9Jpb6Kfo7p74CQvgmZ4ONRF1irbZvjEUjAJSPXqnLkzbCeUGrXwNTfsGNjJIQ2OwQ1+tnYrrmAPKZ3ZFtw+rC08p0XkgYXPHJ639mXHlCnbsTPDTGGiGzq8xHKMp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683750; c=relaxed/simple;
	bh=ecm5qBuobUxfLm11/z7zon/qPnxquqho/PMLTb6i/18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ay+V6bK9LXf7hN7QsbioEEJ/ySPIRTYgxn2Ltv/bzuEnegIU1KgBZGp2hIZUMVM+4fHmp/eWrKVTLjk2DP8IeuKp71u9j26jaTfO3yJBTK9nSwaRIdGLw2JmslaFEz7X4SfVlnBNQVP0Roesqst61wsglsQPajFe3hk0h5XcSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCHokrs9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCHokrs9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53568ffc525so8593027e87.0
        for <imx@lists.linux.dev>; Wed, 18 Sep 2024 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726683747; x=1727288547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b74DjBwDaiguwxZN4WPzTGxSSIqR5dICOz1TwKaf1Qk=;
        b=GCHokrs9Qz52P4huNA38LGsAKu3RDbnhhE6H8HhvIebpilBKFoyNTNhjjbJz28qmQy
         NhPjqsHFbRnxYa+YWdkuG86MvzGeF0zDjaL0yoUeBbXCKiZfc0g+qjWYzHwQt2M1gujZ
         BdVxeO2z5P9fO3049JN7V5M7TDZxzZhGax/FapZYOLmTEVBWg5zCUW1duqvHc8Y/a71J
         HOp4IKLcJ9CXOqqfmpr9YPVnVa7rP+52F/Yw5m02iFScJXP2j9wQyVDLiatcq6CIvoB1
         nkAfvHLkA0ngSN9iIjaE1ZI1VDbTTfIoGiTBjBJkVqLWdCEzkWQedRKZnfEpmyixW7ec
         o6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726683747; x=1727288547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b74DjBwDaiguwxZN4WPzTGxSSIqR5dICOz1TwKaf1Qk=;
        b=ONSj0P4HNRCOZwnC+Fxc8hZ2GQ6++r/V0Xn/r9dKnXXLF2aoQFhWqzzh0UUPK1Yylz
         bJYrAdQYEyrDV1V8KpPhKdvnDMY8opJSui6YM/BssIKWJ77+N+ywiEJwjAVbN5xJmQ67
         BqVC4kjrD00Y/NLBYRrSjpA7q/XiK3XBWgUvPikNtW/gGt84GTllyEd0o170hiliLnad
         drcrZ3B+uxsV5yqPDb80XhNha4tcNr18+dboM3reo9SRL3CrydLglhClv/BGArFStVTo
         auIj3Fus+/iENSH7oBurajmJtjXfwrzelCdNGScs8i/VW3GHQPTMW4QeHKXAfdO44mDX
         hjLg==
X-Forwarded-Encrypted: i=1; AJvYcCX9CL6SyGDIsworz112OyOdRF3Mr5UjNJ4bCHjPBnsQgURCdUa+qQToijfNXc9NFTe/Wqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCKjTPIUv7Wp9gSkEApID79M56/KmLPPXiTf+SgksARtouhc34
	o/XHYA1pPsDv6R1Riz0rQp7E13stMmc/hOaPaAxRGawLpZRtpwjd
X-Google-Smtp-Source: AGHT+IEgDcqWPZk6PODNPj/XhOHH/yFVmMsQL7IfvquOxjcmWF5SBcsMwOEuGAebdORj5/r29Zkppg==
X-Received: by 2002:a05:6512:2345:b0:533:4689:973c with SMTP id 2adb3069b0e04-53678fbaf3cmr10878410e87.23.1726683746810;
        Wed, 18 Sep 2024 11:22:26 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5312dsm5200146a12.23.2024.09.18.11.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:22:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx8qm: enable dsp node for rproc usage
Date: Wed, 18 Sep 2024 14:21:17 -0400
Message-Id: <20240918182117.86221-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Set the status of the dsp node to "okay" and assign
its reserved memory regions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6c..7ee69ce7b193 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -92,6 +92,27 @@ vdevbuffer: memory@90400000 {
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
 		};
+
+		dsp_reserved: dsp@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
@@ -640,6 +661,12 @@ &sai7 {
 	status = "okay";
 };
 
+&vpu_dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
-- 
2.34.1

