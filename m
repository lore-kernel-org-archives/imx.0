Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992964;
	b=czr7e3GwCLMZBdEO35Byk7Lcd8crh172gAcWKYmtjvWKSGVaSTfGU7udC4D8yXRC+aTb
	 DsTRxCF72Dd/5TMgleJQ3KSQfN6OIQHHDj+8NoEXKT10pKVDP+UIbex1802i96P3lSwoK
	 EfFit9uliEUXsTY89y0fN1FH1xJK6XU1YGRmSKjlxc/fs9+1NSM+ubPW6KsrKcUjOiOGt
	 0d+L3mL75XJ6uABdkOjRcPJh/nz+hWEkUFD+W2+HNtWIDgfuCKqlQo9FZe/JVI/JgMytM
	 TkfRZhfu54blgX0mz0zZSKZ+L90Bvy0P+6lGpMtwQmqW4waeafY1qYrRxwvGYubmA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=WdxpGOHlO6QqGWpqHXDWFNnreMPMZ96qWBOQAoozUZxuaT4q2QAodqGE08AQCGzjStl6
	 qbXsZHtxrM1yqi061HkgIAA/SPeUH3ve6McyOhmGUXDeoncpQDA2w0GyGVJBeMPlzPiIp
	 0ssYjfpfmY2q/JHddACXORhkDJgTeJoO9T+wu2xtr6SUISOgbQdB9lG9ANUUYI7aaTVi4
	 I825z0l3+J23mga/Puy/hV+ptvSb7iZMTNpgsFiWNOrAdtmeaojRRxddPBxLGUcjF11Dl
	 m8QqvD3DlQ2mn6+35JOfDH+NmgNyzFl+xL01sTJzknPp8HPaU7EFxSi+3ygHGCp8z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=StbveEOg;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3847606A320
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3847606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=StbveEOg
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8367855e9.0
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992962; x=1795597762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=StbveEOgabGxnZR1X9UGZ+qYrr3f2wPuGcgHXVmQXjf8ED/NxPGM91ia4kqzvOPvm/
         EmZhsGkGHukl3FioIG/yqvOdDJZgGyadDnEiXr9JDU+SiAr63cDC5QpUDmfxK2B6F1Pd
         g8ThrKA5aQFi2pppbEBoC5hSVkgguByOMKUzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992962; x=1795597762;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=k8qn3n9JdF+8EcePJBx+auZ4UlVEjOVant+fWjBBA+irpcVlCQIvOfaOmIAIQTF/mY
         MgAwwfgMiwccDDdz3o4I7A7nIoZPnChupYIrpuUuWPCQAPBcjjE5Y/eiW3r0uEdAZC3A
         4+A1eWCf22SHCds+lvw6O28ZtY9/bS1/RBWGP9NUDaTBsEGGwydXb4D560GDXZH53izy
         /+IVOOgR3DDobr8e8/x5/atORjKCFF0bV8EhnFSoZe08Bhf1NFBww+SaOheTn3b5aPQ/
         egXfOxIj4VcM10sWBWIVPZigptKpY/lx7YWtppYP8TvufxEqc00Ye0RjK8JVIi9i17KI
         mOwQ==
X-Forwarded-Encrypted: i=1; AL+hErH6vUGLhsaFceeILx25h8krOg6aHmA06mPqHfDy/O3ZTzspO8mwwQdf6G34g27pbQj0FtU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/DgxQIitrH9I0AkWxnuE+dlhTU/rBd7x/MQ2HoPB0LvPDG1NsC
	ZzBPiYYLiWGvc7qYn6IQiSXZxykLLqwLhkYVvZpP7/q0bBM5yUXDO3tHteTtl4OYie0=
X-Gm-Gg: AYBFou0q98WiOEF+JlVRKurvS7lJ2kycFwfDiSLwvAcdeo6DFtGvOvW4dfE+SjgJgxa
	0zu6KPCo0HktMQXa74pFJ1CECvV5H8i2Y0q49MkuOzVhMAODSg9AyINgORwd2b3yQBDjLRuTHr9
	QNB+A0A9HZQr8Ee+lc0G84caX/1zIgcAIZsk1PZkUN6rKq3HaL2c40zjGPVjfTNiNw4scFRSBZn
	sV9CktfczhnMvWP2vDvvRsQo7/hX/kH9OSvz6dI/ciQdUxoNeX5h0fQn9v40vDZNe/hLM0Q9KeU
	mUKhG2NPf8bWry+2DaLv89LHnlplWBFAGflZn/sgGna8NcgE0ntUP52er3a/QtYbuu09P2HPy4J
	1mnuZCOHv1GAnpbLfFh3GliHZ+LfPQto4UWMbGCWybmp0MXvSbo4hgZ5V7cri8D3XdNSjNQ6NVn
	3VXo1qgMYY4gShY58EaAhrNMPj6oqWoOSLMiejUrUvxGtHByb1UtoCyIbixRPe6KvphXpGQvyk1
	UXQ/fbmjSm7NnzczlJcsXfiK7wI8iuzCbEZ9wnZzN86Dq9RHl7wd2eimy05nyHarX+d9Rxl5sYV
	p1qMCtmLHFYdPVUWZD0zIQGu7oh3nhEFYVgBY72nLXl6qg==
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr33290135e9.1.1794992961833;
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 18 Nov 2026 11:09:10 +0200
Message-ID: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

