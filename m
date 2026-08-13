Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AB489888
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637470; cv=none; b=RmWr72wEaI84yHxa6sXrVRExnAaF5/4CgHVppcV2zF6Pf6TrUmHd3JzddO1UC2W0aOTvotrafKxQA9s6RgMN9bz7I+ZVaNi/5vYs+1E/Ygu7WM29hkylje3VL/BgYI44Wo4t8DSrbbePGh+ZGMYEEQW57LMyPvzbJ10qMb0rWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637470; c=relaxed/simple;
	bh=ZQgiNiqYgsBrWLZgSSsY8QzFfXicVpacPgeKKriczcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYqYBd4ISQKVp4Y27n5cPC4Esut/WXJu95ty/GlzVH+fLPJUjlAH2TF9YYcnWt+SV8LQNA84Qptco91pesiGh0uBdGmg0QlyAzs5bWA1XFRZ+DtLIoOZkD9+0iVdy9R4tSZWtHDzp8GegHheJXQUAHw3FwEEmP9vyx0OifU/IYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zoa/+7Oq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zoa/+7Oq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2292f8f.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637466; x=1787242266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=Zoa/+7OqAtnrRyKuBNQ29dAnNteyd+SIYUlv/efDWz0s7VC+zfzRepLiW3itodCRpg
         gZjQFY1XRKxdu9ELRo02ovxFGjvSP/r6+bMxaIVmt1CQJ+yh2fC6XFe5u2Jun7qBFO0U
         MUxfVBiScQxQv6qtugtPR2LtUfPrhDmqnk2OuS2JO3TKRAN+MPGCagZ/YPLT4ONv6asR
         4lcKWAiMp51nxksPZdj9Mxho4n4qX3BS8FraniVqwlzzIcVSzkXKrZjLaHxagxoKGGrf
         PyGf+QBn+Zt8UubnO2F976SDuXmqLffjKSGBKhL2soRDeq4xo4Dzvnw8FkzE8gDS4GVE
         PE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637466; x=1787242266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=A5D4LUY7ZqG7c/ZnE4Ktdg95D8dXnOXhYZcrr2OUGk26RgeKbhBppeUNnL6R+Q8abS
         wAwzaVYAvTQ6mjkT08QfWI6dNsDysEy9VkdYRRynoQgndG8Jcg65oOac2LU2FqHWFjUu
         enkrkwbU3CAP7QPk2Hs/ZW589jcPeF/Ey67gynUpEKaDIIYu3s/pPiZjeaSW4QRFKkuF
         aPzndBkQfKSuh45MkZ1nFbaGkl/hOJg5Ro0oxjNM3XO8CwX2Vz7bK74J34UnEKlaEFqT
         vC9T6iS6lKgc4I1TumihVxksHsXSV5bKrQg2FdIurxVWvOxh5N1x/6nQFk9UMjJU2noB
         I8zA==
X-Forwarded-Encrypted: i=1; AHgh+RozOeEbXLke37UYkjmkajoTL7G38c7CJs9mtd7Co13EEvtgSWeTaP3s8xgY8tpgpZWnOw8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya3PzbYk1s3A/OvWcEDed8+T5CHTYrqNnFzDZKSuDjM8lECsd1
	h6sGm5m9muR7qFg6aDSN/rSsRJYLrNW7o/Z+dlW79j/YNDpNCbyCezim
X-Gm-Gg: AR+sD11j6v3Uo9gYcvWW9tDXaX4dOPf1pKnkJ8Kon+Tbf6tkaNy0M/7Sd8mMOPzalyC
	iyYsbyItbje4zHkkeFhiVuKCHBaqOxm9eGaG9G9AoSj32PDZl8uTJDKAC+GrnsVndEQLqtnA3Lr
	9wFNYH6bMqlFX46/41rB36udZp3iDBBzoKKUjJ6a7mIHfMoRNwY/eilDx70uVOh4K6ZynraTaTU
	Jw2kCo2d5kUss+/xT0wMI0BwK8MopF37bxl69sygevkt+lM90KtbDVf1lbpvKDPu0GFqi3bcJ1k
	QJeyUD6qoEp14xTqDgEe/lTtd3wmtzDhSJYlVS3HfLIqeJex54++boFP8f6Mbr23VO+MehlXF6h
	HAB9MdpqJuZRzccXv5ECc3gUtG0AAEDdQlfJjTjyK0kYRd4IAc24uyiKf+1YCmaxMGzdz20uSVd
	sJeEBRDSS8w848ofhaHbbsH9qlpucnhSPBWpJ1IsHXWiDHhL8te+xM+RGEn/6r79+huw==
X-Received: by 2002:a05:6000:46db:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48159ca5c11mr7774631f8f.2.1786637466184;
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 18:11:00 +0200
Message-ID: <20260813161101.2274327-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

