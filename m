Received: from mx-relay139-hz1.antispameurope.com (mx-relay139-hz1.antispameurope.com [94.100.133.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268E2E7F3E
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.185
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277646; cv=pass; b=dSnlMV0ENeNjBNA0ahyOzKDmPBy1KyJ1B6ahX+BHN/ISStbdUpNLsxXhpI6CN3DTmvCyUsxwUCBbiBbKi5dfkbSIGgJvTxYFoGSz8izeVpebvpEboV9Vi5Bq/jgAiFyfQg+MbgZOyynbbcwCfISNTqqSW3ULewEFelnJt8MwB3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277646; c=relaxed/simple;
	bh=JFUWcdpEGbTltfBwlAPAUn1P1VLeYsooLhnf4XEIOgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa8lLFTlSBvXkRZHLXCqxs5CdJ+bS0/xA1ZzzAXiN4vHuTlc/zvMn+x052BomETDNZi2HpRySSDpwWh+qtz5DaUOhOOOxXFaQYxe6XAblzwyl5eA43drz6Lau4+Q7+HFcLS38lHfR7ErBhwQKykfpNXHejwFodZ+6aBGAn7dwpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qpFfTRgd; arc=pass smtp.client-ip=94.100.133.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qpFfTRgd"
ARC-Authentication-Results: i=1; mx-gate139-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8IED3rJ3zsfdXQmpcDwAq+hG+sXvjgA7/waaA9T5c3Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277615;
 b=cCwexNwfdSx4O6yK3RWQi6JvrPxHJXkULWNcTtdHeFkzZMBOB2bOdz0KTTSQvp4LabeUlTFD
 72fw38IK/BT3Z+jF+lCdwIfbkwvKBHjeOXFfzG3IAa4bdVq3Ct4RL/V0LZIOqjsHWNsxMqGowrC
 NoCNDvmQ0RYh3PybRpth+8q8MWISxlY8fPyydI1Bd7scXDY16HFdWbyRHRcxGEX4VOov4Xwy7Rm
 sjiEXAjK2w3204Tv5LycgGGJL9CaAHPpKcmaz7mSFFz4MPMTsLBiy0JDdi6cNXzyg6UI7Jc0Gnm
 YqCd3JFrG7GEMlljlxnnDZu70NHS1G64WTW8OXkF6PkRw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277615;
 b=ohkS/v3XV2JEvcM5sca6T9Tru+QYbnszBjDeY+gfD9lZ8wmq+1tgzFvPUMVAWqyxktB/3LdT
 mgMsHypPba+wDMMg2ETfhkD0EVolju24+dkqZ6+wWO7wI4XtPWsSqZ9kTQ4r+FpdrXrYJRt4r5e
 8wpnH8pFDq6uJ/WemITROxA/w3Q9tNJ5+MPEffP70ChwBD+sDyguVv9e1QlGZdr0gNJe0PuE4AG
 GdMIYUtLw+/xcBfo/6OoRVxmXhCtQYnd/dpavrO6qlL993Zieeo182MYJHiG+mzg4C4QZniGRES
 NsDMtKNGqlDafNjK0N9CTz0ZyXKz/BRz4zPipNt1UlCWA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay139-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 12EF5CC0CB7;
	Tue,  9 Dec 2025 11:53:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 2/8] arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
Date: Tue,  9 Dec 2025 11:53:08 +0100
Message-ID: <20251209105318.977102-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay139-hz1.antispameurope.com with 4dQbLC5gtczNwGg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:a09f991505044410bd11d1a9cce7d8b4
X-cloud-security:scantime:2.263
DKIM-Signature: a=rsa-sha256;
 bh=8IED3rJ3zsfdXQmpcDwAq+hG+sXvjgA7/waaA9T5c3Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277614; v=1;
 b=qpFfTRgdSLrVjEFzzQBHiOLRmfjwG/8sQY0elhwytXhgKGhAkrQ1CfCRih7p9j3knaw4uLuv
 VeszQqro+uExsLenDbRPR7jJ/uYB7HHtSXP+ERgTg/WA0K1SRz3rg28LuWRWYvii/7W7AH5PyqJ
 EJZKgIOpjDl12rukIed4kJRuDpRSWmbdVdWC0cYQNWg7wr6T9ji99+JAOFwc+hj/V3ie9B6a43Y
 0vNbx13zK65uaclf8yScSa5K3kD7PuAIBZOMIFzQuC95IdiYicKCmD4WnZlHd3WVxxVHn+kXL6n
 MaTpmh2qyFoyyiA+sBlpPzCpNnC7U3crA0cYa2bHzLVAg==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 0605cf2faf83b..ff2bacf24bfd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -345,7 +345,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -375,7 +375,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.43.0

