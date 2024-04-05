Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371115FD0E
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712309307; cv=none; b=RpzZklNfHAYhhNPYN+fxEc3SiqFoR/L6EDWPNTytP4qwdWo/IMd+a4AQQg2B1a7ArYnG9E5i3vr+VA7lCJof6eibjc/aTABHnsTpIhgm9xSkhbS4DECdUPDPLxw4DSB/Gp6QrWEt+gn60ARa4dInk1oCVzfpSUag78ERgqiCuGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712309307; c=relaxed/simple;
	bh=2cAmqcIHyrbHhGybTCFdHS/3brV/c7gmFnh2geGe/QY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LTtFrlUx94x70NzDci+ivkU5DqDVGxjjWbuIFoojQEJ8oSllmiKTqbf0yv1ZjyBJujVa7q5VBzKDz5wEzzJXD+UuLqVcpwOmJtxHGbOf7lw1K4twx9LGqbEebPk3fiul1Tgh1vFShTHOjfSeLmkwKeg6qWda/cfeGVuhN9KGYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wY+TFigT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wY+TFigT"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso2256671a12.1
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712309302; x=1712914102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYhVWsiKKRdx7jYs05D0WEroCMJY9Qd94N0BcccLXcU=;
        b=wY+TFigTlgufm+1qo2I/664Z/qRRmy7OTHv8/1XmZ9cRSGvMrDnX8mqwiQ9MLyeyn/
         hAJIIFXxsa2w5tmrAJQuQKj/KfaE1hmxMrU3IGdsdP85VGBen9Xu4MweybiAGASynJzb
         GFKBHVbcLj5SUN63TLUaAbd9rXjO5gwvxbMxnW69K8uk7OyDWS6FthTEB9pgLKUpMyNm
         pIk/e5qi7cqLFawKYcVYaIIH/hmYu/GawAxIOvevpK7eK1wbCAvBM4rFykMaSBEISmdU
         YPK7lyYNQHo9V8PRqKybfpPpoX7IZzLtPbzK80sHPmDUrbkPPtlXuw8PnYTqgwdWXVxC
         sgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712309302; x=1712914102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYhVWsiKKRdx7jYs05D0WEroCMJY9Qd94N0BcccLXcU=;
        b=ULWvTHt8Q7YbIaLji9QmBI2m2B7YlvRE8BcSoxhkoV33pTqocMzmGLS+begOUB/Hye
         LNKC9c3JCJMZJyO3LML1RPW4SfeUG2c0m8Sb0ZhKF2Vq9xQzw39C4l/z2X7FudaIR8Je
         8bdYFuDWMB2h6a/bz64uHSY1ct37ECt8imFwUGDwLQFcENSeYvuX9c2fbIMx8OCrE73l
         mlSmDG5V/Bo51ML5a2xXEjcvH1CrRiO2R23SxFAnwR4O8Jfccfc739DbmcPZTewox9/V
         tSp8rAyVhqXdTd+qrHuDIRFo17S5epheDpkccA0zpIPRdpkf4wYF1h+r+8N78muTmt1s
         NV0A==
X-Forwarded-Encrypted: i=1; AJvYcCXnSZeIEUJP8f33BJRa6HWQ+mVuYHenXvRwH3lLtr0ThoSoYr+PrutSG1i70siyF2nCA/RCtemh4d7R9ZseqWkRE97g
X-Gm-Message-State: AOJu0YxEb/LJeNpRUWOFO11RGUgXLX/1+tWKCPFupgjgSb+N7t1gHVRy
	wpBpi/ngVxsU/bq9m5l3+6Exq/jxATM7dpIKTplk6mC/rNmW2UYwmfS5btqe8wA=
X-Google-Smtp-Source: AGHT+IFkfahotwq8cHOkal6qSEvAwTkdlqinu+jVeTN/KjeYhmM03EB06dwZOWx3FQkSAjd3MFhAYA==
X-Received: by 2002:a50:d6da:0:b0:566:d333:45e8 with SMTP id l26-20020a50d6da000000b00566d33345e8mr664518edj.20.1712309302296;
        Fri, 05 Apr 2024 02:28:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id a1-20020a508581000000b0056e2432d10bsm587750edh.70.2024.04.05.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 02:28:21 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: imx8mm-var-som-symphony: drop redundant status from typec
Date: Fri,  5 Apr 2024 11:28:18 +0200
Message-Id: <20240405092819.40994-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"okay" is the default status, so drop redundant property from the typec
node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index d643381417f1..affbc67c2ef6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -117,7 +117,6 @@ extcon_usbotg1: typec@3d {
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
-		status = "okay";
 	};
 };
 
-- 
2.34.1

