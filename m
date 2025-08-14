Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E6247DEA
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187625; cv=none; b=Wu2otDSB9Ow61PImA3RMioktW03bGfxhyrzZdZjfps0odTPoAdjSa1X8IWoNGZOrsFDOoyW2ZhVsqcE8acgy3injRQlrcc3/v/jkwkcLaEcptDhxV6GoQGz9DKIHm31ee8W2yOW2So5sCeHU5Ow5P6HxtKjPZLcfQQA49xs4ho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187625; c=relaxed/simple;
	bh=MEMndkwsKz3Wir01XY15+wsOAiobH1YxwPbkYo3eX7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iskGET7XqvXBJ/jf0s1EzWsDTuip+PdHq4QVc31hXEpKZZ0YJuAxpBgZ2NbTaQRqgDvB4idlLNIigRVbGsg5Wp6szIM2bRszG3VV1z+3Qcts+XnSjh8vEzEnFguDLFX63fw8mL/XYd0YDsPRPpHHM2pZlrOEsyI/JTB1PPNypro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Me/6Od06; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Me/6Od06"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b097037so6363885e9.2
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187621; x=1755792421; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yj38X/0MfiFnhuC5i4RxM2VUGXAWD2Xbv8OmXp3rmdA=;
        b=Me/6Od06rUBvlC2KCupUoCp0ob33n2bueXQ0sBJ4c5gfy5E8F8tPxwvV1wqLh4AXaP
         XCaZX9PF2npSwhfi9GKtdhwrfz2w4k+ob9AffGHgled5fyasQmNi2Nej39JCEBgXlZNG
         mJKZaCbFoDs5JuaASkkU3U7oQv6Oi/6MbkRKeemc+7iGKrSt54X2Rn1fEmNlPeOP6HRX
         UUYHtuFV8uRc2FsIOh4TtdF8KkzR+qOV0VOw3+zpGeb5hIZdX7voTXFFEbXoOAtKBs2l
         /e4dKVZH5xLozQok/jqvnqjLYTDPC5Jm8EkGHYcdNbYk4JoXTVDz1RWPzptcn+Fpota+
         9p6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187621; x=1755792421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj38X/0MfiFnhuC5i4RxM2VUGXAWD2Xbv8OmXp3rmdA=;
        b=MpNFUW+B9ibsQ/mRd3n70T3dxEaKM4vt1DqYazD6IcKEMuuHvcitjYfnssoK0nl8xw
         7klUbEoY0CgU6O6X53Rv82N8iTV7UDmIGen9NFd81jxqnh2sfH0zR8ue3/rZP0EcybEC
         hrcn6Oh1jcWptCORODYLq/jHG7nu31D92DiE5PIYfvYEOVWbG48EucjyIeySgDMOojW8
         hMCS/YwpuToqaVG3MS6a02sX3ZIuXfuJpebVmYPBlvSAJefYYiyhJ2R35lpi5+px+8i8
         EUFcshIVTxBHuhEqXKmCAs8S1eR0Tj1qyZtNjoomIMNIpQUoXCVWrF9UUTC3BaCoeUSi
         7lKg==
X-Forwarded-Encrypted: i=1; AJvYcCWf9qsaD+wqDxcKN3EvrDWi3Xq79/58dnlbdgYLG3cbv/TyuegmmMVPEm64HnhVx0pQLc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YycUZclH1+l710Sqspvx/ZVMZ062g58AOVxfv61wQnFy2iAhDUD
	QUb/L6apCTutRg1Jyx3RxOys5wE7UU2IbjKBwJjqw5CWv8Yb5g0w/F6DczI4WavmbNw=
X-Gm-Gg: ASbGncv3APpAO9khhmfrpBufjrHKmjyHoCPFOu+t7iArw26o1iDPHFQtctRgD6XVTUN
	Is5+t0xdRIRCydUYSKZWN90xVulSg8vS6sbXImbo2i777qVln7RRy/xsfg/3OHmHsFcepHgbxFL
	7k0lfl9rs7tHpZYCmLhTUgb5wZxUeGseArf2/42v7qlQvNv3VE1BBQZFiw/BdbnVNmy0utw9Zis
	z5RETTtWLRObX/C7PKTLDpYdAOefITYpicmhL/dMY9PwBJ6LQxn7FCRkIMypQFwR3HqAdURUvG6
	QbS9zb8uds7H+AYkEhoW+7JuSranZcA65M3ZwvqpaKseeiZmusqjPSXcXMrWZQADM0O5MJxdB0q
	v4lwhNlHhj5ECQoS04qsKDSuDDH2sBBI=
X-Google-Smtp-Source: AGHT+IGccfHVH8S3HQU2QCeEdvi+7U1L+lLQrDOX9EP621ilEY0DVdTkWjRgqUW6HC5Zu2JnCCHaEg==
X-Received: by 2002:a05:600c:470a:b0:459:db5a:b097 with SMTP id 5b1f17b1804b1-45a1b6489e0mr37662135e9.16.1755187621381;
        Thu, 14 Aug 2025 09:07:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/13] spi: spi-fsl-lpspi: Generic fixes and support for
 S32G devices
Date: Thu, 14 Aug 2025 17:06:40 +0100
Message-Id: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAJnmgC/2XOSwqDMBCA4atI1k3JgxjtqvcoXUSd6BRrQlKCR
 bx7oxRKcfkPzDezkAgBIZJLsZAACSO6KQc/FaQdzNQDxS43EUwoprmiD/OESKfZ09FHj5Rb06o
 KtDCqJnnLB7A47+LtnnvA+HLhvR9IfJt+LckPVuKU0a4uhdSVsbJtriNOJrizCz3ZsCR+QMWOz
 ySRAalryzvTlBrgD1jX9QNSTsKt8AAAAA==
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

Various fixes for LPSI along with some refactorings. None of the fixes
are strictly related to S32G, however these changes all originate from
the work to support S32G devices. The only commits that are strictly
related are for the new s32g2 and s32g3 compatible strings.

Signed-off-by: James Clark <james.clark@linaro.org>
---
To: Frank Li <Frank.Li@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Clark Wang <xiaoning.wang@nxp.com>
To: Fugang Duan <B38611@freescale.com>
To: Gao Pan <pandy.gao@nxp.com>
To: Fugang Duan <fugang.duan@nxp.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@nxp.com>
To: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
To: Ciprianmarian Costea <ciprianmarian.costea@nxp.com>
To: s32@nxp.com
Cc: linux-spi@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Clark (7):
      spi: spi-fsl-lpspi: Enumerate all pin configuration definitions
      spi: spi-fsl-lpspi: Add DT property to override default pin config
      spi: spi-fsl-lpspi: Constify devtype datas
      spi: spi-fsl-lpspi: Make prescale erratum a bool
      spi: spi-fsl-lpspi: Parameterize reading num-cs from hardware
      dt-bindings: lpspi: Update maximum num-cs value
      dt-bindings: lpspi: Document nxp,lpspi-pincfg property

Larisa Grigore (6):
      spi: spi-fsl-lpspi: Fix transmissions when using CONT
      spi: spi-fsl-lpspi: Set correct chip-select polarity bit
      spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
      spi: spi-fsl-lpspi: Clear status register after disabling the module
      spi: spi-fsl-lpspi: Add compatible for S32G
      dt-bindings: lpspi: Document support for S32G

 .../devicetree/bindings/spi/spi-fsl-lpspi.yaml     | 21 +++++-
 drivers/spi/spi-fsl-lpspi.c                        | 87 +++++++++++++++-------
 2 files changed, 82 insertions(+), 26 deletions(-)
---
base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
change-id: 20250715-james-nxp-lpspi-1fac58e72a59

Best regards,
-- 
James Clark <james.clark@linaro.org>

