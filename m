Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095658;
	b=SoBgh9BFrlU3gzCj3JxfY2Ax6HiWLp4uP2FjX2iuNQkjU+eXmImmHHaOg4BksJ7TK1Js
	 rzxrnmi7VH/4ydsaniF4yY+GhhNLY1/MBAfgyL3QfFtY7F8jJGCBC20bCFppsNBXWNgGH
	 sdJih4KvvVTgPoO5tr7F+aV8kvX2U9f3ByOhrbWEF1RmHEus3sWq/AQceSynY7SEPk+R5
	 GIQNYNckR7HLdwuWh2GpaTVbLzc68eIRMwCBz0wzya7rEugS3ApxaCKDADjpQYecJ3dqM
	 Dpj0CtrcfU4Saxmhpx30+srmNX6xYcS56OjY20JUznzREKAHNGchc8Wi5wSwrAJekqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
	b=1JM+koS0H/O5/sPY4S8rYFFZqT6qHfhmYq7uFuYln6qiwCqYhUtKJJT0XVXx6xOLh6R+
	 iBF91UXuzZPO6sY1nSOEBfArpTd/gX/+u1Yi6HW7YRV+ANXRSjNOXJVZn7GL52Jla0tsE
	 FbzskJYMBwEzWVtDav/tkIj0eQp+kb5ERXMx7thVGxlgfdsQubmB5LBaTkg8Ot86ueXko
	 6A1unkZEP0A9WGfP5VHpHB1AvLA1DVd1hIvkz+QB9QpwHHP24MSewVJqyTODW4usIr8Bo
	 DwQWkvLJkjbXFJKWYsUanl62oSsdSLnfLbrwVamKjiHeL0rd83BWeUg0uTL7+2kzY1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V56804w5;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799E606A33C
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8799E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V56804w5
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so700337137.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095657; x=1795700457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=V56804w5g+Ym5Sq0PnrkSieo+2rQT6teuTcWXFW88pl/tCYHCLif09qY0BrNkjNWHM
         RJctwIAWpDLecuaoJjQZLc1KfB6sfI6mXlNeptv+DkS9s6y5VWN2WYDD4DPZPZ5BepDJ
         M3TUqVIB/XQ7ElCq7Xrj+o+kQv8Ayf7SmiOTTTWoZZYHrUVA+18DS1hCeGulpTXwMk5d
         vDJF9ewczECubD/3qx47z8x30zDsR/U92mnAlyB3ztCi51XQtJBgRTlClSzNzjlqMJSO
         k5fxfbJS7CleKXDciw3dA+swpnxqWCC13e598Jfs27p9l3ZrU6Fh+CT3js2xNGsLyIq2
         lvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095657; x=1795700457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzR8EHqO13mERGH6qlAcIvdtNywH2LjT8NBNjWxU6Bo=;
        b=jCj7WPz7o5oX7Nn4i7Cd5FYJ+8xpb/XRQE7EyY8TZDvONVzfV6FnFPQA48fvG2uqLL
         7M/OIUVv2LJLZmwWEn62vhYQIK1u/XxAJr9p/MnvS9L+PjhbUK0uyc1IBxxbeEi0JoRY
         w8pwczvwLzbyrb4Qt1Rp2QFy3RFg84ymXaJQbgSo9/vOjKuzqoD+xg9YZOypUGcrouhh
         x8XMuU582YqUXMUrIYA3dkgdFvPX0yZGjYChaKucEszkJ0v82JNHJB0zJcDkrujyBPme
         isgSMKGfCug1a3i2QMMw4qOx+6ZTy0j8z+8Ca9INACrL6aCyAo+goHK8/GEGwLcKkF1E
         QqaQ==
X-Forwarded-Encrypted: i=1; AL+hErFvFALEqnAqSL+IJ7yUPDPhiV786NtGF9FRe0KC8zS/j3MSAO88lMpGERwZnh/vjAX3K4U=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Zx8OFWy3+lUAIn6Cl2q/igspoO7p8Tz7+f3lZW96GZKlASYEF
	vtge11Lr1efMXS10jjoMkdg7qew5kSisttHbS9wkinkUuLoJje2NGscj
X-Gm-Gg: AYBFou0yoeCiEC9IpHaTobjC6lgNzdj0Y8CWG41YgFjxY24/z6Bi01VTc1wiONZCchS
	HSO6BhtMdjaDH1Rc44WoHI5pN/PJWBTzpf3qJ8rvq1RDcCkMaCcEjIgi5SobCapXqGPigdv6TL3
	SoxXmEE0ysTaZkTRj0pfhxe/iGnE0XXeHgyCJm8JH7qav4Et/YHXvkLmwJAudcbKj4bdjPr8Uh6
	7ILYeCPtuEGeCg/r8UbFsUcLWb5FY8640WsBRZ2N7Bpxopz1ohyKNub1ln2jkVmRi4bnlVEMyx0
	EyW2Z3cxL2sZkSlRjKRprYdbTgTQ/wUp44T4LwlFuF8j9nCTzTsTwZh8JYbmwgkCGknh1q9T4by
	WteHHvlkoGUl74udJ9rzz+ro2oklMDwblrGERPvaBTSp/b/GqA8bmLArJvqcwvTIycdRqHsLu0X
	WeqMZ7x4O7cbyKH9Kssl9UZST5ZXmhe6CS9F54yec4sNq6YzR4nz5x+Nxajz9JYk9Lm5tFl1gh0
	oz0xUdXdocpm97DoXPgNq1wnVbfJMkejt355AoZLgxQix64sk4IP77R5tOFkkXhNpoG/rHMU41h
	B70nVo+jXUlaLyJ0+4UMk1pQb6q6PpjFZGF2n7VvFdqjtFGJivFbQAwWx9xrUmqb9M1Dj+ohJqZ
	tixbugXzSz8JBKiOVtJ0=
X-Received: by 2002:a05:6102:578e:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d6db9e66a3mr319517137.25.1795095657332;
        Thu, 19 Nov 2026 05:40:57 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:40:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 19 Nov 2026 10:40:38 -0300
Message-ID: <20261119134041.16611-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. The DTS
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

This change was prepared with assistance from OpenAI Codex, which was
used to compare the binding with the reference manuals, existing DTS,
and driver ordering.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v4:
- None.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

