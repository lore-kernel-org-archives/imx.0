Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E732638B0
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104683; cv=none; b=uKA/zqO2/JZztWDStK6q3UJTchCpbiP9awFjg01wNGN9pVhBJisQfiPj5CnIX4jQ7yimzLrGfPRpw6H0e80zW7Ppz+dvxpNqgp2GKH8yX+4GypCeQu1l8UXb4B/k1cDotJL81jn4Uc/VirISiChrq0JQSEnMflNpEbPtEndNFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104683; c=relaxed/simple;
	bh=wC8duU7ueJdkTcf2vS0xCtC5Q42ZMxKgl7gVcUJwfF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTjn9yAcErrGGNwnJ4lPR5cqEbedYzORwZ1q6fhv4HwMMrta+QVtBrcVkIPKU/SJaqgcxlaJsmDLMswPxv9TH/y/FRgM3SyVofiqrZFIgOMRyC91v888jiHq2n0SyALgFSF8pqYHxHT/X+qoc8tsUaNecB8LM2mUK2tELP3HE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=S2GqiLF7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iGXz8xae reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="S2GqiLF7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iGXz8xae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104679; x=1775640679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h0s4IqDHUQpz6TfVrnkRbMHalEDSFjPrTCmzN+0kbD4=;
  b=S2GqiLF7cXdqaGbkudOAukO2jdqiKici7yfEqiBHguivfvYMRU+4Auot
   dG925HUFLU1QeZkfGQEr7npbSBcV3SbicatbDALIFsSbo8xFZWd/xZDKY
   BgO0iWJUV5NePqf2pFAH1Yf163NMSw4142ITFEf3sVAGvMk9VW33PyyZn
   Wb/hO33moXHF+o3NCq+vatpqUaFMAu/5w00SdPqBneN1NbBONY3OxiMUx
   N3pgzqPvii202nTTgiGiqGQ6WXI8ojgnkoFbNORn5WZl7jt+f/c4KNZBz
   d9eg8h/Qp4/sT1ZgRGSibvXyTo3yCKWpRc8OS1NA54Nt2j0lkZC84/Orl
   A==;
X-CSE-ConnectionGUID: Ymv1WK9lSly4UKeBKvybJA==
X-CSE-MsgGUID: HWgAOVYaRLCxkl4aLQqe3g==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397353"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:16 +0200
X-CheckPoint: {67F4ECE4-5A-F35B2447-E1635CDE}
X-MAIL-CPID: 96E221BC38795281C901158DDE387570_1
X-Control-Analysis: str=0001.0A006375.67F4ECDF.0015,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A08A169020;
	Tue,  8 Apr 2025 11:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h0s4IqDHUQpz6TfVrnkRbMHalEDSFjPrTCmzN+0kbD4=;
	b=iGXz8xae2/wlseztSWhSU6whTtTSf8ioEbT7mfr7TRKJyPMmeecP6L8AC0bS9TQnBn9DZB
	2vlbySxAwLnEmM13PhtILfn6Pvvb01fQiJJFuweYoYucwuTbMzaHMxdGyASdc4QA2xAo2q
	NkYnjf+GbVPFoU6dgsCalSelPncnE4JW+HxComIWC9+kS753cVGHNLzfy+IQrwcgixtay1
	1bIT22tmQikU8uIacV/81aI0DEz67bxk/71lHz/p7/4BVSGdSbHx1EeP1JZ3TSSWyhLX3R
	lZv9y0Emz6euI9WWVygnzUfmYsbn3WmlAYy+3VryBX9ivOiffAhdcsuYG4YeQg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/7] TQMLS102xA: New display overlays and small fixes
Date: Tue,  8 Apr 2025 11:30:47 +0200
Message-ID: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series adds several display overlays for HDMI, LVDS and RGB displays.
Additionally it fixes the license header and updates the sound card model
name similar to i.MX based platforms by TQ.

Changes in v2:
* Collected Frank's R-b
* Improved commit message on patch 4
* CC'ed imx@lists.linux.dev as well

Best regards,
Alexander

Alexander Stein (7):
  ARM: dts: ls1021a-tqmals1021a: Fix license
  ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
  ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
  ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
  ARM: dts: ls1021a-tqmals1021a: change sound card model name

 arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
 .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
 7 files changed, 204 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

-- 
2.43.0

