Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5682F0C63
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758583552; cv=none; b=enq/7otZIGiMvcCZ/sIpTCoocrhVknyCvbwNBLaMAFq7fz7NUeFyytKN/56+NvORRosf/TS4RAieIgTzcdZe0aQQGSQBsQjQivBy6/JGYnwkFh4yigKig85AXfsl63fDexlJIfL6UCMqgjI2LyWQvUjt+Tx2YmcN5UQ2Fbk7C0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758583552; c=relaxed/simple;
	bh=JLZ6zJ1daf0+CDFQwAvOjSOsjU7qluGVOxSDdjbTdGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m4+tiWSBt6G7vQoPz7fIS2qDXFZt782UsA5fzhFFIijD0Yqywvp+nhnRrL6lwHR5x7qYhTa+QbtmFtRIY81sl49hLN+luby9EAOmhN3lZypGmaKv8FPGSnPBH80rT6sRGV/5grRA96spiFg/b2vjXaLjU/whrzW6rAykQsRSn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO6pIxUy; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO6pIxUy"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78f15d5846dso56063386d6.0
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758583548; x=1759188348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8P93O7mFuM2RNG5Gl6sjJK4baF70StwSvvALSzglIM=;
        b=bO6pIxUykKG0uYwwmWU5C6kztJxdgo9ligX+ELiab7fci+mg42/CiozYprHqUv577p
         8g+7YRyaDrjFz7I8Laxw/O5YfSz/tl2XDD1Zjj6I8+2I2ntKB5XPxwLm/duYRnuZiCcX
         4MHSNxCqS05lCevHD1yYsBeT5DpnGFItBKGOYPelCH+QQWF7TlLSRF+Tie+YsuYFPq7B
         Cbnx9d/03gvce9hPBZCPhJGPCTRdpacjIvGjqao9L8kwpnbrcpmZh9qqzqlZbcZwgbiU
         9XpkUSi0ifLhAqGEXWRxUiZl0sdKUYwMT9ZQg0mO4CamagVgiawsZgSVkHyVHC01y07I
         QtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758583548; x=1759188348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8P93O7mFuM2RNG5Gl6sjJK4baF70StwSvvALSzglIM=;
        b=gb57muvhctTBj+ZQZ+nI3HQ6IBJF5Ws56EAUQ3YaqQ/hrmSJ2QzapumcXP3rgREYo5
         YiMAuboKuPH8B5vqGbxxJL6cd0nxd94eCzuG1ExwgGyLKnkOOZqaSGzvNblPqvBSHKB4
         qI+5wYWmOMsLNxVTkdJ1Rn2AsKYgYkK7hcKMihaGiK01aohNJGJ+wuLmROSXX5pW40Vk
         W3rRSqa1RNzI7G4EiNSQcNJ6PK2rkaycaDNAG1Mm6+B46LOEjLNdcQCx59K7j+ORbHmu
         5JLMY8ycCUFDIAB2A/FwL+1Ix4bC2YW/xSpGnfsX23zA4LNR9gMRxeWg9z//dh8FcgRc
         ksjA==
X-Forwarded-Encrypted: i=1; AJvYcCWKglq/i8uR1ZLJocwuv4T8f/r8PuP0jzhPvGpecP/j0Beaqi/iDPnCydqw9w2QRkhQlO4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSVg3os7uu/eeSj+HxuUUDAjskgLtiVW4kHnozhp5Gm9iGPQgO
	tZgyCTQ7x0VFt+FnpksWQKQRS1m6I0dZ2noWOgJ8PWxqQugHgmznki0a
X-Gm-Gg: ASbGncvA5HbM7Kjn67Vymni+1tctXFrXPybaofWDWf+bvOcp1EdBuFeSfiXho1R1Gwz
	L4/1VLyjuqa2U7HAtrdZHZg4u1jqbh+Bk9AA/oo700ILm/6Q+Zkh1qB1X5CW4Qy+Zuq6iKiNlQc
	59A50kBSaEiCnqVaIi+g1O7TCYSoDfscuOOOWjY6ESHCG7/Vdv7LnGEbdDZpEQBI5segQus9h45
	3Y/QxrGy50r0nooKucrYb+VjIj9XVoZOf5vzzSqOhLvZEYwHb++3nlfvkRQMJnr7Y66Mi7QKaZH
	Hh36cu+g196bdjXPcrXJYsJoGl7oBy1bL1muMBiWx1eIqnro8RX0q0rEoUQC4EHzy7Na+/kib64
	9HjRwO58EEKMFQ768+mPrGVrkVX/UNC81kqOJBC+S
X-Google-Smtp-Source: AGHT+IFbSBgrLxfeIQurMy9quETHgDR5erLT96k/GtUBVfyP12lxyT/MwQ6vyqqabYOGY6hcIz9rTg==
X-Received: by 2002:ad4:5ce1:0:b0:777:2f9d:71ca with SMTP id 6a1803df08f44-7e719766627mr7924456d6.56.1758583547736;
        Mon, 22 Sep 2025 16:25:47 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793548c63desm79417226d6.57.2025.09.22.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:25:47 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Mon, 22 Sep 2025 19:25:22 -0400
Message-Id: <20250922232523.844633-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v3

No changes in v2


 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..8bddf1f8a78d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1

