Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7D1DED4B
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379516; cv=none; b=p6c1vZrs9TXgYXrYm7YvVFWZ1ECjfLA190Aqokj0N5EFrVb9lXOVGr+nC5v8pGN19r50jHErM4pWYe1DGushnUDaKaJno2SKr8o97K1zS8a0kCOtPUf3ptggvFPqJOvDqKkJmHVY8mMbHI3mw4ZRzYHe47SETMk3R6ui1FDvCuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379516; c=relaxed/simple;
	bh=iamKg5+naQEt0ttfGMv21bS2aO7CH3fLetqVJgcwNOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gYL+xEWx5K+MPCCzP/kkwUW0fBzNeDaqxqx9Y9268oTKHKfdAUfX2s6ITUle5DAmDV1RiZTIlxqtTFvj5h/uG8Anjq4jO2ag4nYO99T3/pEBG+xQcXeWH18EwpeYKXx2iTWiQdSpe2p1JFY7zuo4jRUYVSDgfGx0a8lTp4AApkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=TKbgkwXp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cW9ibBma reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="TKbgkwXp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cW9ibBma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379514; x=1768915514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SeUU/CcKteCzk5JgAiW0vYeJCZs4uk8xMONzg4FEjlk=;
  b=TKbgkwXpety2opf5rS+NNjhESxhRFhcUypHiOAFp5g3IuoPrGr918dud
   Vii22Mmr5dgXkWW6l1i3ef2eH9xWphhqHlTobLyDMsgYqlPU28QGC6NCr
   H1xUO4jsJV258Ui/UJz4QdFJkgJGISoh5wQ9MJ0YyYECFm8kCD2Uc+Q8n
   FzrRyWdC1RkLRXTLYtw9/p4qrqcNBi4yCWdU7yZgCz9Q3AozFLA+ngSbr
   TCi63ksII5KxctRB/uUuFqyL4K1IMukTOoJ9TiQDSa2qbE2tAnTpdQeKp
   sY/cbjFBKi9tcdH8gIl+E7CG7lja3IWrJItBCsm6huVx9rm4ceBvaxUJ3
   A==;
X-CSE-ConnectionGUID: r6r3dsEWRAWv+EZTFPLoyw==
X-CSE-MsgGUID: ua6OEG7KTFaJba6J/fFTPg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177837"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:11 +0100
X-CheckPoint: {678E4EB6-1E-9B2B6168-EB6F31C5}
X-MAIL-CPID: C04F1E62FB708A570CD8B49F55B412AD_5
X-Control-Analysis: str=0001.0A682F1F.678E4EB7.008A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46A8816EF42;
	Mon, 20 Jan 2025 14:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SeUU/CcKteCzk5JgAiW0vYeJCZs4uk8xMONzg4FEjlk=;
	b=cW9ibBmaBKVsCdSYNj6/g+sSxif7ygs/R3unlvLpidfp1lzIV5YLiunDz5C3WsUqPGHoO0
	62ms8j6bDZpn8nRcMGrj5jak8k+97hIoGWuERtUcg+UpZMM0rNX62/YS5TjslTZIMeH0H2
	4mmk94Ub7WIRHyar8ZrmEg7KkrdIkyXv16EaMK2MHicPiqgTzKbtfMRjeEAsOmluvcIWrA
	b1ULVTJYGZQacIGSThBEaS3MteuWNrYje8MlkJ0SFJbBKVq8h8htU7aAMt+od7rCZBTr53
	27pagVGZcB65tbS4V0yhKjvSmFH0WjYYIWHKWkLRmsa5XTGZ29Qo34IgPE9Z3A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/5] arm: dts: imx6qdl-mba6: change sound card model name
Date: Mon, 20 Jan 2025 14:24:58 +0100
Message-Id: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.

Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
use the same codec with the same routing on board it is a good idea to
use the same mode name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index 8ba3ec27bee07..7b2bad5f2f0ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -124,7 +124,7 @@ sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_audmux>;
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&ssi1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-asrc = <&asrc>;
-- 
2.34.1

