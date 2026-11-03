Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746120;
	b=bFTdzfSK/Dy1sUAUWb+KSvuvJMo/wRxpG4MH++pSijKiTgcXIkw7R4vrIciM87a2P2A+
	 ZnRuZM6l4HejnxyUeOQFWCTaj8GBLX05obUWhVEtXjpk55eTWG1bnrQ2DIpKR0x68yaRi
	 fk2O6/SAHm6DJM52pUE8vkT10vAk2Am6JsKaZZ/b4eDQiynuxtcNHXb7hJSEKYt7NC0bt
	 +obB+N+F0OVQ5P3WBAjrNgm6rNM9Lq2F/KxY+HB0w5tExgHAfFyUrYrT/oE0jd8NpvrQ/
	 9geWHVQais8tc7vczlM8Pq15XkBET924h/56ruk01Wgr78GMQeTZxlZkmQIzodIvhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
	b=tEbxk478VwyqSf1SNlY+U761Q7qMrptnyAOaxG2rORSDp/wqsUBmd3gcbaPIfuEzuXUb
	 vrxuiQ3AjA2QSDpCTdK65z3dz6Me2vxozbXQ6uI/AOZ1fFUa7yV6PtFyZNA25NIkpWnEp
	 XIp4keGA/luq13YqsVYXinPzHC4BgANvpclOv5PwlZ+m/vp5FwTqbWWpQFuULrMNG9+db
	 /VLzYUfjxWdrnKm9YEFjQrP29EhJQQ4uw+CjpKZpys+RMXsNBcM3ClgqvZarrcV7D6p+z
	 Kt0X4pRzSdtSVvrN4WEpB1bWuKWDVEttkpGMXk7ndZLwOuAhA51dHNDUT5W2PKXQxxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e6tj/o1h";
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2CF606A31B
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 22:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6tj/o1h
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c19c6721a3so28240137.2
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 14:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746119; x=1794350919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
        b=e6tj/o1hE+Ze/7PZxyxjDoiIiQ5Fe3ZtRo0CDe1MxcJcoxZMkSPynEIWX5q1bpDtlQ
         nd3zAnCxIPNdjdLGp3rQanfsHiFTbgBfkleR3uYYayR3rYvyteqTwDZv4xBMhiNHjAyo
         SGMYRvHsKXDwyhlvMSJTS0MX8mK4KGDBvtsFMJfK30a/cnWSXH4EZBu2thAaHjkAofJW
         Dj1x2S1kO2ykDakDcysVr7q02+BPMHQGHpuAdbbk3AbVAsDG1ZXvUhbFvAQxiYZvVO90
         Njl7f7yMHbLg8rvKzm6aIX1oV49WBE94NqyAoiNe5yhsCgU5okoFtmw/YUUDIgnCFgvd
         HSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746119; x=1794350919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpueH27K6JlaQKxGbcQGMz0cimxkNE7G18UyqQoWER4=;
        b=Svb0TUEUdcF6poDo1YkDybsbZl1DhkKPxZQvdOwLaqgZ4/m9+fAV6SdsQha/MLmwwN
         HRGrydUil24zMyPH4bsdLXo4HvEg8qu6gmdhhw9vgbiP3R4cNAN4Trt6FSwQSRgUrA1P
         zqmgwRQn6aAq14XP6VPxYye4mFWMjEGmAnAmcrPfmmB+c/vG+vo4BapC2byV7yGIjm15
         T7hEZgJbRCXWQEf4AWgpCR3CDv3RvOT7rcTFmowoRWX3KosLbJIftDJwLvJWw7x5VUmZ
         e8HVXtNNre1IQPiZ4IHowlyxBcJq3zj07jdzxIN06a8xWqVvhpWq6QueOIJW2RKxyUBk
         hCUA==
X-Forwarded-Encrypted: i=1; AKwUvBziuyTh/NY7r7/2bJWVe5NKFm/mpMtEDtq6yhc6yvxfRy5tuSCgBJavVXlCLiC9tdwCJRg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/HuZOKWDgrf0XmwWj28qhFUJQJhWlrw1Dty0eful8vSJ5riyti
	f1ffoKT5231n5uDtG07Q77BMvSP+DY8zo+3lqRGJXVBpq594qs307VVT
X-Gm-Gg: AYBFou31Dl8rF8VXszq5qChsrVlLwWNjF1/AutaiM6blmDut3W69uiiOVKj0XOnv75O
	8UltPdj3plTHiCph63Go2002tM3KL5mqj/BHhygwn8Kqw4KMbKz60GzB+Z+ouVMgzbDxzfNW35P
	X/Y9IzY3pldXbyz8TRA3A/alwWRzI1nSlue7CeYXfcBpELAt25GDzDAzCzTzjvrl8KkokFwn3x3
	icHIW34FFnsg0Ie5q0fkj2L2xXBtpPGTkr7TaYku9MapTlMkxdJzuDgXv1Z6RhIv6JpOsmXaCrX
	263I++6wAMScm+C8XQV7eZ3HXpgdtYcNqkl4232v4dzoqPT2N/ZcyGtXeew992injJGD+UpmMpU
	/46z9ulqrK6W/fh+HWN6iZbBQs4U+7ut5lRU1DkdJtg5l+6ltfgqIkINfaO/cC+y/+Fi1dpbmvc
	mpW+3XTDO3xZc6wqV19CGuqNPkUYht4IaE4//oKPT/axnKioNiooXAgoSronManK9WrGhMtn8/V
	Ta6/TQZBE9YKhGxWxWjxfkQfiyUii4A6deZGqCj+frx8XqhpYII2WRgcPVL5jkZn+VuV0FiR+9R
	y5j1GzzWG9VxOodjOHRnlC5FnQCt7Hl8mNt2p2WC0ze/8c92Amhp/sdZjYiVt3cLPzT4Cam5C6I
	eQLOv+ULeEDVWqWQJJW7bAbQ=
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr5937597137.23.1793746118899;
        Tue, 03 Nov 2026 14:48:38 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:6062:72c1:c30a:87cd:60c1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d69af4fcsm401286241.2.2026.11.03.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:48:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	luca.ceresoli@bootlin.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: display: imx: Document fsl,pcr
Date: Tue,  3 Nov 2026 19:48:30 -0300
Message-ID: <20261103224830.377009-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some i.MX25 and i.MX27 devicetree display nodes contain fsl,pcr, but
this property is not documented. As a result, dt-core.yaml reports
its raw bytes as an invalid property:

imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr: b'\xf0\xc8\x80\x80' is
not of type 'object', 'integer', 'array', 'boolean', 'null'

Document fsl,pcr.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
With this change applied, imx_v4_v5_defconfig builds with zero dt-schema
warnings.

 .../devicetree/bindings/display/imx/fsl,imx-lcdc.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
index 84610b5690c4..f1931436a4d8 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -65,6 +65,12 @@ properties:
     description:
       LCDC Sharp Configuration Register value.
 
+  fsl,pcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      LCDC Panel Configuration Register value used in the display node
+      referenced by the display property.
+
 allOf:
   - if:
       properties:
-- 
2.43.0

