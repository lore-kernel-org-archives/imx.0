Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EF3EDE7D;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881236; cv=none; b=tAbWS+PKEax85RokqEYoYHHwlUQo1moQhA+a3WZRX7azurL3cEMA+Wvc7oRKINftnFdvec1HLLEK1rWpO+OjwKO0o7pGu1Lk+AZSpYf2v4v+WqwGiW90cJ6eUpLIZ4wf1rwb2Z4eY+jKY3JPedQ550m+6Cu97t1ZaJE8Cc96Oas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881236; c=relaxed/simple;
	bh=iHR42uvynaw9Y8gIAY8rdBOv8ZX9fIc9NWtVHx2Zq3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7+Tdp5lVyTdCDxAC8BjtVe5i3buEu4qOCE+GJyx0sbRxpapqN4usKp7HeQXMe+FoNT847QrsaKsSeHRmP3NCrJ3Pq6god6MaSxWxBeK9m31iEyGbGcKm9AyYArU2i84CwYd9oWjJKoP6Xw2alp0r7sB1GejecRqSSn9+pCncfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPiZRLZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPiZRLZC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D21DC2BCFA;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=iHR42uvynaw9Y8gIAY8rdBOv8ZX9fIc9NWtVHx2Zq3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VPiZRLZCz5TXnuoSJO7dQLfx0FU/jV4n0/EpWtp1wUhbxOOCgIBpqW0sA+wYH2Bgd
	 IIONWjr4TRaL50sa0SC8JOfy0azol6a0EKbYtW7Yt02Uz0+CHC36YYazZrJpDCOv4H
	 W9IPYGQ71WUW7/f6D3u2H/3hbAqMpcVOy2XnXZg7QkKvdqprSTSXJorQXAwgmPcr6v
	 D0Zks8u4Ze3JaPJFjw1CMD/pWhn4SOMcduXdqLElaikmwIR3XcUq0YQJKkggvqIsWg
	 TAS43jv9TKoTdo2USsbat0T8uUcYIuZ4sc9VRNnOwLSPXtmtRjVNSumenckSC1WoLD
	 4OZqgDEjz+KrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355D9CD4F3C;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:34 -0400
Subject: [PATCH 3/6] ARM: dts: imx: Add bus-type for ov5642/ov5640
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-3-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=1774;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HGMs+AFWVIG/7Db0qb4OWvzhAHmrd9vKYw4rG4RNH/M=;
 b=BrOivWXgIRm6WZZQFShvH95LUpQF7Ss1xcHT4UfO/710V+1sIlkj1h/Wd+IZPa2kE/HFX76hq
 udFGBEuy6jEB5qPuPvkaMk0/k8QHcioEeOjEOLfl+n3gl4ScLOt0j3x
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add bus-type (MEDIA_BUS_TYPE_PARALLEL) for ov5642/ov5640. i.MX53 and
i.MX6UL only supports parallel csi interface. Fix below CHECK_DTBS
warnings:
  arm/boot/dts/nxp/imx/imx53-smd.dtb: ov5642@3c (ovti,ov5642): port:endpoint: 'bus-type' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts         | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index a1e19f9709b2c7c7d02812f2b5c2afd382fb5d86..8c02731c7ba9db794627e085feb8a4e957d8c5c3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include "imx53.dtsi"
 
 / {
@@ -314,6 +315,7 @@ camera: ov5642@3c {
 		port {
 			ov5642_to_ipu_csi0: endpoint {
 				remote-endpoint = <&ipu_csi0_from_parallel_sensor>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				hsync-active = <1>;
 				vsync-active = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index 3d147b160ecf150f2f3b6afa8b5873fabc2ba96f..32afe4130e21126bf6e476db1091c4a45b8cf5bc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -217,6 +217,7 @@ camera@3c {
 		port {
 			ov5640_to_parallel: endpoint {
 				remote-endpoint = <&parallel_from_ov5640>;
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 				bus-width = <8>;
 				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;

-- 
2.43.0


