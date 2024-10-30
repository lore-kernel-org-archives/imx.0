Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F651EF098
	for <imx@lists.linux.dev>; Wed, 30 Oct 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282169; cv=none; b=Z74ha8GBHEwmx8vqjQegvhlmRVuSxoNQYowFPbbgXIqEvlhrqNrdmKP62CWn/sqC+aCvYm56EC+bA6Qnfw3e/VBJ+oxB6cWV5Q+oeAXApFXP5RZZ1LqXpx+ohNrxZH/MK5OyIXMhKPRpLXzQ69QsUjBRvFgjMy1A2XmDI5DEQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282169; c=relaxed/simple;
	bh=99fzVsgguHDqwVji99RP999dNaQOQkCqoH4a8e3boJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VeV4TRJUbs171geDPlkzq5RhJaAkI8OLWIOovYQAwqW0CWvh7yVW0it1xP/z9Jp9wOEBm7rPDGk6uam5zcEOyzyFSj/7GceANstEeVVSS1tGTJ+xGqjUvuIfrpaSpHgo6v1vZ8KxKS5wp00ypCE4R25WKutjXfo/ygDsNeU1Dzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=o99xrL23; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FL+xN7ua reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="o99xrL23";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FL+xN7ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730282166; x=1761818166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aPtpCx0bE2hy6c7hMOkAIGp+0vvTAehcVRieP5LmqI8=;
  b=o99xrL23GwIGjbsMnkEkbBErXOB1OUanIqhSJ+mI1P1nUGR7X7bSmzer
   t0MNx5Y/ELd9kL/G+66TqcPFixBJVyLbHM/kd6y5Xqxy4SGskm8VAl/fD
   pBqdwxTIC3WYWyvjmyZcO0vG55Klofbtl/tJg+tj9QwVAeSV2bwz0sJzP
   oW9Yj95a1lpKFmlpxQPP4n3eYtWtRqQu/xj6q4aZkWvdQcMgrYiayBi5z
   Y3isjoAby1gfK+ADEnMCy6NN3Thy8VrVhpvD+vaI9DMS4jEbeqTGKmIr+
   S1WlX+LrGH6E852WbQ1FtQu5DPoEww8ASoCYnftWyXimpjXlqluNj2UU4
   A==;
X-CSE-ConnectionGUID: ++MbzpPnSeOwLv5XgpMU0Q==
X-CSE-MsgGUID: ceWgtWl6R8uurZ1eb3nwlA==
X-IronPort-AV: E=Sophos;i="6.11,244,1725314400"; 
   d="scan'208";a="39758789"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Oct 2024 10:56:03 +0100
X-CheckPoint: {672202B3-21-86C05612-CA75E1CA}
X-MAIL-CPID: F7C9B31834748EFB307F69D08630B802_1
X-Control-Analysis: str=0001.0A682F19.672202B3.00D8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C6D2169508;
	Wed, 30 Oct 2024 10:55:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730282159; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aPtpCx0bE2hy6c7hMOkAIGp+0vvTAehcVRieP5LmqI8=;
	b=FL+xN7uakK0lwhfmfYEmgnm79qVIEe08IZeA/9o7k4L9nOZ2LuBWdvmYIr+Pwpi3v8ZJoE
	FCpaK7pMsnfZzG2u5dr8mWtTPVyZKcVgMvSkbVdYtgt063F0PRR3lp7JjXd2n8S2zuVqu5
	jADVNxELm6HzE85MkRWcM2ftexeEltH6gSXFxHBYIJtwfoNwlRlQzKrSTbRgU5P8l7E55v
	8annQqSHQxd3sIROAwyC43tTWJL+38I5WdbHss1AwxsrFMol6+azZuwTeWmKeWGePznDYu
	vRw1cxOfO8+SXt99P0I4MXZGx+PkcJcMoEMom+1tQFfwVLQQwqq2VKWwo9Yc5Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2 resend] arm64: dts: imx95: Add missing vendor string to SCMI property
Date: Wed, 30 Oct 2024 10:55:51 +0100
Message-Id: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With commit 7bf46ec090b9e ("dt-bindings: firmware: arm,scmi: Add missing
vendor string") this property has 'arm' vendor prefix. Fix the property
name accordingly.

Fixes: 61ed94cd54e3 ("arm64: dts: imx95: set max-rx-timeout-ms")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Sorry, there was a mistake while sending the first batch, so patch 1/2
was missing.

 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 62bb526ba507b..d10f62eacfe08 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -313,7 +313,7 @@ scmi {
 			shmem = <&scmi_buf0>, <&scmi_buf1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			max-rx-timeout-ms = <5000>;
+			arm,max-rx-timeout-ms = <5000>;
 
 			scmi_devpd: protocol@11 {
 				reg = <0x11>;
-- 
2.34.1

