Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7BA263F3A
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833820; cv=none; b=F9PNMuDLOA71JXHabkgZReCLOg/JrgNu91Kx3Mal/pO5Z9yYNfyHB4XSayhVAvXdO5t4g72e8BNMEq+r/jDCyHpmhpjGSxl+eKckm3EQjHfouaMuvPwHaYj6N5H+oLtPbaPE5A8FOsOPVEX+9V1enLSlr1wcCXL1JxOjqStWsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833820; c=relaxed/simple;
	bh=ERndhZd7uvmOxp7VBKjvNKNvE9RMcex1A2puj1YAGhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOJvTxf+PDGESfnbHmM0ygGWdsPjedbx+luvltGP+q3GdAhlJXcv/WnCP3q4MBCC5wc/AOC6ThrFc+dp7YqhgDjRXlUe/aMb5WpgWbUmgLuJwRDFF5RomqG2Fj0VPrU4nsycXZ4VU7UctepoSENaB5nvn9++TMlUR2pyehP7+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFQy/msl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFQy/msl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso29846225e9.3
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833817; x=1743438617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXT10w3JwIzjDNmgL5a3o8h4+fjE6CRvvk0IUCmWmyY=;
        b=VFQy/mslmOgLXB0bHw+UaLSR+uShPJpNkQei2QweomUayWbYmvk3f2A2UAUuRKE+i2
         pt3bFl2EkqkG7YmCz7cTZpPLnjl92xDihjRlGxCMXKCGq9rAA3x0/fNUeIUvDvcJMwk3
         LphDeQUHEEtAd7PKXTRCGfzQRNSBYlLaOqCMsUEBPI7hTu9AN5z/btIx5SjBCD+OvT9X
         jeBsAwShQ/0zZdq3Y9OxMAERnQsvH/HIQ2XNHXuZjbWOWOWQ9ld6aUYlD0VZvYdWxDjv
         Zgk7QEmC+pWiaN4pnJcjOynjNmZU6/ssooNzL0DGBsiDI0hbdBRH0XLAkgj6dFCRNPSj
         FMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833817; x=1743438617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXT10w3JwIzjDNmgL5a3o8h4+fjE6CRvvk0IUCmWmyY=;
        b=iRo0/lud7pQskpKws2YH8eMVKizWlUCoxW/CfJE0yQtupv+O9CCE6/OQJ2hgfyeMNv
         xZWtnX2cc/G4IpJh7Tr91Nn4BeYw9tSanQKn+5fcx/kLTREoEyF5repFWzvIyaXv5ddr
         J5o/XQZJBq4ToJlAGO5cTLK1bjdTRV+hn85mW0unwdEyrVk1O1dlj2S3p4Z4d5z4oAwn
         b8md81XzQuDP0RI0QlBnoYT5jPnzQJIL8pXrWMrY7GeqcLACQ45oprEXT37CY6/Lw4xR
         jZMSGyIfNms4mgopGaL3cAq9D2HdnwQyNTPiHHhZ4mqEvW6f+QFij84U4NQVOimIj0Hp
         xlCg==
X-Forwarded-Encrypted: i=1; AJvYcCVywlAM83nPQbBOuKgh36sGD2kbtRwU/HmoE7d2f3bV+ryQkWWh4RrVtZ14tJMCtg3QJxc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzikyXSNW5ojUddzuAS4SamUjz549WZkv5KRClSPl/GdP7KTDWF
	bld2A0x4XK1+loqcJVrBOTkFAbIWCsYOpBDOAnwo6TEC52E/z39I
X-Gm-Gg: ASbGncv5kRorMtvdae0ACCxUs+078LAXgMGmtA0jcYLIGcNzTY8uehjkTqmi0Peph5r
	Iq/vc18gnW7C49+YnRWOxvuJlVnUW738k1UVroorRPLmRBOj9WmW2VU47L4HTis2afHtNw+NhS6
	9l9ofB+I71EHhJMBS6sfpqswiWJs4Fdsu8dJCc/L4VHELeB5kIIFAhlYjcrV8+M2NYI4hr5Bw5h
	nxpPJnezabeNe8MQKqGtuATiFqWsLdpb9R/t+k+dGeJvDm5HQhiD8g8gKxoLYUmGxZ6n5Aplop/
	FOb0O/RRT833O7aLp2sXScwT3INTesATE6HqQcuEKG5R91qO0B9sX0mB4dhJtyO1Yu0POZ8KQ4P
	WVdNVCv8=
X-Google-Smtp-Source: AGHT+IFx9LdNvoxcmfurF69vi4WC8lka5DNxoYeKcQFuNnicURHcUqXEChK3XzKRjFR0RH0cV+xM3Q==
X-Received: by 2002:a05:600c:1546:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43d50a524a8mr131049695e9.31.1742833816586;
        Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Mon, 24 Mar 2025 12:25:55 -0400
Message-Id: <20250324162556.30972-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
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
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..ce9f6da1e257 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1400,10 +1400,13 @@ eqos: ethernet@30bf0000 {
 		};
 
 		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
+			reg-names = "bus", "ac";
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1

