Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC81E529
	for <imx@lists.linux.dev>; Thu, 12 Sep 2024 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145322; cv=none; b=htUx+LzUpocwMNBj9o4JDgHgK8OKBKx9iOogPOVe2+1JMiV96MnnF+ijEabna4hXzKzXYSXVlQvGoJwVHslqi3iEagmfPoJjgxBAyVyNi6bP4uI9efqIcgJ7W4AM94QeAsm3ypiE0yIx/Md6p3W24S+ujvpSIagF0dnjtWdvhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145322; c=relaxed/simple;
	bh=kggfsNTCZhvoiaY0CpNYztQnwK0ju67Soie53btb2iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i03ZMGdfdu7/O8Q6ZJA9vrsemcKmeahevrZhJ/OrhwEHO79+sp5ZItGRpclWTRYBTwFWcyfq1QUc2Le8hQ7vZjcYDzZ0monJ/YBVjxvtkWB5KQZej1NLpC8V2pYaCoXNSG3OEC/Fp7VjAKYsevJZpLGpV0hgwCbrYT9klqzHepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OP5SryAS; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OP5SryAS"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BCE5F88EEC;
	Thu, 12 Sep 2024 14:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1726145318;
	bh=8CR2aDii7smh/tqc1g8mB9eAQqyrlVh29TmUpt45vTE=;
	h=From:To:Cc:Subject:Date:From;
	b=OP5SryASBaGYDOeAPUBKcWfPccaC0xP6kMaX0Weh1tS4tGwdcaFhyjcycMd/+sVaA
	 WLjmk1y2N6u+a54QkU1kxbbOqWfWE61KR19OnfH09G0Km7Up1ZIymAwTKTw+PZ6Ngi
	 7NkSPOBT0geYMf36e7h4Jg5s5rtcSRC/MsPWaqspJvuDJUlH+N1yt11P411+F40LeV
	 3KEL1S3YhiAjwMU3yxFa56V+yWYZizWpHkaO8WN8Dgl3DYwHkruKbpcaTmmUdqhzM+
	 DiBCvG6mPckUKFsc2bfbHuH2gpVjgDcTdlQVgxt/G2nES2awRNqA71ltIZFetDwYT2
	 tYIt0jTKYsDmw==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v6 1/2] dt-bindings: arm: Document the btt3 i.MX28 based board
Date: Thu, 12 Sep 2024 14:48:24 +0200
Message-Id: <20240912124825.2528984-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The imx287 based btt3 board is very similar to xea in terms of used SOM
module.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 80747d79418a..f290c824a91b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -97,6 +97,7 @@ properties:
               - i2se,duckbill
               - i2se,duckbill-2
               - karo,tx28                 # Ka-Ro electronics TX28 module
+              - lwn,imx28-btt3
               - lwn,imx28-xea
               - msr,m28cu3                # M28 SoM with custom base board
               - schulercontrol,imx28-sps1
-- 
2.39.2

