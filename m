Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA43EE1F7;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881236; cv=none; b=FOfnybRzDR2xvGlPMVunKU74P5lBdEnhOC3gRPFFVNwYXUNfZDu21g4f99vrq2+rNp9kpsHuByCCCQ6vsuhH3zkpEivG9wQg8EmFhTCZff14glmz3+v/NF7E7Ujc4y256J1oiIn8u9tnMoDlcnG73KRbfE+frnGvld1290yIlSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881236; c=relaxed/simple;
	bh=ZnohZHnn2hcuxWohpCh3aH0JBTFgOo0GebNJ+3Wz/xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R79OTzWZ4fRza58ghXEcUUeHV0I0EfNZv7JGlhqaWq1SAL0Inu9fcz4uwOn8O4DPq7cEemJLhBgtqYaqU4n6pk3b7jgqhhY/7L1LCRHdhEj6YM9F+IG16/UTjWsgerQfkvCkxwZdoj7vwarFgXVjLVpkgcj6VTgEoWDpKT6rs+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssWBnfUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssWBnfUR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F6FFC2BCB3;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=ZnohZHnn2hcuxWohpCh3aH0JBTFgOo0GebNJ+3Wz/xc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ssWBnfURxcDPGQzhB58IHB82FIoVqBVeXDMVbWV5qpw//tPVYQ9U8Yhxk5G7aUXM0
	 Q2llKsAKxFSeTbQ8SxTlsbdb1keW8OkZtWaN4Q/dIvBqHWRQDomUMm+A5HSI8wWy0P
	 Wi7fE8x/U1sR3Yl5Adj5XoA+d+qYw31lTwYHno/212la5Qs8q493xseV6/4EFeadok
	 rE799YFrPFki1Y299TT+cfdVfq96mc/S+3OBWpqx/VPtOOj3N73woKkAY2kbMVwk0v
	 H8ctXqx58R43DhriZjPdcni/yjGg9bZtLsJr3R3I/ddSkQNj2U1pVTw0k/7Xp0g7fx
	 gWeFqNAOC02nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476DACD343F;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:35 -0400
Subject: [PATCH 4/6] ARM: dts: imx6qdl-tx6: remove undocumented
 karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-4-b06bff192a05@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=1447;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VqQTiqkhk2bfCYwJMM5wAbMlco3U6+HIbHdkhOxXS8s=;
 b=wOo+Lc+o1+htwVd6+ls5OBNoG3brE6l7hGEvVgNuJ5QVZokIlC4m0jCGB11ULL2G9Y041b34K
 3Gc/YWL8rQDDn2LCwrDgtDKS5jKZVbdjgWVkqt+IbOPQU5R1aLUJTOQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Remove the undocumented and unused compatible karo,imx6qdl-tx6-sgtl5000 and
retain only the generic simple-audio-card sound configuration.

The karo,imx6qdl-tx6-sgtl5000 compatible is not documented and is not
referenced by any in-kernel driver. The audio setup is already fully
described using simple-audio-card, which is the standard and supported
binding for this hardware configuration.

No known users (such as uboot) rely on karo,imx6qdl-tx6-sgtl5000.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index 57297d6521cf09f1fd629ae375c9994ebb683375..ec1528ff3ea0146157a56f2ecba500e651f857ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -148,8 +148,7 @@ reg_usbotg_vbus: regulator-usbotg-vbus {
 	};
 
 	sound {
-		compatible = "karo,imx6qdl-tx6-sgtl5000",
-			     "simple-audio-card";
+		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx6qdl-tx6-sgtl5000-audio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_audmux>;

-- 
2.43.0


