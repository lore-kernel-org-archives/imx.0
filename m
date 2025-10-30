Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36902DCF5B
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761854120; cv=none; b=GGkhSkl1zkoAA//U9lSHc9j6e6x7oZikLlps9XXWDCctRr5RGBgMGXVgTwyOLs6VmRJXw+HQo2lLZ8nVInIX+XwMc7lOs3SGvrnRDsqRQwAqo5FJg9WcU9vpfEgQkmAfxGb5C1juqRS+pCuonZdDeQh0eozhLAdhmtd1/0niDVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761854120; c=relaxed/simple;
	bh=1K65T+QRQPvRIGdXU/w+k/IIV/8h+Bu/VmkZtTAW9uM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NnHXgdcUfnQ0A4NqMqWrmz/418aMgTHjkoMDJlAz1CmA+RLM74fBSEqX2Gpo3lqIbPk2gIXlSYtBmoTIu6o8TNhGjInMduYvbTRb9sBdTn6YA0KXQCNYysY08o3YopbRenABzwse5II729UgD9IBUPs8qfo/qsK9SxN/RFBzodU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvCVD020239;
	Thu, 30 Oct 2025 19:57:12 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvCCN020235;
	Thu, 30 Oct 2025 19:57:12 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v6 6/6] ARM: dts: imx53: add imx53-qsrb PMIC power button
Date: Thu, 30 Oct 2025 19:56:54 +0000
Message-Id: <20251030195654.20142-7-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251030195654.20142-1-akurz@blala.de>
References: <20251030195654.20142-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the board hardware user guide IMX53RQSBRM-R.pdf, the
mc34708 pin PWRON1 is connected to a button "SW6"/"POWER", connecting
this line to GND.
Add support for the imx53-qsrb "POWER" button.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..2a6d28e9e8f8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -139,6 +139,18 @@ vgen2_reg: vgen2 {
 				regulator-always-on;
 			};
 		};
+
+		buttons {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			onkey@0 {
+				reg = <0>;
+				linux,code = <KEY_POWER>;
+				debounce-delay-ms = <30>;
+				active-low;
+				fsl,enable-reset;
+			};
+		};
 	};
 };
 
-- 
2.39.5

