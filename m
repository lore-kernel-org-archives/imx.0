Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE097824AB
	for <imx@lists.linux.dev>; Fri,  3 May 2024 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714771376; cv=none; b=vAX/of0L4H98PCz0xRqGd411SY9LkX7Y9e8qPf3t5oxekkFvsE4xjM6g4Gl3TM/D66hh8xhWDPx9Ir1l7yR5eXC+hQrGdXnbMcq8O6coWvf7yBV0pN4LOfmOdd1zmSszCr7tnqR3wV6cNb3GX16qxuQkB656/ijEx0cuhpQaJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714771376; c=relaxed/simple;
	bh=K4NcSEpC7I/4aUwVZiqF2rm1O+WGjxoElYis3WpGrUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVVXs/adkNoo3+5lhftfY8UlCBqcp5zpVa9aIDQc6YR1UIgyLEs9Blw86PWd7ScZaffgFmYrJNwHbPncU1hKNvuOIXwFU2JaGZRzEDWi0qCnjwGbDJGzxeORGNYgkJM3fkTkQnl9ixlvtFx6S7PAw/+7muH2xre+exp6qvhVbto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzpeZIHC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzpeZIHC"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5171a529224so119123e87.0
        for <imx@lists.linux.dev>; Fri, 03 May 2024 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714771373; x=1715376173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bvhcIi7s7OtBZ29qVZiiarvKCxPVK9OqdYkfozMUGo=;
        b=PzpeZIHCKxkV8QviVnkQG7BJiJTuaCF/EAifuKU+p3ZxGBciScGUjdh/v2gbt9g7X4
         BeXJUeQqxhFBKWdvLWESc/HOLXU85CrKspqIlT1WiYpD1t4Mc2y4aFGcpd5vkAiRydFF
         TbSTKPfzkD/48AMzz3rBJ+cHlbyheDpPCJ+20zScI7Zvbgx3NAs29fD0bq3uFzbQlsbi
         J7vAzFPtcbHNVbmjPCq8O/q6eJLJhLf8Lwfnz/zDpfXu0xcNoP34HwI7bFMq+LnmUDS2
         jxMb//FZtCvNqIsDXks23rBalhkbkOq/xIDZ0Nvn1Mw0GN24wJMbH29CwJR8s8TETjtF
         hA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714771373; x=1715376173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bvhcIi7s7OtBZ29qVZiiarvKCxPVK9OqdYkfozMUGo=;
        b=SiT7etXMrSK6wKlyqIN6e00DFTm48dosElNZKMdlg8noj1H96pXZfgRk7vnVn6whdY
         A6EUHN07nkoaIurBPsiiMK1Zlcl87QUOSOptnWjQf2c2Es/wj/o1dx3lY09fmXE9uk2d
         /ldRRyFR9RZ9BWfQNTq4SwLY8gLvOuWcwEvVfwdqTntVS55/195/FQKn7OVV0vYuV6de
         AGc3Dh81jFzWIcrLoqkuyCBW3IRb/YpuptJ5vc6+pGJThGTvJJ+snXc4/JU2ACPsXQsI
         B5cSp7xZHjtAmRZcA4t4nVpwhllTOYE/b2kLYV+Isdtls0TDqgYcVv2OsCJ/oXUTv6UU
         7Zeg==
X-Forwarded-Encrypted: i=1; AJvYcCXRrD3FbDRRQ1uCpZZg9KtSAuxFanxEEF7svhAiAtE1BAjFduonBGubsf1n/e3ohzW1ll74SabxbrPuyEIk3zWcH/pT
X-Gm-Message-State: AOJu0Yys1zZGONNICH/KhwvyQP7Y90P7RwVtgG0pd5480g/ZcEO4seSG
	Y/tQJckUReH1kYM2G8Muf5jUIOIkirp1d9/9GErGHzPqSJeSanxe
X-Google-Smtp-Source: AGHT+IHKt7/IlhLnAgzH8evYd55jGnh8jC+7MGS9qJrx7K/YQeZM+131ljiwIjiNWKPIrFhyU1yuIQ==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id v26-20020a05651203ba00b0051cd528c333mr1804987lfp.20.1714771372707;
        Fri, 03 May 2024 14:22:52 -0700 (PDT)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at. [80.108.76.242])
        by smtp.gmail.com with ESMTPSA id mt20-20020a170907619400b00a59a4261b84sm162073ejc.141.2024.05.03.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 14:22:52 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Christian Gmeiner <cgmeiner@igalia.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8qm: Add GPU nodes
Date: Fri,  3 May 2024 23:22:48 +0200
Message-ID: <20240503212249.3102288-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Gmeiner <cgmeiner@igalia.com>

Add the DT node for the GPU core found on the i.MX8QM.

etnaviv-gpu 53100000.gpu: model: GC7000, revision: 6009
[drm] Initialized etnaviv 1.4.0 20151214 for etnaviv on minor 0

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
v1 -> v2:
 - Order by subsystem register address.

 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index b3d01677b70c..8e061582a4c9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -463,6 +463,7 @@ drc_crit0: trip1 {
 
 	/* sorted in register address */
 	#include "imx8-ss-vpu.dtsi"
+	#include "imx8-ss-gpu0.dtsi"
 	#include "imx8-ss-img.dtsi"
 	#include "imx8-ss-dma.dtsi"
 	#include "imx8-ss-conn.dtsi"
-- 
2.44.0

