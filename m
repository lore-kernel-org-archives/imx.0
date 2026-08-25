Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3E400DE1
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659869; cv=none; b=Vmc4W4qbT+GXPDM/C5wNf3b/Ln7BeUHuZ3usXDP0GMfv8+ArVKqhx28zRQwvFKpskKWduHI84oxXcvlxRc/BB1fqlttk3fdg6QSdLe96XIq6YvAb5ZBjG2RiQst8pojCnrtylgxM6g4f7BIH5YW8VYhh5TlL+CfAvtG/XWG5tgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659869; c=relaxed/simple;
	bh=OoIu+mil0XO92fIsjqWv9vfzF6b1evoidPJrDdWBQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulDlYcCfFCydhHzNgJYnc3VBEHvQ17a+zk30Yl2qRpeaLd3HoDdLJXm4Gl0bjvNwTZ4RAEkcCNtnaUgntD1/MT2uZF+WmF6I49fayO+5lCJ/G2GRJYGPM2UxnYgR7zRKTSs4KnBpoP6Hpq4Oc6HOcEd4rTcECKqzrztnrJplF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMh6ohOO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMh6ohOO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso6716847a12.0
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659865; x=1788264665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=XMh6ohOOq+hN9FBTFwj57/q8ZwJaXzAt8gpAWDFRU3Pcui0zRRrlDErRY+E0kBP6Dp
         IyK9SyNjx72MibNPMrc+am7FHvktfzo++oAk8lF3EJlVIu+AZpGmzh3guRlEI19b43gp
         S7UAEKVNI7wrAomkbbGGu6YhRbsX6sLYYqu/y4sV5UwTyLmna6W09NS1DyPCKQICCc6S
         WbD3HDTdwa5XcvlFvAizL3UWukpmkKA02n1uN0qtr9AOGJ4mxE5ur4/uzEH9LbgB1NnH
         RAi/cCEYyUfOdwLS25xqV2n6ceB4+q5Uxe3/7FbAYNKbs+84YXR2NqaXAVTOek6Mlwr/
         ldRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659865; x=1788264665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=qFiLRiV0E7VzT8DWKeaaPheG+LnQyXMBYyvG7xnB2jSkjlClWuj8Zb2NmarbONeyiJ
         nrQ98D90OTJHwY0oWfuQuc1ZWJoKWJpXlpMMkj7lDDT2PC/ePo+VwS25Oo6BtIe17K6l
         dV7vpiAALmvg/ktVNUXFgz2sJBvIfUSPFXYp2pgFUBcMYj2f2fALvt/dzAJFY169q6Md
         /Mud1LmnPd1KR8sRiUwQ7pSDqWOHvp5jnf/JYjHCH2gIpG95vW99oR1FQQ8f/75Hlmc7
         196LUH0bs2T1vxCuq8apjBkmiAMBTwlC1b4BqBqUjvmHTUN4WqNwi4ehRqhOG7/Jvx9S
         HmgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTpYpi5spS9SDn81InBCJZbhzRo6EJ8YOCKgdFTAIipnWm9AF141zjbZobjp+4KBarb9Q=@lists.linux.dev
X-Gm-Message-State: AFuF++lWo8g+45HerD4dTBc5NMsHBT0dYdN7gnoFt8iyUFEnqGyAT1QC
	h4bLSv7j8CHWaBE+poq9Sv4VaW1X3IHjvFbVBnmOFsuDlPb1wO5K4pB3
X-Gm-Gg: AR+sD12csoEdAJCHYydIWKn2WOFc9X2tz2/KnvAgzPH1sTwTB+KhQnerMCnCnJpgx3E
	/ZdyQm0VVKlN3UhMDUbGCjE1CVZ45IjpLHlqvuTUoLuY+aulFaNUQ6PHQyuXHFi14aS6KHSy05x
	n22hWraLnKApnfzTubiqi/iUv/ylW07CVyAD9JvCCNw5O3NZQZ2mxwsafo+fmfVsv1KKl3OPVbG
	SaQ/2X5Iq7T2nHL396RRKmS4pdkPW9vduBI6RORkjjOZ2jsbk8Qkjsfueudy0QVZYjGhO5iFmq0
	DW0zAQ+a3TWhejWZKdezmAOzYHsAjeIT23TyZ3W7MSmVouEauo3Bx0X/Gscv2Xp7RqZkE6pGVRK
	meObjl5609pTOKdDac6nHXOBSs6QZZJK5azdbPR6fooqy7z0+fHDDqNYsgxAXE0S0/Rm4bU9rrU
	qnLxR2vCy/fEEGvLv99mC5KXOaSsin50aQdFMDvYncEFL9/mvwshQbVFf2HeWbAbd0jG7Anunov
	Sh5ijEilIJlY9w=
X-Received: by 2002:a05:6402:510d:b0:69f:d4b7:9476 with SMTP id 4fb4d7f45d1cf-6a5c40f286amr6392722a12.4.1787659864924;
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Introduce basic support for MR-NAVQ95
Date: Tue, 25 Aug 2026 05:08:10 -0700
Message-ID: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 267 ++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

