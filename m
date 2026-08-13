Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2861481664
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629966; cv=none; b=tXRHh+4H7dGD3+4T1t+ut0XXFWLRJzl1BNKpkhN5aTq/AxboOSa8vvGuSyoLGvfgHa8Ayn39G0nPj7cvvfFQ9HJtlmzSa9yeGRh6AbtceUaBAM/+0JS8iIacQi/GYEAVbEMFFFi3+ofQ13warXhue1qzj6W3YnNeIN1VgUs+8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629966; c=relaxed/simple;
	bh=ah1cDBDIZ8iXgmzLNyPQB+ryhZ7bXr1UEe22NH6a8So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/sHjSq0BvJekJG8RsCGBK/j0Q/F297NirbyAMnG5UANZ4kv6Ma6mNsUBsAjefN9tlFowP9/feeGKU9VfgVgOVk4pmSP7xYqVl5Ff4CV01jzjqcjKxNWGKgaf8rs1dpaWgOFrTVRg0E6RGVYZhPdctWeA0q8wsuBI33WGPlMk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM41rrqd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM41rrqd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956242332dso19745575e9.2
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629962; x=1787234762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=RM41rrqdatpTWxHay9ABChwP6Zc2IVs2SGAyfet47iOgPBeFsIvt1W9FLOiiyLQnjn
         naKL73yN9YSlzvUZRdnTTr6mCGxBOgxEV6YCT9hbHsmhLnbNKFJEDmnuNZEExI5SwEEO
         TErx6zT6ZsgY+yP/Iv14JKPxsn2mUL0BovJ8TWlS0AB7Nz7ZVZU+ySvfvnuYYtXAK9SY
         6Lq2WIMNMF0BK8rvBt2PV05mu2J6RkAfPWDF3U2dazu1pY/3JzZ6A+y+OnPcvwYVs05t
         lRmIZhFOR6U+mh/+t1MFbWON8RaFQH0X2Vj//6BNjR+y9gSoR3JvgSLy+9rK8DH+rWWw
         iDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629962; x=1787234762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=dPPPEOQTW036Gdtp6vVJQM/52qVwt/qxVLLB4OfGi/QBPtLdfVtyU5x+MHaRHwZR8z
         EdiTWlrlXYdsKoLzGgwntitx/PSezZYcuYbNlzNvzPtrIQxwMgUd49qiZODWXjO32atJ
         tRcoREOtGPBsklCuPXDl+B+hQneSQahMoOLSSdz1UfSJdnAsP3iQcNyeXKPRf7+R3F8s
         MzOkKDNDEFbYv8scZzUUw4C0VjxeEjtY4l9FF9Rm0/Uhj2+7RLcEk1eCNilkvtAc+uYF
         CleQk863oMUor7VsjC1Q1WZEzjvgSJSr9ectXouuuYyMnfpN5FwmCxk4rXY0//9D5CJo
         hCWg==
X-Forwarded-Encrypted: i=1; AHgh+RpvYVIlm9mNQZZGrbw6S7RLZuG/i9+CMWmbF7R7W7CS8tZ3iMYrhqR5WUCjlMwuyr7k7ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXQpk3jRQOAT/hvNKN92SfB7Kx4uCIXJT4A2WQeO9+NrhvM19P
	8v6+UkLczr88zT4ec9uhDTtYZeGLXQNTPeAOFtVdGxcG6L7Nwfn3md8Z
X-Gm-Gg: AR+sD11Sdm1u+qqjXwmB/IdorRHRgdHAzSrkTE8QLLV83lXdNhubpbo8K0DbLQhS71k
	f7uVgx59axVgmN6I4Ntt0+qbo/eyu+yKrQQII2tXsu3kzUefWWVC42vxPTbyaczK8+sm3DM/ooU
	LzP3pRmVcmPIibmPyIJaNETzYqZ62gLFmK4nTFPBY1bHw/tP47C3zSc85IPYsd17DM7XCz3AGH2
	quppnQi463fdXB+hZKSi13BtmZ0gVzreHN6OonBmvIAgKP+wWt8a7szJAfu1fFo7+tk0zWWTh9+
	AJaqCNBcY0pxFTcHNPyEGzlaX/S3t/uhc6Ub60ZC+vMtdeMLv+CMilZqFb+ZLMz4AwDJcY7KlJK
	p65qGkw0Y98ZNzq81Wo/5NTqP0O8r4WlYEa84lligocRUG8rdJfXVnZL1EWn+/AQCJwGMMaSaaE
	vub3uk5IWywLk508u3sc1e6rfBUcX+sNiQczUL3LioLNoMlFJewT0XuzWDDWU34OZZhQ==
X-Received: by 2002:a05:600c:1c25:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499821d91d9mr57412055e9.19.1786629961887;
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:05:56 +0200
Message-ID: <20260813140600.1824949-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18:
Ethernet, USB host and OTG, all three UARTs, i2c with the carrier RTC,
SPI, the microSD slot and the RS232 transceiver hogs.

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
  instead of adding standalone entries
- use hyphens in the newly introduced compatibles
  (toradex,vf500-colibri-vf50-on-iris, toradex,vf610-colibri-vf61-on-iris)
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 308 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

