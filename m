Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84465B
	for <imx@lists.linux.dev>; Sun, 19 Feb 2023 03:11:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90FBA92A;
	Sun, 19 Feb 2023 04:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1676776290;
	bh=X0lLUInyPkKpHOsyCncJoPlX1g8/5aikh+d1ToQIWFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2CY/wuOzp8IWp0EKYP7C6hegzV84reJK0EzcJ7sJ69KRtrrtJbmz6FCzgYStBORK
	 zJpkZkZ61Z7g5n83rE4LnJATmfMTecIv6MfKZgYFpNoxwFvZE4rUvImOMiYF1t8hfo
	 8WiL7nRQwE1ttFAhMGiqD6Q3QlmbHdrHfxMEqZ9Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>
Subject: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Variscite DT8MCustomBoard with DART MX8M-PLUS
Date: Sun, 19 Feb 2023 05:11:23 +0200
Message-Id: <20230219031126.19372-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230219031126.19372-1-laurent.pinchart@ideasonboard.com>
References: <20230219031126.19372-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT8MCustomBoard is a carrier board from Variscite compatible with
the family ox i.MX8M DART modules (i.MX8MM, i.MX8MN and i.MX8MP). Add an
entry for the DT8MCustomBoard v2 mounted with a DART MX8M-PLUS module.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 05b5276a0e14..d62c5643e78f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -990,6 +990,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql       # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DT8MCustomBoard with DART i.MX8MP module
+        items:
+          - const: variscite,dart-mx8mp-dt8mcustomboard-v2 # Variscite DART-MX8M-PLUS on DT8MCustomBoard 2.x
+          - const: variscite,dart-mx8mp                    # Variscite i.MX8MP DART-MX8M-PLUS module
+          - const: fsl,imx8mp
+
       - description: i.MX8MQ based Boards
         items:
           - enum:
-- 
Regards,

Laurent Pinchart

