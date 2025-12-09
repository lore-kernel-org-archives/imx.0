Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B202D2384
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277648; cv=pass; b=jb6Nfd6S1ZfMr9k7iSFsU9pNqoJrMQ5AyIcKgrXm0g/huvAq9WlEJO7QCN/5sIBMJEl28ymkza0NxDHLEC04FnhYDlojEZkDKw+wV30lnLBEeaSg+FLcnBsSu/5qsxTaulBsR/ed0HPJAe5+R8oEMlVuBaYLwgzc0nWgistmQbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277648; c=relaxed/simple;
	bh=6eQxmAaacP/aBW8Y3d+Wuo10K5fyUcZaZ5CsJYaQI1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/EqCBLuykVTncmF1rDbSTDWLvBSbxt1ZyAvkEjv4zgH9SXMvWHwYT0SW1Ao/q6HH8pvpvjpH80rDXeki9lM+Cno+bGjNN2ShNSB4fPcqoBimOZC99GviRIhvZWDG5MuoVYB3toqCbgUzjud6ITKzkdQOOlMCogZxnLO/VN9teI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Aaf+LJ0L; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Aaf+LJ0L"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277618;
 b=jMCBFaKA+oZWJcOPr/0wDeaqiPF/O54KWcBpTB0QcJFlP8T2ieNN1QQgjmc/pN8zMhRZBAyk
 ZtuiNg5uBrPds4BpXZfv7Ys4QyrsxLcGEpoTzihoAnm078wqbxPGKILwP/GS85MKcIVUnsLoc7h
 u6wwBv391/geK/V3m7z0N+ng0rTFgZPz0ginysmeKOxqCPbZgtpZAuWBwMsC4NZOsuTZEOVYsWx
 OFSCIfcfHpOmB2hij4eVlIrCHO3F5VEo6NgMlpDRUlSpFs2EyJ0evuc7F7yx/zvyYGPo9CNRIDa
 Ah9o793VFV2CgSqPfSquqItW+6zUSal9PfEtzIsLbwDuA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277618;
 b=K91JaGxi+kOrtthoiOjdDi+nbwrD0L8p8SQFi+SjGpqoYYB3AeBMUQNNTSykRppn55g7I1JL
 pPZt+BrHhLR39EPTFljUVhVFgFiF0tSOfKCEhPvaJJrB+AOxbYZuhyIdVlLv5iJMX7dDoVTnuLu
 TKv9Nr0zOHpFJx4fapIxiwT4lDhryQDDhwGUywU4XzLOngT4srftuW8YDxkWCwKQb29OMvf+kQC
 QQqG8opLarJCdcO1bTtMur4mE3Bl9KxS+k4ocsqr3lBjkGu76+TXogfGWNk+YkkEB4VmHjl3SUe
 65K8cMO9iYL5D7FLDH8ItSRxrFBMBpaN56rPnWUXHzC6A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:38 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A604ACC0E94;
	Tue,  9 Dec 2025 11:53:27 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
Date: Tue,  9 Dec 2025 11:53:12 +0100
Message-ID: <20251209105318.977102-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLJ2sfpz1kNh56
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ebb7bfe29a23ea3b3ca2efd1a9894abd
X-cloud-security:scantime:1.801
DKIM-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277617; v=1;
 b=Aaf+LJ0L+VL4sGTbkB1pr1ApRKPQJUbpczeapryiqV9+WnrDT3qJtJy+HWMdPMuCOcRyrCJJ
 HmJrMJC5n0F8V4iYfGIpYp4rIErXLvsLiqX1/lZ5MJzjuoEKRi+gt55aw8HOjprYt5iYH3XUpBa
 RhOIJ8WafDUNR/NrTspqPjPthYOgQRtPfkLxv85EqTk05kPpUHJWqrZQQsay88kYvRn5ZA8xc5c
 Af0cwRsCiPf/21S0ZFeIsJ2MmCnUWiAwTmqRI9LPuXFC+kMZVHNQ7IH0iaMnqS0FQ3AX6kSWkeW
 vAwWQjjAMAc3NkpvaqDDOw49XtwBY9gNFx8VsSegV7pqg==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index f7346b3d35fe5..67fe1f63fd93c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -190,7 +190,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -222,7 +222,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-- 
2.43.0

