Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21646F4A1
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937491; cv=none; b=VVT+FP2btoH5LHIGWig+W+IKeezoFM6/oidNzLO2FUFbWiT1fVkdDYxbmaJi6+EYwl7n9lVRd4i52xuN5TX2V1JK2Z7FglTU+MF2EcUrz1QQ/j20rpMPJkl13rxDfwZ1+lPqGQhyTBie5CkqKlP/AF3s94b4NVxIejbT8KPQhTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937491; c=relaxed/simple;
	bh=a9KqHjlXIi87l3g4eMps3Q4mZeuFVvhrhNz2fQWUFXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoQ9lTwBcXYALVFsGtm5kKDKWdKVjp8bG4Amh43JZ5yJFzK4tAuIPoPzXBvagg4tbrm2XDlvIrpKhsDlJyJbJ1AAS+FnnJfLE/qwkRXcl+WbGm4LIiuOiTMRNkY+3VYu222Wv/K4XlipEPAQd7K8IqZCTiWq/zrmQsROllWVnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=i+6jxtT4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="i+6jxtT4"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0C14D20476;
	Fri,  2 Oct 2026 12:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790937484;
	bh=L6WKkXHoPT8Ngp0RSnEnTRpILsIWU0p7WgHa7MALkFk=; h=From:To:Subject;
	b=i+6jxtT4udfRa2RQQYwk5xppBrpPF3Ih8iAcTEqDcES4A31i0leM1CKx5avodBXOA
	 5YhkbMsisuMAkZPCJAA0IKXD5dttRhYM3jUzRj1cGXVVMjcVFQWDNl9dc3rgXGHAJL
	 r9kVX9tAkykFaOmWo8GyuGHBKcgFJStOD+s4p4EKVrcLzFhjklz1rb3dw/HfJEtkIw
	 k6rs9toZm7jTWAt4WZeCCtebnDA4n6v4pGkE67NQOGg+DGiC/aMvylEz6DT0hT1Fnq
	 fvvTRf0P3mf5VV7a9UceI2cYQf6iqKhyVLC9OqZ9nh+lWUnSCbd61PXphFQTvrpNo+
	 AXV4I41rA0W1A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: freescale: imx95-toradex: fix vdev buffer reserved memory node name
Date: Fri,  2 Oct 2026 12:37:53 +0200
Message-ID: <20261002103757.70065-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping and "vdev" prefix to filter
vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Same as commit 5cae743b988d ("arm64: dts: imx95-15x15-frdm: fix reserved
memory node names for remoteproc").

Francesco Dolcini (3):
  arm64: dts: freescale: imx95-verdin: fix vdev buffer reserved memory
    node name
  arm64: dts: freescale: imx95-toradex-smarc: fix vdev buffer reserved
    memory node name
  arm64: dts: freescale: imx95-aquila: fix vdev buffer reserved memory
    node name

 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.47.3

