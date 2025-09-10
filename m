Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB7522F
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 23:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757547253; cv=none; b=rFYpQP1p2jbdlBc0DsJolOYEPxHyHzn0vKNNFU1q01NCII3U42YAEspF7EfJSrGA7QNCmTpyHW23ZU8F/X5V2jRCux7FokmCFPPACeV4goWu+U8rRzkH1Pob5kbp5N/wtjC6ar+JU7fo2rgD3wGqvyyzPmHnFVLecggQsCT4riA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757547253; c=relaxed/simple;
	bh=i099labLySvdDdsbvUbHj5s+OPJb2qtVXH+y5SY+zFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HnOpJW3AeXbOWvPYCS2O5/mdS81aBPShwrRMFAFV9yHZcxXL0y4/G1mex6Kf/WoobqTRyJwyLOgMzWxedxJ8Z7T2q7mQnPhesjNxrrMP48IpMxftXa6LAg1U9omyKbTwJYUZ+tRtIuGezlwNUGoycs0stouXqPg5f8iVN7+Zrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RchY6ySx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RchY6ySx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-772481b2329so154471b3a.2
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 16:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757547251; x=1758152051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg4r6tqzHUH80N6S4z7Ye3MQyAcaZEeUKqyv8uKPNHI=;
        b=RchY6ySx1fDWJyGkMJuyml4SFa5SfsAzdBNLRdlRz6A+ZZ7fQaxdXd9bhxQU24M+9Y
         l4w35Eq86KO95KLYQuNPMxm4LekW+o5IYwS3hrqJsAqa/+VxQejNPVt///9LjxgKPrib
         X0csRSteBTHoB5VkZ/Til1qsP851w6AukQ/JTavkJbUmjxH+wDbhu61n38+Ip5tNTTZ5
         hkr91onnhAr7vfCI/Ow6FN9jQJE0VnBF3iNdoCHW2oS3+onLP/6rn1etbjm/zDQpNCGh
         OOy5DkyPA1ufQ8Q2LlqYTwFd4epKdzOto6TQ5I09y7k4pB046ee9K3DygyBc8CbN8MNu
         wU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757547251; x=1758152051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg4r6tqzHUH80N6S4z7Ye3MQyAcaZEeUKqyv8uKPNHI=;
        b=VPCNkB57Zo6uNaxIl0CaYtBYPr8YdeLfR+msWckcZupNpDi4DbSMDC5noYdQ61T1sH
         SMvaHR6zgdvXlu5a+KFLpjOhJhv40+wSorNcdCzFIv/WiogybVY0dlzfeB+48VZ3cH6N
         A2UQpMY9oY8xLMFV29tSNUiEMnLjyaBlXI/H1Ya98LzgA7+UuNtncSXHlFGAlvT23YxG
         pJrX3JZuiuLkYwGqG5bz+7PjuyQuFkQo3vPxTwv2Wtz5c0v93I54RzhX9STtR1nAQqz2
         euXZ1Gd7xhbyRH5+fvFVRaUdCvMHMMfiWe9uTvo8Jpvba2L/+hffzD5GTFMi2YAkf1PL
         0QQg==
X-Forwarded-Encrypted: i=1; AJvYcCVHNpsnQimQa/HKQdzNrC2Jblegn6jBiImiuqnWDxlxbkl4nLLgqhHo3qyVj60sv6hPLyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBxKTJNc3PrDSNcsDk5ryDc/sh1nsJpSmZwLjJnToeUhEPXYiu
	kDSaz+fFCVT5ELR3OTfn/L2SyNbxEK1YTMb83mYFQ/T6e2Jkn5rbNrVu
X-Gm-Gg: ASbGnctucvqRFPXurDLQzGy8MURfkCJkDGXtxcpuiwR9VZuk74yKFTpl/0KglouoAst
	GpTY7AN7ByBbIktcFN/FimQLSCQq6T9q82iiBcDtHUWD3gd9rF2zBodynjglUCdlNTWmaIAokT6
	E216mClDrwTYWcD7oRRtLRcCuffrIQPYX8NSYyiIehKbSfNlpbRnWzoHoX9vum/bwwERRqVGq+U
	GYjTEIKaj5+6RxUKkzZRwnOeAIqHz+VMhxKxf0QI2FumJySPL/Xj0jF7cWSbzDLGS4DjcZ10svJ
	yL0+Hd05KUQXqpArYXSFb9kHpyIuThGNojsxyiNaTVXuoe4AFBbE5bTBZ6y9r2jcGTOb2PptopC
	mmwDtf0J20IXwEkuBERZMbs+0l3ZSLxLPTA6ZkUY8MWbmUmk=
X-Google-Smtp-Source: AGHT+IFyFjSxsyaF2RJnC90z3QvBijSexO6xHZxytRiU9jodFdMt2l4JVc9tzY8yfXcH4+xcKOaQMw==
X-Received: by 2002:a05:6a00:7094:b0:776:2e3:a95b with SMTP id d2e1a72fcca58-77602e3ab24mr1427978b3a.1.1757547251235;
        Wed, 10 Sep 2025 16:34:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d19c:8c03:e9d7:2ba6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662d2395sm6299114b3a.88.2025.09.10.16.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 16:34:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Date: Wed, 10 Sep 2025 20:34:02 -0300
Message-Id: <20250910233402.567245-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:

- ipu1_csi0_mux
- ipu1_csi1_mux
- ipu2_csi0_mux
- ipu2_csi1_mux

As they were not documented, dt-schema emits warnings like:

  'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Add a top-level patternProperties entry for these CSI mux subnodes
and restrict it to i.MX6Q.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Restrict it to i.MX6Q (Frank).

 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..719de0489002 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -50,6 +50,22 @@ properties:
     type: object
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^ipu[12]_csi[01]_mux$":
+    type: object
+    $ref: /schemas/media/video-mux.yaml
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: fsl,imx6q-iomuxc-gpr
+    then:
+      patternProperties:
+        '^ipu[12]_csi[01]_mux$': false
+
 additionalProperties: false
 
 required:
-- 
2.34.1

