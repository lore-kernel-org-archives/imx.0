Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896A2576F
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727026989; cv=none; b=fu5u4YZVpmlIFhT8Vf1yB3/BYKqUc/6M7SATcRBh2t5Wk0pQSxTcARYuTqaqjV7UuEn+yzrimqI6+hDgIUUqGoWAtSSsoYI5thxBZQz8IlLWLyN9Z9dxA1sHT5+YVInjgV61MAm9R3eIKVnU6Vj8JUf1KZnM6p3iALLTXu+Ohks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727026989; c=relaxed/simple;
	bh=KndTiR0OdHzTrM/PlQIXJZHsx0xGG+vgh0h+TjCqPxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H5RFAAEePBTKy8VV1+JtAhdA2p9gr1J9c6pDOmv3Lutsw21QG7UeGXcmoGdSQ+SMQaG+WHsOocvPs8cgv8I8r995CZJUn8L2+h+kuQP5vfI/H9AS3M/QirT4lMhzlRP2qORd9WELEkr6ThspmYgvUq+ZxKYqbKbZ1W5tMHF4xQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXvTlb/O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXvTlb/O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so46273075e9.0
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727026986; x=1727631786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G0/0BxLdpF3XJIV7yia9b61Vkm7p/ygaIQczFUDvFiQ=;
        b=IXvTlb/OebFbV3ScgTPoYw19qJcRfmjLXhH6aykh50UPvIhcFn7J06O6zhSSIEaIHq
         F/THL0m7qAoZQ4MegwkvvPEzGQG3Jww50nbPyO2pNrs3i2lEg7ioRaM4w/Tk7s7BnjEM
         POyKuHoULyByllKN1N6yFgF+JbjLzsht7o6WyEK7ZfyaFtUPZdgO2BZyb5SVr09greGA
         f2t/TE7WSEJufhKD14+mHCEm6bNQQaXeIoDxi/7ooiQcMbVbIbEwM/3AmoZjRdNo/94I
         sVPG2nQYJAGfMlwxGCeUNJ6w3Z+GurO8ZK6wsuo6Ga3Bu57d35kUi+0AFLnRmuHxAC8o
         BbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727026986; x=1727631786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0/0BxLdpF3XJIV7yia9b61Vkm7p/ygaIQczFUDvFiQ=;
        b=apQs8fVEabIcvcbgIORY4WhtPvYMMwLZTklx9DDbQYnvJFMwThlaCRa5C3XvaGsNa1
         u5oJNlOk1ZfKiBZlvqbYW5l6QIp8AIEZe2LebbrkoTX1HN3C9PhAUu3pCEbjp7TFBGv5
         k//8Wmw5D96L7YnsM68e8EHvgquLcava6Z2BfwEYrC+3N5+FQAaPeTOfTs3gVYHBTOve
         Wmz4HWseNOa4/JBK+1DNGjz9+rMWqbzhvEdTbw3amBWiRV0Z6rv3ZCFyyVQVBeRSBYik
         EN0BLcUoRXDHQhf/NN6bztU9OmntqRfEz6z4Qt/lrHqEizEP2Tj4ku+IVpJXfDkAaWg2
         y62g==
X-Forwarded-Encrypted: i=1; AJvYcCVUe8MtS9sfNgLe1zKjWgtLE4jxXrgnAmxgVIUPzbCMOTsbenEr3XvHdjATaFTxaXKVCw8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3sML2YEAEIiDsSwBkQCSSZtVGHY95yHU7vVGZeV0ZkfsfgBBn
	Mm/t6sUbmw4liWMKAerYopDPyfdDG7X5+U+cJKjHKVIHpCZ+HUdW
X-Google-Smtp-Source: AGHT+IGchA2fv4nZU1ta/RUrDf2dN/GNHctnNcz+zD6gzD0c9IOIG5YzEx5w9yEWjC1Qqw4lvnsGAQ==
X-Received: by 2002:a05:600c:3b92:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-42e7abf06b0mr104218855e9.8.1727026985479;
        Sun, 22 Sep 2024 10:43:05 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae60ad0sm80758535e9.1.2024.09.22.10.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:43:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add support for imx8ulp's SIM
Date: Sun, 22 Sep 2024 13:42:22 -0400
Message-Id: <20240922174225.75948-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

i.MX8ULP's SIM (System Integration Module) allows
control and configuration of certain components
form the domain it's assigned to. Add DT node
and schema for it. Its child shall also be
included.

---
Changes in v5:
- Fixed SoB mismatch
- Link to v4: https://lore.kernel.org/all/20240915114311.75496-1-laurentiu.mihalcea@nxp.com/

Changes in v4:
- Addressed Rob and Krzysztof's comments
- Link to v3: https://lore.kernel.org/all/20240715164514.8718-1-laurentiumihalcea111@gmail.com/

Changes in v3:
- Addressed Krzysztof's comments
- The "reset: add driver for imx8ulp SIM reset controller" patch might generate conflict when
applied to Rob and Shawn Guo's trees (for-next branch). Tested all patches with linux-next,
next-20240715 tag and no conflicts.
- Link to v2: https://lore.kernel.org/all/20240609125901.76274-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Reset controller is now also a syscon provider.
- Changed vendor prefix to nxp.
- Link to v1: https://lore.kernel.org/all/20240516204031.171920-1-laurentiumihalcea111@gmail.com/

---
Laurentiu Mihalcea (3):
  dt-bindings: reset: add schema for imx8ulp SIM reset
  reset: add driver for imx8ulp SIM reset controller
  arm64: dts: imx8ulp: add AVD-SIM node

 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      |  58 ++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  13 +++
 drivers/reset/Kconfig                         |   7 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8ulp-sim.c             | 106 ++++++++++++++++++
 5 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c

-- 
2.34.1

