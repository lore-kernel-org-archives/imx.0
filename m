Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF291E522
	for <imx@lists.linux.dev>; Thu, 21 Mar 2024 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711031484; cv=none; b=UGRXP7ffXNaaQEtuxxpH1CiyBXg6Orjc2+nISRWeYwBxRAQ+GaF65STppu1LVIuxn0Id+A3+OLpP3CtMFlKOc52ShxOYncomvbh/yPgy7sidQAN8xeEupm34l2mjzPZ5vzosguwVIg0TwAW3liQR+DblWiGLpsQm1wkXk/doX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711031484; c=relaxed/simple;
	bh=9VKIRU0K5Z7fsZEmm6mylPcgK9I9wY+qOjbw5qRSFQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ik9o5wPkGNUacMAEJX+tyo3D6E2jaI9t3uM+P3LNW2A1lWx+XQ5B1IgujqA58jq2w4E9wLt0pqkkLbxlQOIQQD8jUCGPKAyxk+OfeoZF/WQC/+x3TMzbT0ohnsytS9SwZkSJ3OnwJocCoKK1Xj9TzZ/GctHF5Z3abgLTg1KSuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THMfnQ//; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THMfnQ//"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e696233f44so98907b3a.0
        for <imx@lists.linux.dev>; Thu, 21 Mar 2024 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711031482; x=1711636282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pslGCepk4NtFryixvUY4bxqanEkcUdR3AbV3Z2lXkmk=;
        b=THMfnQ//dkd44u1r0pN28SPaK3MF74nMOZNorNvDZaCwrxeEg/Nu1wYyWTMRVVCOuR
         XwHkAZN1wIBv6ps9/wvLTRl4QcqGr7fVQ2wqXBHST5LRbIQmEdY+1/X/rbw9XyoVEHNT
         wancjw+Fg/I+q9dUulFrFC4rXTXjSzFneFOPagT5D0DodVW+ixqueTpK4wgY4HZX24gE
         JC74ot0o25Juyz2p2saFzxy9tvsrj9q3KFYlKUnBv/f53xa9zvklXGEJM8yXcfM4tglQ
         xcLYTB8TV5ZLOJg/Q09awIi5lCyNHTSHCoXNc23M6rKpgqDbnxxjGWG/ira5JjiTtcet
         pyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711031482; x=1711636282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pslGCepk4NtFryixvUY4bxqanEkcUdR3AbV3Z2lXkmk=;
        b=Bg5MYIC8wBhZ5UReEIu8SbF/XumC75vmsb3VAGKxbQfnB+EJsk308eQxXUegjgIn1R
         ZMzvxYRRZGh0sz7smX0Qk5Hc7F8d6KGFpL1zOu3whag+94fOUC4d8GgbA1cyowLCXgJq
         UFlYZ04dpJSAw/7iDSWe+0tUKE5ZYZkjewbYGLo8oEtV9NCmCSBo5xK+m+3B8q2NFFCq
         MagW21xWT48wubSb2sCTIezJ7DvEPyYeFmNXXoxd3eMBtvz2mUws7ApNJQGOw3Bdvzjt
         JB/6WBMHX74oH49a5jHKyiBOGrhnyc5NY5xVvmk0rPP74oPkw++MQF9+8XIM4tLcW3Eo
         ftxA==
X-Gm-Message-State: AOJu0YyNOpi5y/2dmGzIIL58GrOScT3jqvfdWJ3CbMPzmAnzvMNuRyl1
	2zZ7o1lVvr4URW6ECZfs7g0RyJwZrd3wFNuJWpEKDTSpuMIJC/ny
X-Google-Smtp-Source: AGHT+IGj0Tecj/iNfiLIpmyyep0EUC22JQAUChjnn1zh9GyduSpQFZf/2myVnplLO/TdzeaChBcdHQ==
X-Received: by 2002:a17:903:18e:b0:1dd:b54c:df51 with SMTP id z14-20020a170903018e00b001ddb54cdf51mr9386846plg.4.1711031482290;
        Thu, 21 Mar 2024 07:31:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:55b4:ac5e:ec4:1d57])
        by smtp.gmail.com with ESMTPSA id ky6-20020a170902f98600b001dcfbbb1ddesm15893054plb.7.2024.03.21.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:31:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx7s: Add snvs-poweroff support
Date: Thu, 21 Mar 2024 11:31:15 -0300
Message-Id: <20240321143115.1117060-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Just like other i.MX devices, i.MX7 also supports using the SNVS
block to poweroff the chip.

Add an entry for it.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 9c81c6baa2d3..22dd72499ef2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -636,6 +636,15 @@ snvs_rtc: snvs-rtc-lp {
 					clock-names = "snvs-rtc";
 				};
 
+				snvs_poweroff: snvs-poweroff {
+					compatible = "syscon-poweroff";
+					regmap = <&snvs>;
+					offset = <0x38>;
+					value = <0x60>;
+					mask = <0x60>;
+					status = "disabled";
+				};
+
 				snvs_pwrkey: snvs-powerkey {
 					compatible = "fsl,sec-v4.0-pwrkey";
 					regmap = <&snvs>;
-- 
2.34.1

