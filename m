Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D727442
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519417; cv=none; b=W6sU3urotpRZB/DJhjxpNS+R9etZirH7lGS0DQXSN36GZ6CbqvjxkZK/xd71+ZKIuJ4cSfj0FcibEQqL2Xyzvgu8+xPCmHv2dnrs4D+dJ/K6pcpL3g/kSz0ToDHkdWbW1rG/Co0m5I5fg3+WqmMkMy1kv9XcOptG+xXi5pQv0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519417; c=relaxed/simple;
	bh=9jslsko6Ysi4k4hZdq86FFeqtg1ZzbHLWDCJLb+kEsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=thIAax/xCkD0lc+22EjChAOvfMVVHt+u6yeqKl+2F9H41DBEXebUHckjXZh+0cG9u/FVHjkDkeTvhdr4rSgfezGFfs3ndizQR8DKKl5cdhA6bFbSeh2HFk0IggEy477P15hRn7jSIdXPxHGPCffRI2h/iettDcUCjahSRqA2AGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMVbbSFJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMVbbSFJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso5033201b3a.0
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 18:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763519416; x=1764124216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAUl3DvNF4a96OMaEmiq14uCqbdByDkYT7FAGSKW29g=;
        b=bMVbbSFJyoBMmSsKhq5t9vwS3mxDj+KvYy2D2ss5288+PBIREeCpARSVLe6QJpoXa2
         wC/Bg5Hpzveku7F6dYfLvxVKf8ngeNVE1gktEy3H9ANZTXtaZ97N3NulobcPxhCQpdI5
         dAJ29XyY834lBqADAhq4xID3+xrm5Ji3mBE8T/QXb0qb3k/jCfsnrlmcpJpNkFuBJ1mn
         BDrQZ6U34TdPfra70RHR8ZoKYSwiL32DSJe5ho0Skm1xmTNU82BMdG5EcEMmrCd+/aMZ
         V/+KvZpNgxhb8KLMV5Cc0PVFsdAIFItfah5N0R17tRsaKBbgEhu3aZavWCb1A0jIgPIa
         71lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763519416; x=1764124216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAUl3DvNF4a96OMaEmiq14uCqbdByDkYT7FAGSKW29g=;
        b=MPZnXq/VPZ9R1pSx64ltWxRxhq7LD41Xa10S82vnrqeTNjvfifMY8+yGtqHjGE3Z70
         i8bDK+4aXnBoS8DCttiEuYuj28F/Lp/Ezt8RRpgYhIhVlhettUneRRMNS+x6EuxTkLvY
         jj2/zvzTBSoGP6lIEfBF3+w+veYoiIABFFZ4/flOVyC8sj/8sglVJB3KKyxsF3Ma4LCQ
         tgep0Yinums+sHDgdRltpfANeb4q2xjO+WnAGUhthTzk+SEro/UoZXY7oslRIyGdMIgg
         Qi2dHDDECHMQSliGmNi8MYSkCzFCnArmKMTrd4dLDpp7DoL1axhkoQ1mvs4RlIICm1WR
         JGUg==
X-Forwarded-Encrypted: i=1; AJvYcCWFJ3KGC70DsuvuwtVGSgM/HLUabL8L2otY+EOYli3vZE+hLFsw3yav/DZ8Ugl3zAvpDRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Jhkw+Gz4FoEzvs+sNyVKRYnRv2AuHr2ciyuMei1jP0aCAvFt
	qf/fUh3LRPwETz42lf2MOFtLtv53ktRaQRyz7AiJaJILHZnRsUxsjm3+
X-Gm-Gg: ASbGnct6vPmMNxLCfjcZ+0s5XnFW1Zk9yG1SGU/2fo8gQ7OmpiXzh3VIPrrCFRFh/+K
	qQmnmWSZjlbE0v/ninBzAa+gldNNRWoX/brUcVPDStmSpboioUMFPZ6aZQS/MEqc/n0/wYxe/45
	nDigd3mlSvdkoMAbcSNQCz3tGdlepRpFXYGMM+kV28xan9Bt5uZZlOdvRHC+QADtOHQrir42Bbt
	xzGWnGpbol8PgIXpSn/nJQsOOE2Izw0xfj9n/fgqJqWiiOvmWMkw8Fmscw3XlEJDGsA1PA47SJd
	QalkvhvLeIxPn/XZB5rK6wvl1KC3DfKAXzG4xpK+B/o5SIwEUcflIrJ1v/BpJwOYqqzZI0X6cvT
	BHqO4+UKVcCEau/ushJPpQAzKa0qVkuB1Q9SC373oe7TT6l1HHQTe0WElgMjw2AqOr1ZMNhUDrF
	jwmMpjEmwN+NvoDRYT4czLqVDnDMSTvmOlukI=
X-Google-Smtp-Source: AGHT+IFh8r79lVQpAeCYF0NNbGC4p1MGfSUZomtiu+dfIgiNGPVRw/+zobtyaOULhCb1FmLl6qDzjQ==
X-Received: by 2002:a05:7022:d8e:b0:119:e569:f258 with SMTP id a92af1059eb24-11b40e7b689mr5344109c88.1.1763519415678;
        Tue, 18 Nov 2025 18:30:15 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm65842955c88.0.2025.11.18.18.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:30:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Frank.li@nxp.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Document nxp,enable-termination-resistor
Date: Tue, 18 Nov 2025 23:29:45 -0300
Message-Id: <20251119022946.268748-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional nxp,enable-termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Change the property name to nxp,enable-termination-resistor (Frank).

 .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90d..6bc786204e65 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,enable-termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

