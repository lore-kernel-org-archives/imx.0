Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB607D07D
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657426; cv=none; b=f9FAlKGOu97x4d5VLfNt1SKGn/O7gscDt25YOT9AHmEwvpd3+R0RsSaULEZhFsoRd5IY5OkQMW0q7KPW1xtekm2r/Xe4yyiJAcvwWznrXcRiyRslo95CnhQ7+Zc+VlP5CpiT2WgMHe5BLyUWYJ6c8479CEXYWFnpLQBiptdqKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657426; c=relaxed/simple;
	bh=Bpn9BWZNH5PRThSfi4wPtUSACyo5xNzRrF/AQoUWk9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pFEomtR+ttFg4AeC1ovB8f+c/2x+vtMLjerPTyo4QQ5ohix3p6Py2JOvTGRBI8S/kwhH0MtLZ1qZzn+Vk4/FSktrC2Tz9OulWlju806sSeiA6oiz8crybmpBa9aMAVbWHPjPM7NZL6B1//VxA38NTNk+m029HLd6nQXisTmnoJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKlYfc7K; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKlYfc7K"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso986616f8f.2
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657423; x=1712262223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aN4PhuvWAnA2tTEHvF8Ua7mWUQaPffQCdMxsppNaWgM=;
        b=QKlYfc7K3fsmIeq+rAUH9dRlw8Kb8snBOusWxR0iA+2cdHkqK1Cr3Obj8cuT/qtR3K
         V1hO87B4oNs0kfHslhuhIks+MpbjOj0+ZggxYwYar3ohwQhZQB43MLNnc+ekwbV/HdUE
         ilqXF+L8wpd9Xoguo6DUlNrHQouW5MvlUQOqFOUejUzaiwMX6baiGyAxnoJxNv5kkfb+
         4INrdFZhhSXB0Pf5ZsGhar1onPzryUgsWD1GurN3oDpBgeyWFqPDUH75oGSd5aQzsRQp
         W/rDaceiN6C0Anps7j3NezsM+tKDSyG0b3+2Ase9WOF/vaXTk5qRgZcBNlb811x3q+P2
         38pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657423; x=1712262223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aN4PhuvWAnA2tTEHvF8Ua7mWUQaPffQCdMxsppNaWgM=;
        b=Q0SCqQm1FAqZCuUp2OIfJwhMGZ2GEqpeceSfWojGu+revMmCngpkC5cbQieEY5Pvzi
         snxZpbYSFd06XYk5P6z2Oj4Uzl3lXoFN0RSr1J0xe51RRUDnf/vJZyIiRTPz6PsAhSdZ
         hHyPW+rI9DkQdgmdy3MrYOVrmWt/3u+L9csjw6Gou0TzxAwjrFc0kp3fTMeuQE80UzSh
         4ZZGTa5jB6u7soLgud8KKhwG70DyoAaKBy7vdSX59kJjY6PaCaHk1QrYwrdg+hZSvgk7
         L5NPdEhHKZVprOwTXOCFxLSoAKxgm9QVEmpIzLx/Tx7K8f/pXJMTwYpOYpN3VwTFh7Zb
         skCA==
X-Forwarded-Encrypted: i=1; AJvYcCUb7XbbEa85wWMO3HCm0/eSIIG3dbtolpZF8yzq4cBZI3QQ4+QGczHmJIS6LBzZUHXjU1hTmSsp9xi16Uo347Gjaxkc
X-Gm-Message-State: AOJu0YyJYaDMQiSqoL6Bxid+GIxlHWjEkRGvd6dkUcdBWyOTO6CmUgIA
	PYFOkxScPyR5cpDIdA9YUiqxB+1CFqvO+HABSpuC7+mui98be2xy
X-Google-Smtp-Source: AGHT+IG14NBt9Lfnp5zRiB//c/Nkx/NjUDrErRTTIGaXk/rXF9TdrJ2RsYII1laA0G/j1M2Z70tKLw==
X-Received: by 2002:adf:e54e:0:b0:33d:74f2:820e with SMTP id z14-20020adfe54e000000b0033d74f2820emr88912wrm.30.1711657423264;
        Thu, 28 Mar 2024 13:23:43 -0700 (PDT)
Received: from localhost.localdomain ([2605:59c8:6662:b310:26a7:2d64:79c1:dee4])
        by smtp.gmail.com with ESMTPSA id dp18-20020a0560000c9200b00341de138a2esm2538974wrb.94.2024.03.28.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:23:42 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	festevam@gmail.com,
	alex@voxelbotics.com,
	Gilles Talis <gilles.talis@gmail.com>
Subject: [PATCH 0/3] Add support for Emcraft Systems NavQ+ kit
Date: Thu, 28 Mar 2024 16:23:17 -0400
Message-Id: <20240328202320.187596-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

This series adds a device tree file for the Emcraft Systems NavQ+ kit [1]

The first patch adds a new vendor prefix for Emcraft Systems
The second one adds the board to the arm/fsl.yaml DT bindings.
Last patch adds device tree file for the kit.

[1] https://www.emcraft.com/products/1222


Gilles Talis (3):
  dt-bindings: vendor-prefixes: Add Emcraft Systems
  dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
  arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 435 ++++++++++++++++++
 4 files changed, 439 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts


base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.39.2

