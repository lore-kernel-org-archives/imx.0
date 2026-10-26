Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018112;
	b=qogDuJDABstDjxbY4wE3jWGifETxYKna6Lry1627O5DrfG2E87fKcXdCCoMpCZS9W/ga
	 aENVGoMKkFw7qqsuPmPnEvjEVrfBmpUlrwRP/v+kCGuyq8LjQTAgViKuXk/xFsWh0AiUC
	 nBXS/blSndAmKB7hogY8nud6qXwmw7uoZZNm7BQkU66IOyGgWSTXx0vHaEBlZRq6rZxVO
	 5mPZWgmTFmc2R4fZttJjV9aF1gP0u3c3lVHoLWdLI/RTxzklQr1mSF38uHjCVXfpsVmTO
	 ObUqopqtRz04jTnG2dRRNvfX5sMnBq5o/zDaEE9ymYCbQdKMfpNCRv/VDud3Cn/z46g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
	b=vqKv8naAUsO2zy3JjIjFgM1Nh/KNbt/03Fal63x4vAlXZmdak0K/OVfnIWMmqf0IHkkp
	 UTUP6znCGR5y/sEe/ltg+Jn8X2baORjaR69UpcW5E+uoF9zEV4NDGCxKJrqDOeFSeopC8
	 vgecAw7Kc+EF/Cw8LXnJSNgimHdP2is5x31WbwTEjvkGsqp5cfurgWb29gvBc0FmalDyJ
	 iX1afashvpB515l04rDTNu9xRCejMyrmcsSKwjveLChCWMC+eBtnjQqLxjXGemSdUoXza
	 FW2Dpx1SIWpIjme61U1Vpd2xa5mSoBViVoMJ4h50zwQbD6I1IuSf0xtd5NqdCJLlVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ijv+xY5K;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4517606A31D
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 12:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4517606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ijv+xY5K
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so1630055f8f.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018110; x=1793622910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=Ijv+xY5KDXwM7SryTpBzAJgt9beIhokwPajLtXYoiTZheCaPYEnHUsBUemSa+fTZBK
         zkOiwkGHAwQlswcwzn0dFbKfvBzVoUInoBm/qGpoeou63Kc7KusySNXKlykmJLvX7i7L
         K2NwXj2q5bxXBqVPRN1qWxUCAI1qCCwAQuzxjtEfZFOQtfm4QFECWDvjV+6E6x2IgwCC
         8U8Ph9f1cSP9Q0dqs6KnN8OOSrv2uMFf53UzBN8g5KKfLesfn8NWCbRK84ahZHyuTR+7
         xsi/8I3j0s+nxBcM3BoozhkebqW3FTHcUOtVmgNdSiK8E4O7ighE8Z8WoPKAI1H7k9Yw
         VBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018110; x=1793622910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=i7L14/HKSrGCzHt16JLfOkYjDlALoB0cvif8skwOHuXFaighMU0QUqoSlTSl2KkMFc
         9sTmidP5KB96PoNnwYTRtpxRwFaPBUs3eLY7l9hNyq1VZxkSE8KvVmxCaTcg+qHc0NCv
         1xzTA2265bPBeoOqtCig2BXB1X03zD1AuPw5OiiJvG8CpJsGFGYMesb6pnYVlITLO8Cq
         RGUuy7OdgtrkEiRP+2XYzH5372FW/x9OdG89bhQh2kwz5k1EjwUTEErohqLm0Du77lIn
         spkrVBQkW99AsCCciHVmqPUJ9oZ4J/1XEtctBkNz7Pwzi+Oud+M6TwZFSzndKBoOCf8L
         EymQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+ywcbc5XSvroul1UV40QTq0CcqKkHG47sQ8r/dVFQ7BCjr9jv2UFJLm48Au/DPKBxAQY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJkFm7mE37iJg0yC8LMHTHHQQ+dGLV2mUCDH5piXiJ+Mp11skvO
	bjVYDuvWvBSL3jks6BqKYoSNEKg7CT8EfyQqIh7dnKxn7a6YlLWY8xJ9
X-Gm-Gg: AYBFou1/UuiNJDkN8olKMXqRohBQHL0ksX8KE6DFiN7c0y7O5z9JCD+XvvALoETLKaq
	9LnP7zMLzkQMHb+1OptEz6YRknINodrLtO51OObjTHwvyreWuqC/5lC639iPR+fPK6nI+oCsDTZ
	6HDsCi1PbrHGgu2+qIam74YpR/fq2FuNdM1fO/Nw+NIL3lea8LRT6ieUNo1w8vmLhWSl0ISusFR
	TSnRMuIIdBKIVNRhQY6ibak9Bqknadn1PI6bSXpwEr4F8/zSV4+GPT+2c8IaxAJy7tFPzrj9Ndx
	9FAqiEC4w9IE1HaOTKJbp16wrhBsVt1htX5Q1A0boL7iUSSi+k+01p1nrjQCs0nweMFjg0o/xG6
	lPmwGe15QDntQInAhwPmu61WDKxgJgvoNfkEWtahixRVeD7BjgoQXcUSyZL8j0bpMdA3Zc+z7JI
	xrqhGStvmnkMrjpTxs0hcoPO62mmHQLRdx3QQTswmdYdjfhZ3Qoz8GU9SJyplP5ZHPRKndWTo00
	seU+RfnE0pX6nceLkiEEPBYEghRRyflLq8I+MVue+Cs7TBxZEOt8wnHjaEWZq3l97m/Zr2MpEfv
	qR0uS0TWycef3xt3acVpNMtBKgItKImPR/4hpDgMOfgM3H6MszUxvvOK0WmdURKm/g8zv+OExE4
	=
X-Received: by 2002:a05:600c:83c7:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a35ac39cedmr117361485e9.3.1793018109889;
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm19175944f8f.45.2026.10.26.05.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
Date: Mon, 26 Oct 2026 13:35:05 +0100
Message-ID: <20261026123505.48909-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The reset input of the ST33KTPM on the Sonata carrier is active low,
but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
reverses the asserted and deasserted levels of the reset signal.

Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
fixes the TPM not responding on I2C and the resulting absence of
/dev/tpm0.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..2644b7c1239c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -259,7 +259,7 @@ st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
 		label = "tpm";
-		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.47.3

