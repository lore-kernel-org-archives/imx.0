Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058837A3BF
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832436; cv=pass; b=klv+kialovHl6A8mnFnELvXm2A3jxtqVrPHzKVwkdAtsbwzMxrTl2AFhIk9nyIUecKZGtkUOYqr7hP/5nnsMOteLK0EW2iKqxQbJgJXB+NFwICfRoZuvU8PEJP2KhEcBo+PWp8O0xP+GoR+ha77jv7gyRydb/lJgqSRkCYMV4pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832436; c=relaxed/simple;
	bh=a0hUOLlXKcl9dQnZySZ63Qhf3hUcavWQoWIZINB11V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAKWe60z7RDgWbAY2JmpuCxSuEW0bmhzCrYBeD5/bjv1I4ABoWnifVXCGPkIPJisKEjgwI6T3/O3ZzIcXdHTKDBQU9v3n4kGdCgYq0GRxETnXJHXzlsn4AKL1PEkrl1WaRTCMzpGwXU28IMtL+qXzMsZiLKDS2FJLyBsGelkAe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UCo4V2u+; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UCo4V2u+"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=AnIuiwyqQKsNxaCMen44jTAA0px2zVCsntf2UHUmosQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832420;
 b=GrINtD7M2ZjNgaWJG+CSeb5ghfz7BhRNMzXnD8k2tfAPYJIdhUtbJ3E2UpY55cxkhFNDwlhx
 qgbdU/lTOvqK8poT+fHwxZiafBCdEwwP5KYjs0OeZfCBEC23GrOZaksXzf2JFJYlOFf3Wy3xGcd
 Oyvk00+RXojMd9UvLStG6acjCepEd6TfirsgKizEToWWVqV6FavgNeHDgelGfklPtHGDrNB7wLS
 mGFoNIur0JJ0iT9i6v6Je+Qnkvzk1bvXZ5E5UUwN5CydSWdZFd3aanY7VeJTuMv9dcOq9Wl5YuB
 SGwmT3Po8eseQGa+w1Gfkc2ziZA9i2iD37avagLaAbBgg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832420;
 b=pWNLD0h5POyrBW7zof1xVqPOKHzRKvUI5Evq9L5kK/EoQQ1OLW9dHT+wJlTkj8NCn7E5BbaI
 Uih4p+D5TOPyZsCPzM4wL6KdyV3xAambIGgNw+PbWu4wmKd9ekhcHaNSGHzsQVzVgZAYUZ/E6oF
 5YaByMto/ry6hJxGW+e3dy3PuvH9RQFiH//Tb8EBdjRYuyjSUXTOWcZTN/o0MkKHO5k2DAWHmii
 eOj6cRaoLTeqKykT1LgCH1re8xvxr6J66a6/1QNVBRP+agj8+SEC01eqkQWbVkma99Wu0678HEv
 RmxBHN5E/j6hM/mc/7tbFkjXUvK0oQfjMzdH1Tz75ba4g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 14:53:40 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 95FA65A0A3E;
	Thu, 30 Oct 2025 14:53:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
Date: Thu, 30 Oct 2025 14:52:58 +0100
Message-ID: <20251030135306.1421154-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy5DV2mnCz2nGl0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:af15caf252ad1b03706cb5988fd6514c
X-cloud-security:scantime:1.978
DKIM-Signature: a=rsa-sha256;
 bh=AnIuiwyqQKsNxaCMen44jTAA0px2zVCsntf2UHUmosQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832420; v=1;
 b=UCo4V2u+0yJhcenc6UoBINkAbrXuRgumSUtlqHTvQxkd5vG8pasIjYGc5zoJThpX/n2k31Rc
 yySAExe2N02173EV0Clapg8V4fgX+RZFq3P3D9xwgllXr/0PexQDtI3TfslA66kAEyuctkT0F3F
 4SJe1y1fN1Se6k9efaKsqqllG2rcPL0/i54OJpeWexxNDuzoA1ci5GLUX/awleriv5ywCZEpnV9
 C8Rj0QLQAAFL6m2l966Caf2L544n9Yh7EF7+b/eJihNbwbkR5KWZcZXiD/aajfNAdKTJQ2AVE42
 BZaQMl1Ps3j88t7juSJT88xfCOzkCOvt2V/Gyfbb2gldQ==

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 8caf0c68ba9fc..d1c3d55b14469 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -144,6 +144,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		audio-codec = <&tlv320aic3x04>;
 		audio-cpu = <&sai3>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0

