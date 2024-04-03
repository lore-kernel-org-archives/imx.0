Received: from mail-108-mta61.mxroute.com (mail-108-mta61.mxroute.com [136.175.108.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB0149E1C
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156895; cv=none; b=LYYXEVjEM895o68/oxNCyhUIihRTBgKx2kswVqerIu+p9DXzuDsrHegZ8cD4JwXUFJnu/J+Vkjf4WvgAZPtNJwUYCEoqh6DUgHbTmzS0tta/UkbwZRt9k3G6xfgpEtpT2u7UexTdywZ54p6P9+yqam9EGopP1mNRUMRSzdRBh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156895; c=relaxed/simple;
	bh=wIpVOMNTepZOMW3UvbZH0rdRDmA+UQLMgr2GlfwRQGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7HAenyrbGTqTHWURPjvYaCbWd+H1ZuXm9mvvBLC7r4ud9zx8eOtYhoobp3wGaFEKwUFtvo3W3TZF7F5QpuBSEgIahs4welyA7pz4X9E4cKDS9TVY5PWdggCEtsU7Dbq+Mxxxvel9ucv0MtcAz1Cnzy6w39J/rQjwyE9iiJMfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=kA1ORBz6; arc=none smtp.client-ip=136.175.108.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="kA1ORBz6"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta61.mxroute.com (ZoneMTA) with ESMTPSA id 18ea480b8510003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:08:03 +0000
X-Zone-Loop: e18c5eae89f5487d601522b52a2c1fd0102e6cf19475
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+hno/NO5DLefJIOqoOH2kmnTpizyU8GDGwSxBdTiTxg=; b=kA1ORBz6pfHHAqSDL9oc6Bnp9o
	ektfpP8ACACEUehYTzqVKk5hoQ5s2j+4+K9osj+aBbYHGNfnAYZo+3MK9DoiyCBNDbXEp5GtFkM0f
	Iz/dgW5juy0V3OvJfzkwOriPQLHG5GazMSMcoJuxmsKrNoje3ChMBqlPerDNYhAGzIfDgyOE6iNyP
	3H3wvWhKEQ8LMQK3/P5dZLaoD48ZaKkJ4rmpMGd+xq+3AwCPylLEhaBAuKgN6UnAwtF1a95NoBhNx
	aXkhC+1upEF8WKoydrMT2JHjeLPYpepESAYT0tK/FOmAWM61zQjAj6XojaitK9ktHXMlYld53wAnf
	OmGrZV4A==;
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
	Luis Garcia <git@luigi311.com>,
	Ondrej Jirman <megi@xff.cz>
Subject: [PATCH v3 22/25] dt-bindings: media: imx258: Add binding for powerdown-gpio
Date: Wed,  3 Apr 2024 09:03:51 -0600
Message-ID: <20240403150355.189229-23-git@luigi311.com>
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

From: Luis Garcia <git@luigi311.com>

Add powerdown-gpio binding as it is required for some boards

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb3..33338139e6e8 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -36,6 +36,10 @@ properties:
   reg:
     maxItems: 1
 
+  powerdown-gpios:
+    description:
+      Reference to the GPIO connected to the PWDN pin, if any.
+
   reset-gpios:
     description: |-
       Reference to the GPIO connected to the XCLR pin, if any.
-- 
2.42.0

