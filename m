Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA561398B6C
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891909; cv=pass; b=e+3OGJ5p/FxcSVcM6uExiEj/XTKgrsL2wr+l5Hgv67inptjltiP8bhkACDtDqs0wi2aiPG29M94YfOGiT0y86I2uKl1kVo+p9Ms8pL3VUkgILtI/ZUSO47AyemuWjTGSpLLTPbO/TWYNn59CPxV2hR+SR+clt2F3udzqx9xum54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891909; c=relaxed/simple;
	bh=9VL5LgAZ1E46s2MQ/aqB4s+D0s57n2MfrryqVuXDPjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlVqUerttEd/mc/Sf2UqCfpruOkaA7Nsy+wnGuiOM4aIFGFZPHH4VQQS8MHjP035/ehe+ewJSDUXtXRmXOw5jORTDrAwMCVPIYIuVyu6Yq4sDYzoKO+7UD+x4/QBxjoo/INZTjDNoi4rf4N0rY8N1VWxl0b0BhLmsaKgNG4gp18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FtGIHNqs; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FtGIHNqs"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qzb3UHTZF0/ujf3fl4j4CQVM2Zy+EWDlaYGx3MSb/lw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891885;
 b=baRYnuhCcpL0oczFYgSRCEma9nNm6VsVi25ecGwFXfNhogVo4LHPAmuTkAedtUApX7iJ0OCT
 uGKbuu5FljwjmMsm9V64pE/wA0IYgFDRDODwQ25SFbsjX9R6jmMY+9NpMFFO5GcZfjNJpUSfEyC
 /Sn93FdDEjTbmmG8RH0li8SplajpIXniMk1IJHmj2QAEXXpJroqEt2w9nI8fvx66BoD+yQyZXc2
 LjoLEUbIe06lWBtieo15dzvkJ+jsws40Ol5Q4n0p/hF7psi0mokaiZwxt/36ExJT0Pps699FYI3
 bSoZX7jx25A+QClZxaOPOD6sWt1DDDvXAjDkCkAqRtscQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891885;
 b=IOWAuMlBqmt4H69e4al27x0eRxQMHpFBi7q7svlwhqSe1BhdGNq6Pte747gyXWw49lLcIgP/
 4zwWu3wQamnFP7S8lg0vsrSdjqm7jXeQsJaJeRAX+vg2cNsfDwI45pW3YNIUDfk2Ks4Wy8AStKO
 J8VbazSX7Sg0MpqKIuU2nzxUDfyhLwKky2p5CpumDEDIkyNtLhX1UJUcR18ZRi3X0jgYoRv0Kx5
 QW1T9Kkpk8gYPLiZo7odOLgvjxwalPmTmw8ednhVR23l6CGrLFOHFG/LQ6f+nnM1vIdUmTkG9Da
 b1ovChsFx3YrrdPrwyF6FNIJekPfxKaIk4JIekMIyTdLQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:31:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC5495A0C27;
	Tue, 16 Dec 2025 14:31:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/4] arm64: dts: imx8mm-tqma8mqml: remove superfluous line
Date: Tue, 16 Dec 2025 14:31:06 +0100
Message-ID: <20251216133110.905950-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dVyW75Qsrz1kNh4p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:69d42c27ce551e48e93b8a3b97d7664d
X-cloud-security:scantime:1.976
DKIM-Signature: a=rsa-sha256;
 bh=qzb3UHTZF0/ujf3fl4j4CQVM2Zy+EWDlaYGx3MSb/lw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891884; v=1;
 b=FtGIHNqsKIhwifSiSAe1NQ0sbPglKAbgeRL9Lp8x7uYu8fuNNebvbz+VU0GkUUGcHNj9PbqA
 RMg5SGVMsJsDQ6i0Ey+c/R8kM9+qV9gim4YYhGc/If3nnbd2A/PqCQPODtBXFmM4xRFiLgL9flG
 +uJ2LOdeGINNAvphUlQMvfTCaKv4vRJiZ/4XTqUrmq1b/kDSb5g/szMcy2R238DbtfmhXCvIvUr
 B+3Ocjg/D1Xrn75HujpNR9TMIbEM2E0bI+JnS0kRruKWG1qDknW4cQ6zLYaskmUOvfgWeED0/z2
 p7/sdzKGhOUtM4Yy/xKm29JFPrhBHeh8i/GlkfP92fTdQ==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Remove one empty line that is not needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 6e63cf8beadcd..2e3860a5f4fd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -195,7 +195,6 @@ ldo5_reg: LDO5 {
 		};
 	};
 
-
 	pcf85063: rtc@51 {
 		compatible = "nxp,pcf85063a";
 		reg = <0x51>;
-- 
2.43.0

