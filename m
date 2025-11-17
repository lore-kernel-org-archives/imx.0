Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD632C321
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383053; cv=pass; b=cRiIO3sc67xc1JN+NgC/ptEngDzKCTODXVepsgv700ejch+HFP10zzoSWuMTF1dFFSg03xZDEfNEqoVxXApjmf3dLM0LBhBVM2S6CPOv+JvuoSx9UC8Q10gqx4FtQ5TU58n89QHh79xE96J1S9/wsTamcM5wisVGd1qFox8tYxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383053; c=relaxed/simple;
	bh=dXDi0s+km02ebBe7AWt7DzqybHNlwTYq4q7yTrzOyeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POdIZ1r4/+U2vq6QOQwxneq+LbT0ju798Z9kAtJ9p0DycmqTXXzMfn/dIz4rvyZa+TuS4ReX+6igvD4Wodpf02xhuWDpPa2aIt3n8kB1gKDujj7kB1v41FtLevh7dolDmQvxJYo3QG/TsTtRvFNwidzjgu4ZakcL/t1+SSyYSZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EQX++rd8; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EQX++rd8"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383028;
 b=arjVptiSpDiHf7bF5+PUaVhHST/+2rsLeb5oXVWdZphiijyLRpg+wmIbiuScLHqGTuFNb2f1
 ue8Kp3c7FdXKgdQtMZOVMiNbMiSGuPo8nAD7+d1X9fTyH8kZ88wf1aQ4UYgIqci1IxrzUIbCwe8
 dKkl733UVe8QiGZoR9TXTj8hwbmr+IqB0byjYkYpdiCIHmNN+lQUGgFAM2B0aj7wAXYmZDkp7Gs
 BUYWT6ouv3jZbkdvl5euKJXp0gHmXO5+MZbvRIsfNgQYCfuoHeJ9D+Fkf6pkpJ4JCdhpaZ4XtTe
 oo0Ps36B606gRT+/uPZpsoi+eZZ8Ykwl5/USxIIASUzdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383028;
 b=FGVD8siySSBj3AlKD/flmYPRk/fpQ9JglTKfVls5FcwO1suBFSBoZU6mS+UYGIeZFbcHTMpZ
 LpIxbJDXyjNT8DJKNhVqME+P5bCljQZXIyrNQV5VdncpE6UydQHFaMOhzdQFiISC3QtTQPNQG8V
 b5IpO1LeY9Uz3MDD+I5jf4hLNUMNbBoMW2/Mfs0Lba6VsIyf+Q515qaBsveKyU403482iJ5OYp/
 QU1m5jPWxX/f7Pr1xSiRFiWp4hpRQ8b0GtR/tTptT+GJsv4U7BNTnsAaV+Sx7RnmIQFkNtLmlPo
 n3knrSPbrYE9cbgpj3vZwjlYtZTRDSdOyTGFOKgQegw6g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 185C9CC0DF3;
	Mon, 17 Nov 2025 13:36:56 +0100 (CET)
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
Subject: [PATCH 5/8] arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
Date: Mon, 17 Nov 2025 13:36:32 +0100
Message-ID: <20251117123643.711968-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d96gr5rnvz4Mb39
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99c01bc02baa59d35c741e13cb81e250
X-cloud-security:scantime:2.386
DKIM-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383028; v=1;
 b=EQX++rd8oVyvOrSaQhxmBEa3dQMOLzcGVksSWFNBAmjVmNaf9AUIg+/GYbj7EoU3PZFMgkYV
 mTXGjD69x+40CMYn9Xx/gxvZ6fHvB3BILXIUNUnt8aCzrwEY+DvjfxfvnjecBki6NKBbEqaFtv9
 RSJkq/lYX17gQlvOMB7lRsHu5+p88sMVGCgJZ0jl5ykCWq05Vjn3Bdkb9rMVDfe4zRvpqxF6Ooz
 h62w5+ejwd3KHQJI66k7jCqsypFJCl/yi81cqNKZBmdBs6Ul67C33HAoJykOvnCQtKM7IpbpB04
 Lsr6LBrdDI52SmBmszdSl2bOh8RD73hQv6sgvTXcOYFsA==

The event out signal on channel 2 is available on pad SAI2_RXD0 which is
connected to X63 pin 13.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ac889a69da69a..fdfe246c56407 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -807,7 +807,8 @@ pinctrl_eqos: eqosgrp {
 			   <MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12>,
 			   <MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12>,
 			   <MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x12>,
-			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>;
+			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>,
+			   <MX8MP_IOMUXC_SAI2_RXD0__ENET_QOS_1588_EVENT2_OUT		0x16>;
 	};
 
 	pinctrl_eqos_event: eqosevtgrp {
-- 
2.43.0

