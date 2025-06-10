Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5EE24111D
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571352; cv=none; b=mk3NOHC+SmihQcW5UMBO78j/mcNavv2KuEaKTdfjLPqedMA/EeLQPe6veQJqZGjkGG0Chrnz5EcdWuKPfPd/yhsUVULRvAMJPVGfXpuWeL6lHYSpPJIASUw4HpHAl44u7CCeTLWIn5Uu8mGTtQsyix3ggJIeAchVfr72Svi5aec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571352; c=relaxed/simple;
	bh=h8BZXYkNYf3ReqiG0t3tej1HP8e30uMrodT+erXtdEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ffIRtHnjVM/aATiqc4Cyc+ogP2SHvZ7O+0TBN7ZOf2gG5/gp8ZjgNMJ8gsce/38eaBzNl0WrAZ8M1VKjmMTiOJkrQIQePWdG1ARmDpQN3jb21Aaw5ZLxzQOZrr3OtOq55ZxyJ+UPxCTd0LBc/hPAd+FQLgBQbLSEyGlXXBXfAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEpxFOFp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEpxFOFp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb79177so27812255e9.0
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571349; x=1750176149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=UEpxFOFp6p4Ry/KRLzA0W0AiwB38ZLmjTvMePxyPj01uWG2I2ou9N5OIh68NcyQaRy
         JtgReOnzEZCeQi70j5RGFR8uYswuSszp/4uorVCyztmyPBF67whF348CT8UPklnTNr5o
         zWhmjfY3tKTtFbLiu4Bn22s6PcX9hhLN3SqB7FDL4tg+b28E+46Bjmd4ykusD/x5C6Qz
         UbQb/BzTNK7xSYBf0WObPSzTMGaew+0nsYv6vHsPuNLm8sqpJXuJW+5/e7FR/Vv+2fJv
         FgqvyONy6wQqFwjmhbzj5HgD2HZk0GLJ6Ri1ygoYP7F5KsUHa5as1U24QQfDpgoxKtd5
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571349; x=1750176149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=GscClYzSagIrZ1myl4jjtFeQ40R9Xq6LqGFIxLuY47/XqpzgsRuV5BsN9x+iRutXBr
         TbafQKrUcADbYka8Rlz34R4G2UilgwX/bjxNIpEkAqLKZa+zgCHB8uivnTJHf3yat0ns
         fho+mM5KMafvzkiosc+FbyvrZZEfbpuWpGT1zI9pTSj3IOAs4opWug7DL9hvCcYez3Y0
         ZNpmFkxIfix8NY4Jtw8O+RLL6PWURkD+gnxbHwA+PpEQ10z4n69HW/L3A2o1V3aVEVmn
         8yrl9BrRcLYfkt/65Wv8DtpqePDpBuiD1X4XsNUmwaAjQ2CzPUX7fGfFc5py/a7fumpS
         v+3g==
X-Forwarded-Encrypted: i=1; AJvYcCWejAGhqieSiNmYhXui6foiak505qESAgjBVqoP0WEg5VBbENd5VCjqTGvOeiDFVeA3Lbs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH4OZky0s0zzBX/ZvLNV8MIVWWyvytr9iyq0P0ZK6L5t+mkjxj
	mIebZuPGluq7LyE9/jgbnuFQZUqK4JHHe+pQ1n6bRzV8QTpUKsg1AZB9
X-Gm-Gg: ASbGncunLFOQP0lykanuWnHR1kaqT6rFJfQSRW3Bu7/Y4Je7W6aed+p/saziYMDpkEr
	3BJUkWB697S9KVBatK71q7ZT2UHIg13aTlWHYhgXaRktsdLScMbhjBJUZTKKRwvwGqmuSy+OwuS
	OwNEbPfzqYLt2XR910iDJrIJKNQH0+IH7eFx6Pq8Hl+2Fn81iLN7D1CY+3lL7AY4+8PswKS7rV0
	gMZiNDBIr9x6OtwTCc6IE8sZ0GBdeBrpeaF+rizwCmVvHaDUGbu3vuQ01qm2Z5AM1a+00fBKVkQ
	oEQITESgKDIpniUxHADTAAGPK7acCo6npqRGM7A+3y7KkfWemvvOhSjxt8LIOIVaBnlFSoDKXlm
	YXXB0hFx15PeWZs02GO+Jeis=
X-Google-Smtp-Source: AGHT+IHSoBa8ZcJWksNpcGAtQt6xG8vZ9PxpTvdcpULBq5usdCTTV9sCqHBLSkFiGZ9cN/o6Et+0OQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a5319b64b0mr11663701f8f.41.1749571348281;
        Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 10 Jun 2025 12:01:50 -0400
Message-Id: <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..307e1671eccf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1397,12 +1397,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1

