Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60E4F475F
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455288; cv=none; b=gFw1BGcBc6WXi2bgbQeGnkNUU8wNaBR3mElxSESWun+f4VKvr0i6oM+I69N6B0buy5dsFkmAa/55jjZOVBBygH5mLTtKlW4pek3oBOPBva3owdCuJpY4cp38vGFbxENLLGcx6O0fQ/ASnrCzEWzVRVixb2h55U6Hv5Bqlc5rfd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455288; c=relaxed/simple;
	bh=8lvDWbK+uMGm7vhd8Ln53UrwdC+utMFwdIt6V9HHNHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VH8Nl5+RDwh9GJ3tBCdkdspOa10T4Y18ALzcJyhOMnK197Gm3jbLhfASeRWHIXkLXjgv9GfsMpvhHdtVDdDoMm1OlHwYazRR4FdIBWp+mG1SXyYom9+BztV/q0ZLlhtt49hxUpMRMnYiyp57LJJPahLutQZsEJDBOPbhBg4f/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/l8t0XI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/l8t0XI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so960865e9.0
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455285; x=1789060085; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=X/l8t0XItwCzrQ11FEEkG7qY/PTXrzjQp8/le2RC1FQLzGQ/LZcrQtDOxf2dbJzu//
         En0CZOgzhVkVvbuSSxdwCRHxvJFtjh2GMIsGgs8m2KCtk8xbJllKH3iNOZMjNQIeWx7R
         ucMJBA/eTe/njiKM0b2AURoHm4fi8ZkGrID/5WHAkN6TOzWM2H/Qa+nYcbzbbjkQqVQ+
         znVkZhJLRho5GQm6VEFcVFUjSTCKWZHqMfhO5Xq8Eco//t0FFkAzLFgRaoKixYQhvI0u
         XlWaeNhO35ZvyaiIt1mkRKHqMLIpboLV3CP+0bqkNBil/TTXcS7bv9DyQJN5YFyPI8mp
         gynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455285; x=1789060085;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=DsbL/3SulwssQ2IejyLuwlWkh++2Bz8Cc2A9ztFVoYVfajS7DOn5tzhRvBkqL1tRS6
         a6arPASR/vVY/EsRriOarZGw0pSkGfg/JGnzVTD4EtA1UNoD8T9JeY7/yDxw70HFX65M
         eFzw/BIIA15sqQU3U7dtsxIksIwlhe27hQzNl/U4aQGnsWryW+8wYV7oIJHwcDBPxbMM
         8fjIrVC8kTEhqNQdQnOiQet10XkZ9dt1joXtlcNKu8A8R/xJqQj3MXLypp0gX32kdszd
         X/qUEhxMjq6nvn0oELGy9P0s0vBy3v9bV7McomchWAiRsrZfK+QyusyxL6ncWN9Ua7vQ
         cRhA==
X-Forwarded-Encrypted: i=1; AKwUvBxh0qOBw66l7/xh3kYdV2dXiaaRgnRkIo/S8IV0YOuVpUENXaHUNxXLw9alu8fm6KR37wY=@lists.linux.dev
X-Gm-Message-State: AFuF++mBHBBULNaY1nme/yLZlzsXpANO6FPw0kYj6nSX0IaQisFQKNtP
	emJRHbqVGjllAf4kZ5VsJxlEuBVqsPdr+tTIy8Sy9Vos6tTSjw/c9KDL
X-Gm-Gg: AYBFou1DYJR6TIx9aY3iCXPyk79nmf+szk7+ICYlwKAQPOqvcPx201clAhGGO9y2dEJ
	k9yDXE/HV8d9LS07mz5r3lCAlSwuW27QGD/HA2k1ApyyMeIeFWfDhkQjPiVzje/B3NACujPZ0uR
	yYh6TV2FK55y45cVThziUpo1DvRW3PQcA5fGkna7TXCztLkddtXBigHZZQLscLBqKEBNJz87baA
	3VriusBVriiswJ8QVvl6UwWQcGGZNBmOYsyj01Uben016ypiK960s0+uMLw5XzbON83oEqkTZFA
	cUFUHC3hHwYQkzwP1lGHhSbFXq2xwDiUszlLDiIRYcwiGsxMan4hesCiv/bh8m5TRmTuhlwvela
	r+4bsiHiy8s4/L8VcbDLKDEwvPZad6cmSRJafz5A8VxVX2ld2HSK5YYMh+fm+NCHCFwLENPQFUv
	LHG4FUQbDmHmu8DbAVwU5QtKJz0hhOtAdlZIKWaK7pHC+NLr5+sSLmrHRnyPzXODkjh1xWeXgwP
	xK25L8uMkr6rFMV+kgtXgY9i5uCZORnmo0RR7R308r6EgExFTpaAxcl0dcemODaorCSJj1vOpxh
	Uaen55ODWot4NQbFO53fLQUlk6bA2aO1geCso2JCNy052UNrfg==
X-Received: by 2002:a05:600c:698d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf4e14cb9mr86335745e9.16.1788455284516;
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Thu, 03 Sep 2026 19:08:00 +0200
Message-Id: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCpmWoC/yXMQQqDMBBG4avIrB2IU7ToVcRFmvy24yJKkpaCe
 PdGu/wW7+2UEBWJhmqniI8mXUNBU1fkXjY8weqLSYx0pjfC1ntGQHa8rTEL329tK53tMYujUm0
 Rs36v4zj9nd6PBS6fGzqOHxKkxIZzAAAA
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

