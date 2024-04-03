Received: from mail-108-mta118.mxroute.com (mail-108-mta118.mxroute.com [136.175.108.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300F149E18
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156879; cv=none; b=MiIaaxN8O+taGzBr+9tSlaj7ASANalylJUgeaXwJE3TG/N+auUuSRGYwM/hcnAh8exReAGcog42s5CbvRtWkaAb79NzsjG2ApAGeqRXJ4mBmEp485fHRdYTh6gEhTryIRZViHWtlsYvBgJfjaVOz8k8A2Y+Bkt7EE4qSDsBUcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156879; c=relaxed/simple;
	bh=l7ZJgU2OQZ8hIYhOK6BqKGPyRov+21qL9H0o+ttP/0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRd6bOHb3WDgMfU0zpWE8NIVVyL/pEmTLM80aT+hy/dWs3qiVKhZT7g1/WStf0ujbaQMeSyEBxg3B2N0O4gKVHJnx7+ol/1HKR3mjpcWqHm6bZY1kOHh3FG0DZgWoeTuctxUYHr3mf61Qn3gH1U4X+gSKmgEWnAcv/no/ItqA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=sLN+JxGH; arc=none smtp.client-ip=136.175.108.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="sLN+JxGH"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta118.mxroute.com (ZoneMTA) with ESMTPSA id 18ea4809a4f0003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:55 +0000
X-Zone-Loop: a8fc39f6ce78b93a4d5111df2463e10ca20f98c83ce9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tkOp5AZhPgUJMKkKNZfkvyskppT+Gp5qCGVEQtkqhtE=; b=sLN+JxGHH4IkDSuiuiqOtDzN7N
	TN50mgHlg+tyxehFX8J0iU3hBf5dxSsxkKcDN29daJvKZXf7I12Saq/c+pZ+9o0Fahy8fzFD+xEU3
	s+0H99mnZH1xhcSk+P9PFExtqaMA0XoNlAhhg0zSE7Nyq8sYZJeWFBugj19R4Xses59V5Z6bG2nfT
	Ct0DFY2CMkt/DT0Qb72ijCUK57wR+TIUAYgnRHP6QzKI0suB1xMMyEBGo0RXgjySE9PEOo79cToR6
	0d8msq8GRKEpWZLrBSp3UvvAMTo8CBYdB7DApHyXm2Et0a+C+QrdCnoEsHZhX5ZchCDgTG75Fi3dN
	I9xS/EHg==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 18/25] dt-bindings: media: imx258: Add alternate compatible strings
Date: Wed,  3 Apr 2024 09:03:47 -0600
Message-ID: <20240403150355.189229-19-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There are a number of variants of the imx258 modules that can not
be differentiated at runtime, so add compatible strings for the
PDAF variant.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 .../devicetree/bindings/media/i2c/sony,imx258.yaml       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index bee61a443b23..c978abc0cdb3 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -13,11 +13,16 @@ description: |-
   IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
   type stacked image sensor with a square pixel array of size 4208 x 3120. It
   is programmable through I2C interface.  Image data is sent through MIPI
-  CSI-2.
+  CSI-2. The sensor exists in two different models, a standard variant
+  (IMX258) and a variant with phase detection autofocus (IMX258-PDAF).
+  The camera module does not expose the model through registers, so the
+  exact model needs to be specified.
 
 properties:
   compatible:
-    const: sony,imx258
+    enum:
+      - sony,imx258
+      - sony,imx258-pdaf
 
   assigned-clocks: true
   assigned-clock-parents: true
-- 
2.42.0

