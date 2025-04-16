Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AB1E8327
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765311; cv=none; b=bypANIqBjDOT5j2E2UE+nPZb+ffjsRwiBnuiyUL576EJsmxu9eOWK5cjrz0noCiCKfUQnEN/NZ/iJKmPZHh2jBoKhoTW1skR/Ol0oyuz04MdfkIUWd7xwhhBqUgfcAOpBa2837yUOvmuQKcm6eFltfOvHYN1WD6r5MOs1o9ZnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765311; c=relaxed/simple;
	bh=A51fK0qKYzvAQmZ34qB4lNAJwPT7AcHFvksrNIey/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NomAP/3tbXdP25q/o8mZAPENlflWBBmQvoAXyZklzJBKqWuXuUlxzZLC+54LkgbdcoyvL+YZeWgIGSvTaf5wUVXzhHLO41hQwLpmaRscYFV3Fv8KrkoSVIguMs3BoM4NRnCnNUFShUQZU5gfLpgSMuDf1s/jm5I2XViPy6XqPZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkpYy6z7; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkpYy6z7"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c7913bab2cso589939385a.0
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765309; x=1745370109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=jkpYy6z7wsjbdTSwovRYyyZdjwtOXMIbz9hoCE5lAOeyxIdazbPoUpYYugPTQlbhOq
         NewqqujR6oJHJjM3bZ6whCmSkiKjcQBEcf0WNdQw8vKu7omRtU1cFGWHu5KboMtlqwC5
         IYuxtkz/CU6EoC1ri0BVks8I0gIo5zVPOYCOOqnkbdxzuVmCOmR5ZDpcswNrb61hML61
         nBIngUlFCCTCuWbSLQ5J33WyM2ZPXHuPLqtZmt88IYCe4JcJ7XMgjzcVviZGEnjVd/ml
         PpC0qCrLRJxCVRY6LX1KGoHutNKLPEHOrdw9Dze2kxi0mfNNMCz91DwXnp/t2tk22Td/
         TwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765309; x=1745370109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=acpvJvoiTfxDs4i25JmYlikLOjSG+yitP80LsOA5Ujj6cZXeGpN+iAQqm32yOE6EFM
         Er28B2FSoIh5Hanh0iiLbv/xZA/j2Gp46niMxQuxDqfmyiN4C/0pLiiVOSFSvACoJeBi
         mc0OBbRt3eoT5dRcsF/JTqKLhz+wIKRAb+2PJaQVZpOj1hH3rZUkDIUyG4b/pgTSmp1C
         TGi9tXj8bzye1WMu2lqZIwKg20WXVRo4zGv3KX70bJYn/4sUNJSwf9tnUNzzRmrAjp3S
         RHdmQMhldpA1p/Kc5aE7xfjC3g9f0I6xhYw6WBaGuOWjwEw8/7891SZWBBHbk7/xuYAG
         fbNw==
X-Forwarded-Encrypted: i=1; AJvYcCXvIuQrwvasFIaNdhaVNX/BRXJF4AFPIVmy7AHVMHAtEiIh66LDTe4iBUUu9+w7cuenx5s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz65tM794jN7FdU3rImUAuTb2FQ8OuXUp3dExdr1406gg0Va7k3
	t17Q5EyxtoWyJN49fdqOWXOllRt5Pjm8wXqro6RAlbXHoZJkOJ9B
X-Gm-Gg: ASbGncuXAbgP75N7qPQISN+sX220X7WIrFJa4xZiVXh72zFbGJrs1kVe6NfR9IRRoZR
	sPAL41d3GkV8wJKr5Us9jgHvcgezW4Xm3sfMvgdKt3qaZapu7K2KMoDrnNw3YM+lCE1X3QVnjaQ
	4qMDCC79WRcwm9Gu9DOLAEtlLVasff69CT48XJPkw0kbUS/oDFr0Usbuub4sNbdOcqMp3dNFK5q
	iq1+Re/3iDzx9HjNN6VOg8MtpaDHo4MU/rFkJKNWU0IqA83NNaxlAH28kVR3IpeKJneq26vyuXh
	Z7E19o6Ou7SsQU26xo19GR4cDjTmre8PEvQ6/ej5Fr+t04Esm2P/hMv1milPTVTLwV3HJa9laCU
	hItr8iaA2yUS8OrQ=
X-Google-Smtp-Source: AGHT+IH0AKG+p7mqeho6hFnJiQGk62QSOmDLzjL41pBbauOWKXT1WSK6KQ7uPvUqX7jO/stSSrNqEQ==
X-Received: by 2002:ac8:5f8d:0:b0:476:8c58:4f69 with SMTP id d75a77b69052e-47ad39fe5e3mr24329581cf.1.1744765308786;
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 02/10] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:28 -0500
Message-ID: <20250416010141.1785841-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..bb11590473a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -242,6 +242,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

