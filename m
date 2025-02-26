Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CC222587
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588401; cv=none; b=Uruq/2OJ7i5ne6DMNFPThqdYgc/fQe7XFV1c577QZoxgKcu6hhdedRkY5/DU+3j5Y5kJ6ES4qG6IyDUs7MsUkUOntqVvsHqoJDW+cvJGKcTk90/mXO6vnyBA1KAZKVCCqx6O++jy5cYrwA2sGvmOTACihEvW/FYmcq/FJkMbM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588401; c=relaxed/simple;
	bh=ORjAe6MoxwYydOUBgswDC+POQ7kq3EukhUnkAloJl6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NlsME71/pNB/0lWIZydCQHyAeRVRA83DND1cOXppvSomKJ6QTVMD/cu4kU0vmWUyYNihVPHKlhzKjIBWF04y5gd3gxVlKjhD9tiMN7UGBNxrldIxYP0M6jB+LEnoZ0+A0XDcJ/xZjqU1nn0tsbSKVLgKjVJzKFwNGtNUNDho9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTyLmz4L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTyLmz4L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4398738217aso202825e9.3
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588398; x=1741193198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1rqUZmbeIGtXPgCTodsmKk6y+OMHLTQEiTCHhSgzVo=;
        b=dTyLmz4Lt05WSgQFSUoqWIkA0JTtXpQQDTZdP6XM8WNqgH1LeddGnYPqEVkJYEXMzU
         RU3jKSBoOK3GfJFW83isRmoAHcQjoVHmYXZVCJ67NtFOpjIxtHcOlJzWDYv0aHF/F5Vi
         27fudml3pQ0YnoCI181X1cWA0MJsaJfEM1Q/8fsq8mu+VH8r9P3cmEKs9TgxXaLPs4nk
         Og3OsE99JoQ5OQ3O2MqJ/86Al17Tnv+IiLG10t9mNuCZCVlsmdGQ3lAr0IzuODJENfh0
         dVnw6zCvaxB3jw0g8z9V5tmSt/m9GgFqfsTdAjL5Q9FbzWxLeXFXZSMF4GiebCKQP+4z
         IIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588398; x=1741193198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1rqUZmbeIGtXPgCTodsmKk6y+OMHLTQEiTCHhSgzVo=;
        b=ALDtDwfmn5LcoR4pkfQjBTsdT5R2Wt55L2Uxyj5uP1OVqcfw9DgCxHUwgyK53ggfY7
         7rD4rIA4niLRBHmSrzl37wg95prwLOaOTQeAIJu6FTHyjAZEl0XeFXqpsh04M2uJI8qR
         RNBDrPEapQg6SzdrKdQDq8pn2URB39XbWHcNU/0nAHMvJkPfBntFQcdH71EtzI8gYSex
         t1Lhbl32yr1jeUKh7JA3cDEyHQqe7KuPfB9rydjnkEGFAV8OGNiI4KrhfDcOJnz/0OpF
         cfWjbejVSW+nhBz8o0VrsitR6DYV9CnPmoSkJLVKE3MvPDGjPAGwHB6GdnzLNfiGdyGm
         ZbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEZiR9+m2AdJZ0n9W/2wd4LIwCK9aN8tVnjlNUcLbu/IXdEgjSLpRBeqKr8PeVPD9m7ec=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx20hfmi38gaRczp9MWVBXmq3YEM7OnySqhPGiPY84P4U5zOBi0
	nAvVsBHZ/kYD3Y/y8wxmxrm7o5T5q8X+CQ7R5FMZMnjSW+RxFZ7e
X-Gm-Gg: ASbGncuhQT4XAPJTKU5r9gG+pVannKRWQVjRA2N5LiJF3XV7cEwPaQqPnztjL80JohW
	k24WO/uWnX/ayaWIw7t2PmvlFIiF53GFcN+NY0bdi/YVqSGAMRDqyZgATR+kCosTZ6m9z+1Qf26
	lr/4PIsDXUWALU6zOU+ha5q4YXf1Q7KuvSNIldfvGEYyiEy21gvuX0kufz+Rhj3YyC1cKPBPFvk
	Dx+5pQwQEPFFEv+cUAwR4kJvWM/OC6u61fOeet/DuGp1Q+2XHMw94t7me2Z3W+dh3Ir0APhxhON
	Uq7OLMRUUF8cIBUDzfNsc3S+qLinDt/kFVqmkeQHSnVP0GilAcbqfV6L16BtYj/I
X-Google-Smtp-Source: AGHT+IGNO74QcjfvqSxSeJoVAhbgQPoU9My5GWhE+D/oKsm5H8jpS40BGbgcOjeGiCnhRrebp+SqTQ==
X-Received: by 2002:a05:600c:5114:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-43ab903f62emr35202715e9.31.1740588397807;
        Wed, 26 Feb 2025 08:46:37 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:37 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Wed, 26 Feb 2025 11:45:10 -0500
Message-Id: <20250226164513.33822-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some components of AUDIOMIX (i.e: DSP, OCRAM_A) are clocked by
AUDIO_AXI_CLK_ROOT. Since the AUDIOMIX block control manages the clock
gates for those components, include their root clock in the list of clocks
consumed by the IP.

Fixes: 95a0aa7bb10e ("dt-bindings: clock: imx8mp: Add audiomix block control")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
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

