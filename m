Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAAC6A8C4
	for <imx@lists.linux.dev>; Fri,  1 Mar 2024 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284481; cv=none; b=u6h8THCeHUWxIpA9ODKAkI7an6ipsLem+kANy9crlaRGUS6V4Tg1bVbWkQZMZvVbWyUAMvn8JrTfRT70W+G/6ni6cDph94ZLO2bgCE9RAb2zUDbztcW2njtetU01Us8eWEV1sJNUvI/NvAIr/oVDzkw99GLlhpvKt9eIP2SDhD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284481; c=relaxed/simple;
	bh=aL5CQ+G5H5XzR83P/AruggKM2ubSymJpW7MKuPTBGKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oYLNO1zPJxUADaTDTASCMXKmmTzPTJvvvUPGZlRZQIHp+44cb1jUaKX3GL378tlksTfYfZB6uu0AEpJ9tEY90vrRTBrmi4Q6x92eCk/uFpYfFBF/Slqke58jS1QdPXPRDWZW6hiPqLk+lHlFxYSXBpe8nCa9DJG8tyzwPzf9WII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Ee6VdW4F; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NmnHWLkn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Ee6VdW4F";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NmnHWLkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709284479; x=1740820479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3nkX6Fj4AoyKyoMjYF6lXx9IwApyCGGhrQ0iU4llyPg=;
  b=Ee6VdW4FukFT6EcVqOpI43u/rxenxXWSuU1ATcok/qPNCF+l8sfzYNN1
   0VrheT1Wkh3okEJP6RcVi4/Nnm0gxMEp4arGDIHpsAJqtJj9V4vKFGs7s
   CkOiRGDC4HvR934xACxfTy6I+1CwccvPvf9u0mj2pjQFr51jLcU17Lu5r
   Qh/3ZUvWNF7MJ1K5FFsWN2VmOYk+ml+tK000Fiz6wWu7tF7bCE+Wbd7uz
   6Tm2E3O+ZBJt3nlJlT8ZqCHEJyg/L4ZH3dK2cqDmzQUcd2V/sWx2t1sIo
   G7u1jbk+Shw6/8X49yAzJO1piC+JMyxEbQaRUs5yjo2VaQHLKS7oAlKAj
   A==;
X-IronPort-AV: E=Sophos;i="6.06,195,1705359600"; 
   d="scan'208";a="35682456"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Mar 2024 10:14:37 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 622DE173575;
	Fri,  1 Mar 2024 10:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1709284472; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3nkX6Fj4AoyKyoMjYF6lXx9IwApyCGGhrQ0iU4llyPg=;
	b=NmnHWLknJLEtsz4Ao2II/7+Dmoy3Txa++ufr5UIozKrWmueb9AE7ZtmoEqObI+MTLCtz7g
	FmkAvqRgYiFZyDLffA8OaueQ4RqR2QbVNqUxyDx/yyHpyXxLcLXPbV1Q4EbtPC+gB+Z4D5
	55KifRyYqQu/JC53q8d1Hd2ckhgGGrcDNRIjAbxkGGrU3JXS6Lcs2AQ1H4/HXHaYT6ryzZ
	JmPIHQ8MfS6fkl0B3mzjaDsPnkNoT8yNX8wytp9W81dQ61Y529/C5WG72HIm043yrI1TqX
	49LJVDVfxQUQghlqk28pH0+hbpCZg4S5OOtMDhOyoTE2ndZtyLvLiJOx2zQWTg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/5] arm64: dts: imx8mq: Add empty DSI output endpoint
Date: Fri,  1 Mar 2024 10:14:11 +0100
Message-Id: <20240301091413.3050689-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301091413.3050689-1-alexander.stein@ew.tq-group.com>
References: <20240301091413.3050689-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Also add a corresponding label so overlays can reference that node.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 74523fa69a5e7..5e906428d5e70 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1290,6 +1290,13 @@ mipi_dsi_lcdif_in: endpoint@0 {
 							remote-endpoint = <&lcdif_mipi_dsi>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_dsi_out: endpoint {
+						};
+					};
 				};
 			};
 
-- 
2.34.1

