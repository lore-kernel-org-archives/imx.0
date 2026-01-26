Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F5337BA4
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439394; cv=none; b=bAYJLC7/hR9B6ywy1fLvivuV8iTmInw9evcZXF7/tLK2TxXYbJqHrTgg5b8fKBU8JQAbNvsbJR5nE+mAGsSEKarQnZ1nj8DL6ARSDarok2dmY3btau916SLNmJWrOWbKuBjZAPZlxDlpbPSZVVfosn0wTRknw9UBETNrFoqF3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439394; c=relaxed/simple;
	bh=zoU5K02Bbq7cw3lIuV6NlOALPTjdLVS9TUL2NqjNC4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNm5QHPmvjH0l321qGtKTqsTIffsb7gdUref4Fq00Qp2G8ACnldK0GnzufHoRyEG3YAz2c5iN9R0LDr5jUyocvBp8Zm20MAUbMtMm99HTkO7XyqTsS3nBwScZntbtlVUjDR5XMRYsW9HRV9nGhWmHz8MaWPhvshZzelbobDyCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL6yEK8K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL6yEK8K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801bc328easo52259955e9.3
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439391; x=1770044191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=RL6yEK8KR9fJrCLLfuuxG+msM44j1AQwDC8kLAHkLJenKbhjM6YwPXmYOJg9FAQP9j
         Sf/s2FKslA35mF6yX+7C8qmCK7CPFmp2laX/IExm1DaLZNKXqLDcFSPlpe9eTSYwg9bc
         aA5e9a8P1lkW58chopp5G12qIBik970f2X+URhmbHO6XERdVhT+Qb1bAFljGbYhR/esa
         CXBwzIEg5asv7KQHGgqY6A9W3iK2Hdda+9EvgSxuMmRT11HtMPI05ddokGB9G/0Dxsry
         kDsoo5zHxjF4mQMyUSbFtfeY9vdpK+a9t05NHI/bRrJCwCRBRzVvF4yyedpHUyHPZdrq
         y86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439391; x=1770044191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=WncuadelAmX1pgBnk2lXMm8qcBG383b6HX4RNTdwzag0LOIt8q3SwVTdGunZswTs/I
         /0VYjtyPbSVKep45uqc6uCFPDzQHJNL4ueBvM56Tlegb95r2OPQh3HCVKz0t9ouBjdcZ
         R13YAPB/E46uKZ+TpwNjQo/bJ+16Dh84aEOF4/9XB9Xxx4MbgDwdxiSD2mV8Iq4OtYtK
         9QjaSi3HrHvr4noKbkTunBU7pO7qUSRF8yBJ8ZUBjxNseZ7XyzyUA88noMihLKL4/rXJ
         MsDuXovZ1me7LWXds68npFcaSov8mYuHK9dIsr6tMEEgqSc6it9mud1ejdynRvUzFwTV
         LHDw==
X-Forwarded-Encrypted: i=1; AJvYcCWyU6V/FAqrJDDZY6Jy/pt3kLw3b6oPirc/uG4pf+tLz+JtiSdNrznGeywsOrKkL4mHB/w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdieIwp9xpPhDwflqyX8eM5XI4BfArPPJv7P0BcFBbB0P7gvFi
	g5TW/3w3FFpS4kwcHmmr1dyQxXJmBVYMJZ0Kc4rauor5cMfuicanUZFZ
X-Gm-Gg: AZuq6aLSYQgKnuMs4wzPHXQ4/EyIqycOB7Heu92cG2iyrR63qkQVSfNVzL7mYCDcDmd
	E8LKDQuQFF3UbBjWRmxdV08BYlF8IpRHkh70ZjriC0fbIzAWC7grbxN8XetuBVx0it0QRLfNNYW
	gnAURXsMoHU9Au+1IzxC2+y7xdNuujG3s9s5ORKA88fLqPlhoLn3Pn1z4RTJpeEormlOgYlzcnf
	vgFc6wXUpHRtueaXhSb17GqGpPyeCdyeaHiYeDMwJPVabcDixfstSPrVWFX9jskZSjTkvXlEa8p
	6AoObTKBuUQlKG6EY2cSdpfEb4SQcr07W/JegEINwIr8cCFEQkH/ckwaNmYZa/OIuDctZwIXkdU
	0W65pMyPTNLzotxXMIK57qucwNUKohK7fVusEhbHVyWK/j0I1aeXyD6sD7Ezi0XwStyFFfvpbKu
	+NBzf207+wQyICoDCUbxjtiT9nrebu9CB4vLuKE9oV174fgX3Q
X-Received: by 2002:a05:600c:3113:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-480650f2933mr20236615e9.10.1769439391388;
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Mon, 26 Jan 2026 06:55:36 -0800
Message-ID: <20260126145537.2301-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, GPR is transparent to the software and does not
need to be described in the devicetree. Make it optional.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 1415247c92c8..bcc265a742c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -63,6 +63,16 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-mqs
+              - fsl,imx93-mqs
+    then:
+      required:
+        - gpr
   - if:
       properties:
         compatible:
@@ -91,8 +101,6 @@ allOf:
         clock-names:
           items:
             - const: mclk
-      required:
-        - gpr
 
 unevaluatedProperties: false
 
-- 
2.43.0

