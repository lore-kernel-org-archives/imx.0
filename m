Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE41990BB
	for <imx@lists.linux.dev>; Tue, 17 Sep 2024 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585863; cv=none; b=iD4zn8DJf4C+ZKJsVxiIowaKgSt/uS/zFAHvK1IkBtt96PlaLvI2+zN9xPCTPuIZCltGolBBIL43rPqZA7rr3bSpQHJpTEmSDGgd9XCAhJAjc0PT/gvMWHflHYfgwl6gJjq5JixxQB9q0WjNFom/HRlYkr/20jlB00nrs4S+gww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585863; c=relaxed/simple;
	bh=/bD4JA0vxpe27QKyvbrcbgqHVkcoC4vH++R5MkJLD/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R37B0jaPjcFUgh6Ap1ggTKFHUW5t41XgZEyaLw4lKNhdtRBjQuzyuzN5x1C/UmMiR+Zipst1gUi09iDzm+Sq6anb3oFPKKy0YjifMoJBTsVBtQlAu9TApD/D18t50A/D3wgtj6iw1p6A/dB9g+UDxHEsbBpt0z+ZRgJgPpkHRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=YM6dK1VY; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="YM6dK1VY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1726585859;
	bh=McKuEG3ZdRB9RWDbYv7LSCu/IrIamkSKpDlqObRjxiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YM6dK1VY01XNLX75HUuFGn/yeWnQzsnBiXKwnHqITSdarhrs2YA1d9wGQ38+dnccA
	 c5/i/PZSl7ImhI2i/KeIMolTZvT0+GpZwc8uAs128qYucNMAezZqQqHIKANMskUXD8
	 ynoMs5Ld/jd/VpObkVC9r5PenavUV/qm/CVDn77Y=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id ABFC2A07F4;
	Tue, 17 Sep 2024 17:10:59 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Petr Benes <petr.benes@ysoft.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH 1/4] dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board
Date: Tue, 17 Sep 2024 17:09:58 +0200
Message-ID: <20240917151001.1289399-2-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917151001.1289399-1-michal.vokac@ysoft.com>
References: <20240917151001.1289399-1-michal.vokac@ysoft.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new board from the Y Soft IOTA family. This one is based on the i.MX8MP
SoC. It is basically a stripped-down clone of the EVK board with some minor
additions.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 80747d79418a..12f987a38ac0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1089,6 +1089,7 @@ properties:
               - toradex,verdin-imx8mp     # Verdin iMX8M Plus Modules
               - toradex,verdin-imx8mp-nonwifi  # Verdin iMX8M Plus Modules without Wi-Fi / BT
               - toradex,verdin-imx8mp-wifi  # Verdin iMX8M Plus Wi-Fi / BT Modules
+              - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
       - description: Avnet (MSC Branded) Boards with SM2S i.MX8M Plus Modules
-- 
2.43.0

