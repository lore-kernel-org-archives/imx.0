Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4E1D5171
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111177; cv=none; b=kmAz2CswkGe33Fc7Wj92SZlqeAxajJ7R7YonzgLQVOoMq/CkT16WcgixuWMDDw2IwxRTgRmVTcxkudkOLwt0PpZnpqtS6ywd97xhUAsj/c6vihXJ94AuW9N/69SgEgO7hO3dwJUS34vkMj51uLxQDF/bPhCtNVnnZkpf6Lv8PKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111177; c=relaxed/simple;
	bh=3RJbrpbC6Nxmr4CObGvh2EeJe3fwMHBQ3Iide/lIGUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcRrJHaySXi7h0lihJrh0NXc2bfqf28zsMKrYLZsF42CPmk5dJ5FxzOOkWO8dw9+6HMBdd6wMTucw9oEoAu0u6Enr6U9LjY9hbZqRb1q/PFD4Q7816GWkneM8i+z7oKTEkupZ9oC8MbWfiV2WBiheGQxVP2o1hcEef8Lx8QdQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Pg4VU/Sq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Pg4VU/Sq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a3dc089d8so614057566b.3
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111174; x=1730715974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kjaoDHO/Cxmm9XfSkRfXuiq2XlHBj2nIJAqnJTFngw=;
        b=Pg4VU/Sq4JRFliH6vLhaWFcDlWWhpEbTbnbFK2d/SrKuosHhTiu7NCAU7V0qNN1cm/
         iaSIBlgzH2B5GNZgkZgemTPom9I2nDHlteR2/PqDBJrMZUJZTp+HKnRhTwfd7eZ53UfE
         KSvEIBR4p90r/sPdUTFEefwYRuetjwFYl2D/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111174; x=1730715974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kjaoDHO/Cxmm9XfSkRfXuiq2XlHBj2nIJAqnJTFngw=;
        b=hBNqrSehxGyO9e9hOFmJhiuDhDNU/hrTBzCou7tBRlyx29occspZkrEyLj9LERh1Ok
         ZhYvV1arSWl09b9/ed4PHrgyNsjqJHCwb2Yh3sJtJv1XxYO+8WKCULGzpyFu28umJNGW
         unK4oq8AAzXomdR3Gb3V8z1AWXWi2l3hoNuKYyLWifgRltciCoTUnxQRHFpea4853SBP
         MMVUqVnGbZlTZATkFjjBrTgoMBqXnHlTqdnUCSAtXtTdt3W135kesQ6t102U0Vp4iZj9
         FRefRo1WSIewfsFIdpw/Vg7yxCMU+J94+JRPKuwwtq+SGBdbr1XNJnyb3w/CqXCFOGSq
         p2iA==
X-Forwarded-Encrypted: i=1; AJvYcCUW3OBHyod/65kMeHSnILalhBoKSxhFpr6wUtZ3zlg5EkQf1T+SUOR0hI2fW6hD/Eek7DQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyffF7/K2e+Low3KswSJakptKwvIBhEgN/H7AHv24uoLjAPs9qK
	dMfv8eX7VEdlSmQAPzMk9GZtN7ftqdOc6oEjowcZl1SqH0ERlwv+mIZKhaSr9h8=
X-Google-Smtp-Source: AGHT+IEYNCvHyI4Ub76KdqemIzRCqERBXA/yyqTx2llDK0lvcsPc5x2y/hbBEKlGhDYQLy/s0WjfIA==
X-Received: by 2002:a17:907:9721:b0:a99:89bd:d84a with SMTP id a640c23a62f3a-a9de5ee107dmr668398566b.25.1730111174240;
        Mon, 28 Oct 2024 03:26:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 03/10] dt-bindings: power: gpcv2: add 'fsl,boot-on' property
Date: Mon, 28 Oct 2024 11:25:26 +0100
Message-ID: <20241028102559.1451383-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property states that the power-domain has been initialized and left
on by the bootloader/firmware. This information becomes relevant, for
example, in the case of supporting the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
index dfdb8dfb6b65..718196f516ad 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
@@ -94,6 +94,12 @@ properties:
             minItems: 1
             maxItems: 4
 
+          fsl,boot-on:
+            description: |
+              The power-domain has been initialized and left on  by the
+              bootloader/firmware.
+            type: boolean
+
         required:
           - '#power-domain-cells'
           - reg
-- 
2.43.0

