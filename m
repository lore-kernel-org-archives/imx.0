Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937F1DDA18
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571336; cv=none; b=rVzHCA3Wz3xDilPV32V3Jxg3+0hDSgWEQpKOxuVp2YFJK5PhIBXxyGvlufK/lLRvC9ZGLV//eCjKypQivfA3qeG4UHlpBsh1a9G3Exy1fyuHTLmw0G3SiK40wQoq2Q+BHfTjaQpt2Cy503ZiTb9975r5yA/wbtpyAPLbTK005c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571336; c=relaxed/simple;
	bh=4OACzvQ+o1v/ewKsSJvfplzpiYTNMwh7JsMdz9ebYlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sB9H8tUKe2jDzQNEUnRK73jmN6BcMNd142zMldMrsk8VbPocHHmxx2Xpeq3LdSLZ4Yuyjtp/cGogol25HN9YFhbaqKC/69EmrpBcqXAwuLH56N1koUnkct0tv+pPqraaLKlbEkqacuH0sdG1A9kDZ1vPYEfQBnTteK0w2clvNao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XshyHVzC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XshyHVzC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45305c280a3so10881155e9.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571333; x=1750176133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDynENx9ibTpBe8p9EgALnsApzixLUrLDUFYT9ocKVA=;
        b=XshyHVzCWOHVVYw2/mkPjAlpnINEj8XRaT5lSTgbrzYC+ddB2MppkRwbDhVv87WnOG
         AiEJFdSPcYKnrQFHHwjSNN5c+QrgBR4c85Xy15ROkU2AKSx30NVPhoMJyBz+I8whY/Dm
         kcLuE6iYW9Tzu9fGJEXhxTuGSO9lz0KSBfXOsfE5ICchAX4fpX4krUwPPcE5BVbFUjL8
         YxcjRpOwDsCR+an+QOf4uaUkxR0YygDN1Xw309iPer2lfeB2Sq8bK6uEGVpv59xywRr5
         OaMltwFwxE00co6A+h9/V/FWx5D+7sOzjbMvvL0wd0+pCMtWnFopfBqAL0354wzf6nLq
         v/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571333; x=1750176133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDynENx9ibTpBe8p9EgALnsApzixLUrLDUFYT9ocKVA=;
        b=DCWfVCCEOYJqtH7v4nOCP6taJyTW02kRuP7axl1EexqXQt/nZk1t98cDhJJNXTbCkc
         lOPu3uP/CYikpLF5veZiQO8PEkOlhkRlFuOk0UDqE2NSdQQl9bRFCZAVJsj6N3R6RNoL
         PjTXZIHFuNx7OPjOlRmsMFxiYZZOwWSflWMWDjQuwh5C9lzt3nChD6PjIOgnsUxWqgkd
         qjkNNQXcxW1w4SSyfOBoh7D4/QB92QtogEpOHbxVWyhm3eDRXs4GDmSaK0th7/TXyz8F
         kiSuHCFfFrdJMrWa3vd8IOgJe/yIhUmreH3KBy1wjdYaIordRC+AOj1kgTdoZqWwiFc3
         eF+A==
X-Forwarded-Encrypted: i=1; AJvYcCUf+lK3uQCRsdOztDef5XHYrTTuixQ6poC0ucGbLTmwzTudRt1oYAB5+4uD6fupos/1t7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLQ4EIt5fhGMwlKgIg4EHAxGCCQ+uVUmto8joVNLKNXCBqqtZj
	QESPCFXna0pebkrtyy+N7iDvzgxFS/cTX7Hu/ysXlOlWzHPdH0CnMt8w
X-Gm-Gg: ASbGncuQN3X/l+OipXHEvM0/b5NVLq2yU1P5t/cDYM+3Bctxo1eMeNXdpnE4YHIInHy
	QbmXHZuz9FBzj/0Xdx0EjxEkEkn+KFQnXG8d10KyQ+df9s64FMaqTvFgcXMVm6Rpy6VS3Kbw4a7
	oN9N1F2tc3DmrZg0AWLXCcAuEriZSZhG5kYQU4i6n+aa1h7JCo5MbNRPLECFnQvLoGPTyTIJjU+
	KrrBkXdwmsD5XQQ65UvTIyiawiMtNm+TDGvBgHqeqe6osZPDNpIFwLuIq4lI21QEON/uFvmGI55
	kzjVxMfDnae3DzMly8870soSz1g8akDyhBd0UmVB0rRr86ez5pKXfBpDzU++DgCy6EFi0hKEDhS
	OsFADziPsBEoDwl/HOZASN2w=
X-Google-Smtp-Source: AGHT+IGJNkskQ6HtPeSLERSg8E7NgFIUqPVnq0JdUJ3imp4C1Ig/Qot2Z0dvSBzfgLdyazSmt2eRQQ==
X-Received: by 2002:a05:6000:250e:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a531cb01b7mr13702741f8f.32.1749571332193;
        Tue, 10 Jun 2025 09:02:12 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:11 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:46 -0400
Message-Id: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v7:
* fix merge conflit caused by addition of the reset-related properties to the
dsp node.
* align values for the macros defined in "imx8mp-aipstz.h" as per Shawn's
comment.
* encapsulate the default configuration and base address in a
"struct imx_aipstz_data" to make the driver more future-proof as per
Shawn's comment.
* link to v6: https://lore.kernel.org/lkml/20250415171919.5623-1-laurentiumihalcea111@gmail.com/

Changes in v6:
* drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
help with making the DTS more readable but if it makes it look worse
then there's no point in keeping it.
* use consumer ID as first AC cell and consumer type as the second cell.
Better to go with a format that more people are used to as long as it
still makes sense.
* pick up Rob's R-b
* link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/

Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  96 ++++++++++++++++
 7 files changed, 255 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

