Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5722E2DDD
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763652; cv=none; b=SunM+edx9D6SkLWcSUYlhXZSoPNw79cAh7szSOvE+u7IMtpbtWjcosrYZRDcY9/Ap7EgE20ELNP665rbvAgAvnBMaKUxFYP0SbKORFhLgpG1WiByl0Q4nJT3NMJTX+8x9CLO0o2x2dyMBYuWwHwiYJ5Bn43ZWBNeIniaD/mee5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763652; c=relaxed/simple;
	bh=gfWrSoeHVI8G8zOpNpxAVkXnMy09qAbqOf8byIMhbHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CW+l4BqT4Cu3Lml/+tMCnX2XvmQ39iynIzzVd+gWtSj/74Mj4op1BliUaNp0tL/be332l4HebzTksgEfgeZCRKwgH29CnL1oIL25UFTsR9D/p1fYpYT1vHcKhBDJJk+9mFIx37dpUrrya8thzO7/t5OVPDs+xdOGQEDaSchGdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrTLUNnZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrTLUNnZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so2930128f8f.3
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=YrTLUNnZokioB+5xr7nJTY4IOo0sVrxncnHFf30a33ETS5XJNq65W7/3jyGR9vXz+7
         X8oJVGiBw2AUafymleKM50h74T96Mt7H2y3JLzSzUixs6PQ+hFK9t56y/mcqqjvtfUS4
         y5tUoOEnIWFrB4xxBHFHsDgCFf/6r5/8+8D4e9j5jc9twXwXDNXY8NhpKpVsWc5Fmyxp
         jnEVVID3BegKJZfXWZiytxfIqfo0g+eRctgNAUhcN9Gv6BN5CbJ94lAcXby8iy+XqiaY
         WCCSjML5RPlc721OnmzCgNO+vYrtNXe5rjsa/RGtnLf5j4aao93wEDV8nFsrYnT4apKh
         O/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=PnPgrRfqcMnbB25AxFQ+r7//xzzMg3GgYKOCYWv3CEqqE165D3meZXqpTmdaXiUhvL
         ncpAwxnFTHxBhPT/9eCaqOteZZT0eCI5CyLiXDAOWzy4ZAtPF+xUgcqFZpFuvuURrLMC
         nDDYZkHRQmg0fkjEYFj+bl6B4EOuByrXEGXrlhgOgRwOU/iCCfM0jcj04fnRtvz0bpsP
         TkxfMKq3xY93G7Nm13VchoR+w1HQMjDdagwrRBubOIjfdiR0g07c3zJdjgh7meTOU66A
         zm4c1FzyfZpHRY6yIGneBfTkuJKdnDLytBSrFakv3TZNfSZq0Rya8677OCoBD4x1paHX
         1EJw==
X-Forwarded-Encrypted: i=1; AKwUvBwMOagP5wi2o+KDFMJu0BuMYxVYUefCIh/0mupayJP0TugtWHOsMyYDjgB7+y8i4Oc1fpI=@lists.linux.dev
X-Gm-Message-State: AFuF++lTdUjLY2/M9xidssyJDjZNuo9MB9/1NfGHiIu52sYqA3CrvoUv
	phqLj3dsc3IrfIGRlqoVCPexosB2JaCT3x4R8qDiD7gSBRxnKPnt6dIk
X-Gm-Gg: AYBFou39FTh72QL8F7BUW6G8YOvH1vQu8UR8jFhaLF41tzGhhP5vQhLyF2J8X+dVqqk
	fBSimLELMwX9PNjwqruMSMdtO1uKrR/+EwsiCT43LyuD4dVT+5OsRCcfYs/kvIUcLUH7fNRqctm
	wfWSbk5qWN41llDmxX/ad5aVAou9wUmc07SV721RukE5t9QNjwT47rdcfYlSCnLzE3BfrqdJPEd
	sN26UL7PmDAoeIXbZNje5S/s3ltD1MZoLj93XE7Yja+NNCPv+eH3RwKsaDwr9ly0efPQYw7AOtE
	n2KbOn0Ebl397BytxENTm9wJhbxQbwqS3aub6EhA+wLwiFclKusxOFmjU4oiLeyJWtDxk07yxCA
	aQ/mZRTHL9MVbCmesfPM7Ndsss/a7uoVpD44BTcgjV5yM59sqHMquzt77PCCL1ZZX4uCSNnuk++
	zZOMkOLdeXM+MMzH2d9d1gcPp4+TlhfjDF4bg/eHfguS5gyA3IY+ikXM7RMxZLnEbi7Ia9vx0d/
	8aU2o9oFK2sxwdrLuCHv7/u3YAJXJM1JPBsbZHzs2Vgqqn+UqwXGOt4PZnWtdZA2uJgLHYJ84kd
	hkEtDhoFg91gCLrqKBjUBTUvhX7e55nhiIUdL6ywzK9kAziX
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr208334755e9.4.1788763646919;
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Mon, 07 Sep 2026 08:47:19 +0200
Message-Id: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPddnmoC/2WNQQ6CMBBFr0Jm7Zh2CBBceQ/CoraD1ERK2tpgC
 He3YFy5fMn7768Q2FsOcClW8JxssG7KQKcC9KimO6M1mYEE1aIVhMoY5Imjxtn5SNiUVUW1ank
 gDXk1ex7schS7/svhdXuwjntmN0YbovPv4zLJ3fvVy796kiiQFElZtqZRjb7mqTK8nLV7Qr9t2
 wd/n0NVwgAAAA==
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v2:
- Fix node order on the imx95-aquila-dev.dts
- Link to v1: https://patch.msgid.link/20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com

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

