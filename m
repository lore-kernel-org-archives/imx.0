Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0D178CE8
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847626; cv=none; b=MKvv1oF24jC6nAisjIHr9KDta8fjY7bxU3uEBPZMcWQUOQcZ821mdry15iTdbkk9BS0QqyLidjyDhgJbqCUUzPBW4atWNaEwquJE2Z2l8AVGz2jZw4HCRthIy4RI4W7oYUPIKvFmNdCaFeIFUglaN3guzu+eNQLIO3WSNfPBIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847626; c=relaxed/simple;
	bh=HmmEEohqwVh1fUXRO/GiYgvsTjyfON6GZYh7OoQhvrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fq+FnyzZ7BubCyFjOMkEcJzcKOggr8ieAELrnSldm3W3drYY+j8/dxNh/fNuyAZ4YvDAtaZUbTRxoQcjJp4rHkPW5JhK9iidUa+SDtDXKel4ToYpv8aWrwUS4HiicPqVoLDzsvfz/JR30tf0jiruF4RRx9WWWzX1IdLz6q4u9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lEkrcXzA; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qMhJG9MN reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lEkrcXzA";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qMhJG9MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724847625; x=1756383625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=23+7cywI0fUPFWkOLsTwrSRQYi45o9fiJhzknLgCNcg=;
  b=lEkrcXzASNoAXcbW8/LlVGYqj0bqFY2CM/KRivE33vdVqtD+c+eONgpC
   ln64JskjTqpuWaAwhncjvgwHP8c8zHkcmgNQ7Dqtkfzb0pnsZeMwGlNuC
   epEBfk5t2i6vXuZLJH86TgnmQGNuMHufeKmkrMH//2v4Rywmx7RbSXcjy
   rr3tC9te0537CljXOAqzBQY3DmnBJ9vM7F8F6yuC69uAKxdpKFTm8lQ82
   ZdWKLtuRRQ66uOMSOmmjKdaV+5qsnZEYR+ls08q+3zJM+NQlQqppjPvv7
   nKm2K/ZErBUF6EVDagAba3QHr7qJOyTgGS/+MDQC9wKKfSlWNKiC56bh8
   w==;
X-CSE-ConnectionGUID: 0encm8wqTLmT8C21cEpXEg==
X-CSE-MsgGUID: 42k1YTMmT7CzzW/PKOl1Dg==
X-IronPort-AV: E=Sophos;i="6.10,182,1719871200"; 
   d="scan'208";a="38635575"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2024 14:20:25 +0200
X-CheckPoint: {66CF1607-2A-AFDE3C8E-D8665302}
X-MAIL-CPID: 9395682CF7F8DDBBAB2FB8DCD6B4C2F1_4
X-Control-Analysis: str=0001.0A782F21.66CF1607.016A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20684167A1C;
	Wed, 28 Aug 2024 14:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724847619; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=23+7cywI0fUPFWkOLsTwrSRQYi45o9fiJhzknLgCNcg=;
	b=qMhJG9MNsxKzEp+QiVHj7ZBBwzZ+nmo3b/3PSzVtAJgY7dMkda/D+8cJvEAN7gAPh/tiyo
	dNBd1kgdhP7+Ercxk9jwrL5qUUWqCfEGI7J9SYFFw4JnkbSS4tcZSOOqKdLDBhAZsqbM1D
	vtBejCkU6DkoYKSyXNVvXMAkUy42CUhC71zPB21wm/I9FGczvFk3sWHu3uejTBMDqAVzT7
	BwQXSEVgD6Ywama2BeAI/24Hx0v9uc/6LZh3x9zs1Ec3Po2AwrdnYOvY+7aSoLFKr123u7
	fN/hFsJ/wOegk91vIDCmHEmodOieBZhYCaze/w5H5ptF3fLC4AOjcE/vVnPDDQ==
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 3/4] ARM: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
Date: Wed, 28 Aug 2024 14:19:58 +0200
Message-Id: <20240828121959.1268463-4-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
References: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use national,lm75a to specify exact variant used. This should cause
no functional changes.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
index 807f3c95e3ce9..aca320ee8f476 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
@@ -13,7 +13,7 @@ &fec {
 
 &i2c1 {
 	lm75: temperature-sensor@49 {
-		compatible = "national,lm75";
+		compatible = "national,lm75a";
 		reg = <0x49>;
 		vs-supply = <&reg_mba6_3p3v>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
index 789733a45b959..eacd230b97d5d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
@@ -23,7 +23,7 @@ &i2c1 {
 
 &i2c3 {
 	lm75: temperature-sensor@49 {
-		compatible = "national,lm75";
+		compatible = "national,lm75a";
 		reg = <0x49>;
 		vs-supply = <&reg_mba6_3p3v>;
 	};
-- 
2.34.1

