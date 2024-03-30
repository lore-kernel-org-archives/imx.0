Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F4125DB
	for <imx@lists.linux.dev>; Sat, 30 Mar 2024 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711805663; cv=none; b=SMpxAb0e45cb4E2aWZu/9XK4wmlH1J4ZimpNMUU6GXCijqSfiObYuepTVTTyE+GOYHo33h9XPo9Dw5Ouj+dwPNaCFbsgaJP5h7QbmIHIFjC2dt6uLC2arYmfLmXaCX5do9HiUcFa+iC87K4dddltU3zAIHweIYpzFEgqvArasCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711805663; c=relaxed/simple;
	bh=b5BAnNAzuVJGQLT54cg66vEhDR5t6XTVi+TumuM+TWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cinNKjCKBJJNyjyzrO1NwJcqCihvAyUeE+A/mzW/bcpMAhvc1w9i9AyysjNe50sIVaXvRkJ7BynhGtljWikpYYdbWJOCP+vKCEblHi0CATxOKSGf7cjyii8Um93oOyRmJ1V6U7jXzF9vc7SAYBmcU+10Liqug1zG+lJLd0sQLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtSaaN4O; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtSaaN4O"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33edbc5932bso1974179f8f.3
        for <imx@lists.linux.dev>; Sat, 30 Mar 2024 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711805659; x=1712410459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grJR46I+1DnHyZ0Zjw+rpwAPFOhrK7vpoH0EHH9w4rk=;
        b=RtSaaN4ObLidUmnS6O4Nn7bNvRSPDtK5oP6ITHN8oB2qetsujZrA56khgWt13W71Ue
         f4INfye+2yxnVAwV9kXEItsfJW9nnASszHX96uBD3bpSlyfrWZcVZClXYNcpQzLt0cpi
         N/TTx4PmwP5ViWsflkNgPaIw3/BKMhV61ipuc4Hi8E6HHmyG0BtTLjwkeaGd89ncf5M/
         jvAuwhNtyGou+qkskROIFdOQffGLxpbZtlW2gO14TDB93zhvtS3/94KVr3az75xdD21+
         BaIwpVfjcUWI6tWHXtoT1Q/yw6YAoawYSsW3nzQBbnQ64xkzsF1+1o7MdY5qTHa19Hak
         83kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711805659; x=1712410459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grJR46I+1DnHyZ0Zjw+rpwAPFOhrK7vpoH0EHH9w4rk=;
        b=ptbLGJ9//PAEd+D0G4ErGN2deCK72F0+Na4PuX9l+OBgzgkHGHKOmhwqGD2HPv+tVz
         BPHNZEAy53MOdsEnkSFx6w4BF1EjVlWRHv2w2QHcKhm74xonhUjkrYrsJTx2tN2bw1x1
         YvbXBljo5dndU2h9cKDwxXOMex0IkED5T6Q9JOX9W4G7C4JC2MzYNZqKYujYH2fkIltt
         6p71+tTyOulXsa1wH9r7LRHt2WkS4FQw3lhW56uC18QA/9FI2K21yeCCOVL+ZY6rIIZe
         83mFe25+q5D5UuGIxPwPVX0GEEq3kBcevqSHDcRyNUG/+Ttf/Di3xmF5Uz0wDpODOcQ6
         44bg==
X-Forwarded-Encrypted: i=1; AJvYcCUfLuSP5gWGJJaLGWFSbWOLQcEnaZI4qGPxPjUPXVazChGXeR4gtwXxox+5dWTMPhzaMkT4o+cFo4Gu/9+aE7ED/npP
X-Gm-Message-State: AOJu0YwtUyHDGzdUsUDBrwwDgIv142c9MCL1T8iSm89P3s0nCUl/mhzl
	G6SZNxFVsaMmjzeDaQwHFxM0FLoZQnPfUdYy+nYqVbLlr53P3Nij
X-Google-Smtp-Source: AGHT+IFoId/XoC9DHDtyTSxWYNrcu16tiyTKfEXlXUPQFq1Kcj1yzBvpm8MrLWmUQk090mPex2Ug+A==
X-Received: by 2002:a5d:474a:0:b0:33d:2071:9b85 with SMTP id o10-20020a5d474a000000b0033d20719b85mr2881980wrs.19.1711805659388;
        Sat, 30 Mar 2024 06:34:19 -0700 (PDT)
Received: from gilles-Precision-3571.lan ([2605:59c8:6662:b310:962a:f8cf:49d0:f63e])
        by smtp.gmail.com with ESMTPSA id dw11-20020a0560000dcb00b00341c7129e28sm6454869wrb.91.2024.03.30.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 06:34:18 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	festevam@gmail.com,
	alex@voxelbotics.com,
	andrew@lunn.ch,
	Gilles Talis <gilles.talis@gmail.com>
Subject: [PATCH v2 0/3] Add support for Emcraft Systems NavQ+ kit
Date: Sat, 30 Mar 2024 09:34:07 -0400
Message-Id: <20240330133410.41408-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

This series adds a device tree file for the Emcraft Systems NavQ+ kit [1]

The first patch adds a new vendor prefix for Emcraft Systems
The second one adds the board to the arm/fsl.yaml DT bindings.
Last patch adds device tree file for the kit.

[1] https://www.emcraft.com/products/1222

Changes in v2:
- Add Acked-by review tags
- Fixed device tree warnings reported by dtbs_check
- Reworked leds node
- Remove unused i2c6 pinctrl entry
- Removed unused regulator node in Ethernet entry
- Link to v1: https://lore.kernel.org/imx/20240328202320.187596-1-gilles.talis@gmail.com/
---
Gilles Talis (3):
  dt-bindings: vendor-prefixes: Add Emcraft Systems
  dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
  arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 424 ++++++++++++++++++
 4 files changed, 428 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts


base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.39.2

