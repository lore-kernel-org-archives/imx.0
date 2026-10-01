Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EA54CA788
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844199; cv=none; b=Trn95+rsqQZESK6Mnepv+s1LuaSZAH9UPwgJv96Xk1Nd8qjZTbHVNSU1SAIsVY034dOqx9K5VbgdvqNB5waSIn/bTVqGbrewEOMAzSVbyRcM2pINSXa2/Vf8ZB/QT6xwzqy28rnTPc5XTcnvwxOAmBvZifDybpWbPaLpA8Zk90A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844199; c=relaxed/simple;
	bh=Dx7y8RK/I3gcYSQBRPLhRiEJorSzsB0ileDu744Zw0U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IzjrQ5bAYNIZd+YTr2hoYxEfqZAe8qbxe5NLLofZPeoGgsU06TujjzCBbGZHDi47OAYNs1IudtIjEVK8y3S1C2Q9yLTSeWm9unkN9ejSHcB8HswIkf1coa5JU4DrFtch2Z86Wbxrt4D5sIMatelCHuG97b6SIxb3KjPce04Yl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjh7KrZ6; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjh7KrZ6"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso944276f8f.3
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844195; x=1791448995; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=hjh7KrZ6hq7tHX9734cmDmEtZ3PfsGDuVd7fLrzAwN/JnjWUnFlNzPuuyek5v3lCtk
         Fy4yqWIt2frfWXudvF/TRmcT+tKbs/8MlJC/waY4or5bZAToYFf5RFXtflXFHyuEupBv
         Vhik09boGe3+VqEFcNKben7BjaSJEMfhqtO16IFwAponE7PfWpaUp/D7x6U5Yl1mjyuw
         Ca011BKgtTAeYD9/6ZFK79b0BHPL1R3tVhDbLDPOegwSHJzR7Q1Dj/nb4P3wV4OjEyxY
         BCn4GE1YfnVbkt+s5CYjdpOLTZw9UJc9lBP3Cg0dyRnfonkqmlvpfXw2nsyq5xzjVhsQ
         nblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844195; x=1791448995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=fpILjz2dsyJcuTN3ngdtTJJvEALKJZvArX9yug4gKqKxdXEiw7G/axDIFbAMIswp6F
         ki6eVK7vcvsRUlIwWixpVgxris/cWsoxVYjMfu6oCvJI19wJCbBCinkiXoOREzt1WF6T
         EZw0HrCtgI5QGjZQZqoaw0TnB9/vjTL1LX8zw9Kd+eAZmnPA2SlUV6GLhBIkoIUL+n6A
         ZvMDw1fWI4SNuhZElRRgzA57k32v0CCCNb++R9i50riCMi7M2fnbkkj06dpI2tn4/k3E
         m6UrD0EnLGdibgw2t7uR89dEL7Wtc2l/p0Sjvx2BGvWFor9STeNDzDfN0SunvQDJfY3t
         kx8Q==
X-Gm-Message-State: AFuF++nnYIi84QconfzHWccKH96utk06SS+wwVbDrQ/AYuKXVLH3Imwp
	ppXJaekPugrfv3qkqpZgO2YEX+7HSdNQRlU6hPA/HNMoA8n7DyYqemtJ
X-Gm-Gg: AYBFou0rbvYY+5sey5l8dAHNnmJQePB1WfC2chtSeuJM83jIZrenCToP1ejxCjZ8kCZ
	rkBP9tJOpUwsGYS1whpMOmHZ9m0eY3HeevsLXUZvrEezXWIh29tHnQTKvKDSyVbn7YdeYH4/RAZ
	efOpg3/ZtU37nMszb8b49lDntj8/HcKytvUYUJUVEO2GvT86e3cLm3JHJ5yHiyh4m3EBlaq+1D8
	cEYPchepfmIA+uoFKU4onEmQiQOWQ4oiqzfNtGt7MjZ5C5EvF/ceMUljplJ/hEyp9tc5NjCGBjw
	gakuU01KP6QwwSI4gBqlGoBn82hjJqhkr6yAkEnivWYJkXhNAwXLRV2ky11JtCTKIQk8SVXvSfA
	cj3KmcEghKqPV/PNUpkOxkJCDE93u9SYMIDGodokGJg7fkMjQpridfDE/RraWLlH7EzK7Ekfrl1
	A6jgjK54fp4ICyfBLC3A7WeZyx4DsC2TO5W8BEt7w5lVrbvdaj2O9E0Mbft4PsdR0TQr/o6PNL2
	aO0y35SU5uxJF4jt0rrmew3AsQDWffO1Y/dVarEpFbOwCcUCIAOPAxUxedkRhl8kSJJBSZ3Z+1L
	04A1sMAu
X-Received: by 2002:a05:600d:8499:10b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a01b11e692mr49639065e9.22.1790844195067;
        Thu, 01 Oct 2026 01:43:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:14 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: Add Apalis iMX8 and Colibri
 iMX8X overlays
Date: Thu, 01 Oct 2026 10:43:09 +0200
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4dvmoC/x3MQQqDMBBG4avIrDsQE4y2VyldpGZsf1AjGRFBv
 LvB5QePd5BKhii9qoOybFCkuaB+VNT/w/wTRiwma6w3T2d4qzksYYRyn0Z8MxjT3nFcNSl7V6o
 2ets2kcpiyTJgv/fvz3lebxgdnG4AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Apalis iMX8 and
Colibri iMX8X SoMs, and describes the Cortex-M4 remote processor on
Colibri iMX8X.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation
  Board V1.2
- Cortex-M4 remote processor on Colibri iMX8X
- Reserving the Colibri iMX8X Cortex-M4 UART for firmware

The remote processor is described in the SoM device tree, following
the Verdin iMX8M Mini support. It uses the same entry address, mailbox
and RPMsg memory layout as the iMX8QXP MEK.

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 and the Colibri iMX8QXP on Evaluation Board V3.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 remoteproc support
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 UART overlay

 arch/arm64/boot/dts/freescale/Makefile             | 11 +++++
 .../imx8-apalis-eval-v1.2-nau8822-btl.dtso         | 15 +++++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso  | 18 +++++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   | 47 ++++++++++++++++++++++
 4 files changed, 91 insertions(+)
---
base-commit: 39be5a7e3ecc08098c039561237499aa595700da
change-id: 20260930-v1-apalis-colibri-imx8-dtsos-632607d6275d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

