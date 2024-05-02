Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0183957C8A
	for <imx@lists.linux.dev>; Thu,  2 May 2024 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714687107; cv=none; b=C9R/LIqHkzLP42hDsTI6sM5bHe5KMKFPCZDcc0xETII7yjF7m4hMzfUeRf8ZeoiEyu6quFanUQGxLIEqVAwF9CG3rdSdFD5Wn05Jgs8NgOPbMmik9+gEJh2/ukMFpez1SmXndkqrsUiM1qH2uucOasUJksJbz6HNQvHA3JHNsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714687107; c=relaxed/simple;
	bh=TN1W5KMMesyLRD7x7xDanKQRJfXjkWhpRfRA82DncpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1lKzjHyv/Bd7lw+0R0/53TmG5GLP7/o719PK4EBffIWc4ogG65HzE5+WeOanxhBn55BekZLFy+bBfio7POYFZyKl4Ju33cJUnlk7ddJB0wV9oeMdS5E9CN45/jh5Lykhb8az9jvezSWXfI+gmjOac4jWnZYtzM7d7sdi8YP0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCPArCfm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCPArCfm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a524ecaf215so1154531966b.2
        for <imx@lists.linux.dev>; Thu, 02 May 2024 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714687104; x=1715291904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGLfA1Ru+uwY6jsvAbh0LYGZzce9SwyCjBrAIvzc7yw=;
        b=ZCPArCfmdm2vP1VS3qSVZ57V5Ujxyb+mGIrlzxQvedm+1qRT/Su9RpmpYp8aeuUNk5
         8sOMBjozLqItaMseAV379rdperexkMjt1U9dQ5hHM4MFTO96b27NyNsGfeT4LYszum34
         OhvADj5EY09am0pc3TbA46ljSv7u2q5M/b+To//ZvD78/CZvrudLH05zIikkkIx9LxVQ
         j+3JQhdbKgO1b8jPGaMc9rmmkbYmR6YjKTnKHFqhyHWUYTBQeqhwqES2AU6KcrNw2qs1
         ZtuXiMmKpOTOVyB4fIrRT+TKRiGovqSkDugab2Gu7rsVmr0/gf3ZcLuj69AZuv9hLsP9
         6lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714687104; x=1715291904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGLfA1Ru+uwY6jsvAbh0LYGZzce9SwyCjBrAIvzc7yw=;
        b=MKxlOrUXF97USkz8n2gab/FbIhoZSX/3n26IGTaIpu2MoZrpVHBRLZCJlo9QtTvrhD
         v4D7MJiIVh8t/Y96re6e64ZBJlgRKQHXHL0oDLAroSSLOF/1QnWRJ7cYk452J0j4wVNx
         XkO91zPsoYBg4mR9wW/WRcMplymhAXWZeS23Pi1nZLeAg/8s+k5CQWravi7Uua0LZAVi
         7SCMQn/eGRN8+hSHqIRaV/moOLwgwxGos38VNlpCXVbG0GlEsGAlD/NXXTupvCj2p2yH
         mYJW13hu4T7Mhg9UmLNRD4DvtnPgPWnjTxNEVxuPLOvHy9IR+9PXxNHN/yEytUx/LoYR
         wZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzA/hj6pRpXOuqLYn3uvGSssWNGGJe4R0eFCB6OgrwjZiRX6tm4Af3LnH0ZkR67gtbqZqG3MPmTaZiTL7jrUEaM5hD
X-Gm-Message-State: AOJu0Yyxs2q+v1K1m/fRrM/s06ikKYcNxb6Hn1OUCRJPdxdmLsInDEMR
	1vIcVFVhl+yI4VAoCikHV/VFH+hqexrd9808EjpgSTKyyZw872WX
X-Google-Smtp-Source: AGHT+IFrUy3JSgdbaGiFGnJ6dFWw4SGywBWdOs7k/nVZzVBYx8ICA7jbSUKdVJTUeMa0SuR0abTjzw==
X-Received: by 2002:a50:a6d1:0:b0:56e:966:be7c with SMTP id f17-20020a50a6d1000000b0056e0966be7cmr419430edc.2.1714687104010;
        Thu, 02 May 2024 14:58:24 -0700 (PDT)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at. [80.108.76.242])
        by smtp.gmail.com with ESMTPSA id c21-20020aa7df15000000b005727bdb1eafsm926722edy.40.2024.05.02.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 14:58:23 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: imx8qm: Add GPU nodes
Date: Thu,  2 May 2024 23:57:46 +0200
Message-ID: <20240502215747.2832126-1-christian.gmeiner@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index b3d01677b70c..54879ae1d7d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -467,6 +467,7 @@ drc_crit0: trip1 {
 	#include "imx8-ss-dma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-lsio.dtsi"
+	#include "imx8-ss-gpu0.dtsi"
 };
 
 #include "imx8qm-ss-img.dtsi"
-- 
2.44.0

