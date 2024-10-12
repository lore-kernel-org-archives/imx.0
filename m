Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEA19C557
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745385; cv=none; b=rfvAN+aIobNgqAebm1O5mF+ZkfgTarjeWbHh2kzEJF/JZknMe/8aYOzI+ek7Fcum/CUbLwgvZL/i0YOTMh/jqXTqu3+3JMprYLkqlDS5XxnSVw6+W/cSCzYbmnWLrttpL0KzqaWXl6T31RSGwXts7w07n0tpzE1/oWOfEdwhIHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745385; c=relaxed/simple;
	bh=sQtQyYnPBIkfPu20sTvazsCGFs70YPMd3bjiAxARVAg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UxstIeX7Qnv3AHquyVK3BRwG+tu97sP2dPSAjuAeLDnKhqW/SmE5PLMIvTV7vi0j4f7kGJ7pD9PKj5Ui0+Srnx5Ry/08epfIOKm+uvghZJrWpErlTDjDGYCLq4ivx8TFlJfOPeElKHs2s99/6Xr4q5itYjDlQEILo96mhHQq4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBajYfTc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBajYfTc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99543ab209so422568966b.2
        for <imx@lists.linux.dev>; Sat, 12 Oct 2024 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728745382; x=1729350182; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJRnIC60WequNGORONeiB9Hea/09Nq/hPMtXKr7cydU=;
        b=yBajYfTcUDt1MGCBrxNeAf/vkJCLAUDiqHFeXpcyjok5PLB09Xfebt5/iToaBkXZ/D
         Ywm+4YHr7mWMtolHVm5nfDwWbGL3f/S11tAS8hPLSfeH33mOsMymVy4TFFzYiopsBVbZ
         1/FxZMgxZ2ugTXmRBIz2qWn+q8F0SJ0vxpvLXqAprzG2tXqNEKgc5WPvbaLNSG4KsW1o
         ObX8cjvZ/RK8EQKKtvkB/9pEBdZ13VueVhLd20Bq6Kj9i9NYZe+nkrduIn4VqzpIYxqo
         5rQ6E+ikwuI78qiPneNpble1i2LcL1agkpbkNQwaDVfqwQLWC+ncZhoyxHZ8qj3z+RWW
         o/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745382; x=1729350182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJRnIC60WequNGORONeiB9Hea/09Nq/hPMtXKr7cydU=;
        b=kDFv3zLWIf3H9WPqf1xCmlsUP6bm13JIlSwE65RC3ltXludH0sm7tUoteBD3SEzBXe
         P0eFARSPjlJnq0hCcSnJseb20TiPDP4F8scRjV4vDlRDqMpggEPG1ALffuZK1OJfaC+V
         qacQWNHMclkS3/6BkRCgEyI866r6A/w/EE7XShhw7UTAyfmjOS+GL6y3VXr8IZX40mqc
         LS47sZ6Zp0QVvHGoqRAcCLfkRcmYL/41owUhxOfQa1I/71g2aySZbUE8VqN5Fw/5/5FX
         M+bIqj6BIVzTKxTB0WGrARBFzAA9u0nOZX0Xai5dZ12CiJq+Ru7vpbxRMpnsVacsRYNd
         QJEw==
X-Forwarded-Encrypted: i=1; AJvYcCXOgSmdelcw/Yxpj/ncl6ZicPRrL8Vp+rpP+MK0FGmPRZX0OVUJ6xVIYCi3r/u47UuSwrE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJAnwtrvUYtSP8+xJI1GJ4yewarqsnHtF24wyfs7yZtSj1Z5zX
	vbajpxIg92sCNXRlETxQQqH+rNgaGPyW5b+utU7M5lFfqrzj2QKi3WvSNuYUawM=
X-Google-Smtp-Source: AGHT+IFpf/Bozl+6zhQfgFtZI3YyImp4QuJFGAdhPDRj8o5rrgKpCQZPKFycBa2lnlrw3kXptZ3U8Q==
X-Received: by 2002:a17:907:3f03:b0:a99:c9a4:a4da with SMTP id a640c23a62f3a-a99c9a4b767mr426772966b.61.1728745372622;
        Sat, 12 Oct 2024 08:02:52 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f148b224sm63730166b.50.2024.10.12.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 08:02:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: i2c: Cleanup assigned-clocks and endpoint:
 properties: unevaluatedProperties: false
Date: Sat, 12 Oct 2024 16:02:49 +0100
Message-Id: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmPCmcC/x2M0QrCMAwAf2Xk2UBaOhB/RXyoaToDW5VWR2Xs3
 818vDu4DZpUlQaXYYMqqzZ9FgN3GoAfsUyCmozBkw+OaMR7wFnLp2OR/kbTdPiA6hkXSRrxG5c
 Zs3ZpmDmPTOyEzgls+aryD3a83vb9B+rDmN9+AAAA
X-Change-ID: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

On a recent schema submission I did what most well adjusted schema writers
do and tried to find a base file to work from to copy/paste and forget.

Confusingly/predictably I received feedback to remove or alter several of
the properties included in my devious copy/paste plan.

The first bit of feedback was that assigned-clock-* was to be dropped.
Removing assigned-clock-* as assigned-clock-* is a core property which
doesn't need to be listed in a schema.

The second bit of feedback landed on use of additionalProperties:false
along with enumeration of all required endpoint properties instead of an
implied list of valid properties from unevaluatedProperties:false.

Link: https://lore.kernel.org/linux-media/20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org

This series removes the assigned-clock-* from upstream sensor property
schemas and applies additionalProperities:false to properties: endpoint:.

A few missing properties: or required: are added to the schemas based on
output of DT checkers.

The one new DT complaint I didn't fix with the move to
additionalProperties: false is:

/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/x1e80100-crd_qlt_integration/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: imx219@10: port:endpoint: 'remote-endpoint' is a required property

Since this appears to be some sort of temporary/commented thing upstream
which I don't know the provenance of.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: dt-bindings: Remove assigned-clock-* from various schema
      media: dt-bindings: Use additionalProperties: false for endpoint: properties:

 .../bindings/media/i2c/alliedvision,alvium-csi2.yaml        |  5 ++++-
 .../devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml    |  4 +++-
 .../devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml    |  4 +++-
 .../devicetree/bindings/media/i2c/galaxycore,gc2145.yaml    |  6 +++++-
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml          | 12 +++---------
 Documentation/devicetree/bindings/media/i2c/imx219.yaml     |  6 +++++-
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml   |  4 +++-
 .../devicetree/bindings/media/i2c/ovti,og01a1b.yaml         |  4 +++-
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml         |  4 +++-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml          |  4 +++-
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml          | 13 ++++---------
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml          |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml          |  4 +++-
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml          | 13 ++++---------
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml          |  8 +++-----
 .../devicetree/bindings/media/i2c/sony,imx214.yaml          |  4 +++-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml          |  8 +++-----
 .../devicetree/bindings/media/i2c/sony,imx283.yaml          |  4 +++-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml          |  4 +++-
 .../devicetree/bindings/media/i2c/sony,imx334.yaml          |  8 +++-----
 .../devicetree/bindings/media/i2c/sony,imx335.yaml          |  8 +++-----
 .../devicetree/bindings/media/i2c/sony,imx412.yaml          |  8 +++-----
 .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml     |  4 +++-
 23 files changed, 75 insertions(+), 67 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

