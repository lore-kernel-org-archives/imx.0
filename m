Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027120C474
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327868; cv=none; b=Lj4rNUnP0nN/CjnBb/8eiI/Cq0jK6xDRqUXTiPiTlGMXA5l09BIwgFSfUMr/pW2hmGLTflFskR1CA6+en7p1TTl983+Had7eWLz35K6tALYrKqVmvkKLxUvFcLdggPiLlEiJiJxYqBTNmwDH4CbS08JJZgigRHV744sJdanKgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327868; c=relaxed/simple;
	bh=YnG7z0fOKJrMFIenIZn/cMyKITkPo1UCS66LL8X/56M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGAZL40xByrnpgXgTNWTgqnL+BTHzEr/blqlkOaECkWVf/c+wbWNUEb/fVmJB7EPaMc3cprLVR8MnHlOLNhip3RuRb3CEsnUh8KOZ/NjgpyJwpJagPK5kuSLWquOhnfaob9N5getAEZrpNsFGLwGMW+v7fJYi2za4rlS2eXsMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHezV1d9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHezV1d9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de79c2be4so8351005e87.2
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327865; x=1733932665; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=IHezV1d9aYDVmgbZAzuYyx9l+65nVTkG4tGOd5HuwRsLkQgFMqLQlaG0+7fS8GtyU8
         JtdpgGhRZ8G4S5fjwou9qC+c6iNefU/yNMnPrQq7JCA/LD5LmOLXxKy3vh5ZWxz38c2f
         3L2FyuRYUwTPPHnOm2cPd/fY5sWZM0LnC5FHssYGK9nDDItO5c2QCIgTjMhZaKFx47f0
         kO0R05QvtnIyKklGpeapzAeMes7PHA8Fe5GO/ZdwAumjFvumtud+7nNvXT0jReKtloNt
         O27EAGslEP0+KbGKEKdASQRsvCrW7OaF1iJq+8pRTEpIJlCDtb1CvHZrHOFrjLf0qSAN
         jHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327865; x=1733932665;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=uGcn0kOn2Ycm3Bev1ACpoSFEg9lEVzniDSrXK6ZPkyGQVI3Ng3U6jHZIkpu0xxOMHY
         XB5kLwfMU5ST/tb8c8O7enRbUO9dHBtOZtbOHkZY7+unoVIIIVnTWnDuq13uN7hU4Nzr
         dLFCmd2tpbfMGRTwU/wGmD4eIH9SKR42HIZIjFPfXeNkTwF3Dt9OfwUuupv9u4kg1gfO
         HA6Dxlt9ZLDT9KXGSPOU+/81J07RRUKVNqlZG8IMyFQ+V6XuJP7Jwl9SLhd7QXoMrXvv
         3ROcC4yeivGFNXI3/JY3HMjPS3XvPnJTjRT5SSecC2hPjPmOp3hHeL4NDU19xJKn0dyO
         FTHw==
X-Forwarded-Encrypted: i=1; AJvYcCWCw513zcMhmIfHebqVOvr7/NfLvoLVIFY3YORDiF2asKVdAA4s+wY1U7bQVHhj34D8aOc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9FbTKxxmSB2r/ZBZq08rADzEMQSUQQqq3U9xccondlR2ngNzA
	PrCK1sh7ANywzzQ+l/DjP/Mdwa5g+J/qJjVzafNJ7V2zMWvd4sWI
X-Gm-Gg: ASbGncunsIMv7cCzIDZ3G2fwvpyAUnefkojdJAFhWVOKfLI1UvQHSY2RgYAe8kJ4xOR
	W7cHG5n6ZBXmPrjDKRd4Rz4am0ztTZvzXovXI3L1SeWc0LsXzdZn/9/a/Co01jfcEdkJgBu9Lkt
	Dbq6JkGa14qZctuWqxUHUWIGSjp0hI52HbzCY0p1xti6BvjMGBtWFW1oSpr+Lr0d4c48+v0jMSj
	mtjGtU4QvKLeZzAPkvTWxUjZfLIyIei4X7UjjVooSicLXZ4Euljmoval34DODbL0GzKptjaCoNJ
	+/i1wPUs/ZvK8wc=
X-Google-Smtp-Source: AGHT+IEy9n6nxWmwqhFSvEOtXxa2/T4QYEk0NY96t8djbuTb5+3DKRoxBp5roEh8mU61qF3g4m3EWA==
X-Received: by 2002:a05:6512:234a:b0:53d:e4d2:bb9 with SMTP id 2adb3069b0e04-53e12a3521cmr4486318e87.54.1733327864801;
        Wed, 04 Dec 2024 07:57:44 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:43 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/9] Rebuild default configurations for some ARM boards
Date: Wed, 04 Dec 2024 16:56:42 +0100
Message-Id: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALp7UGcC/x3MQQqAIBBA0avIrBN0sIKuEi1iHG02GgoRiHdPW
 r7F/w0qF+EKm2pQ+JEqOQ3YSQFdZ4qsxQ8DGnQWjdOeA+UUJFa9muVE62lmRzCCu3CQ95/tR+8
 f4GScaFwAAAA=
X-Change-ID: 20241204-defconfigs-706a21dc5e4c
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YnG7z0fOKJrMFIenIZn/cMyKITkPo1UCS66LL8X/56M=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvE/sKv4AaxRiWeBOth6xz467RGh5qwWXEon
 sjLcr5gT5eJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7xAAKCRCIgE5vWV1S
 MimdEADQXFpBCP3zM2ifwMzmUGOrx6G7P/aLw8UR67mVpyR+t5nSRIqRdDwJGb0BbSdwEKFGuZd
 MgOPNFZDkKduYqnqfcFoPOW0s6GKmNBsH6zsCvx3n2XwX6nvGVzl8P7DZqfNE+a7DajajRt74pq
 tI6bpsVDQLM/7hphDkLVkOb3MiITjryc57v9p3DSsqZf4Zr2ImKOtt+pvXTmrpmSld96R6LmOVJ
 A23Z/cRjWRtKyJnlFwt982t/zVsu24ebApAvTHYT4aZ4EY2nkWIgBTbUtdZZjF4J2DWu61JCRrb
 /AubGtaFC/Gt5c7CVhHYEF1VYEJLULwdEVesAxMGAU89wfPCzt2dC9k656g6jxUejosEt7txbq4
 0ALq/dp9tb34ud+PvelWF1kw9peKgw18yyitFo9jy5fAliMcNTOFSfJ+ddzs5r//pZiVvTL8WDS
 8AQd1z6bpr2y6imt3u4J3Jr/xT+iF+klJgp88h1lrgIi9i6JRgVtPjhYJ6sRpW+j5iRDe5caHuT
 ENZDbbatG80h/+IjrAbYJNoERNarGQWuCFyDCt40sjZ3vi9E+ymYJh7IE7RxXPHmcvZfqymPWP7
 1OumeLUAJ2WwfFS8ehe9mJ+bfqVuTY+xSovrB0r5XzWP3OALPcnEFly/lPjTiatJmuD/VWCDATH
 tG0cwW70ZxepPsA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

I was building Yocto for a davinci based board and got the following:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_MTD_M25P80
     - CONFIG_DRM_TINYDRM

Both of these configuration options are obsolete in newer kernels.
When searching the tree for other instances of these I found a few in
other defconfig files.

This series is simply a
$ make foo_defconfig
$ make savedefconfig
$ cp defconfig arch/arm/configs/foo_defconfig

for those defconfigs that contained any of the options listed above.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (9):
      ARM: axm55xx_defconfig: rebuild default configuration
      ARM: davinci_all_defconfig: rebuild default configuration
      ARM: dove_defconfig: rebuild default configuration
      ARM: keystone_defconfig: rebuild default configuration
      ARM: mvebu_v5_defconfig: rebuild default configuration
      ARM: mxs_defconfig: rebuild default configuration
      ARM: pxa_defconfig: rebuild default configuration
      ARM: qcom_defconfig: rebuild default configuration
      ARM: socfpga_defconfig: rebuild default configuration

 arch/arm/configs/axm55xx_defconfig     | 30 ---------------
 arch/arm/configs/davinci_all_defconfig | 18 ---------
 arch/arm/configs/dove_defconfig        | 11 ------
 arch/arm/configs/keystone_defconfig    | 12 +-----
 arch/arm/configs/mvebu_v5_defconfig    |  8 ----
 arch/arm/configs/mxs_defconfig         | 11 ------
 arch/arm/configs/pxa_defconfig         | 69 +---------------------------------
 arch/arm/configs/qcom_defconfig        | 27 +------------
 arch/arm/configs/socfpga_defconfig     |  3 --
 9 files changed, 4 insertions(+), 185 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241204-defconfigs-706a21dc5e4c

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

