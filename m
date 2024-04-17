Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CC147C89
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713368147; cv=none; b=Y2vHo5E8gzW9bT0esT6u1KVNcw7IQCo+f+SXhzdkHnURRDp0cyr5FZWx0m6xAyaiwrZ7ZY0P3lnnA+qxMZszEy9mjvCD8yi+dpHze5YzqxdE41XWTJONw/62GU+wfrJXDYOX2PYgi688Aw5J0RXRkPjnyJRGVl6wduY5Xf/2jX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713368147; c=relaxed/simple;
	bh=btSzp61lFqSy/rrndpY1GrjLTpySadYlhp3ifjw3jx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YZ7aqocvENik3P7i+EMV7aZ81Y9MfXt8354u7L+Esj5d2jgyxcxgXyGoAW9A2YeQSa2npbE8k6OBuPwe8e1tG0/KX1DnZo87uH9JYdNPRm+hs2Y0oo3/SbxAthv7pjRSwjzOMOwOsyvhursXBT/cudkNM/+RL4Us6nY3n9EnI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com; spf=pass smtp.mailfrom=engicam.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=Nn4tvvEB; arc=none smtp.client-ip=62.149.156.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engicam.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="Nn4tvvEB"
Received: from engicam.com ([77.32.9.15])
	by Aruba Outgoing Smtp  with ESMTPSA
	id x7JrrIqgbiznzx7JtrXavm; Wed, 17 Apr 2024 17:35:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1713368134; bh=btSzp61lFqSy/rrndpY1GrjLTpySadYlhp3ifjw3jx4=;
	h=From:To:Subject:Date:MIME-Version;
	b=Nn4tvvEBF5/URnbqN45TJ7Jp450yrtZ4GvnnNCXcL+9VdJN9lwLOriqMSTK7dyrs+
	 ekK4AIsgICAkvtTGIthAR3X4svSmWPEDTmLXydefH8D2rXhUKftUk/0YaJZXVDCqQU
	 aV6+4PEA2KVMUQU4yzkhi19P4elz/yYgFQQH8Y3DFbh/SmTbPYMjQsp41KbFwV2XcN
	 CqRaFbDLZKkFlasT5khOdAf+r0voY7P4XemVhyE6qLPDYjm0DyNrIU3/VO86CBjQxZ
	 G7U9bn71QNJZ9hRh43KmgXsebhaGFqahR9AVdaBr2aYXiE0xHk3brIXO1X47vwwezc
	 86K8Oprf5wVfA==
From: Fabio Aiuto <fabio.aiuto@engicam.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabio.aiuto@engicam.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Mirko Ardinghi <mirko.ardinghi@engicam.com>
Subject: [PATCH 2/4] regulator: dt-bindings: pca9450: add pca9451a support
Date: Wed, 17 Apr 2024 17:35:26 +0200
Message-Id: <20240417153528.7838-3-fabio.aiuto@engicam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417153528.7838-1-fabio.aiuto@engicam.com>
References: <20240417153528.7838-1-fabio.aiuto@engicam.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPHpNf9H9SERmtitaNHB9NQEIB77Cn1Dk6XdhLlXrvBhpsZpNxS7w/TAP2obO0V7cmEHzEd2wsZf4yanWSq9rId0BsB7+Bp42L7STHg8pRjBbpAvtVLg
 XA8x5dzOT39I5z983olrFj5+fBh5a36PA+qNeE5x/usTtddk7pGLJmsxvC1/NsUvCDHVQNnsmjezzWboDSzselEXarfBpugIaAI+G62rLMqkaYL8RQTRdHLt
 Ssh959VMaWfESOVy15ajaAvMSTeTpHDLHQRJ2Sd/d3BAuy7/zy+v+vqY3yGS91BegehGxulPH64kTV+3lsS2mh+rv0AeE9mfNJopI+uuqhdHbS2NYeAFkhJG
 HaRbw9gSqB/L7ik4qIRTfVdkz3tO+w21u3LuFXNi3McQYq+LiAMOt9rAM7/fAoH/SdrMsMpj8pX7TYrnJznuyxgllQ0fPvE4S89J+Za4sOLQ6CFiSR7avmHL
 ay8YQ3afPeo0zYAApqtPxIHEgyPg8v1NiYCxDKXJCx4svCfASzCryZ6EqI1BZxKCkX3AkXzmK9UcaBzOrNquljwwnEUVztrXYxjqfWo1MfUMe9xKTm7ScTK8
 SQvo9SlqPVh+XXMNCmpxoOqW36Qkd2WkrV1foYCdF/khAA==

Update bindings for pca9451a support.

Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Mirko Ardinghi <mirko.ardinghi@engicam.com>
Signed-off-by: Fabio Aiuto <fabio.aiuto@engicam.com>
---
 .../devicetree/bindings/regulator/nxp,pca9450-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 3d469b8e9774..849bfa50bdba 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -28,6 +28,7 @@ properties:
       - nxp,pca9450a
       - nxp,pca9450b
       - nxp,pca9450c
+      - nxp,pca9451a
 
   reg:
     maxItems: 1
-- 
2.34.1

