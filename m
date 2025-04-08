Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BC722FAF8
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126978; cv=none; b=DBGVWSRNM3LLFN92MPmJLd9GXr7OoI+Y4zUg7zncmUrSqlz95Efjjq7EhMN8gpZvjj7FUMj1txNjQX/VIMt0vXaeoL6FwTirNNLS8wko/Jk5vClNkgDLRz2bmNnshX+3JRnBDQHY4Qm8Awlx0V+dahHcs6+cDGtRcmVZTsDnRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126978; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZupVKZ2Pupm5n17YMSSx+kT1M8TXItT2fe69awHDm5Yq+A2QYWSO0uw2OShXu3jVjuuBWqhjiqELFfQpo/aXD8Xyeu3qDEFMNOxLCyh/y8+pCsqBjH5RUZyihV/8VublK4Mf+Y7CmNI/zJBS8v55FFE3AlE9SvIKILTvQ9Qy0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c80+Dpmy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c80+Dpmy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso53550635e9.2
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126975; x=1744731775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=c80+DpmyUAfh+uYxYTw1091lV6HLrx0cTQ2ZZSQ/Y7XcV7dlGdWeBLQrNrsBBssahU
         okPQXvvQ8wiruxJI2UaFm9avuhdrFiz4bOmqf8afRiL+MglRgYJoQxI2emL9M1lVFhX8
         gwK6Ic5IKuo2pkHNBdDgGfwz8pksLb2WHFfXlzqjGEzKTrS6mEQ7Zn2qcKkN3pvrr+bX
         lDtl65uU1AMSJZ3SJHOk9sQGKe8b9XQ5eTHGWLIEQ6inihW0dWCnCdoCBLONlhhUw7lM
         blT7sL7V7hZ6tltw5/rJtCN0L5ef6/zpjLdMd+DKDPIhNGH414CtqATn1PJXLVR+KEeb
         tuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126975; x=1744731775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=bI+laJViIXLE31Kg+hpPysjFMC6DdWTagv/feXLz0wkHyjHjSarNwllkFneuW0zoPG
         klyRFh00GIozxz7D1p3KFYi6kDC1Oic3ptvbkuePyP4g7TaE78CicUk/Yt7Co0Zizg2X
         Hn/kU4dWJrEhvnNZ75W26+yEr0q0qy4vITHCkcmzBbbY2c3EI4BSOCglIqmtDKw5WQHv
         umm23CxfjMmBjEQDtVuJKttx7xHTpIKRzOJc6zusfZAf2EyIInrc/oP9wGlWaAaZenBR
         z5qyV86sH/s4nhZNnr5SWsn9G5yXICoKlA0lS+S8u82JVFw3BV0fVhIk7GGzEMnEi2/D
         8iVw==
X-Forwarded-Encrypted: i=1; AJvYcCUgbxmIb+RAzYZkmhD2AWPeATuThLXu4+jR4GpDgXEZ6+vzGLj+rInknHwlMWW7UsFXn00=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCLDur5xmgpN8jvrd+yL5NwOKzYbsz9Qapvh/SyZSZ9PXln9Cj
	loXvYMWboqk7oZxNOLeferjxWnwAuMeNRnY+8P/5Ut2xdivj+C9n
X-Gm-Gg: ASbGncv9Y7NP388LsSgrbK54MfJyQh1RHKaYwpiUcygUOj7X4y2EngkG/Nt2NWPIEnc
	LZX5poLq6uUZvu3JPzEgpSUPNl7ohtMj/uC56up1H63rZYrdMZZt0KwuFswBbmLJ0Ii18K19JKR
	CKZ/23bJV7JWjaSe4e8jjEulKu+1f+jsflvCskfNzRKswVd+kSvTaxcXzwy6QhCbZLTS4zzBOaC
	8bJ63Kv7BpIgTfbAkvmig163TCzzpTsah8QySlDBFLvcwjPJoBNSD8duJFF8H09xe7w6+Wdosz/
	QhbyGlcWuiWasW/ek4QIOV0t4edcZQqSNzHvqXqWb4CHQOqpX9mL40SqVIENrMz0qFndDzvFhAB
	6tMwgoow=
X-Google-Smtp-Source: AGHT+IEYi6zlzoKa/yDqzOVKsn45DDMykY+WgG+Uz9FkgPjhijbvcZRMIAXjw/tOkhVFBEr3GkyMnA==
X-Received: by 2002:a5d:64e6:0:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39cba98b7edmr15444584f8f.48.1744126974756;
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  8 Apr 2025 11:42:32 -0400
Message-Id: <20250408154236.49421-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
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

