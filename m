Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91ED1C2BD
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717869910; cv=none; b=s5RVqVXOycZaoFCuxdyoniozfCThz0/cFq8wOSSYOObj74pn8YiYxiVbpBHCW2zKtNCcerkJjn5SIltYlLOkRF4d1Lv35aTqTg+BHBeRRi6IKNo0doUK24MBANVVKyvPUId7CWaGUFpe+LsxCmLYKsUR/pbtxJOLEPce1iEm6Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717869910; c=relaxed/simple;
	bh=hVJZk1PRuniyzRk9IeTmSUpJs0oQ+ZbEKi2d9LVRtsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coSdpAIeNs6bYPhYtzSfOr1n/6DHHqrRuJIYC4QGU6Rhb9loBWm81d7u2CeIut9kL9bIW7qnaFShX1f//xahtFhPKsj61vu2gR95FPzibeTNSHNZEy3aDVSs5oCaQr87tEoOs2Vn+OUJb3WPAr/JwCka8EhitrS3zlHm9/ptYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SEJ6zUBv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SEJ6zUBv"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83057293D;
	Sat,  8 Jun 2024 20:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717869896;
	bh=hVJZk1PRuniyzRk9IeTmSUpJs0oQ+ZbEKi2d9LVRtsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEJ6zUBvJy16B4rzBsw4ITLJ6RX8pRJxMXZU88Y+AiefMyGSmAaGfkWFPqkO7yHz5
	 iuuotgKBMsj2VlN5AYtxEHU9lWmi1FQduhyd+00TD/svHOhxLlYkUi127ane5x0zF5
	 nBWtaMFPFf9KO4fZxQ/ogI+6u5dSQylKNv4QChPw=
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
	Harshesh Valera <harshesh.v@variscite.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 1/4] dt-bindings: arm: fsl: Add Variscite DT8MCustomBoard with DART MX8M-PLUS
Date: Sat,  8 Jun 2024 21:04:44 +0300
Message-ID: <20240608180447.31378-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
References: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6d185d09cb6a..4fd0a158a6f5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1149,6 +1149,12 @@ properties:
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

