Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6C1FC0EA
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352385; cv=none; b=oguc/NN9gZOJkpNaotgeyh/IQtDoIyDw22eukeGJu5cVGZmA+o6gxIlsYcmL0S1QJCad0VP0dmyQShR39faiZhfDI30wjZr2XU/YY2mClD/VbIlD9MWApkihrRAPIHXCTzhQuVe8CVTxpYPIU6Ett5/Efcg45DcEP2k70ROB8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352385; c=relaxed/simple;
	bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZaV4igaU1cyEvf31/qzLio1DeX3hy6oJQLq5B+NBbs538cSYAn5r/NVuegvTm5dqZoFxxY00qaHkbbBABYZQ8qPI0DDQ5yReHFyBV/KBss9+HNrxT5DhuOnDwF3QGPpzbdtbf+tnOcqA4/qSUrPsHjYdgZM+B04KhgUf4lYlLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjMYmitq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjMYmitq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70f191313cso1340751a12.3
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352384; x=1772957184; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=QjMYmitqBuaCgQmtideiRl/6uYeNIOUtucNhwkklj+NPTuFtjukSSY9+CaxBWXuocY
         jjKxjiOOFdOcmVdW94z1b3n+CubJNMTaPHjGIiBwZJvbcSr/rbBGrxFRScJ5b7NWtipA
         GMnJp60z2CfQ9L7bMB8GSgApEZjdrIdRZdDnfSFuv1NB0S5q0prnOpNIqnkbmQR2HLrG
         sEdLlU4oj/zCHO6EN9N6C74mydpJA3ijfYo/ktt9VK4LBYYK5KQ9YO2IBtzvjBCCbpo6
         moU5gLzJT6HDM5GECdpleN1iJIyDx/REWCPbL0ADUdoqmAFX8sksQB7zK7Enp18KMrTz
         RwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352384; x=1772957184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=H+84qrWxUHcCpEDpk6PK+z6YzCFDbVb7amKa9iwgScfhcF9TOwx/22f56iAwfNJxps
         pWb6ZmIymraXtEtf6NUqMayOoBaaKnwb028TMdnHlx/bu2n6lprLvTr0Dnxk718cxBNJ
         62I6eSUI4SQLl2PHFVHMN1Es6BmFMBjmMxGPFLh9kRsoNw8FMtJ95ZQ/+Nrgex3RpdWk
         fi8WSK3SXNhYlGqn/OBsDWYeeSTUqYqj598kx02S+fTyYoa3cxrfL+lFHSzDMU95LfSG
         GAEbZA8jRfv27vou39jfCxIEs+RaVaox2icu5/7wpKqSAtsyi4ZVGWeUQNkopKay3/mv
         ZyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyRtC6fp88YwtdS8NKXVCI4zc6NqjArhR1X9v28bGzGB2q0KZ+cCem/OYz9Zfr9RdGnXQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw42h7OTLy13uMlNJi2JqFxXEtt+7WfwYpBppj1tMHunfWrZ9WU
	6E+Fcfm/8BcwimyMfv10hG0JNPvfL4gfoCB2cp/ssuh2mLKeQSt0+B0O
X-Gm-Gg: ATEYQzy9cp9sMSY3O4BxSxqzNVCE4aqDLdzUopTFEo1Yvpbvlu4kH/1T5gd4VmAp+8W
	jLbanOacV6h4XZltZLU4oUGHKcJ2LbJ3bLpGxZgOaRW9KIjlcdK89nb0792btqFaJY9dGQvUM1b
	fTXYgIGRb4ZazcHPdzVBp2eVzIg9gRcUprk5SCr3siJv5J8cp74hCLd6UlyInzM5/zD+CJj+GuI
	PnvDCu2YCV1AcyIuj5OF/pbTTednZZGaaJjKHdI5s1dQLeAi6rW5c9m1wgs8f1CEyhmutow9OBW
	21sHrjegmiPOoL7bhhX53zthXoL0NPMGeZ3GIi3RRsLF/71GP8mYmWRzlrmWJMWR68Rr7NzWkrj
	UpkI2YWK8jjQkOC0rH/MygF4tvwxpJf3BY8uPqc9Ewpjd3KPvJHLAPSnXNfo81vxyhY9Zy8HLKo
	Bpf4LlIBp27B7gpaSKzC8cWyJ2TI3ddeITyz9di6xkdjNkgvqmb6EqDnzyv2Cg2KnjqQ26oyva7
	O+t1zQSlFTN5opmhMUDBykslZOopIH4hu9Nz33UWv2Or/GWbrKiGNQst9FIW8HyIMmnKAsZb9y9
X-Received: by 2002:a17:90b:5408:b0:341:134:a962 with SMTP id 98e67ed59e1d1-35965ccab15mr6135772a91.28.1772352383697;
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:21 +1000
Subject: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6cHMG3JNUtnOnhEU8P3mFxZpKZOq9r+mHi5Zf112
 n8W7lrVMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOrtJQz/LDoPXY//4G2ZqVPwOXFFua35oXjbRTty8nIZnjV5Ltrkw/CbjWWO294
 VAcvlGK7uLd4ovun4uwWP3tfumPhD8feCpi8T2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   |  9 +++------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..5424d4f16f52 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -24,6 +24,7 @@ patternProperties:
       cpu/codec dais.
 
     type: object
+    $ref: tdm-slot.yaml#
 
     properties:
       link-name:
@@ -38,13 +39,9 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-num: true
 
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-width: true
 
       playback-only:
         description: link is used only for playback
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.53.0

