Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421B27B33F
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806467; cv=none; b=GesMTQuKbJzgaKgP6Gx0zN38/cWZmDVKZrumZ+tqPN51E5nwuHRsHenj29cA95tm7f5d/BwK5pyFIgjfbgULwo3Y2N4eH1Ybad7kLvtnXfw4y1ygPN5ev4I/+pg9u4i6ADHwA1H05Rc3nYjwgjbrA4inALvgZxicXzGPgQsOyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806467; c=relaxed/simple;
	bh=tb+i42TjS4WClFhI4g/9RfeNIRUDoADVsxkZ23rVgfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CWmCuvdYnG5PQFgIMsXz04O57bFUStsck9z6eBdjwpTtxcg92q8uSwAfmU3GOpaVjG8s+ztsRxI/uacpWagRlxDuXos6l1YHLri+yFBRQ2GPd1iJE8+9JM3Pb076wI8L5MEttDJJUcZdIrZ4YtmgwNsFPndpSJ4u6Cq+YS09HrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SV/DBRas; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SV/DBRas"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ce47d1f1f8so3444742f8f.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756806464; x=1757411264; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C15nnHq5jGNekOrg1oEoMYGXiDnEqflax+NNj/Q5DWg=;
        b=SV/DBRasjXGRPVDYClHXBs7bNQszEs93yffH8jWNsFJEWsaxYgTnLG1cD2wnSvG2G+
         5cieSeLw2/8XN6pdsriH1f7twJf0Etv9ycXKomvGJL6MmxAWPxbZALekoM5jOjIiZglw
         ms0zp0DzEZYf2mjI3bLVB+ywgNFHrEV1a4xxIVjOeFaSB/HQEDMSRb0u+WYOFIJnLeq1
         xrVWrT81nCI3GGQfeVxVJ40X+VANAq8RFWJmDDE8Hn7+R4c7QTDChQv1nC9W8IitEGCO
         vWwVXxtRsZC+/5zHljyy0VAeiYSnkoNIcYNSrakgPBpfv0V9GO/bZGo/MiCg7Bk+/gPD
         7r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806464; x=1757411264;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C15nnHq5jGNekOrg1oEoMYGXiDnEqflax+NNj/Q5DWg=;
        b=Y4Rfa+n6+HWZsA1f5l1Rz0nH0wJ5272L4Xk2WoqIAeOiVxlKHjI3sQA1KkRB1sz3ha
         4xRQDqttycSJMB2xvBwcwbyx+/H/UZDEq/uOY7QcWH6inr3bvVxFvVnKsKzOs2YWxqdb
         lDRD665eih4+UVFCbHHdAapzn6H1rC3kBYE/9mWrkxDT0lYN+4PbMAKSCEyshzAWleUL
         rQ1D+Mp6LDCMUBYG1nryTqbNINtXkzT0uQA4ruIwD2i2LCNil4xIiHyAbPFspqiI10rN
         m1q9/eJmXHmg/nnrjdNrLzzePTc0UsOrr8U6vjhb14GH8nSVUlAiqDtAUNhIKrdhckYG
         9kNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8YcdqJQE2MNBCK+NaoSCSAOLkn6qnxM+Qxa+7dHbn73fxkgFlT7U3mwhDtz67MqFWnss=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFPc3PSev5WuygFkfDA/xVD9cmHLgIsWvesFHNFu7tIb+fYcIF
	WRpMIL1wnw+9WcIyKCJWp34D7zJ76/TopL5YiogIxVTTYMo9MFxrvb9IK4xyJ8W2vN0=
X-Gm-Gg: ASbGnctra12ZjshjJVr5XltLJrQ1XLo1IC+pCIv9OvE+Bpu6UpD3uuwt+Vrq4Vij5iU
	TgxQ2gkDuAxTbdnIJB3nurXuSqpxWSEzk2ylYWtf2s80sxNvnBVdYCYCpbUpjb9Q11b/7tmszxQ
	h1lxFX4LAvsqULzeJ8np29xdnrTQIDsBtuG9oh5OaG4ywv0Mt7FyF0YVkutshA/RjeNbr15GqTu
	MZO2dDXZX7FstEuq5753x2Wdqalg24lBqLdOGxClyNs4YZ++lZzBabBxdNntk6HU9oNSJMal+px
	G0pLeOBDEbO8Plbh8hpmFSeyu7kf6q4EPxPgTVskva4LoTdnsVtOrSCUuGJzN7z4H4UH/LKAjjp
	o7sIzEMm7yaa83T1A4rYfWwyOtqYuZ0PoFeI6gA==
X-Google-Smtp-Source: AGHT+IF3trB+IqLVZP1NbcKHzI17jtlNkvyPbQokeVhgB/0JExvYEQ3RkklZMsS1InChMNxxtoDrQA==
X-Received: by 2002:a05:6000:4023:b0:3d9:b028:e278 with SMTP id ffacd0b85a97d-3d9b028e5c9mr1425217f8f.51.1756806464235;
        Tue, 02 Sep 2025 02:47:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d0a7691340sm18023223f8f.39.2025.09.02.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:47:43 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:47:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v3 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1756800543.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This driver provides a way to access the On Chip One-Time Programmable
Controller (OCOTP) on the s32g chipset.  There are three versions of this
chip but they're compatible.

v3: Mostly small cleanups.  Re-order device tree entries.  Remove unused
    label.  Use dev_err_probe().

v2: Major cleanups to device tree.  Fix sign-offs.  Re-write driver using
    keepouts.

Ciprian Costea (2):
  dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
  nvmem: s32g-ocotp: Add driver for S32G OCOTP

Dan Carpenter (1):
  arm64: dts: s32g: Add device tree information for the OCOTP driver

 .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  45 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 ++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g-ocotp-nvmem.c              | 100 ++++++++++++++++++
 6 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2

