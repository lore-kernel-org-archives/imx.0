Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BC1E0DD6
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379519; cv=none; b=YcDgZabMcClL6s5/N4oF2mRkdohK69o4fE/nBpKMarRrex92vJOm9mJe9YasXOFjHvnZvdeHYNClM93m33c9w/2Dw5IRpmP+Z0SWYQOcqkCngVwF8Xf+8elt4SZsVa3U0908RQfgWA5iiz1x4UuM7Gw/8DXMFmBGBUHh9Age//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379519; c=relaxed/simple;
	bh=n1qwl7C0ByvsQlnPhHFTb9SInGSndT0GZ9wp9tDDH1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J3cQwaOFgWzmFbLck6cL0dAElnJcndETX8R2hJ0iA0mGgyvXbnWaZuAs5glITIZTD8NJ/A5E4gMURTwIza7JyJYyHfQ32CitinP8nVTQAsUb4UCD1zkKM9Y3QvAzpHvtHPpdlZob8orma3iRs2r9aiGU3S1o8oyiTaYERVNdyTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=jBmluDth; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R/vecpW2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="jBmluDth";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R/vecpW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379517; x=1768915517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=62kg7EpBQjINxHjvuuwUC/l4ka3K2AOXJOa+OBonMKw=;
  b=jBmluDth/Rjc9mDE9Y4SD5uYbVfh0gbqIDua1FGr4D1zWOjIyzTTvnPM
   EtOz/Ygr+B2/b+XVlRv4Z6TrbH7FBFlDMG7CLH1S0K4G6+3LrNGdTVtwr
   WzjtLN6sU5GO0WNpEXMfZMqEmdFJqpboEwSX6Wr2rGyWVfE0+U91P/pQz
   fvS90P71nQ+oXVNTQWExDbEdZIbxwbKYqEBtZWlU4vYI8HZEp3nrARVOm
   dc0UonGsxCdrSPcxAMU5X515uI+f/VJkzb4NYM3QxwMUpjvU2ndYhWWaH
   bng3bUBOppW1vAIuKJbasMJH69456IvwBbilbHeR3J+cqQlmrR35B9nwz
   g==;
X-CSE-ConnectionGUID: vJKdMvUmQZ+I1OIzU1z5+w==
X-CSE-MsgGUID: tNHpwoO0QrqNYrhfcuCJXg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177840"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:16 +0100
X-CheckPoint: {678E4EBC-E-31397509-E321C4C4}
X-MAIL-CPID: 20ECB963B1329CA933C8A2EE1026F022_0
X-Control-Analysis: str=0001.0A682F1F.678E4EBC.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EAE4161460;
	Mon, 20 Jan 2025 14:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62kg7EpBQjINxHjvuuwUC/l4ka3K2AOXJOa+OBonMKw=;
	b=R/vecpW2z8/EyRmq+gjB7rIc72cV0QLajZMZjAv9QfaL9/JKTzkyM4jUtiKHSgwYE1YkZe
	8KvF33mRpc6Axyxy4Hk/VzimE/hb4QbDDXgQKF9sHHCLDMqFv5kaVHgq6oTZDwKKWBH/nB
	CqbcoSCYSem30EDt8sLKaYB/16PWxNB/9CddKXCbR/e9gJ/Lp369aJnT0YTxvJQYz5D3Lh
	E4PvJi9sA/m78+PLJyx8DlU4+yKaLyzuHLNo3PTqT93mpwz8AYgt4k1lTlyM2XQVt27dTG
	/QuGNRy9Paz84Gzpp7FuBSHWWdwd2kBE2T1y+yomO1CTObEVdr92Xsl+WaBLvg==
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
Subject: [PATCH 2/5] arm: dts: imx7-mba7: change sound card model name
Date: Mon, 20 Jan 2025 14:24:59 +0100
Message-Id: <20250120132503.556547-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
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
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 98956d78c9a18..954739f82d86b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -238,7 +238,7 @@ reg_audio_3v3: regulator-audio-3v3 {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-routing =
-- 
2.34.1

