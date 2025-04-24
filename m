Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950C221FA6
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484490; cv=none; b=QKV8ChbqzibFxS9lnxdYF25VesceqF/UIUjVIfBIkCcHEb5XuDiBp1mPt/Pm8SSQQjjfYodhaDWXoj+VtXEOvrc57y5ouNc1DilFJjpaQRlzBwxgqedJnYZkYomcQjyAGLvUV2ePF07eZvu1g7SmR2EJ1QMSeOu5XFEAQBZZ334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484490; c=relaxed/simple;
	bh=vXjz4hOLTpgU5jbVh6VigWCb9ovYngyk2paVsl+ClIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRMH5rr8BCe8HEK4fP1dLIjTqdvcpkCBfVjnwKsmQYdTgE4VP5d4s1g7vuZ4okXU8Dod3XXo6GibSALU1kYLJ3sNR62fQMzHKbYMxPl1PhHN1KbMLbzZXr0ThmgsiYys94N5MMJR2Jc0zTwJup4R6YhamBm93I078KQbRZR3UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVEB7TD5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVEB7TD5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e83e38d15dso91767a12.2
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484487; x=1746089287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=CVEB7TD5cM2eoA9tF3lZN5Eli4yf77WrzhsFJJnJYJvdocbXZRcsH36jaB8eH2PWZJ
         /QnIbaZ5yZbQP1zbYt9WDJ27067TW6c/+lNa+lzULvA4f8adDs2RsfcLt8dkfoXN42tv
         be2e8aTn+wVEZymn8joHKEmuaC6EDoAA8dUr+yMkzDGh/piYeVUnQPgLD56uOjCTmZ/2
         14yTiYTpZFX/n6spX5JcPxJqWCvvfm6rJU5ppvCTiigl8u3y8QzgOUCDTdafPtbuWH1m
         AlMyse81EPpLOUe01PLLabOa8DTDbEeb1J1IGHZ1M/Ewi1MiizCBFKIVzHcNU2zSCPDl
         JtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484487; x=1746089287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=THPojvLTRB7uSshTnX1nqD1yzEBiU6AZ/cMQAZ7Zdf1uj2D+0yr+k3VoylXrADdiB2
         Uw0vsTuQvL5KTylQijq29iILGqf/58wSNdUpdHcUwO3YvsSKt4tJX+C2vDUBq0pF+FLq
         rr2rTvja0ZAzzERW24oUFC0EsHNLzcQ/SvO79sBLFDsbPJv9Pax6e2d7TELPq8NMzqSh
         nXeXbPr742XfsKwTcjF/L9YY6Yaxuc9EE/Qjz/OTcoG2jAOr+Hrqs32jJHETNWj38c7U
         sfyLnfPdwXL5Z2BhaQxbOeEtMGfyvftg4GpcGsmT27Aw2ZpxQpJ4v2V7oRlc3QM+t1w1
         q5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXQT8+w+rDoZTR2b5MCT/suoccxMLh4VEXhSxMTMSZWzLbJcbyCWhiKTlc0sDN+LLqMvrg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7/sSLF4LkjRherX1+ek8vvJ9AQJwDaShRihCHk/T1rPPkeSAz
	osQGaM0s4ltLtxGJogBPPmmr1cYchuRmRbLku4LrKh5XEsUBXT7dDEVfnY53Qxc=
X-Gm-Gg: ASbGncvk4uQuHXkD4qClCMTsXiWqWBTIm8NcCe7Wybj8CWhzj141ZkyYpWTpHs30h7/
	cYtLyd43qY3atWPBUCmw/3qS8sgfHuIhJ20YZF4Jbo5whWasQ357sctWXTz2m0WjEbK2nU+RqOU
	iVSh/gcRO+sAneSOP3phb7WE9ZCmvnZv63jnB15Tz5X8J1hOO2Xm0s3MTtkgq4qxDutRQN8Ybj3
	Dcul9zOZj2+U9dw5YbXYl/qJ7MHsYJzSuTshDyP7bO9nWdSL7CObFWYj5Pdhzz0gYQ4yFlzZD6H
	ydaF48iOhcZ6ER2pwyOkuUzekunM/vQ6HxD+4DvOtZXhaL7XPA==
X-Google-Smtp-Source: AGHT+IG88LOYVsDqLk364RnZfDnVj+T3Ptml8aT8MgM2ZSYv7HiItMyaObLOH5qjcMxgbUE4cd3WrQ==
X-Received: by 2002:a05:6402:1d48:b0:5f6:d491:20ca with SMTP id 4fb4d7f45d1cf-5f6ddcf7f3bmr612417a12.2.1745484487068;
        Thu, 24 Apr 2025 01:48:07 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6f45fd3c1sm118998a12.3.2025.04.24.01.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:48:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:48:00 +0200
Message-ID: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
index fbe260c9872e..cad985e341a1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
@@ -384,7 +384,7 @@ &usdhc2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index eec526a96311..ff9d50942884 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -374,7 +374,7 @@ &usdhc2 {
 	cap-power-off-card;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
index 2c52e67e5c14..a6903ef2b093 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
@@ -299,7 +299,7 @@ &ssp1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2

