Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818F1A3BB0
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306468; cv=none; b=DLJa+IQJ4ywvUwpgNhMSRM80umDF+8wGhyMtIj+X9tq+JvJQu3FWIQRw9ELsDVDh3jJ9o0LMEgkLogYRlDnSf3wrbjjEOv0MBRE699WGddmUK5g2NS4WSL+I0t9oo+LFAGAZninYFpUQyt7l7d6/XBJhFMjZfwKXTh0XGU9JqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306468; c=relaxed/simple;
	bh=UZd/1MEL/0YGVQ9XZev+SKB2ICbqx/sGLsFNGZT4cxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=je3PUundHRcCtJgUSQD25RdAGK2PXe+ECWYXp3lppLsuI++ox27B69lSAdFI4twFxtmOCa5XAlMZD+ZaweEP/sys0En4qA20WNiCuwQPw0DIpIuGDGv2z5y9i9pmqpshwd9NhnhGUc4JsKiO6j4LS9pwYuJicUhQoGRDc5TStG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG4OCrax; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG4OCrax"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so3923671fa.3
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306465; x=1727911265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bogDjOZyEOHR1iFYz6hiM2rDuEVzKCPss7f3ehg4nU=;
        b=ZG4OCrax4yzRY+pynAHQ2QO4RwJ/+fP3y+JL38dSHGYzDahYHaxDfGJ+1sGCDq0oyG
         0kGiJKnKdw3M21gYp47O0ZhiYR3IlvZqRSjEwJOxmnwDw8ndf8VxKZ+6WSuvAxdSITl3
         5PtrWkBpcg8mhPFfc+WO9KOXYJj7dmo1KaQfyyiVHI+sUTbKSTJa648lJiloH/9hQZhS
         e5bwuiYExsXfS3LcAlZ/kASEiAP0FXizkIKLyG5C4dXh671ORDzHLe5K9jydWeM67/vD
         AxsYCjRebkArbFYr2Uex6tI6JPp63+PhissX3l2TjU8OZIKBi4/u/wNC2fa05ZSYn+VB
         zvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306465; x=1727911265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bogDjOZyEOHR1iFYz6hiM2rDuEVzKCPss7f3ehg4nU=;
        b=MQtN+Nw7U6teK/2xxF+/9p7J9N6m5kBub2anbU7kENI9+otowifa8yaByXj6fgaavc
         rsUufHAHAfL/xDbQVlAbj35HosjKw/BJ9I78eVP1HZTnG73gzbvnpoz3uVN6AjusBWAQ
         F3RkJ+fiGhy+zw9aUfR37nq9UV4EsfEfc6cRM4O1qwAbFwLXhqHkHU3oMTxqKlMB/wWz
         +FVbhOGq+NNDsyXHQEPAx1C+07ICXcvhnSoCO2RtC/O9YiFOWF4ne7abv0FidGjBjT7B
         nG6ew/sQkjwLPQdmm+QRd8ke844hYpj9n0YNGJjHBNPUrU6QT8MGJ94IHRvteCBKbv9v
         XhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUqBb7i6jvdw8stIihhQ6G9btZDKdp9ete7uJpyxjHQD/A3YCp5zAf8V2W7oRUPjUEVQ2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiRhq2udmnPs/RL4WOl6KDYeNpoRDYrGJ0fJvMvbI2SqxjyQd+
	eONpYwfVWskdbyFnSwtWyauPyBjkILeMHUaOEMkyrOTuPhvbIVm67jWGZ6pv
X-Google-Smtp-Source: AGHT+IFzysiJl1nP11kbexTXDIA+NNLYwV/h5+ijVjWxUUQVRdF/d175iEpJG9U0C5fsGowcn2S/qw==
X-Received: by 2002:a2e:751:0:b0:2f6:593d:36f with SMTP id 38308e7fff4ca-2f91ca46349mr22985561fa.28.1727306464388;
        Wed, 25 Sep 2024 16:21:04 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:21:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/6] dt-bindings: arm: arm,mhuv2: remove power domain from example client node
Date: Wed, 25 Sep 2024 19:20:04 -0400
Message-Id: <20240925232008.205802-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
References: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The number of power domains required for DT nodes using the
'fsl,imx8qxp-dsp' compatible is 3. Remove one power domain from
the example client node using this compatible to align with this.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
index a4f1fe63659a..9e878c028036 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
@@ -197,7 +197,7 @@ examples:
             reg = <0 0x596e8000 0 0x88000>;
             clocks = <&adma_lpcg 0>, <&adma_lpcg 1>, <&adma_lpcg 2>;
             clock-names = "ipg", "ocram", "core";
-            power-domains = <&pd 0>, <&pd 1>, <&pd 2>, <&pd 3>;
+            power-domains = <&pd 0>, <&pd 1>, <&pd 2>;
             mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
             mboxes = <&mhu_tx 2 0>, //data-transfer protocol with 5 windows, mhu-tx
                      <&mhu_tx 3 0>, //data-transfer protocol with 7 windows, mhu-tx
-- 
2.34.1

