Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CFA36A5F9
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333359; cv=none; b=bithunWfFdClQCQE4qqbZ5VHlCexL7EtLFlq1EPb9N22BX6fVoaeU7XASaPxEyrdDFuYPc0QxMHv+UTWpdMwmg7yi5UO00afIRl/bjcAP6ITtKXIbXct4NfNAsu0gpvRg+Gb2Fq11pv+xmtfZy1eYO8mc3q9el7Fo83eAW2bUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333359; c=relaxed/simple;
	bh=spWtt1Pp8phvWIL1ongPyy50mYvbEr24rP0ZYo3c4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UImxwfB+7BOwPV/xMlAsNqdq3323QWsqVMrUQaNNtAkketJ1vF1c6PUZ11f+sZiTRZQ7D8dxJ41JhohOuyCApxGRk5/EW2NJGK8ukTXY/wxczCMNiq1KYQWZSyWm9UgABtEtkvdAyo5Z4axB9lx/CHg8qVwVviz5EKxo9saoS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NRIciNc2; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NRIciNc2"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-430ca464785so24063545ab.0
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333357; x=1761938157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=NRIciNc2dGF3vfGBJNkR0Klz6L2RjaywntTim0aSQrAaaYPPQ1Md2uqTr58Uj2r9an
         BOSPgsQjevJK1drJEpwOydvTg3ElYnwu0LxmKeD7z44MxA0EnOkeJ+aERcUJauHijs10
         4155Bl7CHPH86/kinMrrwuAJrvQoIe3RH7OttAcMjyhXdPANXlPJo0T0yTnt0kyLa0/L
         iNo+F/HFLHupdbz4BOEgQNp2AroP8NEeWrRpCSCCecXHTsVXfQjKOc4QBDkR2E7rQ91P
         Vwx84Wbu4lw5Sk/BSQoQ9GQlUkPWxcMZrbDjHwyTzNZC56t8f+s1SLqvsjRpREqzd1A5
         oQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333357; x=1761938157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=Oj3bvJ+mqR8IcrC56IoeB8wDJOZ0dIURaHw8jhh7qSUZrd0Vl4f3kYRGKDwjlSBhmI
         8NWcfua6DhUiQEgw1upKLSzW+RSvAXgbDlDPszYC30mDKCa5xTTyFkMWV2uMx/b2fYHN
         nkhn0F+wTomM1gP+HPfQQ1U96oX7sNUxEyhlFeZAj6Hzh14EI6+XhHl+h/VVuKBMouZ7
         sVxglYYQhpsKTd0BFxnTRx8jmOw7g1IRtoqWkYpVsZbpz+C3us8QIzoSYzB0uVxXiobn
         Y3pzbqNSL6MsgdeuisWZbHbOeXZ3s2juABQn1UpAd/p42eEpa3jr8G0PNn1KyM3E5yA6
         sWsg==
X-Forwarded-Encrypted: i=1; AJvYcCW1aXAEjyIu8iYIMTLjILA05bChlhu8p274ZYbWmZ/eemzrvsqvMK/C8dOvH50JXo4PuBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGfKMK1Y9cxif5jXKEsfEIx4yBFU5eZN1/UYWTUTjGMT9A3bGa
	sOAgCqfDHmydjw51tgEJ+U7fkGzj4msVm4FNhLqftp8chXNDGwESMAeJHNK7CEt2atk=
X-Gm-Gg: ASbGnctFBDweksZlG2O/h8GhHOqPXcLi55jGOhafNXG6222m1T9HWYfCvhWgmoTckRX
	Hzq9ic+8S4tybhit2WOmiH2RYAcB71e4SP453XCSLVfsOeKDv1xNXbOx6iOw265Tqb/D3rvnAY7
	L/V/jIkvnGuXhGU7lHhsap9EwcAfHHMmiMvKyECcno043eXgDt8AX1V8PGv4m4Ug0NDnEL+bouY
	UpcnR8v+KWRC94esfeUHnjIclCuIPOuzHalVXMJelpL7BEQU0u7OqzWznRUDUr4xAgiS197CLzQ
	pZibSFfpb+w6OgXiqwSHapZ1M5YzuhOVgwxJ/CtVpl2UYzq5lvGq688r04uc3sy46KQlcsvtsH1
	o5oM4eq/YwMW2odwFP+d5ndF6tywHcJdf+fYCKmJNPYPPjH43vJoyuxCV8VH02dCKXwvvWtO6Xb
	8vK6mW2YEZGqOq5xDB9uJ2LI9gvFs+a2lqccWfEbuf0F2NaQEDRazffw==
X-Google-Smtp-Source: AGHT+IHFcHZhfeKTHaIT8TeTse7w8bjG9Loy1iIsFUAysOy7saMHPhRTlKWgTzZuCkFXEhYPt8zLNQ==
X-Received: by 2002:a05:6e02:2590:b0:430:9f96:23c7 with SMTP id e9e14a558f8ab-431dc13b52bmr101093185ab.4.1761333357439;
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Fri, 24 Oct 2025 14:15:42 -0500
Message-ID: <20251024191550.194946-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The reset property conditional is now under allOf

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..46e5db25fb107 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -11,6 +11,15 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
 
 properties:
   compatible:
@@ -55,6 +64,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
-- 
2.48.1

