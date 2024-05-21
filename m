Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4E41C63
	for <imx@lists.linux.dev>; Tue, 21 May 2024 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716280231; cv=none; b=kSwz3pHAthqtQscL8fkjTRj5dtpRe8jGfvWfPCjjqarMxGhB/o5852GQar2B4+8McS1dCbjpQiu1kwXtwaqeFBghjrJKWUSTUJWSCWVQ5hLGmkVrljrcQ7pFumxvXejhF+h8ASPIeiulDp+KvIcmIL3wKTMt2ZSte0Vw6fWqgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716280231; c=relaxed/simple;
	bh=13gYofko46IZMmpvH5qkx1agAyFYwqb1N2f3GxAXerM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8RRjI+WjdEziPV+Ql2USQGdw4NCTzKyF+IauChlWwsduwXqfYMpiooaDelbVXhTIQ6j78O3BbNRDfrlcEbgWhLIl2CiU/fCHv0k1wlx0hyTms7nd7HHNGRMXaGxCLh1MM1+om2QPpfii1OVWvwU7HoaC1QBHOpxRKLeXbK1hsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3hLMrna; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3hLMrna"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4202ca70289so27914355e9.1
        for <imx@lists.linux.dev>; Tue, 21 May 2024 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716280228; x=1716885028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrA786U4KPavR4LnBySZw2GdS7HLYmlFSbgJ1uOdz/o=;
        b=l3hLMrnaJJD+BmJFguwUuiaHOLVvnQ0oGk985TgI6L4vAVMrbwKyaCsoaIDW03IHyJ
         3Xewpk6GB/R3YwuRbPlG+zX8hRy+CdQmSP71lHdPT1als0kqTYVPjlKdXbzj2G7xtAkk
         rCoxjKtNc0oSyXg8KmSvaGhUf6ZFJPOKdjdEKfOP2pDDjfKMjkJfqqr4IjEO0F0WY7NN
         l3XrpYB3vdISsbnratyyCjT3RJivhv+5KnZvJQMW1Cpun/pdWUUMfWlS4UCXR/4/R6Cr
         fWoMgPp7AkPbvbdgqg/f+mF0JS9k9CcauWL+QG1afZ8OGtKac1J/9i3eOwGGGiij6+3R
         OBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716280228; x=1716885028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrA786U4KPavR4LnBySZw2GdS7HLYmlFSbgJ1uOdz/o=;
        b=EMohsTn2ZfMUJ1quyZy84xh3Zui3816O39jbvDXdPo9URGQXookLfT5V/hzticXeZC
         Doamw9GHHVBTBSCxc2CQOI8wXNVXMEl81e5mUbQWmhjm9nxmTjfmSwc+CDLvLhXCkxZS
         MF3CZlhw4C2DA8SQvv3QiYAu0mdnzQ5gcR6LnFnBpuBVWeRsmdWE7VON6PpCfHu2GSaX
         dK3S3zs8sG/6EnLzr3y7kL233rKd+nsmt/+uSkMMiOcOlYJdtnrdX7JVD13UbjC4HDFG
         z8G/NycI1miaKHTIOx00H/9PcHHm0lHAzj7JnuoPvoxUAHrBz5Ff+wv0VuxVSoi35n9Z
         IoTw==
X-Forwarded-Encrypted: i=1; AJvYcCXp216vEbMb8r4X3EXRPOFuXa+WhtmYMqVyJt9dFGjnDdTQG5adX02dxtWP/T/4ANAcPKLomBPqpMNzc7DHfiPkB1Bk
X-Gm-Message-State: AOJu0YxJFeDC1ETj+uMXFquymNUOE8cmSJcpbugUVvPX6sTeJXrvASrM
	lkJ7ov7x0DAxlr3mD016AiCiHFrlBOqoHSRt9XI4UznG28TpHB+GWZy8jWq90go=
X-Google-Smtp-Source: AGHT+IHVWqYYv8hCOa92k+zWOJjeMXITMTd7bwD6mQcIHDreBv9G4RztpYp+KuIYeogkzXFxDXyW4Q==
X-Received: by 2002:a05:6000:12d0:b0:34d:a719:4e09 with SMTP id ffacd0b85a97d-3504a96866cmr21533641f8f.45.1716280227892;
        Tue, 21 May 2024 01:30:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b897e39sm31282433f8f.48.2024.05.21.01.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:30:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: fsl-edma: fix dma-channels constraints
Date: Tue, 21 May 2024 10:30:02 +0200
Message-ID: <20240521083002.23262-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma-channels is a number, not a list.  Apply proper constraints on the
actual number.

Fixes: 6eb439dff645 ("dt-bindings: fsl-dma: fsl-edma: add edma3 compatible string")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/dma/fsl,edma.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index 825f4715499e..9ef99eb54104 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -60,8 +60,8 @@ properties:
       - 3
 
   dma-channels:
-    minItems: 1
-    maxItems: 64
+    minimum: 1
+    maximum: 64
 
   clocks:
     minItems: 1
-- 
2.43.0

