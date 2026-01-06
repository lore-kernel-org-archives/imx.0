Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481572F6930
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726127; cv=none; b=uZqhAse9L64nlORmI84P8Kw2KKY2dyuxQfSszYMGtGALfYP5Vuc9jnh1YdcV2ntFW9G+13vaVPYcWlWavwe+DrVSPvBE/QYxrWa3PZNXcm4t3RrqR7NN86s1kKht66hszWE7fmTQ+VxsHkcPYyLNdecCxxEaxvk3mkcLEh0zuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726127; c=relaxed/simple;
	bh=h9LawCRZQJpI98SuX9Q5rrTBGpsOukH2A7vsIqoVRgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPpV6MM3FuoXzWl2kSI6Pb6oXS1yAnuyQgUaFRYpvkixvdMLIGpNHOlcY2qzKOWNJEulLrvwKwAdnAwa+T6dsVQz5PwOYRWICRR6GX65IeK/9RQXzE7Q3zc9K/EGAcVeLwf50FECH7KiFYTj5v3TEPUDD74yJYgIktuLU0VDLxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FQ2Qi6X5; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FQ2Qi6X5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58D7110C95C;
	Tue,  6 Jan 2026 20:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767726123; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PHvmlOWO0t3opsLQEzxykNItCIuB/aLNoxFMEgV9160=;
	b=FQ2Qi6X5zv4mN6/tPp6QHy8cF/fdte4Y4hMpTH1gTtQ/ouIySe02COTZSKHKPUQ338+826
	Sj7LYtt82yvgEoqJ6E+JHi96y+K9DsnoRJ3VkakkFylbWtsXvUC64aVI5MOcrqyZo5IVvM
	msB3zMjoJb9w4TjUqZxtjJmMnZ3VdF5tfGedN2Gc3dT3tDOsMBJssUQJIrHh0qPmuF5qrq
	YsSFcktX2CxLDe52AJcbwhyWj4JZwyPh6Nuf4zQai46O/JAPB6rGgKfqbjPC+DK5hZjE5a
	RU3ltfqKs3RB6gEkkUqYcSulpRo/IgE8+8zxjVaQQbsqtga8uKZrhf8q0fLG4A==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Date: Tue,  6 Jan 2026 20:00:39 +0100
Message-ID: <20260106190147.31924-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106190147.31924-1-marex@nabladev.com>
References: <20260106190147.31924-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add SNVS LPGPR bindings to MX8M Nano, the LPGPR is used to store
boot counter.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: New patch
V3: No change
V4: No change
V5: Add RB from Peng
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25a..3199bc0966b03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -628,6 +628,11 @@ snvs_pwrkey: snvs-powerkey {
 					wakeup-source;
 					status = "disabled";
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx8mn-snvs-lpgpr",
+						     "fsl,imx7d-snvs-lpgpr";
+				};
 			};
 
 			clk: clock-controller@30380000 {
-- 
2.51.0

