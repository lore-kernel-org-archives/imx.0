Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A03D6495
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448835; cv=none; b=h5Ftv7hrFVI9HQwR9+TkwOLX87END8q5nk178P7HGmmQ8MPZw5Qx2BgjCsKYT8dTzrzef4ietuYEz+BtKMtqy+J3vfnux+4euO/b2O0VBZvEjSGWWeUdsAqeZJdqs3ObpFv3jAC0UX7CwB2obdEu6SkYJh/Aa6LxFXAtSxMn0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448835; c=relaxed/simple;
	bh=B23ResA4FCbRNDuiKc1eQnBqPU2ccGIETUQQXvU6O3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpXA2CU6QQQm/PdOUfix6CLXxmKNZokxcFE2GHssOZYgWWoMKiK02+QWTAe6QU8h7Bm7OEcWp9InKSO+R87/QioeFXkyyiKWrOMNFO6PNqC754USxWZMKIYGvLZ6LuHC1bGMjTciuy6OUUIPIXtcnncixlgy1Ls6rAcgDy3RX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gglr0bOU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gglr0bOU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so99300265e9.2
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448833; x=1780053633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=gglr0bOUBsANFPNa1nGasaRXfioLPBHERRdScam55JV3PXaKvIL/NbPIjmFwEASLOC
         q9TLmMTonZeeSLLEL8gNyop172qEH/pmF/Gr5zNeDJp+gUkoTI40lkGBbUvc1BrnMUZO
         QrQK2IGlrSpgUPpKjOevDHyYzWYoPAnRuoHVR2f/SqrAtGZgfsbmc2NNgOH/X8VNkQZA
         YKxm6ozlExBUWKMcnrYIXMx2xsxOC2+qRrMk075FI4Gnzfjpns83P9l7z3zKWKVRcvgy
         XC81upsG7hWzsbAJPynirbteHiJyW+6p9f7IsY0oi1yRbiHXhT8oYJ/lKxEwfItb0cuj
         Ym2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448833; x=1780053633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=fzDuyvJnp3uDNcG6Tvfz7gpfM9H7ZwZXHBlqkdMbf94baWVSuSLMMcxa8HqrC3Gbxw
         ptKSpPKG9ew0mWOMeskxOgbuXPzjijQran4Pt1hopnexeOCcJ+G1gzKpMjEcOr2qn7DV
         lyW+hC2umSbgKblHB4PVn/ZqYFTCgRKEs9xlgkb193OGrOeALWhpBqMIeXkYN8SGpaDn
         dUTYCaLtNfUmPah8WmUst+/LvafaZ0KRPtX14eTZ8isJJ4d3XpLIgxFFfYaXJCAQHPIR
         C8sTHo+s97MciLcFhrWX3MtTLaG5/uu+VrraNnRdwlBTVOjlhqhjBPuH2kfZKqfFu1vb
         oPrw==
X-Forwarded-Encrypted: i=1; AFNElJ9Bs08YLjhSDnqJfEi/tOzyz6skkyAvvCbVSmKWXqYzgy9Dmd+Xg30T0U/3QKmutPX/Y4U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8X58j0vlGY/9u0WGucYsELmQIe56HCcAOOgAOK0iKML0ikLXE
	583xeKiRwjcYnkSWYCZyEfDXqHzxUUN/JXZ1Y79aML70Hq1ynKAi/Asc
X-Gm-Gg: Acq92OEcxM7nviWgtn4UuVW/LLAYRVFZkpp29/h4IRjqYe4PwovwXt1ybcNxysXoMGp
	sFKl5FxwuWkpCZ/tMPvWOGbxduc8yIh8EpPZMV4EP3UdJshoLes3aq1hQCFAOes4A+Y9K+bjac5
	8k5LweCuxCB9ZeJK+xl18WMy+zocI3iSPd2TzPWxUfbsQOD6CljTss7EN++SA6PBkiw3KQdQgV/
	Ei9a9YjMG/AH9eAsmXuInlzhDZrunKTy7S/Htd+kdpkgOM99hj6OY7jyBkJrePne2YjKcslkmDj
	TKRvhESYbYUfTC1Hg8v3q32UT7JtuyGwBZmiRBaF7ZZcY1ZYG6ymqOGyY4angxBKVhHDwrIcix4
	/78OA9huF8moYqG3OQDQySfI65VmIvLQYrf8YkAGjHvDVyWuNPs9i5tA4gIRncl6BUcPLoDXT+2
	hPgxj14XlSn1rYrcGjVI0+r/WOcFFBD+Pw7GEN4YVtorxhawu6Bw==
X-Received: by 2002:a05:600c:a106:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-490426dcb09mr29669825e9.24.1779448832493;
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri, 22 May 2026 04:18:45 -0700
Message-ID: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional "memory-region-names" property.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..6679b10f9da5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      oneOf:
+        - const: rsc-table
+        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0

