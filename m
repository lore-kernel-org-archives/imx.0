Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A49399003
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113093; cv=none; b=IA1lvTRoiGZB1r/CjuGCC0+7KT9PuCkE41HBmXk7K9TUK6FfcHra9ziY2LUHBqm9byih0RoxHI6htKLEtA88Ssn+u0kr22FTgkmyjVe/3BA1yfzfySXVf90BG8WMsnJIpZcZZLvJXO5o6bKObPjUpDUmCqqOjO923dJkKgAe97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113093; c=relaxed/simple;
	bh=Sy0ZT3//n9xXHpwtu/2uEQ3odIe5kcqPKK201QPMl0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZnkJfyYOJLsPRHavpqXZsIvsWw/9wDJA1SKyu8yUXG3ky2f1DBCFjDmVfHxmgn1kMH8LPUQFd7nrqphNGuqBIRahStJqTPrYQzRJEb/q32jgPkoX9ARkFb4UY0PxVWH7dzH49orUV3RlY3Rmwr/N0bUZ/0VSV0uTDG8m+X0i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOG3CtP8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOG3CtP8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so44010105e9.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 02:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113090; x=1770717890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTaOmh9wnqbOJNsuDkJBw5xu/ZxW0Le6p4u6pemJa+w=;
        b=cOG3CtP8VvZT0kQY83tkt6xUcdnteK518G87/7OiH8+k7gPEadtbCFI7auei5rFcbW
         7zfAzDS64f/Ca1TWHDVTT5fC35EmWfFfPl+ETIAPB+LVKx4Es/86G5wMTxb04X1a6feI
         72nGogEyl8xBDC4+jwTOgyywTR/HIqBRJ38+0IC6qFCUs+VHFHblveOZ2TAXHejTP7iN
         rMlbBMODijydEMn0CKb3C5twhiDAptwIUSfjAN6IYQjZnGCcYaQzZBxLj1l2wq6K36w6
         9JCIxz39iGpRwWpx0QgTQhnL+mfBdLESl2xMqPZmCOOWmNQ4dDhnJ8R/Bz34nLhk0Zfj
         tjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113090; x=1770717890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTaOmh9wnqbOJNsuDkJBw5xu/ZxW0Le6p4u6pemJa+w=;
        b=P7JB1YoHE7ReCvz82R1uGnKvo2zhmyn+nMcf1RM21NP+e2WVHxHB2L70TNjEsSxHj/
         D1wd/BFbVZmWkM1HxM5jyNnkROHn6Ttf2LrqflFS7CyGCEYRLYL+jC/D48BQf7oplTSo
         AJXT6Bp8jCFWaVglP9NbCEhkYZnlnZESu4FTQt5Bniid8c7UBKjaUFcow+ckBym4T+JB
         hoWJBul6CNM/HR4EZePDqpPNMD6FvW35c2wXixGCDPRmN6RxKsYwhcfj0GuvwDcXXD7t
         MF/2dLEBSE/QESTKi0gi7UvpfaTA2QQobd7Gx+o5/GrumaJEVe/kFfOAhssenRuENdGq
         pq/g==
X-Forwarded-Encrypted: i=1; AJvYcCXGyOM5JZCCpQlz3Z5MgrRW/mIDXt3KEq1ui0271/cRg0QSfjnYgBqEFjoG6U6M4a86Lag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Oozh/YJ1QksLsbmA2s40Xg7AKPL7kCf/OjyCe3Wk+IvLE5Vn
	PQirhoDgvlUINv652LuoKNIeosif2+LgqRYdj5i/7Tg0eBbHyE+3TdFbtEYWNw==
X-Gm-Gg: AZuq6aJjdyfLXo5D75h1CFZla0BjwAAjOwA4Su7kKJvJi0CIkUepSbP8jeinXGhQ9MT
	AcHiCNPS6hi5VZH5L4mOf61QPvBAHl0Q4Ep2RvPgUBJmNfUUqUBrLWpSYEcSWNBh5+dkJacacPI
	bLOA1XgwfPHkduyAkkE7Ry/EvbwHK5EsA5n1treNiPcCGQjNlyhahvdyeaOf7awnKckumUd6aIL
	F0U6xeC7HAs4dss4JXdnJm/A4UQrnKfBK5IWBGLnN69JDfnStz7IfNKBjxEp5yEZsV9Rxin+UiO
	WyNKf/qT7tJ1ZYJVAySeASXi9pdDrGa674uB3dbZdJ+PgU/U3KHWAkIvqdkegYE1XJQrLn0H8jp
	qwcq+dBdiT0SUlX+9tqUdp7MNqT2vqRGt3uOQgbq1jFLX1xX/S28jj31rBI+jR3jXbD6IEMz/+2
	aDRIbKT9piaPjRztooJFjGMspOxSSRz8838yk7/g==
X-Received: by 2002:a05:600c:350a:b0:480:6910:abd1 with SMTP id 5b1f17b1804b1-482db491f3emr167091755e9.18.1770113089849;
        Tue, 03 Feb 2026 02:04:49 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue,  3 Feb 2026 02:03:30 -0800
Message-ID: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

---
Changes in v3:
- drop binding patch - picked up by Mark
- split DTS patch into SoC and board patches.
- link to v2: https://lore.kernel.org/lkml/20260126145537.2301-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- adjust binding commit message as suggested by Frank
- replace whitespaces with tabs in MQS pinctrl definition
- link to v1: https://lore.kernel.org/lkml/20260120150329.1486-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  arm64: dts: imx95: add AONMIX MQS node
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 2 files changed, 78 insertions(+)

-- 
2.43.0

