Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF8446854
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429321; cv=none; b=fZl0pMXPYYwTU6D9cBiwUF/WuScj8YQA+mecPFq15IuiNnSA9qEIKUTTISj1seSM9/si1BEhCDRocapT1Vden6K3/7CzumnH92t9rU/cbwo/5v4UnixcrA64YXxRQ1qFlbQqHsSRSceFoo7p++wWSNVbRIiS+sTHNYCs66aTDp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429321; c=relaxed/simple;
	bh=0bTfb/Ooe2V2jUcLmx5Y97xxWl4QvgtDbTIBdNYbIuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHbJwfH4//JYPgXG0nt0RpmrgJgFHx7aeVeL3+RxYfMhbVUx8KtsNM7oe6f5GTgEVQbGtfHnLJyoLUNaCFB1edML7nkaF+VgpS3QOjkQ2jMqiXM6P0olBhLzpr3L8EKtPU0HBTfWn9804k7nXGQKArw8+SYuuX36+6y85Agb4hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P94CxHhb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P94CxHhb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de008b020so661883f8f.1
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429318; x=1786034118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=P94CxHhbQ4R5e15Ncb2DgFe4Qydqn4clwk/LQrWsbUqYu02ehgwEkC1XbQ7pIc844R
         WgGcI7u8UNUUg1Qb9koVD7FoDaayUm2saXK2fqJ3RGJcWbM4CyfyrrSHozi2aA/Lgc72
         PlcdMiG08vNzm5O4BwF7wxpU/SQNgMLVfn7kFAl4ccUiU8itVpTwCSfWwp3iApHNOMrF
         Lydc2B138sToJka/WaGTsqa+b6n0srG+Fm858Ma/fT4zdlOYS90h3R9OdhLdRh8vEn7B
         zRIeAO//bv1PMeYt1DZUpB/JQLPGhaXw4WFlyWA5XH3nhUTUE7k0mDS07FNoEHrUnIZ3
         e/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429318; x=1786034118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=DzfTW3uDL4NfKFr4CjpHBZWkkqc2qeNzxof09h8Ni8whcLJjslN880OEcmXGPs4EDV
         x5nZQsUEqzmtIzxaFiGVk2JvC20yr7UnuJGllOcX/J/55XsXPkc4wciX1iSPtreK0cNR
         2Pj+GiFvD/UVud9SNDys8VywKKVMJ3EgOrvFDVABD7nKdUWS/fXzLAhjq772g6Q6rsd4
         2OrwBCQhzg104+anTSLVBTNRAsq2XiwJPBuseGt1Edl1673+J8fiwxmbFtgk4fB30KE8
         0Cwbffqo0tNl29EKYShEC41snRNTd0uDw2ALMFlE1HBhNUmM2Io0/HpSzSuV0OvhEn7v
         Dv9g==
X-Forwarded-Encrypted: i=1; AHgh+RqztgsT8TYbqJvqpF5EdOBh6GUn11B8KLYePipeqgvn78MgzE8rbgweS7DKf6aUMFDGN9o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsxo3ChRnejYJbRjo0fvwZEKmgIhaoHxRYXKgoqnTiUjksHofH
	++wmKitkOR6nuWP46u5vFa5WZ7KOvdqo/FHRwWu1ZKsBPUUPOVqWxM8l
X-Gm-Gg: AR+sD13jayM4mLxwCBU9BbOc8UdT3DE/wNC6nacenXTwTPADIZTudpLcAarS1MuNzFW
	xX7Q4gHjv3FEmL/3DJ5U8AKLR/ZeXjA26dGDE6QMH489PSBpy3Q7F7/UV4hKVxhO2LW0yO46BuA
	or8hFCwfg81shxw8aZQo1F8T+Ikr4p9sNx6HHi/h+CVU+NHCxgRP/rcLK8eK6vynS2vCsNRBgxL
	dRE21Do+jEf5spmrUN2PfAX2xjZoBKfsjsyT5IMf9Za6UQrbIZc4l3XK00ChkaiNKXT2BnZFG5f
	+vzk5FYUnhA6+F4Gg8nynqmZLC/heQHKg/xPrehKBFAOuMi/kWxIqSnXudsKgmHgeRE4cNjg6LU
	djwEBtZkLAyexBvIwoioOF8VusBC1zem6AoY57m+/FZino7Rfk6lKaai6idyJSXdzfdncUAeEe0
	6MBkWzpHo/oHVdoxaUdbksA8ztsvRWrujxizXZjmIlNNX0TA3nJBFPQ698pvGnqSrzW3fg1LFdE
	dWmRltcrEq+TA==
X-Received: by 2002:a5d:5f48:0:b0:47f:9208:9e4 with SMTP id ffacd0b85a97d-47fcbdcbf32mr1850867f8f.31.1785429317752;
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Thu, 30 Jul 2026 09:34:08 -0700
Message-ID: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

---

Changes in v3:

* kept the DT binding patch because it fixes the ABI problem pointed out
by Frank. Modified the commit message to reflect this.
* link to v2: https://lore.kernel.org/lkml/20260605113621.1479-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* change commit message of binding patch to describe why it's needed
* drop restrictions on the string names passed via "memory-region-names"
* drop patch moving the CM7 node to the SoC DTSI. CM7 node is now added
in the RPMSG DT overlay
* rewrite commit message of patch removing some of the RMEM regions from
the bord DTS - previous version was a stale version from first iterations
of this series
* change "micfil" node status from "disabled" to "reserved"
* add check against rmem phandle count and string count mismatch
* include "of_reserved_mem.h" in "imx_rproc.h" to avoid having to rely on
the consumers including it

---

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  4 ++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 drivers/remoteproc/imx_rproc.c                | 13 +++-
 drivers/remoteproc/imx_rproc.h                | 21 ++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.53.0

