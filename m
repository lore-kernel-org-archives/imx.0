Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0D121E08D
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588864; cv=none; b=lyOyo3qz3r8Hk/9PJuZMi7VO4csxjcfHl7kHV2PEdsBOz4nCP5eXbR9Stt/kKhB2Nby/3C2utZwWG/GUFv8BwwxYzvKANIIsNVxINQjW0Nf9yZ90rGvgXQjQhDU69SARA5dhdLdTx4cNbnIDEGbcHTc3b9243jLVuYz1O7cbkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588864; c=relaxed/simple;
	bh=vEb7wZbAKp2+E00O1H3FnSBoPcs396kmDnQUTh8XiO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o9XszNHRwg2LNX5K1GVQPY5f4GJIka8QEt3MySCnf2r2EuFSSRXPvSN8Wi1QCREJcZuIDAICBMaeKQdSqBg4M7uOX19Q7F1Sc8Nohe0Y8ShV6xNpLFTRsmfQJW4k4y/tkDziaFq9owFsnbtbW9gwaDEIpKwitZWFxxPGs55wDm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDPttHac; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDPttHac"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f406e9f80so6392071f8f.2
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588861; x=1741193661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7vkfh4ddTTsMmNol3nhPNfYX8H1c5FYy0uhOqg4mVE=;
        b=cDPttHacAbCtCdG6aPLUWlJ0q5CI7zKQFHjnTzFXF6+/9dErM0/x47QVkCWRECAHUb
         OqLIFdsREpDkit9ZH4q6fT3DQxPfOgqV5qXt4B1dxNWUu5zeNE3EQbBs5KnINrnu+wbE
         oXLL+Ul7trpQSEoj1if4FY3iArSi5PjcHnoSk1mXPAcbVZNykdpjp5//cXlSkHXFvZLH
         7SAPM6Hau3u2NmwJaICNZqAMSMDQjT02EvkYRIItjKxPWvA3Dj6T5f5tvxdv2SfY+n/I
         CNscZs/jdewV++ji+iMWpypnQb2kzYlv+qyL/82+NbT4SuueF3irKGW2BRCBsWhs2sSH
         MPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588861; x=1741193661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7vkfh4ddTTsMmNol3nhPNfYX8H1c5FYy0uhOqg4mVE=;
        b=ZB00FQakCr6yJeGAQU6ZonjBohW5ww7d4NrV/pY1IN6yltucbBTudy8ysVAMa2ghos
         3sMbb2j74aVyfmzHouyNAG7yLCWGxPFUDcDNQv7ehYM18gCSa+zzUlISXstpim4iE+eI
         1nbKgB75B0a8usRemJZ6fjNF/CuFLIK0+W3n45S0ayiiQhLYvsot4ys0v0jQZcQozNqB
         N2x4Xyo1KeVW/3cFeCtSkkqK8XkLbIgNNfbJAQIHdBQwQ+i+67eJiWLIH+SQOAbtVhR1
         Qj3HwwrgBBMynX7EGqjhZbES6k7FWCPAgjhXcPU+oyHstzW0UcPW9Ij31COtpKcFjaek
         gsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgm3unfza/DSyZg6D3qIRBPo6vQ/UCLD2FVyVHc6cZdumbev3cHKGQ4I+qSyCCkoDE6pA=@lists.linux.dev
X-Gm-Message-State: AOJu0YywlwBJRly2BjbV0MvFGQLgKpcw/pcUs7I0O4RmpsxujfhxWZg1
	dQQxgVJkrO6cKq94vcfUK0vBSJez7lT2ds+GUpJWYJRzUTqcPJFb
X-Gm-Gg: ASbGncts2ywrmlP58/Dz7Z5WOs0e11dK6yrK+YzKaUnj8Sj9H7PaTRsXTWWvEkebhmV
	Y1e1s9cWBMUjXoUQ35Whf9OcQpuiVC19M2TCq2bPaTFBwB3FpIc1b1F6ZrtS7wfwRt4xxIi9RmQ
	uVxsJud3L2HhqlTPO2f8vS+1RSiMHcuU482JTLQdcGvnm2INpsVyXqr5J+H8UIel5ZXbCQZ7vQ3
	70ztuzdcJMqt+A+b8pJOcHUd1GMv3hjNXisPieTbmdmXwlgCqhAcYdXXbaDEJ8LLd30b/TOccoC
	HUdFcieITcc69NbVE48RRQGtt1MNYWoDfrux+v35nu0IWtMNzWUNcNjRBRQUbmbw
X-Google-Smtp-Source: AGHT+IFkEUgrTUm48/FTrUcUruOOa4wlLyjFj2y//pjXXddwMb+aMzVxF/jrzVCXgJFveDwHMDYHJg==
X-Received: by 2002:a05:6000:2c2:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-390d4f8b6a7mr3152525f8f.34.1740588860292;
        Wed, 26 Feb 2025 08:54:20 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:19 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:09 -0500
Message-Id: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
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

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
---

Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  9 +-
 drivers/bus/Kconfig                           |  6 ++
 drivers/bus/Makefile                          |  1 +
 drivers/bus/imx-aipstz.c                      | 92 +++++++++++++++++++
 6 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

