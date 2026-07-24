Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C61A42377D
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889141; cv=none; b=HFGjfUmS7Ng+3I2Iz7dC/03Wb7djpggf4/HRPVlgOkQQBu8+nbdlfA02vnEIKxhxYXIpQ3rcN/Yi3+U2v1pNeYyKV7LYyC26eG5OTrn/LFu4hFxPQ9fMWWJqp1rG83K8dgoLFEyJByVEK+CTF4idzxxD2sF+XdSO/qSugWkA+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889141; c=relaxed/simple;
	bh=km7ZBcz7tXWZnSNktgEBnUlaoi606YmDd2gft3d5PUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HLndtqIUSywh1JN86+lAYfzsys2u4JNnIPC4X6Tvod5avc9C1zJX7H7W1CY1oXOviWnwWInXbSjit0VuLooERsDyF1aLPUEJ4kikokRAL93/0+ltQTQrdtkW0ctjWiRbWLRovxcd6/dHj+IyI3Cj0b2MJLtIOFXnnSR0D3x5glA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiwbFbc4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiwbFbc4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso1752935e9.2
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784889137; x=1785493937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=kiwbFbc4hxk/+79MVKAh04yAMXmoK8LWyYpIjUPJ/ZC9b5jbuxXUmel7uchiGR7aR+
         4NTqLw/2CX8HAVrORovKWZ5hhXFTzWJjzJk29Y+HZlyWoejA5lnY9frrXvP59cg5ub0Y
         bX2FzIKkWTkjVX4Dh9rqBNqtrt4ZRbS7DrmgZKl3ClkWdc2X5vbpsgbGPrce4BhGQ3ij
         89TLQnaH6WOlCmRau7V+K27m+xjf+F2d/GqAtnovFAah0m9hMd1QJMH2cDMqOi2v+JiT
         mvMey0Rwiept0YkMEjF2uo7X8iOabHZ79RxsuaKMn3rxdcsmM17hk0uyNi9k4mBTWLIk
         2jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889137; x=1785493937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=EX5qj6fiLTwwWb1sOmkbrvXNAOM1yIbYW9Kt0Zbg4faAr20P7jSbhOZDe9JQlj0bT5
         sjWc7aX4QtbsdTCDQmQEJrs1qgAWC6vjLn82q8ITFV6tzeANEhQ3DLzXiejFYJ1xKewb
         ei11bLlglIuPv9l2zuoiUE6O3uilZyANjFr1C0q+i/wDXabVQO5qyKz+0spIou1zJnfw
         ok6+mG2gPkrHaJ8TSASBvu0CS/esQuMVmqPXt5K3SraeyDOTfdZccPyqjFE37mpJ+Rr1
         Np60AI0wpuv8dQCVLWJShCsRRX3xJzDhQkfkShQN/7HR3rvsxuFtyF9uZYHyb0thV8Rh
         2EOw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+C+2b1jb8RQz9tS/yZcMSqshKPVdzRovmfc97CbTmCWaTCLIELhS5HqJsdVRooE0vht4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ6IbLzgYC49vv4XLtL4jJXtziG1pR0/JirM7RXB1vJQM3DUw4
	LhIIvtkbo85croLyYBM2fExpDAL4oiYiqIOGxw1ROGtYH+s9uthzobN4
X-Gm-Gg: AR+sD13q0Q5Df0EMU1hjh72lZjEQvvw3NmYC5rbk3Dyimdqwdq9WcKaxf2U8mro65qV
	pka7d//4gGWAaOYMtKmVKvpuKJpzTHT9mR+beePgfeFLU8GulOie4lVCXafq7OE2hAanK738uDT
	73QEEyEvvDI+jm4+bRGwrNGt3Ph4l8PVV356aW4VTdZIKwvilpynDCufOkW+uoVKbzqU+X61O9H
	YqD8a+UlF5MWs+N/8Al+XcwG+moyiNDvALCmlz70QrgfhOgMmHLvcc8iPyt7VgG5ZsNzOOeBeL+
	mM48XyyzUrDtMrxdkef2grLFhlgaJiHxcglvbPZiAYeimk6GsdjhEXNc99n2/ULG8dw5vWXmXeU
	+0X+HN4JSpMoCHF8wGMjRB5pCnQ8t0z5UAfU/p5dXC+PRtGrKOqdVu+ix3TjcB/ryd5b1AWPqML
	zFc5co9IA4czI85VHBtAJKtBBJcWKPlzqKzTtlw2o794VvH1m0qb/HiNIGPO3ti3NBazXZ+0XwH
	t2pkAzc18Tfpp7sigd0ROs38w==
X-Received: by 2002:a05:600c:35d5:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49573c8c8c4mr71266265e9.5.1784889136179;
        Fri, 24 Jul 2026 03:32:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm55709885e9.10.2026.07.24.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:32:15 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 12:32:12 +0200
Message-ID: <20260724103212.41821-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The 10GBASE-R port is connected to an SFP cage and requires in-band
status handling for link state reporting.

Set managed to "in-band-status" so phylink can manage the SFP link
through the PCS.

Tested-by: Stefano Radaelli <stefano.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index ccf7e77016e4..3479abc25df2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -157,6 +157,7 @@ &enetc_port1 {
 };
 
 &enetc_port2 {
+	managed = "in-band-status";
 	phy-mode = "10gbase-r";
 	sfp = <&sfp0>;
 	status = "okay";
-- 
2.47.3

