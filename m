Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718718048
	for <imx@lists.linux.dev>; Tue,  5 Mar 2024 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604317; cv=none; b=TQ7hpihgPXG39vAcalzstFJIXNQPqSHggwYfWr9M9jzZvSUjnKxUQttTInafYgvnGgmYm6ElwItVJt6cYipeIe8pEa/WT+uCXU/XO0d0sRxhqSF4u5mzAHENIeMzbjaq/bk6UFRqeBgKJpQLQQjbig2iNssjUJNrlGgjpgfmqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604317; c=relaxed/simple;
	bh=mQfMQLmAIBV2TnuZl3ZY6h75I3PfxUcRIRutX3ur6xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJnAeet6sN0UzEhLy1ANulSrrvzW2I9f1NuUo2fD9Ducb+Kgn1brULFRIfNk2A8zpzfd3iQnzXONsB9YtD+abuiZsWIMdOQy63ko9Q0djQu1zoCn4F4QIlsuK2At/a0wMrIRo+8wDwWExdDh3NeSzPNZt8CO033jPKHreWWw/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1xrgPZy; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1xrgPZy"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso308908839f.1
        for <imx@lists.linux.dev>; Mon, 04 Mar 2024 18:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709604314; x=1710209114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJuCH373LezeptXjAUVUX17sgHTpn3EnPm8FEMA/ybs=;
        b=f1xrgPZyzyIKyG/UPctMvAyV4y8+dzlrG0pIKW6E0rSxe32fGt1l+NM4mVi7Yk0iFE
         z6Y46UDo/f0G3/9SK95ZB8ZL+tUbqxkQkLIgnBVmeCl/yfp+px+T02XLgsyklgpgApQd
         mLgqzodUEqWJGrQhBZUhEuXmrOj2nWJ/oBfdbtfo0ANa0ami5Dk6TAVKuwNrJ6P/4GJh
         //1tsIrIwWpw6raYmGEH+AD0JfY2ERAZ5DklZLU6/IQD+Fa6aiKYTkkyUxktyB17pyeg
         Y1YSZ/kkoRfUZ5Sp/DjznPyg1sTRyP/XEaz/+E3hBevNk3vmSxaJ8OSIcaG0DifGSuBs
         gqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604314; x=1710209114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJuCH373LezeptXjAUVUX17sgHTpn3EnPm8FEMA/ybs=;
        b=BM+dqYjiL5Ehew2cMMk8daOd3Q24eLvMtX97Gw1lrpS3MemYcFXyrUyUZcuaiR2Snr
         Aj5hldoY4vnUJjTm0k5/CMZih9q/9KZsjwINzQECDNlu9hl0IrHWrUKdDqWOG7XK2K00
         Vx2PY84aZUeyucAoZGz2z3utoelhTsPJeG0Ky740A3T660RYvVzeALY/ANucqX518OhK
         QBhSNALLih632q8FXSKsVp2Dn/25TN+Oli0wX6WMzyOyXFztrdpif7xxewu0f4OfTTnj
         EhCFbrBj9Smx1G2j1CwDi9GLk7TiJoMJiU57TF01r7YnUDl+uGt1IqCU99kSeBua2Sx/
         X9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB7xqJlARAQx5n0YkTPzzXw21xvlOOAHA+EZy4hnjEY1v+BWfEWDm7rCxb6kbmT3bEkd83G3FmbAmtmNEDRriJB24E
X-Gm-Message-State: AOJu0Yym6pceDP//6ggL+ktb7PJJ9Hb9hgRjxLwYL2oi2DvsNK7F6K5O
	nYwsFaW/W9GG++iTPy4kzDnq75+vVaeJYURRIF00GsvT1t26L9sH
X-Google-Smtp-Source: AGHT+IEAIhjfu9DwkDH1PlpTwYvXtDbjW4w0IaT9LIlexPIlg93AQjn3hVh6QqttEk1LXdSnSY9ZkQ==
X-Received: by 2002:a5d:9502:0:b0:7c8:5ab2:6313 with SMTP id d2-20020a5d9502000000b007c85ab26313mr3171143iom.8.1709604314546;
        Mon, 04 Mar 2024 18:05:14 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:5872:22b6:b680:a683])
        by smtp.gmail.com with ESMTPSA id g16-20020a056638061000b0047483de6cd5sm2590708jar.112.2024.03.04.18.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 18:05:14 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-beacon-kit: Fix errors found from CHECK_DTBS
Date: Mon,  4 Mar 2024 20:05:08 -0600
Message-ID: <20240305020508.6379-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adv7535 has some extra reg-name which can be removed since
the defaults that are used when these are not assigned work
just fine.  Removing them and adding some required regulators
make the errors detected from CHECK_DTBS go away.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
Requires: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240305004859.201085-2-aford173@gmail.com/

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index fba8fd04398d..b1cd0f0b9c13 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -302,12 +302,19 @@ pca6416_3: gpio@20 {
 
 	adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
-		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
-		reg-names = "main", "cec", "edid", "packet";
+		reg = <0x3d>;
+		reg-names = "main";
 		interrupt-parent = <&gpio4>;
 		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
+		avdd-supply = <&buck5>;
+		dvdd-supply = <&buck5>;
+		pvdd-supply = <&buck5>;
+		a2vdd-supply = <&buck5>;
+		v1p2-supply = <&buck5>;
+		v3p3-supply = <&buck4>;
+
 
 		ports {
 			#address-cells = <1>;
-- 
2.43.0

