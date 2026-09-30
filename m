Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70384FDA5A
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781188; cv=none; b=uPqCXrgrGjMFs/MI0suIoKsuPFFd9MPzvM5Gl6XUf6bHrGOvArYlL4dVgzmsu9JOEysJAKqhDy0zg8AmsIXDozThYzfTxRfUKjWtVP61xkWm73ZBu8KDFjZdVKAl9J2HgdmaZsp/TdaFDQMZL6W9TUL+Behhz2VAPvKdJqSCiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781188; c=relaxed/simple;
	bh=S0WsyTGzpzbVbWSeET0rlW9Cuja8kSc60m8JARgfnIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQ1wK9aadLltAXlH0ZEr7ePG9Jc0YFUNr92492JjOrqVxisZUwQ0D+I+2U1odifbKHFfArCL40IlmqUdzHqsHx0tFrCRjLi25tuV0uIY9dwE5qQgUCdCCQHOLSfobRjoGn1jlj1wUfd9sfCAH6x4qeIlHgcplMafrInbg9czw0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q/4FdQGW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q/4FdQGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781168;
	bh=S0WsyTGzpzbVbWSeET0rlW9Cuja8kSc60m8JARgfnIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/4FdQGW1AXthZNYknamkkPstOSrQljxfgS/EIAUVJCc5LA6S5EMIra3QmWLjztkv
	 r2VrcyJy6dt1hswLVLZJ+sYTx+tytPmUhj72cY42pF3HTsfYMBGoQjqcVHn/fqTnrh
	 h8IbLBY/t4uiQf/Tdl4oqiSOSwTjbjUdo9aVo4y7+n3GkEZMYHvee/OcztttAfRMN5
	 LLMtFkAv0LKmgAyKFzPaRBu1gThV1zjhFlDWayqdaUVAEuMb4ApqD9XUjppJ4cAxc0
	 6PxkyBXbJHbJ7R68NBKORTbP/BTVCHkLQOYtgOQfsum6R7fWlNtVREx5azpeDFbcfp
	 tCmPEU5+rwwww==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDFFE17E0D39;
	Wed, 30 Sep 2026 17:12:47 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Wed, 30 Sep 2026 17:12:40 +0200
Message-ID: <20260930151241.58233-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
References: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxp,imx8mq-vpu has been tagged has deprecated since a while and
driver emitted a warning when this bindings was used.
Vendor DT use the following node before they moved to mainline driver:
vpu: vpu@38300000 {
	compatible = "nxp,imx8mq-hantro";
	...
};
but that binding has never be documented.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
changes in v6:
- remove pw-bot tag

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a..69619d2c86fa 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -14,12 +14,10 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
-      - const: nxp,imx8mq-vpu-g1
-      - const: nxp,imx8mq-vpu-g2
-      - const: nxp,imx8mm-vpu-g1
+    enum:
+      - nxp,imx8mq-vpu-g1
+      - nxp,imx8mq-vpu-g2
+      - nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.53.0

