Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A62D374F
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320378; cv=none; b=FLGRvXn5gdGXFWpWZN1HEuAm7XP5rlmeoFbUty5hryodHXQOf5RQu8wqTCY2dD20KypsQxpkwA83Xx0rQU5Iotu1WZbJ2W1l+bM4E2dEtJ2BGqOc9sLDP8/4VEcoFCv7lB+FEACSwNKiWPgjwhHOAMyoZFK9+LsCoRt/IR+8fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320378; c=relaxed/simple;
	bh=bBc+mfqKr3uL9dadx2ba1PgNMN8oNbSq2rlIFExQJKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sdlokrBqH/nnY/IVNDCY5rAmoQ7BExJ8h82r5EFumlJ19PwcuEhlIn0YJqUkjizm0avvjDFALtNfOeL8524opKvMvU8zqipE3hlwUSxsw66ALLTEp1fwG/uI2D0vLuBxLGkpGaiaGlpX8mu9yLFWWfj1G755O5NnRDPSYQm5Un8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=CqykJfQA; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="CqykJfQA"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vfgOa-00000005WHW-3sKl
	for imx@lists.linux.dev;
	Tue, 13 Jan 2026 16:33:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=TBIjrv4Y8OCNFBCu4sCpO8dv9dAjBKgPmh8xrmvTw4k=; b=CqykJfQAMzzxW08XAMUVqzuQd/
	dXeHErJk8dedGFD3st4JDdDkPr0WhUw8QajWMph/fr+cElv98NIcffLsu9o8BD/ZR8hx6n8mAVrsk
	eJObhJaU6hIey5iDdBkG4hmPZb93FCNC0mgz2Sqyqox3phEdoAA7EQMm8orI4IOpTNVaIrQlj2rHB
	xYk3FavNqgyJwouerKTB9nvin2dS7ufexoiysNfz6y5tZdcuKAPstEf2OzIMLsMqe2UZc75QP8pL5
	JMhWAHzFXkyCrdMeBAn3qKdrzY/RGlRjwNRKrefO95ydJdNp91RmEhPV3EygYAr4Ka15qEQ325Kj5
	tQR9uZcQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/3] ARM: dts: imx: wire up the TPS65185 for various
 ereaders
Date: Tue, 13 Jan 2026 16:31:33 +0100
Message-Id: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVlZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKCYjNTQwtT3ZQS3dTUFHOTRAMLS1ODZCWgjoKi1LTMCrBp0bG
 1tQATdF29XQAAAA==
X-Change-ID: 20260113-tps65185-dt-eed74a08950c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=bBc+mfqKr3uL9dadx2ba1PgNMN8oNbSq2rlIFExQJKo=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqU3yv37qTa68uEWQI5J7o1t1+m6W9NL1J+Vfp669e
 sD4peimjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACayvoPhf0yRbOw8E+XEjM/M
 ucWtNkuyNcO+vSqwbtilJzz5iMkyCUaGz3vvsMvGbRaLOK5srxY8L49ZyFb607d/6kYPW3e99Fn
 LDwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

As the driver is now upstream, wire it up for various ebook readers
containing imx6sl/6sll/50 SoCs.

The driver for the EPD itself (not included) still needs polishing
which would be the consumer for these regulators.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: dts: imx: tolino-shine2: add tps65185
      ARM: dts: imx: e60k02: add tps65185

Josua Mayer (1):
      ARM: dts: imx50-kobo-aura: add epd pmic description

 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 ++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      | 60 +++++++++++++++++++++-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    | 55 +++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 ++++++++++
 5 files changed, 199 insertions(+), 3 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260113-tps65185-dt-eed74a08950c

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

