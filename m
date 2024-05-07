Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C91514C5
	for <imx@lists.linux.dev>; Tue,  7 May 2024 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092568; cv=none; b=UZd6ahPl5+MQ30C/91edcl0PXoAXVMBPDrnIe7YVfWxIysmuWw9Oqdb5FDq3NCcCVcG8ouMc5hEw0hHd79mhBuvDcyyeQ2Uqo8AaOtvmDgEBbf0n7yPggeE0h5ThETgRsHX6YPg8FULlNeERNuq7xAPii2u8DIRNfyJWFi9JDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092568; c=relaxed/simple;
	bh=OTjMBZ+MwP+QZ3qrHxyCTvxPfkh9ukS1LO64DlNpS7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mFWueRdqvUU8ddr1rGu1CwpGZuQ8rY0HH5bjOSHMQLUp6EHPyQicQEa2ryEkPNLAGvFyrWm9yxF2rgOIq1fBxvLOYBdYrF0y16MnwllnP+FSSfrujiToYC5YaZswTJMfXfe3XF+IuzppgIo9YhnE59COTKA/f4hU74aBiDa9Fgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAphFeRV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAphFeRV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec4b2400b6so26876315ad.3
        for <imx@lists.linux.dev>; Tue, 07 May 2024 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715092566; x=1715697366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4sE/TPSmc70RJaChbU/e2Q4/04mDKoGHf4Df/fOCQVg=;
        b=kAphFeRVkxA12jew8mVhRai6kuNq/+4ARYzjM6qMCePmj3p8p+KbCooxBi6Qw8r3b1
         a+TzV8O8SZe/DNFWUE4C6Gh1Rcn9Y1BVLEiD4q7Tb5uM+Kn2SXYsm7WxDvZkeA8d5Sbm
         8YSomMM2hIOyZ5+IL+H5llL3qntIQqtkAx0eKmVwq3FDq9JHD+ahidBUV5WgfpgJ797m
         5xjpcswjc8Vp0T7pGr0BqHDjmBXEFBRnVYAJAAu8GgX335AdcOZGHrsLP2Pbu+Ah6GDK
         TjW6/rqt2DNCrSYbPR6qcAw/aNcVvUMceP8tCoApKZDz6ej+/id+/b9ukMed8E9I6zg+
         XBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092566; x=1715697366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sE/TPSmc70RJaChbU/e2Q4/04mDKoGHf4Df/fOCQVg=;
        b=mL8JrMhsTF57XYjU5IpSNfIOzc9t+bct+7BlKq1ET59PiXe4D9jWThVL6lBsRPurdt
         0gbY5JFO9B97oFGhti6ejuSiujz2Bwm9/sKMCIfJ5h0xgeQhIz98P+d/H7JvSd8voTWC
         XXHXL7uxg1PBJZDdDdunqV0TXxxDLsxo8yaQ9VOQccl6vd9pLeZD2b2YFAZAxb96mxrR
         mynQsWryv9yBGiOsfss4JsiSD8GhwrvPp+UYLc5E/bOMzu35NX14DEHGCUPwucTlfaBr
         vFfRlfYJwZUcxCE+q5Nl2BEydkdalps54IVXbk72jYxNQcUJX1UTpojIHeg1uauNuDhB
         iCMA==
X-Forwarded-Encrypted: i=1; AJvYcCU1jER5IhNV1/g548/U7wFtCxgzFE+qSKEzhh1VUXUiVnA5rzrQxrfJr4GajNBVDPYAVvURV6pfNEblcDVKbCNguDhk
X-Gm-Message-State: AOJu0Yyqa+O729bY8lFLpR3hUqg9xQZdSPb5Ht1dKh7pkQREV0wKJg3z
	CXRBpvenfS0ERjRiP9w+o8iWbiW8BionI7OnctfQhoIaH2CPCxHD
X-Google-Smtp-Source: AGHT+IF8UDVWK4Skk4ZlNGshwxW7PJ/6S/WIVk0uQs5wZ/EnneK9HcykXPYay7T6RrHB7WIfQNx9QA==
X-Received: by 2002:a17:903:947:b0:1e2:a31e:2062 with SMTP id ma7-20020a170903094700b001e2a31e2062mr18166406plb.53.1715092566069;
        Tue, 07 May 2024 07:36:06 -0700 (PDT)
Received: from joaog-nb.. ([189.78.25.116])
        by smtp.gmail.com with ESMTPSA id b11-20020a170903228b00b001e3c01dfaf5sm10105124plh.24.2024.05.07.07.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:36:05 -0700 (PDT)
From: Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: imx8mm-verdin: Fix GPU speed
Date: Tue,  7 May 2024 11:35:55 -0300
Message-Id: <20240507143555.471025-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joao Paulo Goncalves <joao.goncalves@toradex.com>

The GPU clock was reduced on iMX8MM SOC device tree to prevent boards
that don't support GPU overdrive from being out of specification. However,
this caused a regression in GPU speed for the Verdin iMX8MM, which does
support GPU overdrive. This patch fixes this by enabling overdrive mode
in the SOM dtsi.

Fixes: 1f794d3eed53 ("arm64: dts: imx8mm: Reduce GPU to nominal speed")
Signed-off-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4768b05fd765..0d9abca58821 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "imx8mm.dtsi"
+#include "imx8mm-overdrive.dtsi"
 
 / {
 	chosen {
-- 
2.34.1

