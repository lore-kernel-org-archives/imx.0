Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFF30748B
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869499; cv=none; b=ALfKgieCZ/EwXSTsmA9/05emmXrfBqd3F2ImZMMO9xhKNJ+dExNHR2FT4uJpNryjQceXJTAz7bCK16KKEzcX+Jsl+8Osc8i+eg3ZorQrHMHXOzaOL7rk6eXJwAGrsqYEeFUGZaX4SEwoE0QuZHhE3fOR3Y6ihB7ypZT6+/U41cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869499; c=relaxed/simple;
	bh=kHSR3OBfxE0kL9LgZuy6tb09v4e6Fk2998ktGFCNaNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZiw0eGuKxEwcCpffflHw9NpeOrYzJc+LtItmhaju+PHCRW2vgbip64G8hBZI+YKvgSyOQqpkLGy/92eVz9KlTV7U1PxiO4WZrxbvKAMa+pYWHx3/FOOHVXkui5r+RIK50GNkJGnLmyuEOTq0r7AED1AOu2yKbAIzIUsyqqWnG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ebk8MCcT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebk8MCcT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afdefc9b005so33616266b.0
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869495; x=1756474295; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHSlakyKxrjNUT7S6VUafjxhT54zInLD1iFLeYFLDh8=;
        b=ebk8MCcTA6LYmMPQ2uTWgs+WuDigeZYdrwSc/gBKrXMBL78+f3leglFO1mQFd6r5l+
         I6F8V7BzEdw2YSAT14EEBJZoDMp8uT28+di0HVIz4me5/6ytUrBI+DRaJnUQa/nEiy7q
         vuvo665fWEsGsjayhjrUz3cBm84/DYWT2MOGW8Tm6dPUzxT8pzxFSINp66fboKGj4wuL
         zgv1EuE0vuQkh3PIPKeX1/QOQyNtpPbt/A6j9Wx77ciX0JLCaHdhS3P5jHEZadyRpq5Y
         O1KWdPun4367ztis5iZYTsIgp6iAgikBbc8vEmyiIDy0LklSBZxlqptYCw7/Xr1a5NEt
         LepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869495; x=1756474295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHSlakyKxrjNUT7S6VUafjxhT54zInLD1iFLeYFLDh8=;
        b=YBueOT53siFYFACbOCf4L9+/h1sneO60bqkkeem7E1xUezl9bcFdLqaG1/X9taIYXm
         hKBq81eX2WNYeNR4R+zIRqB8AwuyxN6jYy29Ts/cBeztmvk+qajF/BJgyJvnDQJ7gZdt
         XZtWqrpGNNLeRsuQLTqELi6hvEAv3Usic+YnaevrhiQpjRTuejHDboeDIt6ZQS0vWtaE
         yZdZOMEvpQCCCCUKFcszLWJZZmVc/DpDDyUjUEAYIR1wuApMSrPGH/j5LgHkCujDPF2z
         gCQXvUlb2C+JR6Hq+oGQT1CShXVNfxJ14w1BqvUCY6+8jnLCZxIYdVLvI9zoLbQGF14M
         WhPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvjK5xTAq0Pt8CFtTGDk3sPTVf7ao3UDmCp5Ok6Pi9pzYghpKxbGxMPW7ezd+w4bGImC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXw3K0TKwyGMZ+qfjncVn9kDO+XJ5oJ9r6IuzhPNVXlpuE/fgz
	vIYpYw1KvlvMoJJac3ftUsnw3hyq/7SWcM8yciT1OPhxvPtsGX8VH/62RRUYGZACfIw=
X-Gm-Gg: ASbGncuWSx3YGK14ZG+7Cs9AGfRmyPCqVn2E3xyr9ayQX77PZmhkIsA7Hg3l6C39FtT
	nWjlK2br1/QWtlghAdesQycS14ZUiDsAetZEib223seImzdtPldofMzJRAnVLahsKNS/ympJdnI
	yD/wFqBe1kG68y69Mx6dHnry3TWidDNUGtoIKttDadhen8HEf7wSd7Kx5uT12Qg4x1fLhipL923
	A0/uhbfPP0lgzvsli1az+Bded9fVYfEb3s3fHAzsVx0jUxIG7Xet9zPSSmR7GaYdvWL1HHW9pND
	k1uz0onRHBrKZA6z9AXncNzKJMYvr6zOW25ep0stDEeT7Adn5HzP85qAuEXpvsfhD48u2kcoZ++
	2igvsBKWdq6JvU9r+TRdGXVtOJ98HGQOQNLociYw=
X-Google-Smtp-Source: AGHT+IFH99GO8Rglk9z1kVj4gHZfOeJnVrjz3zilZUHOkV9zKxf8NlcHsbBnTMmSCOB1kQdl0LkccA==
X-Received: by 2002:a17:907:7b8c:b0:ae0:ba0e:ae59 with SMTP id a640c23a62f3a-afe2943ebfemr132325066b.7.1755869494660;
        Fri, 22 Aug 2025 06:31:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:17 +0200
Subject: [PATCH 08/10] arm64: dts: imx8qm: Add default GIC address cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-8-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kHSR3OBfxE0kL9LgZuy6tb09v4e6Fk2998ktGFCNaNE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEmpXOBhphAMxpNv9K4iWFobvh3z5y2FOtCm
 oc8Bat2eRuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJgAKCRDBN2bmhouD
 1zvTD/0cT8GVrN4h/fVwVC9D8PivWS1iPCVzB1oOviTi/ZPILeFCCt2UiG8SZTY5AHKpyFrCKBr
 y7r5VnQ9k7POV0GkdF6cr6Rx0kudWl4Auhxq7ljxJ3SgQ6q/sbyiIWaqbsIa4vVS8Ul65R5mgSn
 HWrLun9VAVRgCyRoR8fvkqyuk6rOP7THvuAOtiudMDyRHEBWl0xw4dD04mXY0TROWpHwlmQykoo
 SnrfYpXxDmunvQ3EddTUce+v9o7lb09/PkaC/4BkqJF9WofBhpx+A5WWC0xPdtiOdO3RKThEIvc
 KIFPBTEM9nOVfqHIOZ1EG80xO+cweeADF0tPU/lHMhXbhr4XgrUXnmi0mum8ifop7YeqBgGNiDG
 eV9uoWroZ4Uvg6FN8LDXCgmfUmhlRlR1A3I1v9maOZhV2ojio1j2dx83Xk+TZeFeLyfb7h7U0oe
 7XtohEOhkEdeR9Y8NresyjZWLoyXYWhV3JAvVIll5sFWqWimk8PqAPRAn9Z6x5YkWHUvIiHyHyc
 bjZfi3NJhcS/uXvZE+qMaAfQAG960emuj0Tfj/MVQLRPmX1gA0Y+Rmqv0o0qbtJdgsk02i0Xwfb
 8b+uMpM2Ur591EvypbdpzjlyzSbnriMvUMYgHhv8/Kyvt1geFiEIh3+3S8Y2lZzxjNUjEkqROCI
 EsXQufp2TZc5omg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 827e1365b5dae438d4628852ed6884aa846eb89b..5206ca82eaf642a32299147e9c1b45704075e2b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -245,6 +245,7 @@ gic: interrupt-controller@51a00000 {
 		      <0x0 0x52000000 0 0x2000>,  /* GICC */
 		      <0x0 0x52010000 0 0x1000>,  /* GICH */
 		      <0x0 0x52020000 0 0x20000>; /* GICV */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

