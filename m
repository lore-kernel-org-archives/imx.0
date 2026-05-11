Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663E2C3252
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490691; cv=none; b=RHC3f+fpi4Vm/rWad6tokb0fQAuTJvuoFBz0bL9U+GA08a5hVfqLA60SsswRvFAv03tnubE8Py3ylMJX+lUmtG56tTBUu/ldPh3And4L6vKvwBi+ROtubX4akLCbj700lI5LncoiT1koqwD/QGEOGyuIYwqaRbFhcwni4keV7BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490691; c=relaxed/simple;
	bh=SZ8f9PPqWZU+1cRpq6Zl5ZieD1mgOP9e8yXexQ+jYTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+/sFQQbxFXzwwmyww8YXtdOFFq2rGcjvloMktsttB6hfM6rmlFl1YppIHVnX9q0RWUkdVfYwJNpCRjlC7SGkFn8dQPu9VFGMm/5Tz2jlc6Ljj2fIUXPmLl4qQ/f9KKIzFKmoqhs2xg/AR13A0NQ2SsnvvR+KU60Y5xP/JgW7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjDqHfzT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjDqHfzT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so360838b3a.0
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490688; x=1779095488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=VjDqHfzTMIXuc3xlgF5hqJzI47wxDRr8KxpAKW0AMggXsSuIbHBoyx/LEG4g5j7Vvz
         s/M6x3yUtuaFGh1rXKDC/MP9tCu3BsnVTa7smzj+A93yeVf2hBiLbNBdAhQGXIRFIX+y
         sU5TxYEE7zWbf960G6tTwUI3QRzcNoum/8PDINAwjmuANBTiS1dPhGiuFwZdIfxi16Vz
         bH7QyFznUZXGxItgel+Ui/IlD344nY3/6VZzMbIU95zFEcEaw/tHTSPL9wZfsfv9fdXJ
         XYPe4Cb21+hMnxzYLV2ygv0btFehVlf7+LHF4+IMJYkIFaG4o8L82DSJGEY5kCpdvvBt
         3mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490688; x=1779095488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=k8lbHPOjT83b1X093+qUeOoy9JRjoMPJ3+5ZSbDdWF4odJUzfS/5YZERTbKknE8bXb
         GXPJBNU3iJ2UTapYfPrm/MoB7GfOeEJYnXBJKIDL8hDfKL3eKj4Dj0lpHnPyxYi6/khF
         zbz929thjCaVIBtOzKaKWttSFjDZUUQfoZxVl5xncFJtyjPqvV3kEryWNuQ4x/vkpDUM
         /E20/1RRc1yP0OW/v3nc4xTUm5egoLatxa0SRk7JddKzgEh44Q8N3rVVnPblXfrwRB6m
         3NYCKQNs4cJRDBSmhQMTbu1Wstls/8ocE9BAhpv0HOK4CHU8cEBDoFysw5StK0wiR/LG
         O73Q==
X-Forwarded-Encrypted: i=1; AFNElJ+2JkZMkwxUvjnYpAPZyNwKI/R8o2Zmh3y7z597WtD+mkRBOReSQTcV7U721kg9F/UrNAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUcVMLoUObZSEvNqQ6WUmbelDNl03abE/Hs7tRrxShfIuY5r0g
	SF/H0LEoRLz4+5KcniPzbbN0CRHkYbpeiRpV9TALFi78j55GYsomP1+c
X-Gm-Gg: Acq92OG4lJNf2Xl9hnh2YCRzPSAWz8RcvjILpTG5dtKnD7PdLZojvJ4d7hO09/pH0sp
	99bRlk3i3g6c9qDhB87PCOH4cbtkI8WKTyeC7Q+0Bmo5uEsvgroawLiW5rcUppwo1Bfva8EStPB
	Q54w2HBoy6Jx6g2PXYhkTm2cMGDx4HFHNQL+QpkxGWHFH178f6GgG+rNGAcnanZ/zeDNrPI+Ij2
	JRq/Pa56W+cb7Yl3zFTUr15QEFlUfcPIbvEB6372078iW8rvbbWpX7oaCrKFyLDqEG0aKfi5QuT
	0LhGxHon8av5t1xb9d1WqyponQMbOqW3Uz1otq30dRaY+pmHC/KwhUcrEv+zZl4MGiOqUXLOXWC
	JYgzXmX3f5HVYHSqWUw/B3Ka6l8OjWpb8oW6zCdLiyOsvzXvcKKstr6LtShQG+wOVk05qTyd4P2
	1A03pCc54gOY9RXmV6sWAadHc=
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr21057954b3a.16.1778490687914;
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 17:09:19 +0800
Message-ID: <20260511090924.269106-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0

