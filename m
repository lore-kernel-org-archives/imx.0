Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9C22A4D8
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758159818; cv=none; b=RjQN0P3LfWOXydAzWBwLc4FvQ0mo1MsKz9jOz1lJqf7VRKpogyRCgInVfS4br3RzDBO2jZcHI8IpqNmnLhGvilKxW+8ZH9AyPhCtzvwSe48XBsd0ycofScqA4lOuDa0E3ToMr1JOZN40GSGry5s6iuHfNB+m6VFb2wcwUpUn++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758159818; c=relaxed/simple;
	bh=UrGxr/WjtT928xmbCCKU5+v2Ur3oxLYlU77CDE4u8No=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CwWy4RUXZDwR+jkquKAcrwBR18v2ozyHrz/NuKjNjONlgjnkCd6BbpNkivaX7VDeOo6/DDBdiXRYwGvxA5lmpLZ78+cg32xRspCMxtmej/yKQBKDLa9r2TcD7nU/Ewwi1845G5QIb23+UkmXOmFh86Lfrn9SJeCPG9IkoOmlA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz7AjpRj; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz7AjpRj"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b5f7fe502dso2388901cf.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758159816; x=1758764616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+l9K23yh6l3TvW8w/MfzE09CsujDDpfaYqSz07+eVdQ=;
        b=Dz7AjpRjwmnBaG9Z7MLGmg+tm2x2qHjl/Mact5S9AJAA2rvTzpwUP56vPyMK2Ovz9A
         Vv4vkU0yvThXKGTZjwZnRO8XIOa1b8IIu1z4D2cL3S1RSUu1jUzOe4pSj+HdwnYKxIod
         nISQZxkxaoKm6tS/eTqujcAzNPOTCGO97wPJVY7CDdIIvPsWvg0XqZEtdpUj7oC5X8V9
         XwIX1Sj/4MV64d/IS+ZndYB7ARY7I+N32Z8H6NtiBmERcSG8iPyJsbkCIbC2jHrl+x+0
         +YZHTbjTSvrEtUNpndPSece8ktxZgcZGgn7SJgklKHTHl9vimmPs1X/D92jJ+mT4IRlh
         eX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159816; x=1758764616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+l9K23yh6l3TvW8w/MfzE09CsujDDpfaYqSz07+eVdQ=;
        b=lUo5qcCKxaGjx0pWHb2aBHKmqD8B5tfQOwfmwxnJmxUiFZ8EFLqavshx6r581/zdt+
         3WHm08KlNw66Sh0ksgnke40HFyFAXo39VkMkqBXnDZ1R8nKRR8oy4Xe5reSPdzkW+25D
         l7yu/NA0BppicFjfhZXj7b6dkcNv/BSRh1YW3876Zz+y1uTFY1wHeWadXx8ge61Tms1S
         v+0k40YdAh/+9kWkfhRuQxwbiyiZB+4DlInA7c4B0X3KoaT5sONv4ZoGUCA+8LzGUaIX
         fZRdkvFGfuTcf4KrWXdEub3sPhbr/3kT0pvx5JYVcTx4zGcml+192x40hiJOAbeQm2W6
         Rn8w==
X-Forwarded-Encrypted: i=1; AJvYcCWZmzTTu+ZJq5oD0GQoadDSI/ZSY8z7xYbR8eQhHyrYvCCf9agwWNJUvvfqqVBW5Bj7TTo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+kRKfe9N276X971wCeCmGPH3Z70T+WDXqE3EUbzj/GNPYpuG
	4NYvI2Xy3DH+SJNJ2hUZXkOKqokkkBPfq0YvXpPNsnTY2jZIbx3Mg4QB
X-Gm-Gg: ASbGncv/JsqFKSnL7qBAIPBi1aiX4xEE6TMaa+cqe5VvW8o9mAbF/M08mDPS0OBkOQ5
	HmVWkisnA9YqH28HGFDAL2m1Y6IV6Gm7jb8qPE4O4B6X7mEahrjQ51nRQdfLvgjgS8rcRbGQV+u
	rjRIdu6yj1CCsz67H3NkB2RlWImvf4wxelf46bamdp/9LL85VRfc5XaBk0tg0zebuCnhVgrIS0u
	TxKN7nQ/mn+Tir6/iHa1JzgJxCezr3EIv8LPhiRtipVjkHfW7wFYt1lDZG+gi82R9fX2hUyBT7z
	cTt6VFdj+7KtW12IqGmA75/DpqXvkMqJm/p46DtXtTshDzJs7S2Rjp61p2c1eCEAq/Ee/DwkGYb
	wLbq0wCaiY+uDKfv5sK2q+5N8n8wigYn/oSCVIbptqn/3QblntfoBKuJdDP8=
X-Google-Smtp-Source: AGHT+IGKxnkq9Yna25gDDHM/UBKhOjdM3Em76x+D0aBlAB+6RbOzXElaevH4sYxDOsPcW3TRYXULaA==
X-Received: by 2002:a05:6214:3482:b0:78f:5313:1417 with SMTP id 6a1803df08f44-78f531316a6mr29850696d6.32.1758159815844;
        Wed, 17 Sep 2025 18:43:35 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79346930bbesm5191506d6.17.2025.09.17.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:43:35 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
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
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Wed, 17 Sep 2025 21:40:52 -0400
Message-Id: <20250918014053.696710-1-rpimentel.silva@gmail.com>
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

