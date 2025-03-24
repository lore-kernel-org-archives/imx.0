Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E50263F2B
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833816; cv=none; b=h+j6cgwa0T5o0Xas9Lx5SDPdOuf+RtzuMGH3g3GzG+tEjZreLR23BoC3G9qqUbsla/gjXm3MaNHie2M1VhxWvqUwYHhefRX65NU3SgeGE15eHhOJRt2EciMO5R6KAIwAYS9lILe2GBey6l3Qy/iHVzL7TU+g2Hf23i03ZgfUIto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833816; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GVzdfN5MKnr4s6CboK7sUrd5OoYD/jVc7cQX9P8vAptUmFyR4TmMMwrcRkFYFik8O9YqtVGA05QOtNDjvoSgrNg10BxhkOCHSwtvoEbofm6DFfckB3hK5xSKfilMn54aUilJjlyeN5XAO/ROZ7Trng4625jrY4sLc314/IbTkUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWmKZiMm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWmKZiMm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394036c0efso28972145e9.2
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833813; x=1743438613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=RWmKZiMmQTH/lXonwq4d3Rm5x4x9JW4UgNdMiAapaxu5hRgXZBu6JTlT0U1FPV+jvu
         JdtoOtHmZZMQ/BpkilJWB3wOpuzhwykNd5NEOYmbGB1Z/VgYg7Yhxe5I4jA5zSrIX7rV
         FlS1pYRQArmwbWSiSQSsZO/ZiEveM8brs7ImY/zePGd4XFQYjq89eXsjyfYu2qb2/9HW
         hcgWfDz4hVEYWNDchcSUFis+o1jJbTwNbnTKU4c2HWrFaTJ98fV8Ohc67xLgSEChjL/Y
         6xjJY7pz2WykY4Vf3moccfa7luurRjC/2vY06pCFYm9VImpWG0xrfpeSHZVDXbu4MHIs
         LGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833813; x=1743438613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=ae8ilfag5HiBhXboSB1mW85hkRx40ejdTDhebWgsUN1V4wz1ML2FzqFo2NZpsslVu3
         faTcc22+S6Fk8Mc1bShvu8ZD4bOdUtnCAGMLHrsgljeYE/4HoFOa8PK2Ap/l5+6J/e6Y
         vb2YUiN/Bgdc2hg4/Onaj9VtBG1vu02+7i43+obHk+4RA66Jj0KP5+DRDfrXT3/A/lcn
         F/9j9MaHj+EhnmRDWG3FZYY1XvREdULK5ArXbQ1TleRIjLjbFIANNM1r3KeWsPtRGPrR
         5bGU4v6TJQ4+Gt5iRf4SY0cnEGgWCDb8PSQq+vXe8pitjkDtjcfqjb//D3V4Rm4EIGou
         psMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH3KhiYFCPCIHrKiF7GhHMqyJZkhiPsjiXafx4SRsmi3fl2wtvTiy2fHQD9a7EwFOjGA8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl9NBXHeK7FyCG/G4hOEtYAkYq8Z8CNCgsHKpMKnxkvcflEEi/
	MQlMcaQZEugGIaftUipsObGYolQeUtOcpYR7za0MuOMGLo4lY4bD
X-Gm-Gg: ASbGncurgWuUqrxYFavTRQOoy5K397sV/bM0JV2OOiDApIpHm1nELdGXrbir4LdozhQ
	2T7Iz51KSRk0sIJYrf4eAaeC4lwismtwtORjkfcM7I9DmQgyqNm47AE/GeC7wK2B8in6biwlv96
	wvXX51sB0z7qcTbgIniEkOKtEnjNo+QF8B76dukdqQMeEYdHCqti3wkKJeKiSLcG9pMqxm83/Qw
	8GfFzwIVNuRIAhBGvlizAj42jsQ4LMvasKL2ue6TF1EIOSbHBZNvGj2sWTQVDkZR1YaMK5PLK7B
	yagcB+TpYAWmOV3G07IcMqbyb6rzaRMLMTfWjqHPX2mgL37wUKPA+T10jcqWQuxRTrq1G3sLvgM
	cyltEzVc=
X-Google-Smtp-Source: AGHT+IGu6fTgDwofVoKRjp4DA1DLbpppRHEZaZIgwdT9HARin3pVTWNzJxo96bidLrG+Ulb5IFSLDw==
X-Received: by 2002:a05:600c:3b9c:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43d50a4ca6bmr119432205e9.30.1742833812679;
        Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:12 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Mon, 24 Mar 2025 12:25:53 -0400
Message-Id: <20250324162556.30972-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

