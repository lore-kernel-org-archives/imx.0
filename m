Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595050;
	b=qD5f++zKJS9w1qRL0zvv4PEfYwQWMWCIBw9wUrb7g9lolaxFRV/RMywAZTHyvt5QQNht
	 Nk8Dtw0cjEZHplju4GrYGhggvN5M2rvTEnrAWNHKqJEBcmciHGUG+g+3O9SfG1a0M5AcU
	 Ta95o22N/tXE3ractDt2qmk7xy7ZCoqwPVa8BXs7Nen71Uh81//tUQcaRRCNEEsSTZJ/G
	 hm+lc8GW69EE9eTRC1TqrUpOMaLsKcp3d9ZLIN5jKPavEnbDhRJrnfa5Wbl+GqJA5qO/4
	 Qb0/2AsguM2Ps/rObvEPVh1JnFZ8DzHQjZgLPkeZT7fcVv+ulQ0SkGTMY0W5TzN9Ekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
	b=XkNTpG/AHK5pg9vyvsQQq70HlXBWM8mSex9KnnAPSNpQj2J3s8T5bV1LXfVFyT5i2lhd
	 rRb6b0RmthRzpo8hFZ/5Q4W2crNI0EAPsN8djTUpowWjjpaBeww1tl5G7YWdpMWudlCWz
	 3aHTFhHh4W6SO4wc0nc02fF4H06JRwbm/yNnGiL4Ll5oVIeXTEOz9NPMtcDqqOT3tRW2G
	 nJwN3ar3Dol+9hRDcC6fmVvvEquzdQnexAz7oHlfjebqASIzmWbBkvg7VK8qIieW6qEtq
	 spnxY3PQyfG64cjylVzgC7wfwmOLy6vGp94TmOTlGwiPyj4J/OyNNF1/V1l8PUkOHTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0TttQ02;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01981606A31D
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01981606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W0TttQ02
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so7428785e9.3
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595048; x=1793199848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=W0TttQ02i+EtJCzZGIBB/xFOqBwujyMNp8arV4e+n/HoMYJfnhvHYNk7qSD7xCYuG0
         SsIIMx0i7iFq2ddibAvJ3aVrg7AamLFWAQF7ffjkenuS9kwoTOvKTCTYDuogmbuyg/gq
         GlDj4Beb8DaFRzDbWisE4x1DR/NmHg3SgSeS7DMgXp3GLEy7PWUhMYhP9N+gpCDyN958
         qcqieeFwmwEAFT6PTqAIrmOSbqfMGCq4FVe0CWGKfNj1UdrFkagAjBbn5Y4NiInWzhDt
         r3aJy26SZwzf1Q1t6G33itXWNBql1d1oypTxjvJdLXLl3YIrWps2ooKSdc1mvAij6k+K
         77PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595048; x=1793199848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=aEHN64pcxAA/EHDXRiJ+/3qGnS5SIApyBP4qiVcovmT2o8OxbI+lwnFNSZqRo9uoIN
         g7j60eAEJyNQsA7PJB2PTQ3V9ECQjUCPbnOKXy1TlGoyU/cHBYQmWDRyjwNW6MSFRSzP
         FIQ6VxZMsdkivEzRr/oRZ7QwrnI/ezjeCiaHPetu8/zoYD2Q1nqpAiovG3nsjS3++Z3P
         vXKufUU6dzE+9lpvQgxYCccRW0b3t9FmU7CDxUSghJIK1wzRXmLLlWREg4xXJMKYWHAM
         IwjX5A0qYesh5JOP4KMXc3YMMKOQHzTcpGu+/QUGwUU9BvWbN9uCgC1I56uFJ9nXx0WV
         NEcw==
X-Forwarded-Encrypted: i=1; AKwUvBz2sdkk/OZNcAGyFfLJ7l36joKGxVs5RNY3fhjLAJusiL2ApwUNgKtPBiLtds4Pm36X5Vk=@lists.linux.dev
X-Gm-Message-State: AFq9FYK79uE6Th6MShH18tcJBmsiV3pfIwSL+riTY8uFBRZtDRfzUrqU
	r12PzdORHRbSC18Z+xif6iKoVfl+GZwxKwNyd53ntP5qe629v2NY2XJB
X-Gm-Gg: AYBFou3nST5IXCRCkzQ7904SbyP7R+ivokl3FlPme64BCzHjJSRgr5OXDp7ab565JXB
	Osj/eKg987An21rDLN3pl2FJh1n5iKTwAUXARt6O0dukJ59X+tUPbN+OI7LlR+9899ZjyQMyknP
	4r/OIIEyZiUA4sipkjx5o1Apzi3kE7J6oJit/VrQk0M5RLFJfHWbO9dtqHJb3Yyc/dVmIPemYs/
	tgoEpsgYFDMhfvL3SLJXWy8mGLau1RnLlGkmHydRWIABe1nW8Nk9CbOkw5fQ5kv+rSokf7AhH2Y
	Z4LTGBDF8UFo/Gn1I1yxTzy8uuQwbTN9WEyk9CWHYAySgmfLy57TnvVPtYonF7v13o+N3VnqJbi
	mIxSjqPc8gIFvvHXpR8k+kcPtchE67rW9EKs8omeKW6hw+/KpjTcIJqLn1unYcVmFxMGU8OYEH9
	1g49UWGTN4R2FGNd6cK9HPI1VJ92R9ykpNq3ZkjCYlF58ZmImz9LPNg5Vx6f3KHhfn9L1L89rn4
	vkdkMSIWj4pLHkeb9T8o4iBETj5+5OcJHwOjFolazok5SuJRgtMnbam/4Xk8gfg/aSi99h4SfJD
	bpyfUXi2ALQHOhuP1hZ1rnMUefrDpqOS6SX2hxpU4Rv+76UC92OrHU9fQw==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr51336125e9.1.1792595047719;
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
Received: from FLK-B04Q314.fortive.net (217.97.98.50.ipv4.supernova.orange.pl. [217.97.98.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm179698705e9.4.2026.10.21.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <sympthicode@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 17:03:31 +0200
Message-ID: <20261021150403.71569-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - sort TPM6 node by unit address

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

