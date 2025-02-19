Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783241CAA99
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953128; cv=none; b=E+X6j+/g8znr6hwZwYWjQFHZvSiOyeCiGLr1CT67xOMxBS7lW2bsLY4c7erfsRKlvDmQeFepOuViFLIVZklWrz0YkyPEgvlqZ3TmeFga38t4G8Xzz6lJttXiShaPRlY85cPLpzfZaPkDxfNXHU7/EfIA/YuIaLf8nTSxloIYjms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953128; c=relaxed/simple;
	bh=QGDwY1x4W8QtR5yxKgHmCsEFYX3eeJHlwtwdFaWhWgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB8zZUe4fbiCNo77hvMijuNRe6/DqYVUGyPUozIFYTfBSt0vC7cCm+TcCZDTWiMtnYwi5rZNIT1I8ZsXRjPgAKMpAY4ix2wnN4JtcKSCHr6xXAvk4rSdbVvHarVm1wLrkRLL2EQ4RMRus29wmNtxyQJyL/WU9zlt9ayojYy9TK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=anO2nD9g; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GwRoyopz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="anO2nD9g";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GwRoyopz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953126; x=1771489126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sJCpfFuLYwpfyisJZD4BZNp2s874UbfEw6yfvZepqdE=;
  b=anO2nD9gH3MLBEXoGUf3bhBQR9tDBy41lp8wsdqRTJUkSoKKYkFUTMTa
   nl9NR8I8Sj8QHxZHYGhcxbTvOmr72kseYpSik2G4TkVqzDEU5B34bx+so
   AkLRFRvuJHYu61pSWvoxi/6/2YKhHglLRXQQqYVbwJ8tIhdeyJXeV4DHJ
   CQqQjG6FoB8n6idPNuiOxB2WZnyLnhNbrv0ilW29TqH9OvTcBaRkCuc1L
   +bZZrRFu1ZqgI83eDF6zKuL6rCcMwpVBgdcdva9c9sdI0UZrkcC8mmJ96
   tQTPvS3At5XulIccNURxP9gVUsP6JeK5uRRpc6qkjE1Lzk+23NKRiLwfE
   g==;
X-CSE-ConnectionGUID: PIkwYlt4RYWT1ITq5zOsOA==
X-CSE-MsgGUID: CtiBKZdITmql8A1axdGK5Q==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945182"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:45 +0100
X-CheckPoint: {67B593E5-38-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6D57F2DBFDF88598594366B5F97E1B52_1
X-Control-Analysis: str=0001.0A002119.67B593E6.0005,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE5C316D46F;
	Wed, 19 Feb 2025 09:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJCpfFuLYwpfyisJZD4BZNp2s874UbfEw6yfvZepqdE=;
	b=GwRoyopzItomM2TruwIv/TMEriySQ/CwUMzGt2NqsfLaBvVzNVKrQBP74VhmnqpCeQmiv7
	He/wg+RrMR7ig6zAv04r95MmET2/uVarahSHpmj9pmmUgmuTpZkFOhPkdgZgRS6RSaut8L
	I0h9BztWcpnd05oCdJuuQ2MktdPOBoxztlfLk+ZfUdi6wow2iUEH+vaMFPwhYQnX7k/zq8
	ql6cLIbmQGezhIrRtZ4sWi9Vl3zDibw52HZ1UHuEIcHgKY1GKEYQPKA25ytfHXR8Mww3cQ
	ivxQrieoWVtCQlPZRnG+1HniAhan/sulxI7sQ+EuXbZ8bPcGIIsV8PWKb8DlCg==
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
Subject: [PATCH 9/9] ARM: dts: tqma7: Add partitions subnode to spi-nor
Date: Wed, 19 Feb 2025 09:17:44 +0100
Message-ID: <20250219081748.1181507-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The bootloader adds MTD partitions in this subnode if present.
Add an empty partitions node which the bootloader will fill with
configured MTD partitions.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 618c3f68fbe25..2966a33bc528a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -266,6 +266,12 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		vcc-supply = <&vgen4_reg>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.43.0

