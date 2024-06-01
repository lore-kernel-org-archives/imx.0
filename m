Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE91514E2
	for <imx@lists.linux.dev>; Sat,  1 Jun 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717249959; cv=none; b=lTzY8yDNpLX4zSQsa4CLufTC2T2zY3KXWfefYT6BMKD9tBQqZptcUvhcEo9wFy7Mr1KH+mxUt+GAc6y41vY1z1z5ZGaT5QCE/apAoHUwb76HiIdX23xboC1P9cdghFmcvWStb5Lo0LFQ21q+jf7cKhlxI60VFbFUOJURfUqSI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717249959; c=relaxed/simple;
	bh=x97TGYicuAOIiNkkbEMugsrQH1Uh8scFHklNqOBKDT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gdlw8wb4RC3eg9pIBFRCsWEQiZG73WncvpAgUoR6HZv3Jqxw/eceWcSZo51qZAw9Un+2cn1r1v8X+h71oKC/dgjPrXpJD6ADodhwcG+hgNbOMS/SXEJ+l4paY/0GVnOOeZNSMTDhTgyBuQ5K1/pkcwUKGNveCDiygaCk/H+M2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbGbfn9N; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbGbfn9N"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7ea7bcc72caso130531939f.0
        for <imx@lists.linux.dev>; Sat, 01 Jun 2024 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717249957; x=1717854757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSOWAUY88oC5lW5rvGSdvx6UaNHLnsYyAlMhcv2+2no=;
        b=BbGbfn9NAEmm4q+oN8kDhXZ73rnERav6ymqeW/P1/UJ6z/nLIC2XO/drejsGi68THD
         Kr5S3V2CTjv0ev8viRwLfHF2DViUrMtvdRBViX6imHcg+6YOF2A3oSnKY9YCxgY7RA43
         aXyP9fghdKHG4JXI5l8mKzL90pC4UalX/HcFTGiOgNddW9uIIyj4PGtL0IXUxNXdQZyu
         iVhEJMJfPOQY5FraTTJoZp64m5JxvGJ2JO0L5N0XqxtQm504IsHXK9noQ8vlEYjK2mAJ
         FWBsMZSKHc+wOeYbCiBML3/72CSl0PSj1mSqx9FphYsl4mAhLBnf2S/CJPuwxnuBRD9T
         KX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717249957; x=1717854757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSOWAUY88oC5lW5rvGSdvx6UaNHLnsYyAlMhcv2+2no=;
        b=rJKKg7Rzz9HyMA0sndNnkmrbSECNBCoQ40k2tKJR0TeZAaV4bxSvkHDZB1kLazFj44
         Z7/tcyS7f9RpeOTQZ9xN9dcvwm0WC7wMmeAN5/ICbIztFgD7qmfR46OVznXJUfISLceR
         kxRtsJ0WuI0TsXHnhxbD+wfBf46HSz1G/EGypEOblr/Zd/hXPFG5qWdtho6ySgblP6mr
         eDP6uF4t+mZy3Q9w61xQBpHm2f/u3AC01S/t9rcovd57LqWpW0MOHFs2E45F1VblJc/c
         KJRpMSGX45Cnp/QqyRb5JzkaR+uFS8oV9H+Gr3pmiR3zAzieFHJ5n1fnD+6FjeT0IcpB
         1y4w==
X-Forwarded-Encrypted: i=1; AJvYcCU1MSQJRc0Z0lF/7f2fMelCBR/GwfVuzoz/ONFD2ahsG/gb9ktFdhg81zbdgD0SvU+XS4higMR2r0XLcKHd+3XBFGHd
X-Gm-Message-State: AOJu0YzDq+CgHidCIdA0zkLd0M3xOIJIJg0tGXIlFmcfWoRVN6xYKICM
	Dz3BIwYn4W3uNDcnol8/8dxOye9oHGw1WqpGEMA4V0MOO4PgcV+Z
X-Google-Smtp-Source: AGHT+IFu377v3BUIDc9piHIID8NWcbvXfFBcxu9yZ9fDFgRolnum/XAZM3rhhAySVW5+a3c2HcN5tA==
X-Received: by 2002:a05:6602:2d88:b0:7ea:fadb:1cd5 with SMTP id ca18e2360f4ac-7eafff2b8e1mr639467839f.18.1717249956993;
        Sat, 01 Jun 2024 06:52:36 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:e0b7:c613:ee:e8f3])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b56e7824d4sm556349173.172.2024.06.01.06.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 06:52:36 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/2] arm64: dts: imx8mp-beacon-kit: Enable ADV7535 Hot Plug Detect
Date: Sat,  1 Jun 2024 08:52:28 -0500
Message-ID: <20240601135230.89980-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DSI to HDMI bridge supports hot-plug-detect.The driver
supports shared GPIO IRQ pins, so it's save to enable them
which allows for hot-plug detect.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
V3:  Update commit message, no functional changes.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index e5d3901f2913..da836172ae46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
 		reg-names = "main", "cec", "edid", "packet";
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.43.0

