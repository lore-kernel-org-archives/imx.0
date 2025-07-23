Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975F28A73C
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267149; cv=none; b=Jv9FEfypcuRJsallvSMBJ24ywS3KT1IdVv2O0RZeaPBx0epzJtH7InpVepyaUV8s+RvMRQESU1KlMZKV617XESkoel2lpFEjGnrbOOeYlWxOB1AG4wxXw+Vt1oCocfcJgQavTc7QFqtVSbIN8rvk9P4ic11N9JaTOAASStE5Qdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267149; c=relaxed/simple;
	bh=9WicMZ0FvlfVMTRmnsa6r0HX0R3VrCim8HjIAXHgfK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lGvqmcfJQm0NiXyxaQOaqyfjEzHEHGpZHbsdIwyVmT85Q/Xh0ONDYrBhJSwGnN6wo92dbGufnBRgDOUgNf2p3BVsZBVKKh+7v5eno1gh31np5W09ECMOLIbKNBtDyznt3yECLxI3LxTVelxnG+Ne8aFsqTxHcz2Dn5aJnJK0f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfrjLmwN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfrjLmwN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso10363806a12.0
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753267145; x=1753871945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5iTEuPm8PXvAv97xyJNqssuf7uJW8wkgDFwGB5kF8I=;
        b=dfrjLmwNORecP5RIfF3F8hdFcMorTGuA70RNjgG1iEe2edaoExWsFcfIwcfvqNI1zz
         KghJoKasDVgUP88xG2wQouzNX6DBo88YAcEtZFXCaaqUSPpiAJECnlH6IbIqvAZPqPqT
         cf00EKCwKZuJV5lAUdDiJ/Rbqu1wUAh7rE9IcSV/4lP5bakyoh7RizvsvLHX1odlwQt/
         xU4XFTjUeinTuGhcYd2iMn9g9MGbjfLbblOQYjFn1hsr9E91S2/Qzb8J9EyHj3TZTRmc
         ed88zWHOxxZJ6NXNKT+gC7UnT5/awGHRZNSJXR6jtxOKpfiH58/YaCYG+uyI6sIxHhrH
         pLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267145; x=1753871945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5iTEuPm8PXvAv97xyJNqssuf7uJW8wkgDFwGB5kF8I=;
        b=xUI1Ah+0LZwOIFDNrRSmjkf1Y9DqyhVZBd4R/EmFwZTSbgudbP2tfM8DjRGkio+C06
         I9pwZIVs/9EghiXnr7e8I1jzKk3IBlIVqKv1abj1U4RhsUmwwDJ5ZmsvShTXTdS4Qqf/
         KyGI1zpP/WS2h7Yv1A6aYi1XeXHoYeHdd6Shmakmh/+7RGnxPnCy5ogf3/59PPGgy9z7
         31S+oX/JE4+avFIVADCA0Fp+i1kFCe6QnoGD8N72gNdVtm12cRFrt0LhpJFKdmtqaEre
         KfCoCxIqvr/uriQQJjVh+vsi7z1AbygzvLVfsJbKMIn7Vt0mCMMy1ppxSsBPDUqX9MYb
         l6Lg==
X-Gm-Message-State: AOJu0Yzf6BmQy8/KFgjdIYWJmr2tNulI8Rdxv/5vSBhEgouZBoJQWljG
	EGBhiog5ukfDgi3XTEQ67QVHaBd6wmURLiZRq4ocF52JBZtPoPPcaoRW8DxBprZT1rE=
X-Gm-Gg: ASbGncvXnG4/DBryMEvPn+h6xuWJLnD/YcDiZkazt99Ms4q7pYEjFJ3hI9xlxmrE43s
	Du77Sg9PA3dT/6AbstJSrR/5C6PacJaR/aWCIZg8T7yXZeUhs5V6QKYFRZnZj0X7MpMH4c40dJz
	9c8NvcKBCxKSxeM1iTVBpEQJ6FD48sQzdVsmwmMpnHMouM+WnXPPtEXGTwxyF7K4cCLL1Iu1Uga
	7zoc0EIpulCinJmidSluahkSlag7OQnCdbol/6uw8H/zNGhpVkqvnkqrtLUoKsT5Rnpfuh9zc66
	c60CiDOfm1qDGf7lXz22zIHG8Qcfe+5C1H3BFZGLZ8oNIt33NmIY9pNogeTL1WiSdcmVLZcfb07
	6Rirr5MvC9jsP7aW0aWmB2Pkb7jm7nvs=
X-Google-Smtp-Source: AGHT+IE9kD3d46UGakbV9lDnsOWGYgjtTl2vVJnO3SnTKV+RHc/bdrYKZCM4+1r0ZRNOsbXZk/HelA==
X-Received: by 2002:a05:6402:5244:b0:607:f558:e328 with SMTP id 4fb4d7f45d1cf-6149b40d059mr2124453a12.5.1753267145272;
        Wed, 23 Jul 2025 03:39:05 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f5cf4esm8150799a12.32.2025.07.23.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:39:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.17
Date: Wed, 23 Jul 2025 13:38:44 +0300
Message-Id: <20250723103844.1641282-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.17

for you to fetch changes up to c78865241ecffaff7ce5db00ed5b71c1a70c0ff1:

  MAINTAINERS: Update i.MX Clock Entry (2025-07-21 10:33:57 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.17

- Document bindings for i.MX94 LVDS/Display CSR
- Fix synchronous abort in i.MX95 BLK CTL driver
- Rename LVDS and displaymix CSR BLK needed for supporting i.MX943
- Add i.MX94 LVDS/Display CSR clock to the i.MX95 BLK CTL
- Update MAINTAINERS entry to include both nxp,imx* and fsl,imx*

----------------------------------------------------------------
Laurentiu Palcu (1):
      clk: imx95-blk-ctl: Fix synchronous abort

Peng Fan (3):
      dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      MAINTAINERS: Update i.MX Clock Entry

Sandor Yu (1):
      clk: imx95-blk-ctl: Rename lvds and displaymix csr blk

Xiaolei Wang (1):
      clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  2 +
 MAINTAINERS                                        |  4 +-
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 95 +++++++++++++++++-----
 include/dt-bindings/clock/nxp,imx94-clock.h        | 13 +++
 4 files changed, 91 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/clock/nxp,imx94-clock.h
