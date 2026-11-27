Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800929;
	b=gr/jS1Ry1KctSK/zuBwBKTsiE5hNASpK6Axk1IVqwHI1WL/LVo7QD7LPqOYcV1hdAf4W
	 rhbvJZzBO2HRlINmWqlHzcZ0HJbc5s3T1/i1Os182g4VOMpN9A5o5T5/RARs6WbUF0Wa0
	 Rf7loeeA0IerqzyJC5ob3QV9ZRA2cPubo0VBXmQJQXiRh/BAxL9Vg7qICX6xmHXToVopP
	 vsWaUPqFgw20LDgavAdG7ska3L3DV3u0fKGkjkpXHS1bn9pkKRgok671PatYy30G8lh3E
	 i1BDQsitMVuEuxhbubg/Qq35Oyoc5zeRUuDznTRyUlxCylUg2U/JUWPIoPRYgIEJjtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
	b=lfbVhGYhiC8TLLhvknKmkWz/PBiZMajFCOpte7F/irV65rxiBv4+crTkX/Gc8CuOGugu
	 qlgt7WwCMO/aVyyhA7oO70vTvSaNkQSTY54hjbaHwr5TZYGajFnvlDAwcJ8IQhcsTarHN
	 jP+5FOde1RpwNoqQky+rMfeHLA4cV0DNjI+o6JHnYe7tm142r+vPoA7FIeiQ9WtuaSNd+
	 tBdQD2vX5h9Gkoz7fpx2yn7Y90GndXvUj8vMPVLHnAf5ipfYxfvXMWSnXhgB+dhwy7MLo
	 EpvqhOPax0MdcdNWa+kRD1N5M5BCNBybAsSqWvB/uXOWImtQqmj1a7iG+bCNFpWYIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiygflLM;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E35606A31F
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 17:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiygflLM
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2da1667b2so5070758137.2
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800927; x=1796405727; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=OiygflLMyNc8+gARxHlJWuKQjJSWoa0aSya96RXy3m/UuL5P7b+KaQzgbpSxlCUz+n
         eIRiStUzy9lZKkM+mNn6oeV5cCkZednyb5eI6C0D/+iZpf2Wketzx/p04kzANjaTG0jL
         zgKoIpcliAefRM+w+4VdtQueoZXvMWgFixcEINuz90o4Va9VqV98PFZq+wfT5/xS1THC
         vpbTQmccdz2B3jI+x87Zjp8n1sa9+HqSjr8FKBzBbXyQ9ggAP38vjxjN4RmvvyIgPJJm
         Q/bKy05yO7KKHpU8/2F5gXR9aEcXBWjgrUCOssC+DjGgg8oF7x5NJw7xBEM8Lq7cqaT2
         /JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800927; x=1796405727;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=qWoArwAee0EGV328CqRTRrx736+1FQmEwXM0qMNB+yGy4InwiSVO17VuMY8ME5aIGr
         7T4vzPQknGNxz6cANzrtRcL9VZMpRfWSGYhlRAoHXHr/x3edpvvqyyeEZzBkygtV8s3l
         fztJWjFeqsHybMI2IMtstghUWs0jeH7mrrIqdz5uVTFwQgfKfqJRnGaC2gzr/jtesMTX
         BCS3+Jvhzu1l2yQoDjmNPAmXomgdw44UidxeQMeGPWHrEUqErNmQwx6NlKp+1dbgrwM2
         sE5neI5Y7VUgTFUzEigFEfavYoQzZEzYC1TWLTyby0AQCHahZgbMVHcJPEzIQZvVjU4J
         jzBQ==
X-Forwarded-Encrypted: i=1; AL+hErGFqQ2cu6DnOcxWxDLbItj35D9pzhzqcByrE/qt9V+n+R5ICG41jB1w50NqYx5i349OCeI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8yR2FWLsdhKS80GVswRLc3ZiTiNWHFK8SbbRQYEcka5s0uwKst
	6Jmw4UUWEQX2dMfQ+8s+OU2cqUry2STh+NDffWvs1RwVbdRDaz3XEx4A
X-Gm-Gg: AZFdTZevFV7XklOhvaym9bQjWyl81GAN8/dwJ6j8Y3zb3YBewO4lZrj6BtWSwpF5TH1
	3W2CJZbmEDKBmsa6Fwqq/rON1YmqW0qqsmFM2pvT17XlFXRAklbSJ6ztjn+Qx6q0JKHzZWslr6C
	TQGl8qgpY3mbhf6qXS9oyb9ofrzLOvvXTjKdAPMm1Yyp3pCvbf2ORhbtcS4JPV+BoPYpJuTOPoH
	Kg1Od6TTWedqZUgKFax5L/QSY7HXklqqwW/ELpK5F+m5A7EMmWuyhxVeucuZ+oo4Q8h61ETUScU
	W4e88tgahFWo7My32WROzPdP+pI+RRizu2K7mlYmE7jR4q1ri3Tt28zDn/I/XVMUe5oBhNXXLql
	rPo2jRKMs2zUFL71SaOcjUZAaGshj1lqQ0BCa512sIFgW6Jyaf8kVwrki2lCA0p8T/I7ZsldUVb
	padlexqpyvoQ2u7KIaONztMz8moCMTRq+W9ZWLHjdHDof5NFTiXTd/WZmaFSc8FJ8ues3iNtxHy
	l1Fo+m2z5vVtTCTjO9ygHrEWfaCEyz0sQDLBp6HmIo6pp8o1tx1hYkK8p1vN5pHof0fjLmUSkVV
	IacAhPxGhza1eFQGBRb7Q2ucOlsMb7U3Vw==
X-Received: by 2002:a05:6102:b03:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d739450a75mr15786710137.24.1795800926783;
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
Received: from [127.0.1.1] ([2804:1b3:a700:1033:f688:69e1:e4d:ce91])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm26107747241.10.2026.11.27.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 27 Nov 2026 14:34:52 -0300
Subject: [PATCH] arm64: dts: imx95-aquila-lotus: Add internal voltage
 monitoring
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
Message-Id: <20261127-v1-aquila-imx95-lotus-add-missing-nodes-v1-1-162c7ad8c302@toradex.com>
X-B4-Tracking: v=1; b=H4sIADy/CWsC/x3NwQrCMAyA4VcZORtoiivoq4iHsGQzsLXauDEYe
 3eLx+/y/we4VlOHe3dA1c3cSm6gSwfDi/OkaNIMMcREFBNuhPxZbWa0Zb/1OJfv6sgiuJi75Ql
 zEXWUkJh7CqOGK7Tau+po+//0eJ7nD3Ngo5t5AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795800922; l=1592;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZxK2MgG5q/LBAnoBWmanwjQtuKQAwsd2KRSb3AQNx0U=;
 b=fZ3SskkRL+/kfEm2nx7HRYt46R1l2PAl/6TN9QxLtD4GvefiuN0cqUMqFN68SMXgstgNXiBP8
 sY8QNLeMM/vBzuFC3QyrLocz+cMYwskiJBnsKtSaP6+1StD2RJak0PX
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Lotus Carrier board routes its 5V, 3.3V and 1.8V internal voltages
through resistor dividers to ADC_[123]. Add the voltage dividers so that
the internal voltages can be monitored.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
index 4ae600636106b..7c20df249eb20 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -34,6 +34,30 @@ dp_1_connector_in: endpoint {
 		};
 	};
 
+	lotus-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Aquila ADC_3 */
+		io-channels = <&adc1 2>;
+		output-ohms = <27000>;
+	};
+
+	lotus-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Aquila ADC_2 */
+		io-channels = <&adc1 1>;
+		output-ohms = <27000>;
+	};
+
+	lotus-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Aquila ADC_1 */
+		io-channels = <&adc1 0>;
+		output-ohms = <12000>;
+	};
+
 	reg_dp_3p3v: regulator-dp-3p3v {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";

---
base-commit: ebe46fb6c3c40292eb647d0bfd5d1beb05b923c4
change-id: 20261126-v1-aquila-imx95-lotus-add-missing-nodes-d06aa510fe04

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

