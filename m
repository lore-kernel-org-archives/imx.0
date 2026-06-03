Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0AA42315F
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475113; cv=none; b=BDmLeuNdDMB/C0+nNxUR5KVYmitPwutQqiEZbNhOh2O+ADccPrFCyaCRt62YnA7nwW3uzbpmqlvayg5O5GZxOs3rGx1FjqlXlLFKEdfPKF2RSWDHEZvbDniX6C3B7Bl8EFXtRQqBdCt6l7eMikn+A18x2uMNODMnLjgpiCIVm+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475113; c=relaxed/simple;
	bh=LZNgjFG9EBOVSjjHWPD7UZZD7Fr0Nzu8jQlkaEa1S00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9+ajI/TrYuDk35NHz8W4ZwFOpw7NkIHI0sod7sr0Ap1gC3g9ZIwK/xWiVWqbkJUnRNOsw0Di/AUpyRCJtP5zI9ddQDF3a4kBPW2YtDBO2dRp3vX3NLRqkKHYG7VJah8PedcOEXVW5TNiWMlRxhvfTA/XIYsneovapCYQrSqzcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvN0Y99T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvN0Y99T"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso7804625e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=gvN0Y99TEE/uqMRQUlqrWEYqUP1HilB/H2TPjwAAA0EdoUbZ/qcEbL9KIu56QPY4DO
         0c3LjlHPUeJe67HLFLsLwxvrlCHzR9K1FMSVG2PQRFSIpTwQAGcYyUwMqGM5eqMkwnr1
         5juAj6f7mqzJoncmi5tuRCVN24UVq5/WjTRdusw4gwuZd/h+WCiCALPCuzQShJKkWCkJ
         q4xwwFMIux+hqkEtbsOzlShXjUw+J+WsVva6QKoQq9cts08RrGkkFFW1ZixSXHgmUawC
         NA+7SCmk5APOqwTsW16C2SrlY9C8EaLnxvYBRyygt2ealaCuqjF2jC7NVYGwjSCAq7u+
         28WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=hmvKJCsLd/69t7W49kOZMdhIv7ZnXmbLtpI2Gt1MigY7jhWqTcRS5UEEQT10ODGmUN
         8JvvDT9DKrZsD1K1OXIgnQbIQ8Y75QmhR63sj91VAw1Pad710LJGkww1uvHb3Knkj0wt
         plkunoqHWYJZumgPzQPslsEpsiY2RGPC/i1zCeq6ZDayEIs0zL1aBxNnTZ1MNg2NWjad
         AwA2EXUP6nl/CBNNKpkRd87Xvop4m2woE6TP0S4EPY6WTrOEdHEpiNxejfHs7dkOwbL9
         sT8yftsR6LJhoSW0/1tYQcmMS7UM0Qha9PteL9gahWUhGqyD43Z9uufYXN1/I4+Dx/e7
         f6AA==
X-Forwarded-Encrypted: i=1; AFNElJ86nUJsulVBY2pNUwU3bXpeA3UTKd6uwZvb5h1JUQfCCgm5UrOH9MQvJQWtpuTAs7n/apw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAEqFk3o7jrDjtLAyIoJ/u2ygMAFsJGeY3/mf7hFxdVwlEbQnx
	GNDE/tf2Ef1hdYPIbHI/+h16HRYodGkD46EAzzky0NWYetngQ62Vgw0k
X-Gm-Gg: Acq92OHUiWXuZdh6I0qLaSp8UEITRTe2foVRUmXvxDtyD7iDFTaTBI263MRAWZtKfy5
	9HsgVheuMg2CzVw3KMNDtqIaCiC5JWfgj22mskiMqxaQO3sv9yJFIH5xx+f/WIt7LpFkgLvYMzF
	JoLaIwbYX8C1T0pGxSAnQlVu4mx8KuCJiMi6RPz3i3ZHQPaa8FIVWMwZEgZ0DQn+13caZMnEjsA
	+sAhAPQC2DqY9Rrb8gAmxJxkS5bowXOg02Lfi0HtUVfQ0PfoS2LJqKtL7N75SY6FyOhh6zeni/N
	DMFvsaR+QkK4Di69SjE51a0jmeKllrc8ueh0wUpxFAMS/5a0oguxOOdbM0N03kZQV6XKBzuye0K
	mHTQ7uiDoD06AOVCPbN6dOKJZtX1Yjg50dH8dv17sN9WKxeH8URQEHnHmj/Zeoeb/8ZqLrrNAWH
	hA8ea/oZVKiZxp73/BqO7f/1fyqZQc4YG4qohxHMwBmbAPA8k2TGRVdu6UNHKdK1d1atHDcwdW4
	EMSC+JKM8dfCcjxtV3WrXVIm4Cr7hCQFe2MQf2DJuROqhj6
X-Received: by 2002:a05:600c:c174:b0:490:b258:3576 with SMTP id 5b1f17b1804b1-490b5d1cf1bmr38390695e9.7.1780475110617;
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Wed,  3 Jun 2026 10:25:03 +0200
Message-ID: <39bfb7ce8a40d041f2f23344eadeb641a1cf9275.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c835394468ef..56f8744c861a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -320,6 +320,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -442,6 +449,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

