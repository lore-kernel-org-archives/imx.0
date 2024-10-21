Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A11991B4
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533691; cv=none; b=IhvStvAb0s3ZHuJ9S0/p6cseyXs8DFMPiCvk92mVuHvVvMWL5ggOS0kElI03X9wtwFC4N1pyg2k0oFZdoEFRSg3IOEfAaCQGCIJ28fwsna3/i1A5PJvtOEMi9SuQ3SHt0XMMyBPoeG59rO5LBolYIdEhn/I3ddYSD5FnoiVEGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533691; c=relaxed/simple;
	bh=6UrIP3x6Q4VvkyT70SfUcwoNeQTbMiQIeBKEpg8X6M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uTEQqW8TZUPDzLsBNOs/QI4nLE6Fmrl2bkgNb2lnCqJa56Sw5fs1tgwxba4tqlsxwnMc74ep8tYp6xN9QjNSgHl8wD0NXGVJ8DiaJEa3AGhA58U96pA+rEJjaeVPBmd4aMlwL3KkXK75oocoocS+UrlMLu61XcfTY2QEaA7ma1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=et37ahJ/; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="et37ahJ/"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t2wL3-00A4Z4-0u
	for imx@lists.linux.dev;
	Mon, 21 Oct 2024 19:37:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CCs37GV7vVuBh26VL6pxUZ05QQRqLswyJ0vwq4ol3vg=; b=et37ahJ/YgSY/9THd1KxieZ+If
	Qv33CctofhSfbbBH+kOgN9L1FTTNItsmaY/oQWhL29hVpYCNQgBmxNzqXNVHnLrX/K0VMFjhwuOO8
	sJFmiF7EBoxbfJ7k2wvdkoJF18s3uMKtdKkvQfV7KX1dG9Ex1UAsX1e1yVmxGTQ94WWsmiJEQuPWg
	dIqXSaBE1bhWjFctcO2FA9uAEsw5QQrpHi3t8gb49v+KZTxAy7nCBv/EPVqYMhnU2YKCsFla1p3+2
	EUZ2zwsqRB2oLws1jS0qdmCzNt9ryuRQ6do82Mu+1yvQBUI3Q/vZ+RKspFyF1+8l+PkUxlaFhhhCu
	1um1dPzg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
Date: Mon, 21 Oct 2024 19:36:29 +0200
Message-Id: <20241021173631.299143-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021173631.299143-1-andreas@kemnade.info>
References: <20241021173631.299143-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds compatible strings for the Kobo Clara 2E eBook reader.
There are two variants differing in the EPD PMIC used.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177e..a78903076269b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -620,6 +620,14 @@ properties:
               - kobo,librah2o
           - const: fsl,imx6sll
 
+      - description: i.MX6SLL Kobo Clara 2e Rev. A/B
+        items:
+          - enum:
+              - kobo,clara2e-a
+              - kobo,clara2e-b
+          - const: kobo,clara2e
+          - const: fsl,imx6sll
+
       - description: i.MX6SX based Boards
         items:
           - enum:
-- 
2.39.5

