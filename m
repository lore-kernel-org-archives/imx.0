Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54639487B0
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274720; cv=none; b=QUQ/pwca7s+uK2WFBo8sMn4X9J9a61H4ETYZrHepnoSgw+ZRjBPe6XUFRHN+52eg5zaZOJYOOvzwjX1JTJbzHXNQ6HuIuq/3kW8BgENnrKKm5NphdSZoKcSj7lGr8ZvWHFJOFfbAA3kl0S1rzDsUWdcZBqn0c3VvPGdNnpxJpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274720; c=relaxed/simple;
	bh=P6Q8H/nVfZxoli/QLkCamvYcqkoFGaMes991H56nXKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NbVBqRBGTfpyc/q9GuOlBupktFkmuB+Y9so+VWwA+bCGaClao1iMXrpMy5Jfjhm7ZClbgNXRV+2R8yDXIZVuWZOiw6oGOwE5SEJlh3zPJ6R/qi2yLQUNTs55OaI02vGyz+fkamFxeIvt6cJdDf1hNIFZRaFOV9/U+XsDSRFDNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=wnV5yGb8; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="wnV5yGb8"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BA5EF85B66;
	Wed, 25 Sep 2024 16:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727274712;
	bh=Lu4rvVtjeWbLqPkpe2uf4LN2PWTpI6uvoia3eK+/qII=;
	h=From:To:Cc:Subject:Date:From;
	b=wnV5yGb8IhjheI7hU3yaeiRng4byjGK6k5+smvKVFI+B1+42LfkkSoQz7gNU9fWeO
	 O0YrgaPxwBCnvb2PD4VxcIkZ0qF9JqZyMwJvMhy78PDzB5U5O7ranO4Fb1LSXcERiv
	 YLD3O3FoLZmzx4LgeQ8+GeeJ1MBsbbNwQakFSif3TCAQPvsPdPXNMel7JWlvdZZ04k
	 P8nN6mdJm/SvrtZfTw6CXnlTGLCeiFswKHstf/exJks4MHmea4u+Wle5dhL7Ozt08d
	 3deArbxt3GcBM2F8yW4uKpOysx+HHuunNuAHjiHPXvXHUz35GU67O1Rk7Sav+LMx+M
	 EnKciuilwzmAA==
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
Subject: [PATCH v7 1/2] dt-bindings: arm: Document the btt3 i.MX28 based board
Date: Wed, 25 Sep 2024 16:31:28 +0200
Message-Id: <20240925143129.4081815-1-lukma@denx.de>
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
index b39a7e031177..2b5c405d15ef 100644
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

