Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73944B690
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429325; cv=none; b=fGl9HsHW+C+yDOWYzKYk7w0NWBvYx+jbTrO37I6VqJeD0qMUsMcpApILp8oO8rhYDyfKBTebtejthQ4CVaTKYyGjPTSUPKvMWyPAPPX+QDnHo8Pe8xzuuKOja6HJ2YK5S+P3kkePfrB+BOgYInxj9nbmX/5k1AzvUWyKuhC1uyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429325; c=relaxed/simple;
	bh=L+CLUo6CbJvVdEY+C3+udC16zWCDIDUTCSNKKOoqq0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdyUS66UlTh+w5yYRHlH4QQsycr5EeuN+U4xfLUgoAOlHeM2IuaaPyr5vA2p2T7tkVvQxUYKJphh8QzDOAe5u0KstzjPNjZuT8pVhscb9npxOJ3ZOQeVpU2s1AulH5NSm4Xaa8TSzZ4cpW43LNZ7lY69GkDb++f+d1bPK7Kk+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4GWj06x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4GWj06x"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1564339f8f.3
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429321; x=1786034121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=A4GWj06x/sqb4qoU7DPKOL5yf1C2mg2fULOtIOW4rQT+jgLUIT/IDQBsbi6BBA00yD
         dZ+qmBajqzGBvzOPjnVIFjSgIYkPb5sWW5xetgT1DP2BjCyc+1k2L34D9BiHvhejNnGT
         fy/XAFh2zWw1XTR+ZPuHTw4xKAoBz/32n0wv9EoaQ2ChT2CvbOz3kXsKBCI01n2SAbb+
         sKcEz+7WaAp57yQUNlMqoVcAAy+VigRU40IKZRwp0kxqwpDZ/iOihKJw4N7CrhB11ylL
         GEkssYeyeASKN4qdUZNy8z6mwDpQIBjKv6QXfjK6kLW8KlweTavqJGuEOv6DawSoHILp
         be8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429321; x=1786034121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=rmdEgmab7xHzC7Z43vz8/GdAsxQo2evjcM0xPI7c4Uipk8iNu6qGhJ6zJCAPbXtoKW
         RSjhwNATnanzsp74uyAnRUETzZSxHkZ9R6PgQ5fDYfVvLUem2bJ7xK1rGe5lHo5jSfOJ
         84Jg0wX77INcItqcFl94O4MR3YAzgrK23yBQtd0FLO/UzvDVv5zo7suaVLQ3hjWQGx6s
         hjOE/7lNGQdrKGjVVwrV+6bT1dca/8zw0d2anQXzvcx3lxBxQbGxtpPCZ4nmsh4YyQ48
         u1RdCLmzbLBBuMCS+XojDSQoOYwFNsdC/dQ8IudT8cryUa7cS/tZqp2HFGV0Q+xO4zCD
         6dow==
X-Forwarded-Encrypted: i=1; AHgh+Roa2F9m7MaiXsyhoLkF52JbEpatczteDUuw3P2mONMgkYAq2DKpaGTdt/9NYyZweqHIFXk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTp0JjpGO8rnfL+vYVNhNdkxtgTitPcKH2hCoAjjpTLGQ9BZym
	L+nZza8SQya6jK7SrZ4WqbsTsulu3mVlSYs8Ts9ZMpy66UXFtNTKZqr0
X-Gm-Gg: AR+sD13S9zKSgPv95F+/+FaACCTchDcpPX4U0BeEDAkSH+61+MG8a6ZF5qVxo3qC5PH
	nDGzMznDyYVTNiKj+TJDRTetLuoF/OpRpmTI0Ls3vfJYAx4dB2vb4hN/nnrMJcLv0Pb7JtCp0uw
	eRc1ujwYvalXGijo7dbDyUOQ7WYKw9jlBgi2nejWgaV6QJssoqN5aOnqXwXQ+rDAbXdfQsOF49B
	+IfhdT7vrjrDdTwwt7LtP2Wxben70Ml8pSJEc6+0qlkzvJZnJ3fU8twdEBgFforYkP3m39D+vBd
	90Y7GjwCiku1smgnAqe43Hovzco6yCBjJnvCCCYh2N5hzH6/DvrYK8trntQV3YpNqf9iLWXlSM5
	Kj90kaz3MOVjAdrSjpVmPlu4XUHat6YMhzEAE1nxcyUGDUJ6fau8C5PeptGUDZds5gJmg1++Q+V
	TVOXkgEhPHM43gwy0aMzRt+OhZbktQQc7+mvboxkbyYWHkCme1YXfsqNPUbpsd2sC+YNgtmox92
	5JwJ54Iyq+j5w==
X-Received: by 2002:a05:6000:1acb:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-47fc822eacfmr4812060f8f.4.1785429321557;
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Thu, 30 Jul 2026 09:34:09 -0700
Message-ID: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The carveout region names are derived based on the DT node names. Because
of this, the DT node names are ABI, which is not supposed to happen.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the software will have a way to build the
carveout region names without relying on the DT node names.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.53.0

