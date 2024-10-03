Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2251AC44C
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984039; cv=none; b=DMdGeaatgODRJsTE8BhR6AJksywARL4wJIOAc+g44HzAIZYD4/mWtOSzHhk3rscF6wN1Z88dvI/HO9nh2D2EdRvJeLKkGSs6eHkx5GHkZksk0HwF3dB5K1QBSS8OcqUfCTHDl+DJVU4AsJoiqGcc8zR/QIsj9pdnQMeYFYqLLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984039; c=relaxed/simple;
	bh=kIbV8w9VACrw56EiOJHnI17zKPAzzsTMVzsAhN5J9BI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhCysvfHIzCTG2fe9DcPAyi/c7PPdFqZ7aibWM/mgWXlvM7Q2roVIaZShJSlZ3oHnxgT8wPsbnQ1amkrp/wX2Kyoga2DtL8eTuLI33WUoD8cjuv/ATr5HWO1SPGPdu7V/djlxDBxWGolVaWE/DxNAYppCTTk+RVKTFlzHbxjTXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAWg/9kZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAWg/9kZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb3c6c353so2102265e9.3
        for <imx@lists.linux.dev>; Thu, 03 Oct 2024 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727984036; x=1728588836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=03Fv72OC4PmcFCeI8nt8n17s1/uuSrep9ca3zTiEkFs=;
        b=XAWg/9kZGff88gLQfjP3qKJLuUNEWeAMzxLNyekUR1tP+P21SFdKx392HVXtqgsZuf
         jtozWEgwl1q6Qp6Hpr99TkPmVr1QXIp62lHZLYiP5OOC7pKY9WDIXW8yAOC9+uCZKvVS
         ixH29aFuMoaH7Llvm4kdueTYin4JpSektkGlKunjtTw3Cn0xkrK8wOn1bQGFSYUUNqeC
         vR76YiHWB/tikFeCP2+2wWAxLB0YszASMmhCYGWV6ZmRF9gWIdXZE6vrC5kiFon3A3j5
         XuX7KPh8BxWcum+saP0vb7QkSpGemJV0LKmbFcXPVnYJIuDytDCti9uGrjWkhCnQFYGZ
         9YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727984036; x=1728588836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03Fv72OC4PmcFCeI8nt8n17s1/uuSrep9ca3zTiEkFs=;
        b=uZSx9ofh2AkRlK6duVawKkNs6BCKtq4JX3ktI4BG/ovD0NDk7nSv+d+AGE2Tokq8eo
         NnuQh0cZGzPrOj/B4OHipjY46BWGL281QAx0zUDMH/pLh+0OfJm2vjdLfs1NUAJdt+wa
         W8e0WRFn/ADtaWv/Tey6AjZFqj15VFWpk5X3WWdh+kB90rh5fm+J0mWePyMmPmAt/aU+
         ApSYFKGEQCa4jEJPjfI5HRx6XqULR/mTvA6QIqQWLYfxOSfjk5ormqlIfLfyFLS2HkqI
         yQKd5LgHODfiW17T1cabA5t4vun1DuP6aOPniDyi/m0u4DEfq6kF3O5ac9vy+gp6Y8O1
         UWrA==
X-Forwarded-Encrypted: i=1; AJvYcCVw41qFWFKomaBdQeYDe5rn6a4Qo+o9PMSoct7hNzOduEhw5looZ/nBTUu3CrV4pr74rqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJmcMUpUp57pH3iac61HJ1FlddTMmsExACSjS3KFX+zFJ3vWtV
	vu09bDXUhMNp7C4EEtUtR4f/yGSBgqRKlxeuU6QtA1U1PeMQhMaIARNEHkcVOj4=
X-Google-Smtp-Source: AGHT+IHjRWUaU8ltzBjbkFXmEkgDCxZchAnWE0VBPx5pWs6E7ZjLo/UP7jBOqliwGkw4W1bGRndjRw==
X-Received: by 2002:a05:600c:5106:b0:42c:aeee:da87 with SMTP id 5b1f17b1804b1-42f85af8cf9mr414215e9.9.1727984035866;
        Thu, 03 Oct 2024 12:33:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ed3e3fsm51453405e9.23.2024.10.03.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 12:33:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Frank Li <Frank.li@nxp.com>,
	York Sun <york.sun@nxp.com>
Subject: [PATCH v2] EDAC: MAINTAINERS: change FSL DDR EDAC maintainer to Frank Li
Date: Thu,  3 Oct 2024 21:33:48 +0200
Message-ID: <20241003193348.102234-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last email from York Sun is from 2019, so move him to Credits.  Frank Li
volounteered to keep maintaining the driver.

Suggested-by: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@nxp.com>
Cc: York Sun <york.sun@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changesi in v2:
1. Switch to Frank Li, do not orphan the driver.
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 63f53feefa0a..1c0ed4b16226 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3791,6 +3791,10 @@ S: Department of Zoology, University of Washington
 S: Seattle, WA  98195-1800
 S: USA
 
+N: York Sun
+E: york.sun@nxp.com
+D: Freescale DDR EDAC
+
 N: Eugene Surovegin
 E: ebs@ebshome.net
 W: https://kernel.ebshome.net/
diff --git a/MAINTAINERS b/MAINTAINERS
index 636a84ccb5f6..03474c934930 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8120,7 +8120,8 @@ S:	Maintained
 F:	drivers/edac/e7xxx_edac.c
 
 EDAC-FSL_DDR
-M:	York Sun <york.sun@nxp.com>
+M:	Frank Li <Frank.Li@nxp.com>
+L:	imx@lists.linux.dev
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/fsl_ddr_edac.*
-- 
2.43.0

