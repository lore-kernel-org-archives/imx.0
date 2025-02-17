Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3B226896
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811649; cv=none; b=o3Bj8cSRASv1e567Mha6xw72fvjdVMxERElPHKhQNWFYbvL83VwQGuQhXYQ0ygJVFEW3mHQyT6YFV2es1UDm9Pzu0NP4IZAMlQYzd8ijIbJNOWb4fgQnIp2aEhki9fjNVg75DqaUS8Lkb1WzI72VP0Bv+JjL0LVWzVxyyBLtBvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811649; c=relaxed/simple;
	bh=yDSPeTXboEdRS8x7d2A8N+8BHRSpjjkkT3cyeJcrnlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PeGdEYN6N4Dw9kkBxXRDVIlGNwP+GR1SDkcAY331/9ux8nNo3egzwCaKSGEXssyZwU2sDrapSMmU2N1cA9U7EOHNz4UB8qKmCJU+KQg6QXNyXAEJP/pkH0k0YcFfHxFCVo+VXacIMtfYxTXwr4pT3Mhz69kOWGKICzoVCw7sNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X57IJrjA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X57IJrjA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so922598366b.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811645; x=1740416445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrtKLikUl3VDuLA5KThNUpjO2Vam386mSG/zowIweFg=;
        b=X57IJrjAPLk0BzFkI4mLUjfMTBJD8sPelI5vD/h+qNpG7801GTzHQmSLR5KAJfIMEh
         jyT60YTQweMJXgn7R3UYLLP9wOuJyPXnPVJnNVo7EnibFvAl6h9hmEfBJvw58p2798DI
         yUhfyGgXRAYLbVJdUo+wrsZ5K2zt0WnieKq1iGufKutbztSyn+5+Fa0AxzosfyvOj9hN
         fwOhS0wWFZgvsHTPCmBf0glO/crVyvQ9uZ5OOD5OJKa6zOXhLMTQjPRVAWL4c87Wgipd
         PbtmT9ufR4tm1rpT01mkTN3C7VttWznop7Jq2pFmC7jBRt89Cm2m3oLgaMOerW3oRDjk
         ujNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811645; x=1740416445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrtKLikUl3VDuLA5KThNUpjO2Vam386mSG/zowIweFg=;
        b=Q1qLNd2o31dtPpdBIYhHnXAZUDyfxJPr/KRidKi9UDdInMkVgnuxfJmUSUTXMZW9Ai
         nPlG4hJwIr0USpKl4FHhjiI38iRCef6YV9cqxqriN7AG1sglDxC8pO8jVV66uZ7wvZDN
         jL5TJqH0Tgr2Mm1Sz6oNEQ3QpU7ucZn8qvgtHBJ3KLNpA0lVcZTOaq0XJheAMOeqk55a
         NyFURed8FaBh3SgjGPx6hc9qpUPVLKxtYQapcJkcLsGtun/34+6Hlo24a1+5Hcp5C/RS
         /wotfrCX40qbZIvmxf+vs+EonNxYF4NJ95tG/MiBwXCurBBpFtLiCeiKkPAidZ735fE1
         LURQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Iid1mzqIAHaPL5ZTZsdmCxF14Furnu5EOSHMlLXuie6EHU5cjV0/OMa/7nyrmBJ7msw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWJX90ZucqlhT5n6wkK48em33Q3aF0aLshJ5Wn+wWuoSGjnhhA
	TpJg0HMm6bygD60kcgHNnI+WhzEi0/+nwtGcBAh75p7uHjRCYRh1
X-Gm-Gg: ASbGncukGfKY9TV16JXbOHjbL35cMUsMGcXaLFuGQCTbKula5yc0L2l+C7/EvP+4tNs
	S4AX8Lw/hua+5AcvpghOKS4xJpWAo46jyBi0TD2Oh6hPvp/byYs2jjBC8SMZM63wyi4eTb1rvyE
	e80WuH6dfRg/b1NRdbMvtxZgYrZqWSLgtNQNBUfImfP+8kpLTkcWJicj/jhmmjINGypLO9Bt3yf
	XIolTtOVZZQ23lHXp7B7jiokC56leDFs1PJLdlzrhLGLnxzfzvDlI41a//UpFPR5e88c7wuAvDs
	k7vV9NN/N59VMDlfmPWg82NEoe45sjeCzJgm3/G0YbWNzAbW0FwS2Q==
X-Google-Smtp-Source: AGHT+IEy3WVBYS5bkjMmOdhylnIW18miMxAnn6ezvqexWBHLNRb3AIqDu2C8ZCsKXA+RyQX3qUnCaQ==
X-Received: by 2002:a17:906:379a:b0:abb:aef3:6052 with SMTP id a640c23a62f3a-abbaef36608mr148178766b.55.1739811645248;
        Mon, 17 Feb 2025 09:00:45 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:44 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Mon, 17 Feb 2025 11:57:15 -0500
Message-Id: <20250217165718.74619-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AUDIOMIX clock provider takes an additional clock: AUDIO_AXI_CLK_ROOT.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 6588a17a7d9a..0272c9527037 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -24,8 +24,8 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 7
-    maxItems: 7
+    minItems: 8
+    maxItems: 8
 
   clock-names:
     items:
@@ -36,6 +36,7 @@ properties:
       - const: sai5
       - const: sai6
       - const: sai7
+      - const: axi
 
   '#clock-cells':
     const: 1
@@ -72,10 +73,11 @@ examples:
                  <&clk IMX8MP_CLK_SAI3>,
                  <&clk IMX8MP_CLK_SAI5>,
                  <&clk IMX8MP_CLK_SAI6>,
-                 <&clk IMX8MP_CLK_SAI7>;
+                 <&clk IMX8MP_CLK_SAI7>,
+                 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
         clock-names = "ahb",
                       "sai1", "sai2", "sai3",
-                      "sai5", "sai6", "sai7";
+                      "sai5", "sai6", "sai7", "axi";
         power-domains = <&pgc_audio>;
     };
 
-- 
2.34.1

