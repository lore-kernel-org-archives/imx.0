Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585143;
	b=XuiWaekyFueaInMgTJRlhwbXa8rlHMnHwv5GRs1RMj91+QZMeGLbu1N7A1L+as7rSUkJ
	 qyUtYm3DhHFOrK/LcONEsvmr4o4/1xyB8FXoOf9sD9WnrsqpgxnLCxUpUGTKMonFc92tK
	 39L05XWvaZBIJ0jlz6+8GwsKiYK/tf9b9dQHXIoMhkOHVnV/owCxSESuXl/494/UDLN6p
	 ToQosstY520rwQR9FfKUQ7hfp8/pGcIJRxwNU7Q0sT38YyvlrC6lwHAoZ2jT/sKiHv4VA
	 ACO9mw5McBQfKNYzetVnFRHajG50xH4VtxCaK3o+fC0bsRJ9qtatrNpumjSFP6wkR1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
	b=tBcObb90MpJ7VgTt3tFlfk2ydE5yX9dz9BSzTGtagD8HMElq5wGMBcmY+uJ92dHWKZIH
	 5D3Ujw6Dl4YKHskX6065PJj2aqFyq/mpHeSOSod3OssNoKod8JjvqlbEvE1umydwWW6z8
	 v86hAgypXnIOgmkcfEjlaphs2V1MT6R/o+BVzyzw1vj3jtGlugbYhwyTmxcv6HPIrVdHm
	 PTt4OY07w21McIpdOxn8qu3tU8TBa03UwkYevL71DOBu+aN8n3QaTK13CwGPI+jpM5DEp
	 axHys32aj1iyvgKcq+0Hv/N2R1zYYjUwYdG+uDHlccAUG1M/NSVq9uKVARRh9p+cayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PoCujI88;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF5606A333
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFAF5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PoCujI88
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2e14babc8so1669163137.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585142; x=1795189942; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=PoCujI88aIhCtIA41ZkZQWVclob89wuDKufQdxvZqfjGbpCqooP/Ts8NjmcTmE5Gvv
         EBMay9lQlNPejjyWxzk9Uqk9ghKb5ito4QnhMcN5+O8Ht3dNC+fFZBGYlk78OPVpeP+f
         3KsMZdpW4uHChnLN6fBe2LatqYrmV7vgnkDNSLrsloX0Tag+xasyyA98TrQ+788IjziF
         4GKMIgQYFke89Too+kGsvWK2pQu6PIAkllKFHpzZhuonpFhdotxxs+ZCooAv7dgqNk2N
         vpv0ioDhsax/kWWhnBNd4ePUNIrJsKkFuE45yws30ghwouUiEMviwAgZS25oA0W/ekPC
         4XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585142; x=1795189942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=cQrGY7IE9CpzqurKS5j5WT/gQnkV9wfD4Kg+UNBoASeM9Lp7bkffLL6KWohRekhlc+
         M2rt4jpdiuIi4yMBUWWAldtmVCbVES1C8cGDCl1Kn8iSqYKGnRCHscPWhfgHIz2jJdZf
         HoXlXyubz4H8NlCA0x/YH420epDKvC2XDFWFYBwa8K/pa3v0mDWgO3QqHWuHDCsRWhS4
         47lmlJRbuq+wrA5CaJRZnT6e68WM+dF9fBNoNKwOSrrok8yErTBTDFPtS39P1XK5LNWq
         FiWqkm2OczJjre4oOZ3uKU7Be7jRTUpk8/rr4v94NwkkOdsDYRqtLy/eVvF/sNQEA7Zs
         vrvQ==
X-Forwarded-Encrypted: i=1; AL+hErHsrkaPYNkTcy4XG4uXV6mRXDfXfnwlz2rfz15WGW4xrfhw4R6BA5pwiQ5Mmj4xFW3L3Ac=@lists.linux.dev
X-Gm-Message-State: APuU4Z8jBpofarKxCcL6+HmMvg4RFovQO+Gfrxst8Sn8E2LNUmpV66tn
	kTcyQnQsJQZ6H0kVQUUqFjq8iZxebAzI0rmr798Je6b+sjpwVCihReLadLDx7KJq
X-Gm-Gg: AYBFou0/m8hOAdm+93m3rmYqASePZfHGC1fWE1GWhsunpk+V5V8TA+w2+Q97+CprnHi
	OfmMSybALviYsKDPxrLqPe1d0ISGCfTaichiaD7BbQYrgiNBwIqE2SqNF1PDrNk0AARZ2GYLd5+
	80bFk6uTMgNSnkS80WXz0x9lG2K8j3LYgnAPbjrMCFF68RwhZ1hsr5pad6Q/vbWBlY55Lr5Fh+M
	5Abc9Wxcph29OR29DLowDQJLZHyAzuPnjcyhPwuITY2ZvjaAPbv1s6oWztEQqiZPdVxMbxDngwt
	TgRUAk+pRC0DsU5YRgpCVi0Av33CxhOMc5e0N307g9v+eWpdbpE2RpBIvMjab3C4T+QYrv0zs6w
	jybYATCZsF7gFmRi8QWjcrjxTbUlXNjATapajp1AIWCfuTuRxqF/3GCKqmnTnFoJEpMBJiEre4v
	3p8NBwtimh+EkZNdHehSr9fSkgu3pMnxHiBBvSvFVUb9pCa5gZGQBAjWefX7VbZG7ijZSL5CHYM
	B7kUY9DPq/voTpGeFG9Joes8+w4BzJ5p4HYp2QBV8iSjrMAZYdFEY70zAq+BNQTndQ0P91d7jeK
	TgZicrhyn0lhF20OE1t1MaFugXtE8U8b
X-Received: by 2002:a05:6102:3f92:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d64d7b3c04mr1034478137.21.1794585141712;
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:14 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-3-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=1182;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ACMvTzpi3rzHKOD3OMtDyhYbpZE8JqAqCI1yxB7JH0w=;
 b=HoglfcWoz04OuPV1Vqs6i563kJXTViuwqXiS/eO2JdpSsEGKBUKtC3UYpYkiHWO3E1ZIQKdt+
 ldKgsbBl3/UAFWUXAlzaLfYPZA21o510HWbuOJ6lbP7HRwY//8EaqMI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c8..c28d63293149b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

