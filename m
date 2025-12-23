Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F62D6E53
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766525737; cv=none; b=kJ3QawDy8nd4wQ5BrXVkWdylEonE1+qX6G0qDjXiyYOU6bmXuvuos+CrksUBmbdegWF3AZQtwg+ecB1ZHPsh8UK6XqHlU3Z8Cz+wu4Upd0Scx8KtmqCgX+b/5D+xcb0AmeHbWvlU/5nqy9zmo0ieTbSOCFCkkfhUt4sX0sInVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766525737; c=relaxed/simple;
	bh=VB/32YG9Ct5aZGQZIwrgo28UOF+9MONPUTdSSEgoPMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bMfhQSzxj6M3rIHKkIuF5XUcQOfqdekQJRpA/gMA/v32gIuMkjKj2EXG94PrBySeiyo+EtF34BloRnzjHtKwMyevLmJhrSvjNf24qeTO6Twz0UJUj0pZ7av7PYR5O3An88XyUpmyU7DlxufBiLNcYsoWbUy46aMkt1s469qfCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=izejPjLg; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="izejPjLg"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vYA2Y-00000003SSw-1p1z
	for imx@lists.linux.dev;
	Tue, 23 Dec 2025 22:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=xQqBPEjIjyfmPnQ7OqwKCSApA4c3YAryRblra9QBYi8=; b=izejPjLgN5y6GXW2Z4NPtK0JZi
	8ckA5wYqu4OXIqz+UrfX2bkNte7lR0eukJYjIAwxjFo41e2z2TBvuEhjfTnhoNRFeifyxO0Siig/M
	7OBWz1bmDv8DiahRRpfT74SGghpxUvcSXBDTjNywnINs8YKCAm6bMWASswAGjxvaM6RV+wd58MHbX
	JUpJq7C8zdBzKA2fCl8RuvfmKj1/zQqF/tjmXout11l+7UChxXkajlq+3g0pIUCTuMokzsH4a541j
	NcLPtpajI6VA8JoPCHxPes1J4Zgdj5pt0bzNakJYKyNjBz6vpWXNxRXt2U6hXNDwGp/hWcjoyYpiN
	LKWa4gaw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: imx: imx6sll-kobo-clara2e add JD9930
 regulator
Date: Tue, 23 Dec 2025 22:34:01 +0100
Message-Id: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkKS2kC/x3MMQqAMAxA0atIZgsmpUO9ijjUNmpAtKQgQvHuF
 sc3/F+hsAoXGLsKyrcUuc4G7DuIezg3NpKagQZySGTNmr23aOIRNBAb5xMmh8nSMkCLsvIqzz+
 c5vf9ABerX2pgAAAA
X-Change-ID: 20251223-fp9931-clara2e-59d1d51d32b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=695; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=VB/32YG9Ct5aZGQZIwrgo28UOF+9MONPUTdSSEgoPMg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJneXD+W684Oeyl9h0HT1LqvP9vik+2su+/ZFATXiGTlM
 R3at2RRRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABOZ2sfIcNjKYXbMuefMHSut
 CkpPmEVsEns178sr7jmtP6Ib9+a2ljD8d7/75P3Efdd/Hnr66Ka1H2PkBCNZC6FvDtuYzk/9NU9
 oGTMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add the JD9930 regulator to the devicetree and enable the
corresponding driver in the defconfig.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD.
      ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    | 61 +++++++++++++++++++++-
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 2 files changed, 61 insertions(+), 1 deletion(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-fp9931-clara2e-59d1d51d32b0

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

