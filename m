Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535A1940A2
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156286; cv=none; b=azkqv/0GebsP9UtlYloz8nDED6Yro2zEo55xqyr5s0qVOqeii6WT8pYF9WXO0XB6UwtZiPBNWJXqIhmArwpK2Y5ReJKbC0rInptxLmZS4ai1pWIbFg6vN1Kym2yNF43sdI6//tGWXSfDzwCcDl+8YF+HJwbGk1S7Xd77LRTOI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156286; c=relaxed/simple;
	bh=XDi/izkEsxpjIBfFcCl4FataBQfKvJR8pQmYDtefj8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tX3ZMB657C73xoWMnxKDgSR+tCZCR+qvAaQ6SY4madGxnN3sdJjtAF7c/ZT9q+opYBmZiO1kgJSbG6rKSiNDYoFrhJeTTmqrno5X68YGkO8cApqY6FEj+uRuJ9U2ljbMOFcXfvG1nMnDDUboSgZ8i6wPS69SGifWyH/OJCBw2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csydSRzL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csydSRzL"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso4067817a12.1
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156283; x=1731761083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMBRjHQI74d5Z99eEqTTVCC+GvOlvQ6t8L8FeqMEQRI=;
        b=csydSRzLrpCEQ+SpMIzLVDwl1UE+XwCJLkjAIa0xWbLSUlRHf4PTWlOhgHC0zWzkfF
         5ztoowPDUJqGcvjhAGpLACHO7m22HbMK7sXZhe8YSozrMBpWp7T5Qy+hR3loOQHYR4MT
         K8ccsRhxAtSAstBz5Z9oCGZCMagio81p+cFdNI6rFO46/KQNz/4+RtkhplQFRDJyR7qI
         lFDtW2vQnANJWiqEKZfqr8ovWa7JPwcLl9FdowEnW0SPup5V7qT66yXkDdp9BCatkTWO
         aIu5s3caPgl2Hg25rsuBmICNV8BB0smeSyjQI6dHJyWNYt50x/3G2nhhNKA5Vv2/6L32
         AmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156283; x=1731761083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMBRjHQI74d5Z99eEqTTVCC+GvOlvQ6t8L8FeqMEQRI=;
        b=ApjXpn2yTMGy2C9dhx7VM/wbknP4FHTGGgx601Xre+tu3+5FGhJFyLXk8i/bNwL5b9
         01w0NvsfdD5/FsZX3TwxVuJWT/SeGA4XlrpCG3W4fMkHOyKEwQ05bWpfU7RKZgJ1a40s
         mWotrB4QQaZbEVoi+HSgvNZwtOVY1QZ/BAxb3x27AWUdje0SOgUPeI3c4xwTvDPXk/lF
         OWrN6jlxyqDxs2i34LZ6ozEKrhetlT7Z5Yaqsy2ujPxC2RSam/GrmZDThTT6JUMkLZmQ
         LtGYNjixvygM+Xfy8+OkY7i+iz57rF5nhQoh2k1Ai8GarfQIEkqm1qIJiCLVsQGU//E5
         /ulw==
X-Forwarded-Encrypted: i=1; AJvYcCU2jpZ22i67cKczmrYBk3Lw98V5xCRttUGDETFtExrZIwcQFh9b3MeMXUG5OgqI0SUX3uk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVV3fZt5uKStNLNd6QgLpP/bY1k3OzbU6c6pTWScF+fi4tIvAb
	17ZMv3yEfxjd7fSbeSuogmU+yFh2OTSovqW11cJ2n0cD2vOSYj1c
X-Google-Smtp-Source: AGHT+IGHmXkaxvNLQkweBLdDmIhicVaPliDsIzJWNuOAzUgBi/pEgCPcvtCC2kM/nBeKCrbNxy/bFw==
X-Received: by 2002:a05:6402:4405:b0:5ca:da2:b2ca with SMTP id 4fb4d7f45d1cf-5cf0a32477cmr4494536a12.19.1731156283115;
        Sat, 09 Nov 2024 04:44:43 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:42 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:33 +0300
Subject: [PATCH 1/4] dt-bindings: power: supply: max17042: add share-irq
 node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-1-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1112;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=XDi/izkEsxpjIBfFcCl4FataBQfKvJR8pQmYDtefj8s=;
 b=S2oWIinV5ResTYdNod6KQGakhY3n2n115RbBezpr5fVJmGmnKyaCmXd8jZrZ+MQSaky4qbucC
 JOnSGVPtY/GD5N10XFrNG4mOf2wnORx+aMouPtcZM9TebziThuOZ1ge
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

If specified, driver should request irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index 085e2504d0dc..e98ffdad1ec3 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -59,6 +59,11 @@ properties:
       Voltage threshold to report battery as over voltage (in mV).
       Default is not to report over-voltage events.
 
+  shared-irq:
+    description: |
+      Request interrupt as shared.
+      Set in case of other devices using same interrupt pin.
+
   power-supplies: true
 
 required:
@@ -79,5 +84,6 @@ examples:
         maxim,rsns-microohm = <10000>;
         maxim,over-heat-temp = <600>;
         maxim,over-volt = <4300>;
+        shared-irq;
       };
     };

-- 
2.39.2

