Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01F1BBBD7
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736695682; cv=none; b=ZcOCrkLFhROdrric4HHvgHtvCPeMssmGyIgzE48TrjOL03GzdWQON/ZrKakXNisAATLakDSPQtJmxlEUrhBQ2WxQFg+tI0vWV2sJSIlMloChV0alB0QWRSwDeQq1/eXuZ3J6Z6q+OSlmtXaiI7D5vYhvq0vfHGuReYyxV8QPQTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736695682; c=relaxed/simple;
	bh=w+1HevnkSVnWipoDnFwbDZ8xG3ppmW7Bxk6nuXd0sNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tL/ToJ9Kjeirh4eX905wVKsLz1Om/xyN6OcdeyiXKAgbGJxNFnJW9WY3BdVCny8l/5eMCiGmq6Y+QR+014bSpUJvoGAvQv3GHinqJEl8AJjIKSxDmJTSXJRupDefHQIj8qg9L9D6tt5CQgQe6kyAznkA9rTUg+2mM7T5mcBNp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hES27ZfT; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hES27ZfT"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71e17de2816so1762235a34.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695680; x=1737300480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwdo4qQeCKznPv9ebQBvPBmgu2DZRJWGaG2NfRNb44U=;
        b=hES27ZfTMveAzBOosVYqHS5uaSGMLjNpK/8fHU204IFIGosVyGURJn/8dGfs1Sb1af
         5SMMiZV+Vt6jrfCHaexnDH4Pb/jFZfcb0725z8Qzr4CkAKYqtnIiFGT32+Gi5DVdH16E
         VeICgxD76fUdLNai6CPiWbh+X5PDLQhw/SulzyOLjhEbJICEbcHKvdDw1/fznAn87a4+
         5teQZ1K3fidzE0RNyurxGygwOfKFpINYfG+dRUddzDa6OVhjSRbNJDbKecdREyEx05bD
         4ndNkOfYA9iapbQIxQcTg9UhqUHJMktY+Uwsmoht0RykBLXl+XQjHMZD/krNRhIB9Cfz
         0tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695680; x=1737300480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pwdo4qQeCKznPv9ebQBvPBmgu2DZRJWGaG2NfRNb44U=;
        b=fIufbDA/7N33qOI1d+qq/7N2MsWO/YN0tJcZEARtr1xwkEHUyty4a3jZYJtHVPtm9H
         vyuj+hLdLo6ihpiyyQ0aeWAqNvv3Qb5CBnpt9AQ/zdrgJcIlnjQ3EPgaZzZnrOMDtsDV
         jFvW3cIJIsWhHsh0kw0DbjV3R1VsQwsC94XsZ33xwskuoQoKmhDloFdvYeam/X8HUDbt
         YbazPyPP3IMe+PQWIQ7qelWzGNWALVEXsMQ6RQDffSOFVWpJ4HdB4LmM0LIw6pEekekj
         oFisQQ57D4ASuHnkeEpqX/gjIylIEoZpnlY5cRIf6BJdrm83U7zF7gsHQ3WoPy/zN8HD
         VYFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+L5XhenJHPaZCf5fhsTM35Rh1BcqXFbCOHvddZXp+RYleUSwNHZ62X2XlfjtCK6k6Crw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAAzBo/7ypPUkPVULupgCxYW+SEJeEkCn9Em37p54PRpPiGXz3
	avahsx8KFYbfMzHDHhsnnSwN7f2KU2WZm04E/u7/VCY78Xi9tdig
X-Gm-Gg: ASbGncvWLqI/h+WKtsUH9qgG1KiR6Wa+2rE+KmW7koqozoXtvhX8Y8KqRuff97hW3Ra
	zJUVnfwHjZeQzH8pUl1n6KknlDO5DbzVvPbT7EXTde85T51yrlWiiZyDGaoagdQIjGUFDjY4wC7
	4vVDwor3P6LwhsydGq1/uG2ZORQ1ucSL6WERd0ljvcZIFBBHokgdC+76qcPCKJlqhsRZ4T/T8cl
	xyCJZljHSREJ/nELU8l4oPr9wtIW2wM4fHNbolR+Snwj9jqsIcs8K8DdtFTJBB4UfDdwA==
X-Google-Smtp-Source: AGHT+IHGgArEfN9u2RPH9RRrlk20P9prFqs8qFY9RW76sTAmV/urO4/B2SkzhIvQzXSVvGyn3gaIBQ==
X-Received: by 2002:a05:6870:7e8c:b0:29e:2d50:11aa with SMTP id 586e51a60fabf-2aa066b6229mr9191645fac.18.1736695680164;
        Sun, 12 Jan 2025 07:28:00 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80547c11sm2858083fac.18.2025.01.12.07.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:27:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 12:27:45 -0300
Message-Id: <20250112152745.1079880-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
References: <20250112152745.1079880-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

Make the CCM nodes to follow this format.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use interrupts = <71>, <72>;

 Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 423c0142c1d3..ad03c0a13e64 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -46,13 +46,11 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx5-clock.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     clock-controller@53fd4000{
         compatible = "fsl,imx53-ccm";
         reg = <0x53fd4000 0x4000>;
-        interrupts = <0 71 IRQ_TYPE_LEVEL_HIGH>,
-                     <0 72 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <71>, <72>;
         #clock-cells = <1>;
     };
 ...
-- 
2.34.1

