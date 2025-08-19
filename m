Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3837C340DA6
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609488; cv=none; b=PjA74Qtq0oFUfKNJni7BV0YX1mDNdR4m6kb3mi2qHYvlKqBloE157tIr/NEP1QkhHp4p1B+kmTQPT7Z2vGZdcR37bSn/h3m3ifWK3iFyqv8Z8CMKoXQgd7aLxp3nTnEZB5hojzwtn77XOTuCNvqVGGS8ojBc4P0jfK9zwxbZ2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609488; c=relaxed/simple;
	bh=xtnDCv4eFzy5ACNTqpXuFQnkdvi4l046jdxQ272mGQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUzV+I7KZxmtwQvQY3pkstzlGKhaot3dHSME+sDklKCce/u9j9LsdHKuP1GDtmxf7D6k9BbukVvabYoz+2LRPVQc7ttXfZ3+2N8ySaaLrh5zVzDVoEro2hZcJxRMXi85L8oXD3zw5H81veYo56smSQTaqtHbhtO2wEh+hoEIb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nwbk42uR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nwbk42uR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78d1695so69660266b.1
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609486; x=1756214286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2jIqckmzmL31HAyK5saMTVF8f6NQtPgJyovhg4/VOc=;
        b=Nwbk42uREvSvhwgS6HxYRzubGl9PN4w3OzZW2lbrovc6C+/KCsG0hapdbWFlda8ztf
         Oil1LRW3Jj8XHjrhK3/3T8tfPbH7BPY4qfkH5glROMqZ//DqKA1UzFqZMabgahxRsBc3
         Sc44xnAoYqr4N6hue3iAbGp8HVP8LrjBEm+/MesURuYwL7KP3BDnJzTMty3d5XqX2Xol
         l5/B/eZYBx8L3ldefVFHvoMEbvHgmcjtnmv6Z4ruNJ0/HPGqkVliaJvpyilZsxO9cAyj
         ODKfQyZbprjYlXNQN0P9RmKF+CsuuaLhxiTxG1u5DUqjN0744IJTo0Tddp6bzwCl651z
         41sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609486; x=1756214286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2jIqckmzmL31HAyK5saMTVF8f6NQtPgJyovhg4/VOc=;
        b=KMtqO+OntVYBgp+KuvajEyR6qnoj1n3LCA8dotQdaSspN/1Djx2GjzQOCW3celMO3z
         pDEgz7Syw+KPyiGZj/0SUBT6RMQkFeY5TJ4r6iRGTCk6cUaH6WLssgpzyA6XTPi1KsIg
         GQZQclIHVzuvdmaNxfwZ5XM8Z4t3NFwhjSyIie5OoPzNq5x8RXMqxxj00Jn7OQApEy7j
         jWyiioKrjHQGXvZE84hblm8vN7oW1I8HwxdI9DKJ+XSl/3qud90S9VFzEAh4jHO8uGrZ
         GiydAgKk6STvNjdhPFrqRtmwo290c9HK9NNrBlxTOZmAHlaKJ92694dad4K0ZtgSu+Wn
         bH2g==
X-Forwarded-Encrypted: i=1; AJvYcCVQLwOX/LItL0QnxP03W0xEetY5aODeMiBIkvbvR+taR1hniinnVNuB7w8qzgGMny8pRJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpMG+65nneoEFbfn/nLgRJIcTON/79RSp8Fukk72F7H145VF4j
	iZWjQYzGaXXraTWAMQCqUcsOnCmFxLTbYBxWA7ZxVQNL8HAgO0Z/oNwK5NYPGMTgvNM=
X-Gm-Gg: ASbGnctTXrrOC0W2giq9nlUj5L/bI0D3t+gnL6jN+XQQkGQ489JuxBCftphI6RVQL1T
	VeWI3u8Vp472qm6cH1utyKF1kW2CgB5EQrFvUn9mRwaNmn5d8/aq1It52U9p4htQoNHxmbYb1I7
	vPMQoTYwQmbX4JMV5i2Mk9IFXWnySIrTWNdrl6iL7Xa0BsWssY+jXrxgaxs2mVx0pOuuBxm+1pJ
	B6oEF2u555b1s+X2frneg/9XoJxs8M/eoaZM0ZqzDtBWMfBEdXv2jaw8L4Wm9gvQJNktxW1WC34
	WFAHdcEWHRAjsUfHwM+d+AUErkzFshCbwYpd+ZIf4svuaUbHzW6JAYOeI0uUKPb0qEeswenzqjV
	LIK8YNmlO7mwt0m+IDBwuLgnG4hDMLF4LRw==
X-Google-Smtp-Source: AGHT+IGyvvSsYmBOqUpNPKJ0n3bvvP0DcDCulcG/syIt2wzsfbzAt0lyKnerC5YPY0kHA2qlG+r2Mw==
X-Received: by 2002:a17:907:7e9d:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-afddd1f8b4bmr100763666b.7.1755609485345;
        Tue, 19 Aug 2025 06:18:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab3fsm1006508966b.102.2025.08.19.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:18:04 -0700 (PDT)
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
Subject: [PATCH 1/2] ARM: dts: nxp: imx6ull: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:18:01 +0200
Message-ID: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xtnDCv4eFzy5ACNTqpXuFQnkdvi4l046jdxQ272mGQw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHmIdIih5hgjFKYVXkgjYOmgK6x+Rs7p3ybX3
 j/4k1od8vWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5iAAKCRDBN2bmhouD
 15GYEACDpblDVOMuoKN4y9jt8cF4hJgLK9fli2s9chrgNEGKFUVpYq6K4M+iWYmXrBBPvZ2Kw2t
 CCjeHxVNkOM2PcH9C/3h5Xz4Aft/0XIK+EdQugnDfaYQr46cwlJ8C75O9KMtes/hR8llTh3qLIZ
 M26wOApvdXKMkvl4GKfHB6tdyQmW0xhLW+VB6BuY0TKWnsWfAkYr/tslhGE7URwyDbhEo3T43Gz
 ifcSgZeURLeyjrgztlS/HGjOb+Uh5XDBkxi2IWrVe0U+05Gv0TTJEv/HXIMok0oGwInp3JPnAcT
 UweplIcOEfh4A34gX+ZwtQ5RgycMcv+fwFgFNPbV0idAEtIsbljzAid19ikRmgi5vb6W3Sm0xyu
 joCSm4o9dg5PL0aYjcBIfDh6u17YJKhcYqvOrKDcFvTRUAOjEx8P+wJLFoPMOrtsamyxxaJZnTe
 2bmECOATOzSM9afaIO6irt1G7C4ocQUoF+OvFTbunP4XihRxHq1xcYCqJ/z+j8lERvCh9INlttD
 vAcAOl0CnNNL9FTOCQ7UM8xu5ovV/ssTxNXhZOT8RItS0Ze4RJj1jI3mDtZratMYt4qv4rQI4WQ
 Ep+Ez9WVUXvf2YKA4/ivB4fhn0bCLghsu6zIrVmbe7gVPCqrUb5QFlyMIIjgQ4zYNn6Sr36Rosp Q6PdBrAfYq3+2Mg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..107b00b9a939 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -129,7 +129,7 @@ &i2c1 {
 	status = "okay";
 
 	touchscreen: touchscreen@38 {
-		compatible ="edt,edt-ft5306";
+		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touchscreen>;
-- 
2.48.1

