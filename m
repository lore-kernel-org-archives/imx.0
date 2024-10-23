Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1F1D0957
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709933; cv=none; b=AuJKvBCv3frMebDdtOSWdbRJox/f/K3dOtyP/N/qjw+Qrqs+CPecgs5qcwcDtUViPpem2gcaD1Wpp5Lcn6LpjdB2rvRUfZmiwxa3upAGFXzW5UKRCvZ4S9cmHeK443AeQ8LLg7NzcjMHuyBHSlWmA9trTcvAxfJ8VukGjmhKCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709933; c=relaxed/simple;
	bh=63W5Ky+pMOBBnhK2c1KQgIZjKxCECrOTMw1zvS/YZEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A7AvZamN3K1vN2wihvWWVw+hWEIGrCXS97BPpNQuT7DT8lvsduyhrde6tnRb8lq+rU9szEop/IPFZI7VVAVjZ5y697xj+zR1REK3/0gX9zVXirbIdH/YijM1GB28oDVN/LpGRYs+mE9gc6/Mc8atD2r99BbSJjtMERfCeQgSubo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRy5TKkT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRy5TKkT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cb89a4e4cso458055ad.3
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729709931; x=1730314731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bETUmi3XIXD8kJXknLOuOgQdcHp3kntpbqzcQWybJyo=;
        b=ZRy5TKkTzYHLSkZMFfSO5yqndlzAzwI2W44tpKHowQdhR90eagQCjZIEwca0sMwVVz
         Opmpq6ujo0+C+Ty03fl5prwCf9ysYCXl2HJdi0tJdynwhW9g7D98qIOS0UVFoOsOeK2o
         MF7iQ/PD70dRB3rLvRBMerAcNSEGIaYe88ofRZ1pHk5sZ+Bv1bcENXso7bKnIbTRrMpg
         PFutGBob/sHj/GHlrKRr/fDj/a1PkOTQfpasB1E51ooiIRJKaih9D9rI41+LmvrNDjIe
         5AbdMBx3rIAfJuP8rs+e9Olv37pXVZFI9DGmGLsC6AKgdp+wZp9sYvrqQMMY/GxFndw3
         VDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709931; x=1730314731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bETUmi3XIXD8kJXknLOuOgQdcHp3kntpbqzcQWybJyo=;
        b=xNsy6Fa4pBTjjrYEVZj9awrLI7gxIoypF0BEd+DGIclVsAOp3WO928CI2UXE7ljEkC
         O0swKAuCTBP7C4ODM7R8NXLe/rlk8HfORsab8WtkDIfQWkB0Jkuc6ERmsUqg/zCBJZ0g
         0NvKWc7NaZxcY4Ezwh8lOeiiKeWAMP/LGDM07IyFFUKjO9WbWHRvJdACB+3oSs2+Flf3
         KV+jS0kaxd7GnLXqJ1eW5f9HGYwFfCUwFhx+t7dNl/VJ870KAtx83rxTNkKMtMOwZ83+
         Fm2U+pYc/kc5Ynb/uuh6yww4xV2JxkHvZxbWd/5J3SkABJZN6J+QhTXwBwGhjkSpJe8D
         eQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz8iaRGRFEk6jQtTrMfL7kPBSijznP4DtjVrsp4o0HWX8mdE33Z1f0/teRNE4k7BA2T44=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5FFNnD7rpi2iv2ztFklNNgkKD9tSUGnbAjHzeZct+KNxvQnRi
	+yrZmxGRrnbCiaiv3fRf6+iRxfYktNxo5WaIV/2Tqn5sLdGWJYqknvZDHA==
X-Google-Smtp-Source: AGHT+IEiMM+L5uFTC2VVfCZ7I44sSELbZMIx+Zoda6jHBhFMKFwgs8wwCZULrOSJN8mgnxIegVhiIQ==
X-Received: by 2002:a17:902:d482:b0:20c:8df8:5066 with SMTP id d9443c01a7336-20fa9ea096cmr44157185ad.45.1729709931402;
        Wed, 23 Oct 2024 11:58:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6ee4sm60619955ad.295.2024.10.23.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:58:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@linutronix.de
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
Date: Wed, 23 Oct 2024 15:58:40 -0300
Message-Id: <20241023185841.1183706-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx7s.dtsi correctly describes the GPT node as:

compatible = "fsl,imx7d-gpt", "fsl,imx6dl-gpt";

Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings.

This fixes the following dt-schema warnings:

timer@302f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
	'fsl,imx6sx-gpt' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index e2607377cbae..a2fcb1e8e74e 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - fsl,imx6sl-gpt
               - fsl,imx6sx-gpt
+              - fsl,imx7d-gpt
               - fsl,imx8mp-gpt
               - fsl,imxrt1050-gpt
               - fsl,imxrt1170-gpt
@@ -38,7 +39,6 @@ properties:
       - items:
           - enum:
               - fsl,imx6ul-gpt
-              - fsl,imx7d-gpt
           - const: fsl,imx6sx-gpt
 
   reg:
-- 
2.34.1

