Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87D4279E9
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827120; cv=none; b=AVKcmxbfsFZqLQ7iybKmlGBrh0cOSpv4J0tY8cXGVwIPIsnR7ZoVmYk9GACFpnaI3n+enNpBvvyRYQTMeIaqd5SPd4qLBJA921kbULSyALjC+Ls2QzRqrKTd82RUoBS6S31RzmuTbXeB6BsIVudSN7jrbFzGk+Ew7Jo0gVsRBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827120; c=relaxed/simple;
	bh=EmsHs4PY5dV6w/dlgUhaa3qubhgIhvpaYihUosLnwko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lLbTVMbgG6fwXaxMLxHQf6GNK6acHgyT/JxnF0npbbuufcRh7zFnyQ8c3F8O2O6/HTqO4aHarAmdqlwu7xnZyRIYIi7BMbhgf8YDhtOPwUJ0XQv2CKLhK5NqK/1VRo4IVr+NsUrihIQAhqkz7hcF3PVYAkKhrcGOV9ppSlgljAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UebYcKqL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UebYcKqL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4807068eacbso80805785e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827117; x=1773431917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pygklHzPZCvqH88rpK8Mu6BNLua8aC7oKSSLfM/aNbo=;
        b=UebYcKqLKdud0cf+NQ2Gn5TFdPVHqqLchBO3RF6EFeDBrrPfsleeIQjPylxygu3v4j
         +UMFfLsnZI82uQdKL+qAijo16BC5frN1qcFFMoiwdPU5D1qBtZO/a5H6EH9kISkwF2WI
         kYjmQtFisWDoHG2UyJLsLBd9Qa939w3pIwJpXf5LQGTzo3vKJY1s8QNyGpTVmk85a4+r
         uyuvONbaeKfFLwqjjU0l9jsXBJYwrHUXpj47pdUHWqesViMaKfrBFpV4r6HX91gozZEB
         nGqo045kGu4gR4qrfqgoQtOvlcaIO5aG/mcyWQJHkO/qmR5GHgZMRoragvzqB3LDzt4Y
         /x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827117; x=1773431917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pygklHzPZCvqH88rpK8Mu6BNLua8aC7oKSSLfM/aNbo=;
        b=g+ezYqfjN+q/afXrd9odj7KpCd9gWSjx+3btLvzlV94xZ273wzScgV+cPMxNJvHSIg
         cUBh/ub+ypmKppRj8xZ5d4Wqc/wSsf2PSrN5zIqUXzUF/g372BYzQzYfFVlQw7q0qqWZ
         SijUresMCe92HztfKlCfGMRREewndR5Asz1FsA+OH0XhSiXXgL9siavvxgEpbuSKC+AE
         PfHKtf6cxV21v/DxeBLMFCqIuLoTBJAJCnhfFTHlLV5ALg0wLt7OzAobY/3Sah23dcSe
         3dmQkrw8jaH1yBkDL33O1X7BTfm+TJJw5x7U3fxz0+9+zjiS51gulSg3N3AEIunA8xbE
         Vlmw==
X-Forwarded-Encrypted: i=1; AJvYcCVtawbIAMFT11pODPM8L+gjMvHWR8cQNBky3d6NGdl7RIozRHOVn5XiSLXVRdU6AE54Pj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK9uL7jnfLJ3QPsps+KXoHjD5MIi6tOVukcEmBHdrSaNnyhqb2
	M6N0qlcr8bE8rwWfTX4VeQn66LWKOMuk7zR66beLdxK2G/7JKNlhtRii
X-Gm-Gg: ATEYQzyEQjqajzzMu0tVwJzS2DYatW+IGQI9OtzuEdAMPDRPstiXz99HlnX1T7ya+k8
	MMVra86yirkO6fGQxeiii8O841J+pnEP5hru5+N2lNdBxEbXur1V5Eb2TXXW34lvCvPiBvWOgkc
	JWonwGB0QnKXhyTdqU3e2y5RJ9n4CDADN89cZLRt5GViVcNu+GtDoVY18QgS0uzizAw5KcAGrDD
	/k3dp9yhpU2vdudZc0BBj7qez5TgAxS2iwKtOQusP24qQcwmVHaZrarSivXKOTx++DTbp94Btw+
	RYUb6OhMG7amdvPFGLvOQOLwPM2I4uPWBF32JGCgE0sY1FTdMwX0LdYmEXn37rZWidJy0cF6uLf
	uyZV/JU+QMZoxNW985raLRM4/pWv2i8GbQa7aa2mZJDGme+tuQYo3fOA9nC4XrJnHvCJY0aexNn
	DPcMBS9nNRjzd6fbCVe5L0rR+6ACXDdoNz4W8B5dtWsD7HwyBOc9TbwathrL7Ysl2vRT+iBhSlU
	yip9fV6s7oZRM6p9+O6FSSyrP5p64s7RgtGepo=
X-Received: by 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr57513635e9.15.1772827116958;
        Fri, 06 Mar 2026 11:58:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:36 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Fri,  6 Mar 2026 20:58:19 +0100
Message-ID: <cover.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v1->v2:
 - Moved phy LED configurations to symphony dts
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

Stefano Radaelli (11):
  arm64: dts: freescale: imx8mm-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 .../dts/freescale/imx8mm-var-som-symphony.dts | 223 ++++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 4 files changed, 501 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3

