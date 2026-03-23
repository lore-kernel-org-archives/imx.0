Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD237F8B1
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255701; cv=none; b=WMUdroI8QycovJV4q1Z0S6iZoM6f4VOGUnsexkocSmm99J27sgMXGO92ZWw3eFeHJheAiTh1UP29iUnyPKpeAXhiCy/25w3DgXm4XcLYeO1eAr76u01BM4v4Nq9cDKwhVlg/xn+qCoPMUTR+tsniSZecHliQbY8r5s3AJGtkcv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255701; c=relaxed/simple;
	bh=BnHHgfi+YmfrLHT/dUq69ubD2Rw4c8iZpcGQ9pZBjr8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfK9pzG89igb+k0H9qygdLR4UeP26X7EEyCAenH3ElGEF90zHXprFnqUWTXZzHALC1Dt1xlPt+RT0Cxv/M0Sx3JecKUA8OT/yaawUZ13A4etjgzfYM+6UWiMoDOd3dl6wW+V8RgsHFdFND9OJIYSPk31BpezB6/NUMokjCFbfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xees4REy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xees4REy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2782841f8f.1
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255699; x=1774860499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiFXaq2KynT225qwMSd7jsUuMjJ4J3qIwVeyuIMFqQA=;
        b=Xees4REyjV+PQj64LqeTh48HlM8zQkSO15GCVPSHIY8H+kFBnihJQluMtnbKwQ8qPk
         cDHuarUxbNFHZ6axKKStlFXiFdFS2Y+5sGQmehsIbqPHeS7rqyG3uR9Y1ryyKI/h8PCR
         8PImBasPWmwkqjpmRI4/3ArFbJQAeMqQBSC8s1mFPzSqXNnptuKh/StG9aAxlJjGUTdZ
         KZpEAoPxjWWLR6vTF/HnQnImqCnU+IoxetjFtyUdGfYhOh4bFYi3WKKXtVbu+XOuVx6r
         Y+GHhdzr4yQok92NsjhhHJNzIzJETPFDlfJpJg6qMyagM+J1wb5OJoHG6T+Unp2NbBv0
         2l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255699; x=1774860499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IiFXaq2KynT225qwMSd7jsUuMjJ4J3qIwVeyuIMFqQA=;
        b=BP6TJoLAsBcS7uTyYwXydx0G31nLesbPCLZMLtfYYdpOfS1IiIom+igYrDof6DMSKN
         VCgURJ4gLX3Y+nOxXVn1SJmMciT2Ff3+waTVJT0yl6JPDrC3h9e5QiGRVzQ9h89zvpQm
         +3l1YXEz1Icq4nLkVKh1n6SOGfWDrgPcFdfaLhGDnfwxJOgmNqKdU9N5gucsC1hL7Tg0
         trRrzRjIZa/QB94s+93/ECu5HZT+LVAQlcTH7dBrvcp2qj779IbifsMVWwNxxuBi2GGH
         Xh1lyDMLyp1SQE8wXt98JTmL51aHUm9ec+26Qzb7mW95D+fxaDLWYmBj7+hreCkhDlRB
         7Fbg==
X-Forwarded-Encrypted: i=1; AJvYcCUeB+yWCCnGSnfEf759WBaUzgHstRO1FRSl3hBzQs0AFGxVwgIiOku1/sSQvQ1v62x00ZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiMr+kvACvyHNmThGagHsYmvp7L12qi/3i+m9bwBTm8eqaNscd
	nph+6ThIKFff4HFmsCcZEEz+UOZaGezTK6+djC6LRLazYmkGFTIwHXjk
X-Gm-Gg: ATEYQzxJT6fMbmnW7PEDhk4I6BVLjhFjfcDy1BngTTJDB8mOYnUUFNxUSBUvSsNVdp4
	/L1TomuAxLlmoYyApt2YxnuO2TCXRoBTMb71oBkKVxMSqxM/v6BLX+fc//NOapn4otPVVJ9UDAY
	CWL+bjROZxC7tMNrMld8EfzTE4nGBk8Jfet/POBRCSjDug/13eoIEYFdOO7+xV1R37qgSmyACGV
	frVTZD5H+WYfV1vHCQqKaYAqIcYQYZ9QyJUOCXdwLbIV6kaklKk6P396PtLQsJEyotQ17Nzc9tK
	xGXJVJxoeCffbZMDfL+6yC31INpA/CbwJfYXiNl0MysXGHWLXOicX2lFObYWYgt79PiGyEItTXi
	PhomgUeea2nyg2iDFHvOW8dgWanpbMH4xsOhtNSAuXX3161ah/3lVc1D/MdV3GMqVpkaxeCae9l
	2TGCrk/4GJSZv3
X-Received: by 2002:a05:600c:3f19:b0:483:badb:618e with SMTP id 5b1f17b1804b1-486fedf70a8mr160064695e9.8.1774255698607;
        Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 10:46:12 +0200
Message-ID: <20260323084616.10469-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323084616.10469-1-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Technologic Systems TS-4800 watchdog timer bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
 2 files changed, 46 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
new file mode 100644
index 000000000..cb2066b4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-4800 Watchdog
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: technologic,ts4800-wdt
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the FPGA's syscon
+          - description: Offset to the watchdog register
+    description: Phandle / integers array that points to the syscon node which
+      describes the FPGA's syscon registers.
+
+required:
+  - compatible
+  - syscon
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon: syscon@b0010000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0xb0010000 0x3d>;
+      reg-io-width = <2>;
+
+      watchdog {
+        compatible = "technologic,ts4800-wdt";
+        syscon = <&syscon 0xe>;
+        timeout-sec = <10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
deleted file mode 100644
index 8f6caad42..000000000
--- a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Technologic Systems Watchdog
-
-Required properties:
-- compatible: must be "technologic,ts4800-wdt"
-- syscon: phandle / integer array that points to the syscon node which
-          describes the FPGA's syscon registers.
-          - phandle to FPGA's syscon
-          - offset to the watchdog register
-
-Optional property:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-syscon: syscon@b0010000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0xb0010000 0x3d>;
-	reg-io-width = <2>;
-
-	wdt@e {
-		compatible = "technologic,ts4800-wdt";
-		syscon = <&syscon 0xe>;
-		timeout-sec = <10>;
-	};
-}
-- 
2.53.0

