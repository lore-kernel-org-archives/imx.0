Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F744D03A
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921487; cv=none; b=eBTCFgJzpY5N/4yKMRv7nQRhGnKA9hkgfy7gW+nrWkKK4N5Zp+YLYRdYqE5RdgW0oN009+VZ+KdhSezXGWDpdC+61/doX/O2QgZl0tyqoFPpicL8y+Imy1bCC/hhviNS+EYrPqxk89va5YZwt+KYo1bAVHNTN6Oc3uUUgwxP3Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921487; c=relaxed/simple;
	bh=BRbaKg0j1YGfSmfS2ryN0Aw2oduKrLhHck+5ZVdAPis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOnzVNNZVCqOAWDoGvbI1fQA5qOwGp+sXCgHk5+Jq501LY3nYQAAlukp9cFfbv2vpRgRVrG7n+ou2cd24kJOsl0rIeafhYzsnwBqveHzKdhiimQmwZmNTqmQuhRsJVg59VBefto/vXgPWVIBFa0MrZaolnH9AOSrD4y2zqx6Mxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En5Rpicl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En5Rpicl"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b874c00a3fcso867128366b.1
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921484; x=1769526284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=En5Rpicli6hsmQfp+Vwg0PktNMau9JmRVDYkZCxPepxrdP94Gn+806vluWoFQAJ0jW
         zL3FAqUZ6+TkmbnJa9jbYRWsN1hGk25KLERaZTPwr+/FKzm6lDqYnlt8HQjwQA/5GrJK
         xTs2E65yvl8IPL7xPCMe6/J0riI002Q82n0DhcgfGs2tKODMncwoR4oHbi1WefT6n4Uy
         W6bFjP72TaPg54xtEGUHzFulzy4uyAmsVHZcKoBxzG0Tq7bMfLe6dC5fehIWnLkW+4v8
         3inJ0EBKSksXLxFegyLZuzbnnZcnVUw2HdEn6yeErLhZzYZR77+FcShskH47MDtEaR7Z
         7gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921484; x=1769526284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=cPv3Wbq9Czmch4w+2XC5Nna8JvJ+G9PCMTufJliexHDMyYRFvEwPl0Ol3oUmfyfR9L
         Am791SYPGfd2MSFwfsj1JEo2mjvL64/Tk1ZRjtKsuuAWl8qLpudndOp7wUG9dB2Y2a6J
         Nq6geOg8HvwudmnzSzK5Mf26D+E00xC5CznMYUsv5KjoGaI8BxI7MHRxARYJU7xJ8F4O
         YsLffEBSMz3R+ZoRDfQQqjqxhlMvOrrk5qzFuFPG/MCq8bG5VIfJhOF19OvMB75JAXwT
         u9rufvieZQIiw6HF2q+a+9ElF05NHzcSLjrGuIvYGqfw3aAj2QQSlBO8PLLUBrdWMcJs
         tGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6kA8PT+UMal5wTHANCiOO5rEbgMjY36Yo/5BBres0bajtpyOKLVMgE3ny9lssKOzEwW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaQG4XGPWCmYIISlstX8zI2fHASH5rI3S5mnQWfqZZg+Yw7Imv
	deiAHc97CxMVUeW0LeTWXck1LAqOls7NpASL9Vs+cSBPat2ZDlh2KsPX
X-Gm-Gg: AZuq6aJ7eFwNPM5sA6onl9JRaSEW+37h1jk87u4ZSmfK9ALsdX37fyxGPAKxRWSjHMS
	IBAx0sABjKwdc/WxEmgqnDAdPOhARfhDSkhtrcOPg5tK7FAO7n+REt2unoye5EDbbUoulCOzHnW
	LGFcFE/MRnfvk0g+ELwNrUbRi6L8/Q6nusO7MqZRm7C6SzF/QdoZixplZfM7yKLol7SKTOU12ws
	dHr8kTWOpiU+0DTbYmHan3aRjZtWpvQyJ16fv/3ykEDwgUSvvSlPlhLA2nkmh/aSEWCPhQ7aup5
	QT3Yh5JhEqe617QVgi1xdQW9kIc4HJJl3D7DMPsU+2Og1Uije3XeGH5rR9qvAiZKgV/mForSavo
	wJEyTJDEL0k+WEse8EJtiudDHEX5dZo7JAg0QinCwPNvbabRU+f9xdgQtsPZJMDzmwwMNyTx1bv
	UPN43z9hlt/RbNv6JhYPN3ePPiku3HmhtaEalrsJL3pTm9LJk=
X-Received: by 2002:a17:907:8692:b0:b73:6d78:9b79 with SMTP id a640c23a62f3a-b8800261c34mr210659966b.20.1768921483413;
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
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
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Tue, 20 Jan 2026 07:03:28 -0800
Message-ID: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, the programming model needs no handle to the
GPR node. Make it optional.

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

