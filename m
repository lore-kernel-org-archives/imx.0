Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42923AB96
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571348; cv=none; b=iZpdcGPbP9mAEM1Di2RvffkBQlrSdGenxRPasZ9uyzDUu0N6XnbQLG+RCpxWJNaGcmoQqEueJC9PPssyvonkOqRGpeqQSD40X0of+ilxXC7tvHDiBadjkRhHf3rH431uMEe5hp7qhOQHGSxFCQ2CLYCcK+0PB45SSEZvPuFWu6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571348; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzbqYNReStG6ezBWl31AbBo4lrj7hLfI9oXuEX+rpcG8rXNBqY8ZgynlFaAnHvQGQD0EQ527bvzWnA9i9dht+GDL/8yhRGDPj82HAgLf1ca8Senx1IJ2/xiCvH/lzBhPNSzbxTtV5EIHLM09kN0RpQQxUUmR9ONT4h+4cUtz2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIoO/UXJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIoO/UXJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4613716f8f.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571345; x=1750176145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=QIoO/UXJcc4QhUAwX/odOHW/sudI6cY3uk0B22uobT2XXy7uUcuwS1DT13ZjGut5o+
         5tRR0zW9HsA0/+ztel6Pyh3pzIONGJa9oAhZfIjVSUbZ1XEn0AXgEMuRlvEftCchA46z
         ugReBar58bd+KrYXy6clVwCYJj8g6P58ypx5VJnYewB5etGODMAyAQJqLhmagqCJ9X4p
         +PoyCnfd2IbK9UI3PfvqQekv/1liMvwreDIw1oyJ9VXLqOHWMfpUbBrm1fQ31feR9KTP
         37yYXlLqcdOPwkbQbVUOutNgws5bWL1E7EOt3jUCaFqI1Qnd2knPhVjDPX+AFOPphINR
         l/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571345; x=1750176145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=cVe7W7HawYrXLZgVj9kSmShE/Ug1OFD06q6O+aubmV/aXlcXMrM4vZoKYdBTZp6w4D
         hA0gwMtfUJHR//K+p4z+Q9DkGIM7zS6qDuHtIAA0Xi2okwsskEng0jdy3h0qlsluwvLB
         BtKvxNeYhvVHyF+nfl39f9LsWAYn+hIjDMXnvZuQFMkqRxGZQZu9umGemPg5QE8PYwCS
         H9UJ1ouUwrez31qTkpvPBCGAEBGoxYkBH0MVl1djxYsIL5eDVJukz7PyVbbj7wQqW3Ez
         /WMZAft4WaoTBKhRs3ilx/HelShmUwQcGFhuomEokYX63YwNUGPUDDgLrJL9FICaJeBT
         w4lA==
X-Forwarded-Encrypted: i=1; AJvYcCXVQ+IuWlncameQ8uWBS03t2lhqTyQvcuzt2Dlyt4Q1TFr3pRKofGMb1IhIi5F7Rt5xaLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz82trZAq2pLqaIlnxVeTMH+L5oAYKqNE26rgQbcwM07AZ436zt
	0nr/5E0Uy2RnOEKgZHgd2QZsz98tM8m8EOBVDsO9+mWkC1/XMMyhMw5q
X-Gm-Gg: ASbGncskFpx21K/TMoU18IBnl6eeMxex5FtiwRnS/gxbfZRSSDw0RzbdUhn9XoN7AQ7
	vmaWlR1znWROTokPOWUsoWzBW/jr+fOl2o/tG8K6Eyy9+3l2bUew19UBGXYpjxR4cQM8j390UDp
	CQ4RIzFLkn0MQhjEgdfbT/J6LNz52dTjjbWVwluwSDetAQV8Gflwy+JiLOgZ0CgnjrSqRo+nZbh
	Veb6T9reRqj1rkk+RGTkD9MVpRgTeKSF2C9HxOtiqdabtsfO5Qtx9zNAH+pPMUl/KOwA6FKr/4k
	zYaXTzmUC1LfBswx80l1sGFYUC97aJMRMHQ++IvPFWD8ahD5RqM7dOP750OF96dJy7VJwUqLUlh
	d66u3mPAfVSEdIBIk5S5lYp4=
X-Google-Smtp-Source: AGHT+IE40dc98wMFPx4uPCgW5ShheukO7bwqGFEpXjw3tHAaGruG35TyY17fMDbCmkoqNX7lS0vi5w==
X-Received: by 2002:a05:6000:26ca:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a5522ddd75mr2710478f8f.52.1749571344655;
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 10 Jun 2025 12:01:48 -0400
Message-Id: <20250610160152.1113930-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

