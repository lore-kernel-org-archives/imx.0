Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301F267715
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 22:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314730; cv=none; b=ifNlxll+RTpaR5qCgJlx4wS1xPQ6dVfSH6M3sHVByAVbXkXDKaGwW1l9vXVByri5ZhdCZBTD/ZLdpsY1zBxeR287z+Wu5K9ZwGEQncxVOBX49OY6Su5GZ6Dnq9TFQfavK6GU4IJngwembvImB/r2tQlG6vDvLqZLkUfMCjV3lqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314730; c=relaxed/simple;
	bh=9IiabNlZOwbWR0KxMdhX1H4jsvCWScoh399ys98j62E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=demKW9DOrpztz088mENAnYcgvCe/1e7lCGZgmKR4fZZAKh0KA0l+GBnVfod060aWJVDDsLo3dOxxWo96lrKP2I32nIB0UGWSiiqBUgRVlQVCDIQEBbsUp+6EQD9vVg8Ej1i7w3UkWIuqSD9C2x5my3RUsRTnrAkuQQWjySEqM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzlP0w0D; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzlP0w0D"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaecf50578eso1214015766b.2
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 14:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314727; x=1739919527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPQUrHxbPl4glK9O9eU6ywBBPx1I7T/6JYnYhIuuFKk=;
        b=VzlP0w0DNjBaR5lmpUh80g+fOGL8faRoOg/UUHIlxwGKEecxM7g6SJPjHLdRgV8/Kw
         dGDCJ8zt11E0VRu1vS/8KzLv61DRT1JfroWutNh2XeHliRdt9CLJo7/59NewBZjK6WlD
         PdyLsuR9ZKiVwFLAfAhcNCdyDBrv3Rna0MNJ++rU3mdHmgd0/h8DEn1QlR/Ciocw305a
         +NxGrc21CIK3I210CXR01xG6rBQcqHQC4fmKug/iX7599a/bZkkD/Jo42QEJGTADpAQQ
         S3/rAdJHhcc+pwDPxBtkxoiOVXcIbX6uajN8GrRM4XxS4pTKm5U8r2Tkj79xpiRvEhPs
         4+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314727; x=1739919527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPQUrHxbPl4glK9O9eU6ywBBPx1I7T/6JYnYhIuuFKk=;
        b=jLppE8CNm0bEv1P9X/iz9CKO8zkOo3b/8yervRIDAB2Gag2OgAmSLDu3wHs9gOGw9N
         HaL8qakAKrpVmdpKKVVmKCO6OrOYBh99zyP7NQXbBGI/M6/qniZBotl0Bs2m1q41N+j5
         GG1yabxJFr59l5i+0Z3ccEEgfPTjZBCotjqzxS1eqA4fW/w1Mwutlax711NbDkrMBUiX
         prlV0gCh0IVVyW/5fHyFk7yno5tHM6+R1e/wBUnm1lTKMRmK8iMDw0wkDd7JXg6UFUoq
         ZWuNQ+LuwsIhrfQs5t77OYbkbD96VpnRubJq6ZH84w5e2D/9+nvQiy6JQX8W2ABWpaPg
         O6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUGI6ZxMIFK4OKlFdzXu44LdVE3aesG50YTUrNdE4McXlWcbdTH0TdECuIafMuuucnZLEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHpvnGk8dMTgzywfxoguxTlk0HwZDbtGsvGNniBRdPN1JrVQDP
	2UXnHXx9SN2rzVOW/ApRmsBtdPtJLYxQ6riJPjC5sG8NhCgr5sbe
X-Gm-Gg: ASbGncuxLPZvrsNQ8KmjpUNo1RAZKOPWUpLGuyWcmzk200mtgtoTU90yIqpg65Osnwf
	F5I0pfZUOwuYqlyJtzicQyDDxCfHiRbuod8wHyNg7JQlBczszDWFQmHOPY9jgCjeyK2FqlK1mXN
	Mm+0duqcANzXLfFQhlICvaoTaFyhtCkB2up1uRDUJOkCC5YIJn8bTjk5n0ZQ2IpW6hDpvruUIyN
	VrD3gRPEGja1poyaB0RruiGoLQ9xuDUYSCQhxlti1leDPCeGri9mMp4nmMwUI1JAArxb6ZR08z7
	XgdusqZX5J0Jaoo/XHmpgnzGg6FKgRcQrsm/d8rB7pyff+zTFyA3YA==
X-Google-Smtp-Source: AGHT+IEmqE1LOzAGu3QEL/UkzAXihfpx2bG/CuCWu32huCvYMcpoSHU615QU9ED9pRm7TjRqIRBWjA==
X-Received: by 2002:a17:907:7d92:b0:ab7:dec1:b357 with SMTP id a640c23a62f3a-ab7f34a0d2amr68277466b.39.1739314726948;
        Tue, 11 Feb 2025 14:58:46 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Tue, 11 Feb 2025 17:58:07 -0500
Message-Id: <20250211225808.3050-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1

