Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9DC47799B
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488007; cv=none; b=n+QSoKNdmrMDClJ2JFycnIpNcYbb0z7MX1DSCt91OJaQ7qNyENTIAPTeYRGUgFTlBbj0xjsmMR7BX6+I2xNBSNt7gQXqqmJScdZ9k4EhatGmmq/rXTqpXAuIwf9TPur24vdPiAZ69tj6kfwepmAMxJtgaox9rE1jAft30wD6c0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488007; c=relaxed/simple;
	bh=va3FMAj37lmAZ+RMmNYaBUL6BXEPNT3Ugfx7uxjQSl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ep23ceB62J9pvD7CqZQlMKmQmL/1HhWbU+vdwbsUSq1Kv6EQDDhJwAdRhCWr/69yxm2eiMiP3ogIfSf3QRQR7CMyU6BBv070UqJPuLolVD1BhkIC9oq5ldXx/rOr9n3NfMiN9iCkPduicacvAH73mZVnIH7pD50owFH0MRgB1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIGAAToG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIGAAToG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b7866869so7373415e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488004; x=1781092804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=rIGAAToGDnkewjNRj9/wvlgnTzFsK87z0RR0txTbNb+3oM2Qh7oYncmnbqA0qbmPcV
         3MMcUDmzB32x0Q0NjrZOuPYtPbtFV9IxWOuIO0/qWnnnOVd3UvBeGei9lypNRm/odwR2
         61ZtvrWWh3lFE4xPDPFqYPkUhkubhtVZoaBCQOs1nP3dEYeFA7ivTRd2aQgFgAxgXC47
         z+wQOdS88JdQe15Ey0dR7g6Npo+O7E9UTflbBhfEEZP0Y8V2N2ljV3jCx+xzH7jvaVAm
         wmQZawpb+XgJXDBTVVVXvxsT9iqG6dnV0Lc85180+ONCogC5CP3HN43eAdel5sqhqbjU
         McKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488004; x=1781092804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=PVcT++PraqDuVRkXVPgDr9x47RLgj3VO71XMQNiOt9LNmeXwQnoZL8glqfAlHG9bqr
         xk6/WkN3H07idQQg7PfSXaz3qNhBg6xHLQq+vmfFp0YcAua4lvaTaNNT5BAClQ9aCRhg
         h6ZfNrtNaVh48wgi1ktwlYFq9jgrK1s6f0Z4GcTxlJLYeubiTS2CnoVyVkUZMryp7dFn
         VzzCmE/yuX11gAhF8RGHMT6b2gbDL63yM/yq8SdVEVWJ/a2zsCS5C0esTRwH1RBIdIqq
         kYueuxCXN5F384B2B7uTH2TDkRZLZc+x8RzPdimj9fWYU7OabkRbuY5nxpldJs9JXKqe
         7YPA==
X-Forwarded-Encrypted: i=1; AFNElJ8hETpHc9xGtytZVeolNT+ugk0/tA9ytF/J3mPZ2hcLI/szNIy4WXMcfXsmNN/pRWmJvwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ZWouoDYPW+jRyuyylmvZIYa5ruq2WYD1Fs3u7fsfkZwWcikN
	V3qeEGbEHR+DLVU6X2d0pGITWnnfRvnsthejKok8CS9yZeb6Vzy2WiR/
X-Gm-Gg: Acq92OEoYzZSKfqh0i6eFfUVLLfXUWnfrpgysSnCLXwSuiV4/x/0A1Qh9ATb+06fZei
	C2lCjyHaNIH4r10xBsfVri5mrSBs3h0ZcJH1k7sohpwp/GEb9iD4M0bKs7h3OJuflCyeUXvUjE/
	suUXwZCa/nVMXmfy2udk1+cpU2dG+5J35+ieo0zilM8OktWPBYBJVm3siHN+9k4TS6DyCF9v4cv
	wmqMPy9L5WpFKQ2blAt+TJcwQFa6E9lpOM/N4lruxfeDnq0ebBemXMVJCs79RI5IlNMjdIs9nxP
	8uriQ+N3gCf9JVwF8oVrGP98OOTBct54vWL3lyFvS0/65GaUWsvzhvXvlVtBQ48qk2vJN4+Sa24
	VP5ZC3iXVbAXtcM+jVPNvl8/PgC09N/qN3FM7LRYlfD+PJ5B9qz0/7XZxiMR7/2SXREW7HENBIG
	PNkXKhoLkWCfJeyw0k5Zb9fAkKgkEjIDETRfF29LrPW9/RzDukuDlw0H1DjXjucDXFeIhUNuBhK
	A6qIo27SmAGvJ2q9DSvIvOEWyJguRd7Z1btp0f3ywxrsKRW
X-Received: by 2002:a05:600c:8184:b0:490:b5a0:ccfe with SMTP id 5b1f17b1804b1-490b610797cmr46813405e9.31.1780488004248;
        Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
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
Subject: [PATCH v1 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 13:55:42 +0200
Message-ID: <e6d7ce3ec53b1a4fca1a6f6f7473e9c75c04f30d.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 935bc71b6ee1..8f8c76993fb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

