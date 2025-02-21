Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5725291E
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165014; cv=none; b=L/Yx286zAnrc8W7LnWDQbd0S9XelqUNV8PPJ7RYc9CIPTcUNJ9jFEaSHJpmYVo52qEEaKMGkpTBlNQz3hsvBGk/I9YUxYOOfHTxkjKTn8cwkH0UmN+Wyx0yWYv+M5L9zoUXuA2nOAX9a8uV+2pJ98TDhwopgM+CG3Yp9nPBE67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165014; c=relaxed/simple;
	bh=LeH65yTFTRVqmDaRl1tqPoArVGX6tswmQUVoL+mdRu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vw5vJiNTaAHeUApEoZWqhtCV2SPLiVe/4Su77svj/g9NL5K9UbpbQXQ/unYCnwcKUX/tDyuZGLipBmN8pi+xqgy/dXHeKTNn0ydxAN672W5mSKbrv59IkmMc4H8W5onx3JiY9428xBcJP0j1wsaX4ecHMTC3MaEMV6lFIA9oG6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBfYh8Ox; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBfYh8Ox"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbc38adeb1so429572866b.1
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165011; x=1740769811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=567O03TXl1K2zaFaElzh+NHx2wBNM9WmJYIw4dMoWLI=;
        b=FBfYh8Oxkh0mYmznHkM5FIRShadkUpYW32cVXKYi/gB5ZYT3rBpK3cY2IgBag2mnHV
         Rip3uSVDUmAPGTVFi//9Oi5raOEm/JWOgdFkHcG8hRcjR4eZUGoVkrUQ6muk/VT+vyGf
         xEQJx2yZFJsySKYwhx9sVgle06gcOBqRVs7waDoezyyWE8R/KbNmoyI4g0icMuB8cEvj
         ewoqwG84JIsF0o7u6Js52Aomu/ASoesZG62YHZXuxFm3LB/5196XMm5/KcvrXs05D2V9
         sM4oQrlCs4J7ihPzqBd9G0dI621EyCmn0VhRFQ9w1FKlMdFcHUPMvLxC1amg3tdIO8Fj
         o48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165011; x=1740769811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=567O03TXl1K2zaFaElzh+NHx2wBNM9WmJYIw4dMoWLI=;
        b=uczQqz8Vzj3NDb7vSoDlxkoA018wVzvKACpKvivGghxQHiz7fwadgje3oBnNOq+Zbo
         eMPUgmDs03poQaO889HgAvx+/bjKiRNrOx9uAyGWLy3NamawbasLWaGxQPdlv477Y/9y
         jE9ISaUdVy791qDATVtPW/VHnDA9BZr21piCylFS02VwgSKYcKcKRSHm2NkmRRykIW/A
         zBNd/2vhR5DycSizh1vwhj33ZNQ7IrpsQs7HnpucwQ8e5RyCaNSPaVTyOz1f55ZXquBF
         sik+3r6afXFFhEisLBbijDjZrGh0j2f3ndR3x5r3NNx9IssUZnPW6AvOjrUbYOm+Bzqc
         nYWA==
X-Forwarded-Encrypted: i=1; AJvYcCWfmvJ+jI/9l1RevirPg1Tbd37O41YzpWEkl0meWlSOipXv0kJTVjOZBX+gfvLimjZAAB4=@lists.linux.dev
X-Gm-Message-State: AOJu0YylxElHhM8yMwYnIKpRIc4p6OjlNPTX+tBSUMMAjcfYUvMy9s0z
	WpemQ1zVwxNovzeSgiDYnEUqgjfMjuix6eUbdnsfZQAwrs9H6ajI
X-Gm-Gg: ASbGncs9iFrNZuZv2lj4Elv5Svx6E5mcFPjhyBBWAPZ1KqV2pgpdR7MsIqw34uUtd/Y
	CH6Yz4JtHv18niLtiwuv5GvJE9dR4nS0drmSVAyVqVA6g0mAxb2Ks4yfUoxCYZ/c6+qATJQ6oB4
	rCa+DpKkG75LiptqGuMxp41mTYF4CqUlx4v1Z3Peb7+9wXwsnqukKgalPuQkd3HNYEXZt69UWRM
	MQmuUbMctHUgVtJwV0MfZQHl37Z5FRG/aL3PfGF2elCdk3CllAdAmxXzDx0Rw2STEYb9iXHms4Q
	lRWZXZ1ndhT9Pj+3MzosnbWE2vLqDSmzZ2wxKdvZvQElv9lSuGmeEtDaGCc=
X-Google-Smtp-Source: AGHT+IEmPiejRQxTssIcrN88SLF0un2Lky5fZZJX36APFTjfjcJGDZ+uQm2T3CrIR28xRbfsva9TAw==
X-Received: by 2002:a17:906:314c:b0:ab7:ec8b:c642 with SMTP id a640c23a62f3a-abc099e9473mr411947166b.5.1740165010510;
        Fri, 21 Feb 2025 11:10:10 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Fri, 21 Feb 2025 14:09:26 -0500
Message-Id: <20250221190929.31469-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AUDIOMIX clock provider takes an additional clock: AUDIO_AXI_CLK_ROOT.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 6588a17a7d9a..0272c9527037 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -24,8 +24,8 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 7
-    maxItems: 7
+    minItems: 8
+    maxItems: 8
 
   clock-names:
     items:
@@ -36,6 +36,7 @@ properties:
       - const: sai5
       - const: sai6
       - const: sai7
+      - const: axi
 
   '#clock-cells':
     const: 1
@@ -72,10 +73,11 @@ examples:
                  <&clk IMX8MP_CLK_SAI3>,
                  <&clk IMX8MP_CLK_SAI5>,
                  <&clk IMX8MP_CLK_SAI6>,
-                 <&clk IMX8MP_CLK_SAI7>;
+                 <&clk IMX8MP_CLK_SAI7>,
+                 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
         clock-names = "ahb",
                       "sai1", "sai2", "sai3",
-                      "sai5", "sai6", "sai7";
+                      "sai5", "sai6", "sai7", "axi";
         power-domains = <&pgc_audio>;
     };
 
-- 
2.34.1

