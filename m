Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B501FF7D1
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793662; cv=none; b=OKjthMgW/EMzkBCraC7/8vlZOjEolsdhsNDcLIHzxSDd9Kl7ETBUQ36DCxBxgUWhy1yLa45XawTt0VgW25qc41AEdoF/o/so37PTncN5AxNCPMi8AxCX7ZBN2KnloVoGID83VUit7Ncrhmn36IFGD4rBuPUEJW14lDIK25+HrhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793662; c=relaxed/simple;
	bh=b6bXM70L8ttQQAERg0pKOeOQ7SPw82oq1yMl/099naY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kaazvSqAl7pA80xheqvtgEARPqIiwuQTw9Dab5YqmTaD8VSpnaSLlemSk/EtXXLb3c4VZzCB+7P6ngLN+P+hdVKKhiHCO5BUtGa+4Rqr+VeyyODir7XD+nwRTj5dT8KC3CeJAccsuI2b2coNh7aDufdEEyRRsyl1le7ZWGWAvxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ymua56+W; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ymua56+W"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea9739647bso799470a12.0
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793659; x=1730398459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2mRYwktrmZtlfT2nFMLWD2hPCZTt5hXE/NuFZYD1KE=;
        b=Ymua56+WCFlLiM3etjoQQqUIS8MB1cWVvBcMTjUxhXu8Qad8iq+X4yi5YaJxK/lYLJ
         RtAnprOfc2NnxhKdtYBmCrXahqel6vsF46mhpaZjNPEb36XDsnpGlSXP9IJywH1bSzIG
         0EH6NI6smiWXqPcKCclP9PVQrfMu6vwY+hAl5RNM5F3qcgGoSj6GngOvaFmuUUULvLME
         xVgnZzbQB6XPiVsaJFOBuSfRPFKh9u+MrqHqtsl5j36wZR6+w2ATqxfMSIhW4hyypB5w
         p3ooDcMzNhC+gG149BygBX551RA+5u4h5Td9nWQHgT7/4XJpY6dMV10/OGfH0DZnc7CM
         4iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793659; x=1730398459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2mRYwktrmZtlfT2nFMLWD2hPCZTt5hXE/NuFZYD1KE=;
        b=FhfwPpVyPo6RUiS58zXXNTvLMt3M/crA0C2ZPQyMexH+VhZQY8LHRZquxR7XuH27kJ
         w6Nlt5kwrNrMxt1x/YSehYpIJ5UqDoxVLLuPUc/Fv0fcpfceqSowIAbsJfeCZT59PCw/
         qNW2440+JMebjQYzCsvhvMzp8+tD09vUYto9vayGun+/ktlhOkyEd5VLc9XqaOo8cSZ+
         9j/KRfnSVRFSxYZ/YgfI//X6iToVdcbM0lpLy69FwT3aAiqMckWL61O6H2S+GjjJD63p
         /ANn1/TmxasxsT+F6MfUEqg9lUj1dYUjHpnjDWrDSs2gyrS5xZm/52LK3okiaIp2Da5F
         +bXA==
X-Forwarded-Encrypted: i=1; AJvYcCX2/GDpGX/PC83Tu2QuiJk6mC0k8ZEfsq2efMbmMX+fJ89tnr8uTu1kesjIeJVVvL5W8Og=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRXiFlo9TSHo8nXerFZNwJe0P5bsH0ll/O50aRxB7Ymu/LGWCX
	QNwto/tCzGXSkzMmeL9wdXSc4uHMLDIQGWwI0/YwdCt+Q87URwdKgoe3cA==
X-Google-Smtp-Source: AGHT+IF15FANv02/HX5OJM9MTivD/8lQBJRNT9ZUddV/kotfU3iNdSgaePzvpQs3OCWOW5wJ1NIpAQ==
X-Received: by 2002:a05:6a20:43a7:b0:1d8:a3ab:7220 with SMTP id adf61e73a8af0-1d98976e70fmr3697478637.0.1729793658893;
        Thu, 24 Oct 2024 11:14:18 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d74d9sm8208171b3a.133.2024.10.24.11.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:14:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@nxp.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sll: Fix the last SPDIF clock name
Date: Thu, 24 Oct 2024 15:14:09 -0300
Message-Id: <20241024181409.1461997-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The last SPDIF clock is IMX6SLL_CLK_SPBA, so change the last
clock-name entry to 'spba' as expected by fsl,spdif.yaml.

This fixes the following dt-schema warning:

spdif@2004000: clock-names:9: 'spba' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..207b193db3ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -173,7 +173,7 @@ spdif: spdif@2004000 {
 						      "rxtx1", "rxtx2",
 						      "rxtx3", "rxtx4",
 						      "rxtx5", "rxtx6",
-						      "rxtx7", "dma";
+						      "rxtx7", "spba";
 					status = "disabled";
 				};
 
-- 
2.34.1

