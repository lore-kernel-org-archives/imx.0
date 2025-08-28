Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E5D26CE13
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376128; cv=none; b=uUKWJVblWnJkg8bGIuGhbS5SVUtIEHxXDXxgRrr+oeAIaBUX+wBWDF99/dl4iIpcYxoos0dsJfM7DRcAj8K4ltjxogDsYeArDc8aQvHAbPOhNW/3l4LD4m/kzd+snGoV5TDjrAE3pdC9hlMnwtxwls3OrDfwj472qj+uTUpMFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376128; c=relaxed/simple;
	bh=x3Xcu1z+CtLQlbgjL7Gni2IBKCEYZWwIRYW4Gql8iLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aA4caRMkGUwD8k7y0CoCdLlCoBp3mVic9UZnSB5mBLNcDuj3eW7IYVtMWsiciSnX4ZxykC/S6HhVO1uJVm1YkPp+/qSOcQiqKOyigLmjBOeX0hvYescAzEuVFVyuD4jcGAWWtS0RI1yNfNmq2nz8v84Z3Rhh+irB0ctndLNjSBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncv13FBK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncv13FBK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3c98b309804so487612f8f.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376124; x=1756980924; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dtsWOrssFq6dCtiMfrdoC2rXhSI5ZG5/AkQSWPW1V4=;
        b=ncv13FBKetyzqlqqhtIwjasUBs/yyYoKRC+01AYYERWA7qZvzkLfaTrs6C1JCupUB9
         JKjfjQ8R7hHTfmPBCikRwtmeI19MoDU09tHpLvYUvLGXpnH60DUeXVHM0muicSJTQ395
         MoJ70FFjTt71VZ6AODyqUUvSd88UD/m4ELJw8edj/MCHqgeGrKOEhtYguc9MZnWcoK0Q
         BwQFhwKHwv0IQ3poY8Q3mnB3m4NvHkoY0sfazXzOj5uQhYij998S23fKI+HrcEI+F/IY
         loGTmEgGrQkH6oceweRF+Tfd++0b6RAl+islhNqxV+EvciKOhQyGbwFG+NMSpYdbC/+k
         /Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376124; x=1756980924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dtsWOrssFq6dCtiMfrdoC2rXhSI5ZG5/AkQSWPW1V4=;
        b=GRU5rLuiIf3HUTlyEw3cZjTaspMHVEn3cnIGDMA/6Cda6UmjuxwX8FMrbhwO81EdDt
         FM+ju4kqUjfKpAj/ZZeLxmTQw3ZZqaZ0Z9AwYg/kG78IO0ehCPXRECt+u+FLOX7n2+yP
         U3bMTVlvAAVmrT+m2L6lBY5OFwiCVjLaEBjuU7khrDLgp0/p24kAKcsi6b7Jtqt3XV6S
         gfSJEziiPeZsxokRTltd7q/cQnTSmRG/lzwoLW+6IZJsP/v4RQs3L5ww1XdPj24IFZ4F
         UuALjlCmz/uZOUJy96fJwMyQo9a404nFKmkTwx6rk7x7qwgskbJKDw/uEEGaRO6pIrwT
         EDLA==
X-Forwarded-Encrypted: i=1; AJvYcCUekuZ8p6ytO/dPMcp6cKj04a1aONslAs0NCdV4BVBVBSpjlRK5LB6c7FSLa5x3GvM1grY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3zwT42f5s3aCVlLLK9uIpBva+ZElFh29DDccwlyMvd149WmaG
	lX0eAlPFTo3Gz+fxxBC7jZCKtcOeDPFiRIgPKzlrSqDBVAdlHhTDGoPJXtMWVz4+Lm8=
X-Gm-Gg: ASbGncuPgrM66OiJOi4lFPE9yIFAa8iiUFo96z+3poeSfSeeh0IBjDphH/lS+ESX9Xu
	VnYmBPRbeQMl3xllVpquYBbYfuFYH2BFSHDDDEvk/Encnl2swxBOq13Mwhbfwn+ezbCrs/Y7+i7
	RaqSnI4R9nT8bfb2PNUXFfPmfuU5NmizMHiLinlRFj8VLY9F5mzrLehZ94q7MFcyBMbVxtI1oPI
	Nkpwa+wS0pSC1f80J+0PYaUldecQHuEi4lx/ze1ZtnjENTomICNWHhJRpOMfdrqKSwxvP00mkGW
	YC1JrSqMKnpyYlSSUhffVFRby56uz7NHRkaZvvXkZV4hUDwvCfeZqtPXlNmt464586TKsMhAwDn
	OGM4J1Vz+b5XWlW04YUKIXZJ+tdcZ9FSeDaXRvMyeUg==
X-Google-Smtp-Source: AGHT+IHKf2aG6pLYrFaDWGlL7FrtoqqzoGeCk3EgyukB/f1w9pdZhxPxMSnGHp2vNNZqCXF6rvJJMA==
X-Received: by 2002:a05:6000:240c:b0:3c9:9ec0:203b with SMTP id ffacd0b85a97d-3c99ec02f4bmr11349567f8f.27.1756376124175;
        Thu, 28 Aug 2025 03:15:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/9] spi: spi-fsl-lpspi: Generic fixes and support for
 S32G devices
Date: Thu, 28 Aug 2025 11:14:39 +0100
Message-Id: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8ssGgC/22PQQ6CMBBFr0K6toYplBZX3sO4KHSAGiykNQ2Gc
 HcLMVGDy/+T9/7MTDw6g56ckpk4DMabwcbADgmpO2VbpEbHTFjKeCqA05u6o6d2Gmk/+tFQaFT
 NJQqmeEkiNTpszLQZL9eYO+Mfg3tuAwHW9u3KYOcKQFOqy4JlQqomq6tzb6xyw3Fw7ereQAn5f
 7DkstBCAteQf4PrFYF9lmW6/yKwKMhE2YBWVSEQfwTLsrwANL898CkBAAA=
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
Changes in v2:
- Drop changes to be able to swap input/output pins. It's not required
  for generic S32G support and we don't know what board it's for.
- Drop binding change for max num_cs value. Although the maximum is 3,
  this would be autodetected so it should be left blank. 2 is the max
  that is required to set manually.
- Fix missing bitfield header for some compile targets
- Keep prescale_max as a numeric value, but treat 0 as no limit
- Put compatible string dt-bindings patch before driver change
- Link to v1: https://lore.kernel.org/r/20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org

---
James Clark (3):
      spi: spi-fsl-lpspi: Constify devtype datas
      spi: spi-fsl-lpspi: Treat prescale_max == 0 as no erratum
      spi: spi-fsl-lpspi: Parameterize reading num-cs from hardware

Larisa Grigore (6):
      spi: spi-fsl-lpspi: Fix transmissions when using CONT
      spi: spi-fsl-lpspi: Set correct chip-select polarity bit
      spi: spi-fsl-lpspi: Reset FIFO and disable module on transfer abort
      spi: spi-fsl-lpspi: Clear status register after disabling the module
      dt-bindings: lpspi: Document support for S32G
      spi: spi-fsl-lpspi: Add compatible for S32G

 .../devicetree/bindings/spi/spi-fsl-lpspi.yaml     |  5 +++
 drivers/spi/spi-fsl-lpspi.c                        | 47 +++++++++++++---------
 2 files changed, 33 insertions(+), 19 deletions(-)
---
base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
change-id: 20250715-james-nxp-lpspi-1fac58e72a59

Best regards,
-- 
James Clark <james.clark@linaro.org>

