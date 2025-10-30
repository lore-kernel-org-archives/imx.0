Received: from mx-relay13-hz2.antispameurope.com (mx-relay13-hz2.antispameurope.com [83.246.65.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29B226CF0
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832447; cv=pass; b=btzCJkCkqbO+kSmnrEPY+3n8Xg1oqeHD035uzjO5xd3QAHyiLh/kDuy482khAkKxcgKAgQRblbKrxgBbPieNYRBhQNvyMDisAjDKJxbYWIKcfpwIHW1grwTZGRcPiFAVrUUptQ2C5BUsrmEGgly/3XMrACRfSSIKNooRA0HORWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832447; c=relaxed/simple;
	bh=+sePMg1ADt1lzpdhzp3d8sszHWrpZkkDSdH4qWD+amU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGbDB+XxJQLEtyLN3NlcJCGONFr0TNLeZDCn4CYA5TIowxjB2LErBG5gZHccKZlfOY/QBnfGsI6ve97kn98yyMb8QfqrKx1WBxgYaoO7t5WfbhwKry9uA+o3UzYojhRL3YINnQhIuxdbVd2JKuBYC6XqyFZ3IZccdQafMQ69Z4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DC3O+7Vk; arc=pass smtp.client-ip=83.246.65.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DC3O+7Vk"
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Q/J0eJNHpyNTzgYF4P4yNw/ejnkLZX/hDBoKw5OjID4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832421;
 b=n2J3BuC4RsO//2qVq2D2xLS4T3FzWRuNKfOHVXrDxEcIaMXCM7m3LP2k9+5ZSkA9cpYy4yQn
 9oRQ0SlMzly08p+2SQFS3zKK2RpICxprODTAWkZ7adF+gO6zqbIEpnh1XH0cdsU9oUEsf2osD1r
 0nPXBrmtfbLnkuaMPuCP9RDyH3XDRC4lrJConARdMBl93S1SAV1Ym2LjX0d2TC+oBT19Y/u4HUW
 APW8sPNWaF6Q1faUofT8hUNNVQOTzs+RkIpJchwYAG7lfxEw8+6DlaVrK/bDqgyY4PU3Cj8sAzX
 TzAgxpyYUqgzamfiFAxsFd4O34yM378vB0QT7+QXHwWTA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832421;
 b=femBs16zjYgoZo7tPE0CEvwFXb8scviw4DeABfgaSDCwMRM6XB434fXrEYaxddPdv2A0ospL
 Ixuxrd/gJfulrDEVXC06CHR+AJrnM8Z5VK193bsiV04viA31W4Dbo0BsDj+ZsS1sYGILGBTIdUc
 V2VJUt+5xLiRp4GagN2gfri+chMG/ayoJAKvhgX3QGxq5RLUhUPm8jh9Fo04nwEzTfSjpGDdVnk
 c4rLbhOab6f+5koo9iwdynDLUbjAb6PrESLVOJNuMsMCMqLI/7hOj6V1iRCLJbDZs3XxvlvIzjB
 A46GfiF5JsmEMbeROmVV+HI1Nx5/mhQ8e65cZrlvyUvpQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:40 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 108875A0B13;
	Thu, 30 Oct 2025 14:53:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
Date: Thu, 30 Oct 2025 14:53:00 +0100
Message-ID: <20251030135306.1421154-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4cy5DV6fJtz3svlF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:813d6957f8f6d1a248c870b46880b697
X-cloud-security:scantime:1.840
DKIM-Signature: a=rsa-sha256;
 bh=Q/J0eJNHpyNTzgYF4P4yNw/ejnkLZX/hDBoKw5OjID4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832420; v=1;
 b=DC3O+7VkVJXq1GF6slXsnXBf5TIm4jnNxnERA66WCtirtt4iF8cEVWYqyDDVRDB9LHWZQwbh
 cqegopdcAnj/JabRsCq1IVSmD5GeVrCkgFfhgF76B6WIMmrHTec07Ztzc9rgXZ6ZgmuLd4yR4iH
 uihhA+OP9isibAJMT1cVyTYeJyDocQ1ylXxvWehjszhS0hohQe2CayH6Y3J6pu5KKR8E9VN2z9I
 5mq09mSJGCO8+3SQJR++aGT3v2al5Ew37PDlx6cDrjJH7NnTIRpud0Hz3TvL4dDiTVlbToPUlCg
 Gm6RA8ec6lxnhS8aDx+LVgvMctcVMXz1DGSASyZ73lODw==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Remove empty line, no functional changes.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 15d117d785445..d3a9360b8c548 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -259,7 +259,6 @@ &usb2 {
 	status = "okay";
 };
 
-
 /* X16 */
 &usdhc2 {
 	no-mmc;
-- 
2.43.0

