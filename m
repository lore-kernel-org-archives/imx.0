Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F915359A
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 04:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734322068; cv=none; b=tOLKOyKC2SUycRWlVA2hGA06Ovhslx1EPIirVM5FyPEMbUQqEuTZWojmPrNzp5yrKkaDlqQp8Cjl5pLr8kUBMn8kblbsPnQoh0qKwOox0BenRB3IWcIglPnM+8SshITHiLbDU8XAGII+/Ih9B5tZf1S6SUaCwisY/lKri78p5qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734322068; c=relaxed/simple;
	bh=sivIsfEUA1IAgBPBGdPH6gflJdVlAA79Y9+Z1XmUkY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZi3hum36sSprY9fqT6qet4tKrdDwL0rITFJVMxc6bRDkvAQTBxxl8MIDbzcpgFTi5/CvWbo8SfuAEsR4D2hnbQxofak/72WY+tnsW8pX7dyF6j7rpGZh9oJw0lPgFISfMHSow+4mePOeKAm2Knm9Cv0wJUN0B0Rmyf4j+vVpvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=oeOAJCuX; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oeOAJCuX"
Received: from hwang4-ThinkPad-T14s-Gen-2a.. (unknown [220.197.230.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 0F2B63F214;
	Mon, 16 Dec 2024 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1734322061;
	bh=KGWUyeOha+X1jJGqKNXSQpB1hVyHAmJEjzhsVzT9bUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=oeOAJCuXFmfYlkbRyGRJjMn9gigh91xMdP8fEgFaHt/AVunbtpFgUeXqSBnkSyldy
	 MSrRjIdahH9aC7kvPSQUafpzXqMZ1nPhyIMzG0c+vdymxTO9cANjlfOUcy7yKxHgaO
	 4zmG4TTmxRJBPw6AqX4ym1l6+b/nweAxaIT1aQiulASgI2nCzo8Qu54/SyoetujE7l
	 02uzSA4mtVceFGM2MzH6b/W41VmZHLUm6hjipcOws11oni+s5h1TMDJxkTfZJiVP7c
	 lrO3FG/W85jkjSKUUrwgCNyoNXp0zVD9A/GyhKqLqEcpWm2bqj4n8fSKJRKPb0bQ5K
	 g0ED4doIqJbnw==
From: Hui Wang <hui.wang@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: shawnguo@kernel.org,
	xu.yang_2@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hui.wang@canonical.com
Subject: [PATCH v2] ARM: dts: nxp: imx6qdl-sabresd: add dr_mode to usbotg
Date: Mon, 16 Dec 2024 12:07:22 +0800
Message-Id: <20241216040722.21738-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there are 3 type of boards (imx6q|imx6qp|imx6dl-sabresd)
based on imx6qdl-sabresd.dtsi, they all do not set the dr_mode for
usbotg device node. The chipidea usb driver will configure it to otg
mode by default if the dr_mode is not set, but some testcases need to
parse the dr_mode from DT and decide the follow-up test strategy, here
set the dr_mode to otg explicitly for these 3 imx6qdl-sabresd based
boards.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
in the v2:
 adding the dr_mode in imx6qdl-sabresd.dtsi rather than imx6qdl.dtsi

 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index dc8298f6db34..914c129b09a5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -804,6 +804,7 @@ &usbotg {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usbotg>;
 	disable-over-current;
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
2.34.1

