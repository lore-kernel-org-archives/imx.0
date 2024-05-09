Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0C322E
	for <imx@lists.linux.dev>; Thu,  9 May 2024 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251727; cv=none; b=nBkdofAAPEujbBJyEXS9jX629h3NRU7Jp3nlRJJp/PlMOVEBLcVnhelVEpHLyEe0XIzYNhmudRzSNi3sq+uTSbxPMKAdAxIlPFbAotIdZz7gs6tAiHH/3Q98XAZMzNcVjxX3FSh0Z9DV42uOuzRyR8ne8vHeQxdo6V0FtDYxM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251727; c=relaxed/simple;
	bh=gcpdIFHr8ER34Z3GWGDwVi8dmpRY0WZC3XvZC+2j07g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQH+QoqXCTquSFi6RmqOleI1j0qjybh9C9qiH4IaLQQ6FTFZglDga15DLxVVzr63eu9806MeIXAogtqPasVmjn2rx+/6RaTI0A1DY8v76lH/ek+kzyMvdGD9r8tlgWk/LbPa1UIjDyp64mf6ShD068ph6dqwf0pkua9E7ZgxJWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayRY8L6t; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayRY8L6t"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a599eedc8eeso187370966b.1
        for <imx@lists.linux.dev>; Thu, 09 May 2024 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251724; x=1715856524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnzQs4M8STg8v5mtXmoZjumL7kiGXFglN5V5NIOcQXY=;
        b=ayRY8L6tio7jIXFELaXnRLOC0Msu43fw183yqmRfBhdBdXpSSquRV3glEyCpmWNVdm
         kyA3q8Nk2I5moJ7hQ6MB/FqPUdS1vrOKXy2I0dLw6yVgpsYN5rPHYv+rfzRox3XxVlMw
         XdUPOEBdwdRVdjzQjwaAQYe0mSncXtUDknxdkIFZbzkfbKDRtYIp+gA9EGcd7ey0frZc
         OeFoHMwYs/Lh1iKhiJRSB3uMWBeXDCbwB+HKIiIH4EgmkesmaJcXEPbqVVAsJigim8y5
         1IGzifgrCnAIGOkf24/huP3HeT60A/vVJEVlOarWcGFJpC07Z10QrZMs33duNZCYFx9V
         HmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251724; x=1715856524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnzQs4M8STg8v5mtXmoZjumL7kiGXFglN5V5NIOcQXY=;
        b=kIAofRhzEGgHm6G2WXu8izO0Z4NZ6hdRPG8sAM31ap9+wCbsgywyhZv/0EJsz5ftUk
         Lu8y0l+gbWXgmCNv2tt7DQG0pXoAJX6xUGD43S2Vp3qpVYq7EppTQDevoum+jl4cLLCk
         qGbPyIWUubxJntqXKZzFi855lm3qU8oPjwz+e6Vq8m8M1acUk6tcJUF08ZOTF92m7VPF
         EXP1gtH1OITM5kKSpNU1xW/enVrdVdYiujDywrEigknHXdPcvkHkyVYWravAkr0+UkB1
         NeS5zPBoKMq8DBYMpaQ60d7U78lET9WOrAUgNbgW24B4A7k4REfmN2bVyW2oGvWBlWk7
         J7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWEJMHreSv0XOekzns7vFwtn1T/BsmP5N/83I3MqOZGQBH8BtWEsj9Z0BGqIYjbzZv+0uHw24Yl+nPwrD3KrQLABcvs
X-Gm-Message-State: AOJu0YwcDoBd/hw41q1xpId0d6dKvOUSC9UMJe5Zq2CAqq8mm5rrQuR7
	YHqPZPOqtptCU2Thw9GF9OtXuzziF1KqcG/CpeBnT49MsDLTtES2Ow2JuqWfRYI=
X-Google-Smtp-Source: AGHT+IHczS5CGAbdxg981H0G+SH61xNrLiSFw+Z1T9VXSEXNVrCC1Lb8qrk7DjDkFnik5BB2nKDB1A==
X-Received: by 2002:a17:906:61a:b0:a59:9ef3:f6df with SMTP id a640c23a62f3a-a59fb941d7bmr290673566b.22.1715251724582;
        Thu, 09 May 2024 03:48:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm60195966b.72.2024.05.09.03.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:48:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] ARM: dts: imx: correct choice of panel native mode
Date: Thu,  9 May 2024 12:48:35 +0200
Message-ID: <20240509104838.216773-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
References: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings and Linux driver expect native-mode to be a phandle to one of
the timings node, not a boolean property.  Correct the DTS to fix
dtbs_check warnings like:

  imx53-m53evk.dtb: display-timings: timing-800x480p60: 'native-mode' does not match any of the regexes: 'pinctrl-[0-9]+'

This should not have actual effect for Linux kernel (no real bug
affecting choice of native-mode), because the first timing node is
chosen in absence of proper native-mode property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts b/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
index f72e109342bc..de6b7607510a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
@@ -25,8 +25,8 @@ disp1 {
 		pinctrl-0 = <&pinctrl_ipu_disp1>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-lw700 {
-				native-mode;
 				clock-frequency = <33000033>;
 				hactive = <800>;
 				vactive = <480>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 87a34cbdf233..079bd3d14999 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -58,8 +58,8 @@ display1: disp1 {
 		pinctrl-0 = <&pinctrl_lcd>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-800x480p60 {
-				native-mode;
 				clock-frequency = <30066000>;
 				hactive = <800>;
 				vactive = <480>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
index f0f92ee7ba95..ba0c62994f75 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
@@ -17,8 +17,8 @@ display1: disp1 {
 		pinctrl-0 = <&pinctrl_ipu_disp1>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-800x480p60 {
-				native-mode;
 				clock-frequency = <31500000>;
 				hactive = <800>;
 				vactive = <480>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
index c75606fc4abd..ec806b8d503a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
@@ -85,8 +85,8 @@ lcd_panel: display@0 {
 		power-on-delay = <10>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-480x800p57 {
-				native-mode;
 				clock-frequency = <27000027>;
 				hactive = <480>;
 				vactive = <800>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts
index 0d86927819c2..9ec038f1d0ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts
@@ -36,8 +36,8 @@ display0: disp0 {
 		status = "okay";
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-480x800p60 {
-				native-mode;
 				clock-frequency = <30000000>;
 				hactive = <480>;
 				vactive = <800>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts
index 66271daf97d9..b3129832f471 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts
@@ -25,8 +25,8 @@ display0: disp0 {
 		status = "okay";
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: timing-800x480p60 {
-				native-mode;
 				clock-frequency = <33246000>;
 				hactive = <800>;
 				vactive = <480>;
-- 
2.43.0

