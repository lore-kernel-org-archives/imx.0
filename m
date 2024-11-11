Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6107189BB0
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323994; cv=none; b=F837pso5RulGcItqXLXUq2ZN4zlTXQE9+i16lOvxEa4pSDqczdnw/MBDRphBVIL3IDHkOcDA41HU9d/mN6pn7065teHcksTfbQkuJsCvPBh0+0ONINfTuXnZkS8vcW7JjMMWxhLXh6OzHm6v4UoYCP/k/7bLlhsY9ivNk+hAPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323994; c=relaxed/simple;
	bh=yR0gR1vAjLhs0FBNDgPv2TANgg/seBwdhhtk/Rr/WUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ejpV8vQD2tjnrW+ODC3TgTa+IgQzhNHPLX+7eBTcBPvKcLj1WBKRpileN9lHH3iOKQKvzKNI52GiNHIg8B0QWb7digH5jFSZy5oBKiWIUd9iJM1t82QjM+6qENfkNo+0K8EwgrtpNSGQAnKIDALMTEtby8wbhfAc5PyRxpeyWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cd56O3Cl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cd56O3Cl"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ec86a67feso770990666b.1
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323991; x=1731928791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=cd56O3ClrQQqh+cVp+RilHw0k0N93/nof5zTzryaawfrPVOpX2mARsqd4NZkkm8EPp
         ay/H8fy6CHt2JT1fWreAsX48AFx0tIWXiC/0nEMo3b9GOwmDyl2POliZ1X8TVehQItJb
         ofADAJSgnu+o1aMV566+hFX6LtfBR3kbzCC1tWNrHv0hqOMYMnmaOKbBFTBTQpFJyKDR
         +I+ZalIvxx+miZOcuavOlOhmzq325cGO9kDbSxIbs9y/HMmtxrfJCDRFKU8GU7Sm1MOI
         48yJWzJO8s7pqQYjlU5SdTvKdGxxcRI+kqUMb+wd49bf416Pq5HiK47xla+vVmQxGuAX
         CyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323991; x=1731928791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=aayt2f+nieTc1Jox695109k9OLzyqcOGQXc9ilyOUVDtjCbbzG9XZItCBFnUZSn8rK
         nCK4tfKmqJw8dqfAeatxIb2mgFQLPgUanOXxRyreRgrD8QqYgqFu8WkEp4eh5GUMV1dc
         X/2xf81otKBWHC4doyLq6b62fRzFoJAFDCFaCzC6Jl6DfK0ysAb94xQfe3mFU7rAwpVb
         HmIjOzOisSAe3MX8AbYUdbNCtrRpDGOqrH0LsQfU0/5F8Vtn/vrbu7Q++/HlYPBHnMnO
         1HluooKahokLDlPMOxjlrreVRpvJaVsemAi8wdmeSeBDhM01qM+y1fIl1yz/lUFxF2BX
         MizQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuZIxHN1PbziOFxjS/rb8eGXwIYpGER3EQGJOoQ+J1qVBF6Bo0OocvQ08sv2pmGu6Kxeg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnafg3isv16mMQULhbhiGSwd6RcHH3Dmbolix8UavFRb83QUwt
	KPmrODN40ItzIP2bkw3+1XiSzLYmx4vCl2rGgMW4UthTXaqvhBYV2Rsl1a32ONQ=
X-Google-Smtp-Source: AGHT+IHOXkjlkrDrtvlnPceOnN5si90LVUaiVILWy4AO1guCrPxVvXLDLxRd0s7RMfvfwDzqJwxOIw==
X-Received: by 2002:a17:907:3f13:b0:a9a:b9d:bd93 with SMTP id a640c23a62f3a-a9eefebd119mr1154918666b.4.1731323991120;
        Mon, 11 Nov 2024 03:19:51 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply
Date: Mon, 11 Nov 2024 13:19:44 +0200
Message-Id: <20241111111946.9048-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=tudor.ambarus@linaro.org; h=from:subject; bh=/+Hab6B4EJ5Dh9SCHmRGYARDt8d1ozFiUUdntiL5/lk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSLAOWEq2QisQo/KwTNHCKeQe1lOWHd82ps 5T1iSUMhUKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6RatCAC4xwOyECtAGIseOOgysDe7h7v7SgsjEr0sfn28ZspNaS/95AIqQMCfPSy2qy0reu67pKZ pCg8oRQQfb3u2HfTFOANgCtFAvUU7byNiliCO09Xw/vU9C9LdcuY8F6L/FvGyghiMvel2oXw9Ht jm506UJHfuIDMw1XINeUG68aULrEnhlGPJQfJIVn2XMCxiAq3u8l/3KN7r+bNbltYTHoiXnHXSA hKoSjlCj2GvfWO1ADnETrU7j9ckN4gikrHQvgxc2MSXGg6MDrI5p5PZJcsKjq+PjslQVcnEro6j sz+KTxRqSUMXxVLeIuVuiSw6EVHibHzUNsjqTuJGpAfOBm7O
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4, v5: no changes

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..335f8204aa1e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 
-- 
2.34.1

