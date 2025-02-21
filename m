Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AA253344
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165596; cv=none; b=Q823dKY3G3Zf5ss2VrDnwhKfQNRy7XZJqlbGgPpja5bPpD7wDT7qqF6Nc/b89wXnjgEhCVVn7DzOGaieTmIh2BAQhwHtwxkcAUrvofuZT+YR/SBuDJA/+87rbIcyfrNBfJKiIWe9zUZnm7pweOTBKNkIKFnfkXSfeQxuiJluc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165596; c=relaxed/simple;
	bh=8RjCHeGicpAI7VaTcNR4h3jndERCQ5XJEatYLWqDA0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lu4uZWa1Le94G1WYjWeeEuBfaBUmPvKU6fof8Fc7RSKi6otZXp51mlY9WKQLrlXAn49eKdL6HL7hpyWL1pzdjBQwPHKqUkdCX1SFd2+GRN8HeVlDfTuFHQCgU06H9cFRxaC++eNBZ/pFwnBF+fbvmGLYjPT7YqqCfqDkw3eBUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTyndnDt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTyndnDt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abba1b74586so371545566b.2
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165592; x=1740770392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZM3oG7u9MlBe7jgQYod3pM9eHw7F5bbi3sRetSKux0=;
        b=KTyndnDtQsx+TQmy0mmA7J1Qn4BxowYLDVphdBoEL/pVhKlftaJN86wafLgLOXaxoB
         f1QIxSxMdPMYz4jyEzXB8GRkRBLqarsFgogVoo2KxUqmQgsmSAKq0uFY2WdVszVrNvDv
         lbYDVVpWyvlxNQ13d0HbJpzhhViunWF/rSIWAdFuLwpB9JgnRLENsVPCpXnJ9tkRBdcA
         I4eISl1Be/f4qiww07VgIA+qrKS87BCDolMml5b2awokltbpmhIKb8M72jk8IV9U1Zve
         tsu72C5LwyaHFQZLoboYgpjcT+60f8fyEW8o2zBh4qX0G8NxJX+PkBXQdkjBOH+1OnQV
         KWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165592; x=1740770392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZM3oG7u9MlBe7jgQYod3pM9eHw7F5bbi3sRetSKux0=;
        b=Qgcu/XlYw46lsCLZyNcxeVaiTN9+cApx7Nq3B6yo7Jn2TfhhvDdA2VaPNKKqwwDrVf
         ZQmQgAkZijFlOZf5HcJazBBtgbFEg1afaaOc0v1uOAbcRyzM1gPiLWp+aX/4HFfBnsCl
         3tW/oc6Yulo2P80JB2S/py2HdE/gB5fDjKRMggM2TwnL8h06ba95m8tSVk6P8JUSDOgz
         o2gulr1U4RgLwbu/oydE+Db7k6hk8x5zr32yi8fnSh2rFPu92LLpKZYkhNun/mvWzdKg
         92byyZ7G7mv7xZIxvuBLGwyEHaZbHoOpzAXVeQD+qBEXp0Uo+BIIJSM24cajWiiUxXhk
         H//A==
X-Forwarded-Encrypted: i=1; AJvYcCUp4Ddk1V0vfQM+59CdZXxl9stvluuOnpb0hhopnHdnQcc/msREkLrL8W+PzgZ7His0RvU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy81yRYNjXYItsiUXsWVnEiFIiwxDZL+Ff5OHcxk8R3COMgsRA
	VjxPh/exb5EY6DjpakdPOb2B/GLVBKtjLWGWezJAqSfR5Avzl4aEGaCNqGJAs6A=
X-Gm-Gg: ASbGncvbys2WMoy8G15n9cJtNbbdQhEhmYio6ccauQfCgqWltebjdi+kQDNzXtUzcKO
	Vc1qsWuKfainr/FJdWeu/DYiT3nBkZ4VmD8Q2xASyKiEVt6/zJzgVzB9dNoIn78QLdg5EJFnaJL
	OWRO1UrwBOntgKPXlr1N9zrPiGbvu7liHD3EukxYVBtZFbwxx6VSGXlzU7Mn5PS8xbP+oYt+lyB
	iMQ7XhreKisySwh7hmTLbVJDP055YNvrylu+lWefsVJcj+jNf7l8nl5VI5bJPb04+zCzBlat1N/
	IhH54F8SDM2NJ23qgRtRHj3XpOwhobbPLrz1tz03ii8U9JDhw77zDLktfxk=
X-Google-Smtp-Source: AGHT+IFhYP8y5xpswatsEAcBPviWPk6yhTISADU0DuizXwbXYM7HIbRp4R+leRv7ntYUsYVDT1hb0w==
X-Received: by 2002:a17:907:9446:b0:ab7:ed56:a780 with SMTP id a640c23a62f3a-abc09a97abbmr474131866b.27.1740165591932;
        Fri, 21 Feb 2025 11:19:51 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:51 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Fri, 21 Feb 2025 14:19:06 -0500
Message-Id: <20250221191909.31874-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
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
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..869df7fcece0 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,9 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

