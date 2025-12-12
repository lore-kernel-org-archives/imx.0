Received: from mx-relay175-hz1.antispameurope.com (mx-relay175-hz1.antispameurope.com [94.100.132.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D4830FF26
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530009; cv=pass; b=HVx6+sNf8kSaHEI8oHBkIFyHCgGPSzfm7IaY0CYvDlBTTeB6D8CMWx//zmOMogkkd/e8NaKGPV1z/2Mjl439MM31E0DvmWHFJTda2usxPKrD05g7hJS41WqkKWWWel3t27ngzCiFhhYPQ3JLED0fdo88096o4qrqQPOT0HS9/us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530009; c=relaxed/simple;
	bh=TTPuwWyrhwIbAh7bSDP8tr6fzMuC7IEfYtFGTQnG3t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7M59WYjlkCu7qbysaI/Z4BwvQSl2W9d368nNo3k8CLeXqrDU0jlUJKw7wHABFdrKiSE1YpSvwk5YPbfc05CfDFE/JOqId1ZNuROUL6gI3wgpYlSrtcJLjpII2TZMDw2k7NhwJJEsgUOVqRG4/okO4/xAEuZJLilvqhIS25gFVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=secJU5rR; arc=pass smtp.client-ip=94.100.132.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="secJU5rR"
ARC-Authentication-Results: i=1; mx-gate175-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EPA4cw3Gvq6SBCJV/vWcX38SZi8PRTPj9bVk8hJPiao=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765529961;
 b=MKOcZBpkYD7PeFWXY1xnK1ZoGChpjjjiVnq+Fe3/mhI0Td7dMpP+227rjlTPWFC7V+CqN1+V
 4jqJitQwgLFBSxqrCgeCKpZNIwYt50MAHm2X2Cxe9TjlEMCZM+iag6Je46fHglZ6W4GHK98Y7y1
 vdVdm7/iwnk8PcEV8FA+8z0DUTcgVFquC6b9qEsolzHWpoIA1GE14LU5VATs1FGuDOO0PpZnu9H
 xYwsls3MHf0KCP9HQWr2L2+w5YpE3UUyBa0X049M81gVmmfawL0lLxiSiZyzDSHbCt1Xl/6YNYd
 odX43j8ciInGgkagwnFHVlTthhTtG49fjfv4mxTRI7yzA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765529961;
 b=Hb9UYofuSTFaGKbDkOBIBBSKG8R0HdpbAif0h+Khfp19N0di+Bc22843gI1IbB8q3hmY0hvg
 fZLztpx5T3Z+T1snRXrDaPhAOKv1Z9IF4iU7AGBP5fp9Pytc4l4IqsoAsilMdGxJEGemspcSr9S
 50YhpPFus/Uyk31+BgHXERkCfSWPNEndGEujx7RVsmyqMbdcdrKBqPnYAw1XYKzNxaFI8qNzhlD
 HViWa9kYdUFqJLT7/Thtz0GNEyRZ1jzAijKVCVvC2m5YMPPT0vAHiMlM065FbsmIFwFsrnlKxhy
 u8e9kfDj9XSOxepjZZclIYevkGeWWyfzlFV5/iMcd0Wtw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay175-hz1.antispameurope.com;
 Fri, 12 Dec 2025 09:59:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 434D5CC0CCA;
	Fri, 12 Dec 2025 09:59:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document address-cells
Date: Fri, 12 Dec 2025 09:58:59 +0100
Message-ID: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay175-hz1.antispameurope.com with 4dSNg273DBz2SSMs
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fa6caea5f90cd85704070cb335c8b449
X-cloud-security:scantime:2.182
DKIM-Signature: a=rsa-sha256;
 bh=EPA4cw3Gvq6SBCJV/vWcX38SZi8PRTPj9bVk8hJPiao=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765529960; v=1;
 b=secJU5rRhgGa0FDg2cjOdtThIpg5q/4O6kJblZnk+vzoYIHTZQU+MMevUzXRSkMjY6dsBuzO
 nta/oL+b4wqufhhyfil4a59ol1L14kGThZyjh/PI5Pq1tKDQU7NWkawKLbU54cWrkcygLj8ASyV
 AmkiajbGZ9c1BTCcYz8D4d17j7uHq7lSvshnhc5yfDdfGiGwq+bYChtNUVESz7vQm9zsIrB35Dj
 vtWGP3faUPzQfMk2kUw3cJRbKgIDTKrSqNTCFFrXe5HPSTywRrPGg/vuFl1I/4clygRTdWNyT+c
 ALuwST8v9s2zYn5H/4pPzp2yOgvi0ekkEr8G4gVPB8vRQ==

The GPC power controller is an interrupt controllers and can be referenced
in interrupt-map properties, e.g. PCIe controller, thus the node should
have address-cells property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
index 9de3fe73c1eb6..d49a5130b87c7 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
@@ -38,6 +38,9 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 0
+
   interrupts:
     maxItems: 1
 
-- 
2.43.0

