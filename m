Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708941;
	b=lZrU+TVaez/ssgaHzGLDJRmsyxg9QGjdevrJxTkf8EA4hJXWhkq6D5TjINVzqkwW42ef
	 XWDEHDJBQ3iAyyYb8MGJrHtCtLTaqH8GtEwtCQpNlEExTw0pbCHC9cthfCaSO5kT3YYFI
	 4OUCbAEHfkJKAUFnFquUy7r0Ko8nXx444t1V63g6zSTdyh/21LjeM0hi48qEK9bZ3z+g2
	 va2LyocXC16ylgmkcGHYvv7ZOULG8hEIic998PspmqFtj9/GQ6M45XbIk86qqQC8pYAQw
	 ao0OKrc3JBhOJMSvb5kV/7n0vG8mSzsjPH522RelRqM48wxI6upYmo0SkpQJK7E1+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
	b=X4hNrn7DJEA557qAS4NwrI/DtMfEoi6p09Ev6ae9RZdg405zC3QH7WUkdbt/kSRnrCtZ
	 53caCUZSfQxUOdDFKT0sNx6JWRZHZNRULVyQaQPthvahexyNzlO21REQNClRJwJqy4zVF
	 T5/28SeUfPQF/BRXxg85YcZvSm6Q9gslwxzqCpvTXV/xJfguIrCDCFUPyq9/XFtJNW6i5
	 p1eQNRzCTP2jXYTy3UUcf2HebU0WIpYtcNEEFfj7RfnrmrDWvZVV4IqG8hgPmYLu88bCY
	 Y51sQV2UnieS258cK/gZ8Q80/UbHx+azjy8dZmgHzIpVuT3513p6eAodWQeKpAUxqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5NRiw09;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB7606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5NRiw09
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so3210021eec.0
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708941; x=1796313741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=U5NRiw09mbuoRSuSM4lmzCkEfqlgemwEVvtN5ri0aqKmnItof3kT/lV+Of4phZI4Y0
         CEssRYR3IyYILQSwjCqtigsd77pySll8VJFfHgfMQY8CWFB3af+Fey/xiPbr3oAK3QbP
         7n1A+NyJFNs4Z6jWCSFsmBF7UgcFRRp5oXq/jMga529TNADGJNn0U/lmAtBPIkgJjDQy
         yPYoCjfyAcQvaB3wgocJ0vXvoZ+tXdcsX1PuTG2dXybIB/G8uTtPinHtcd0GpKpgdF+h
         6luk8xWAIDflKVe0G+/T17OugFTPZ/qWg5v7/1V/C2T0FSmAUxkpLpY1mdU5NrwLyTJ3
         l54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708941; x=1796313741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=HQbuCchKh80E4uIbCWKJZdWisa2O1lVTHGKj+LtZ/ewyzUTTcqxoWi2epYDyGLyt4P
         iyF83HQ807ovellYreQcKkK6VBAdBuCYC3VLowx52r+WXGeVH9C0Kquu6tbHNC2fg47a
         xd45dAZWq/9D2e0x2q4oy9ptVro3MfDGBvHsQco83Nywq/fXxsW/hhucSv61uUG1UDBf
         silek9lmEWT6CKEfiHjPm7/Mc/s6jrRXbC7OdWdcnilXvd52C1VDhEmwn1oopt2I+Qpc
         bGxWVkboZmMnFRkeY/wSM1Mtlc9DDaD0lIt6oB7glVGLrHQCC6KSME2j/67YG1PGmEO/
         QKiQ==
X-Forwarded-Encrypted: i=1; AL+hErFzfIPK+yT7JV+Lr+bCnlDmKSf+ytkXFAECSnDJOO37FxOpcWDqmAy7ya5sJKSp1Yhqk4k=@lists.linux.dev
X-Gm-Message-State: APuU4Z8I2NJPVVep5iYEkoYiwRSSlBVKG9QYToSDt0NxsaHt7xpr8tRb
	iFg8tl5t1I3rI0hxqxj9uIj0I4P9609kL+e0Eb94AovM45vUvDzvI5nK
X-Gm-Gg: AZFdTZd4qDbUa1d3eZKukJMa2nXhsPs/OkSv9vSzmM0gQjA5uMLVVX5ajA1EQ9YMJp+
	wWsl2CBcPpltwRdJ9J3150VsAveY29KMUQ620IvI9Od3l4Suq1lQ7kE+1bFg6VSdAii4FSD0dDQ
	GkXNIXuglHzKvSi1fPJrioMzh/SI1+eeqQWPDPBK72euWpxmI4yMDACeWYnwc++eXlom7ckQppN
	gAM/PiDWxQVG2RP8L50u4DzSA0GQcWbh6JsxYVp1PGTFIREunETkdV1X9k/lGGzYdTx5sqrlL4k
	7KnOIDHJbrlox3rvliKF+dmwkj5Y7z2I7D2g2VfWgYQyACoxebe9hsMW1dhmT7hFUj1oU4qCMOr
	Q/LFVFJH2lhNbj/4GjZosp0cy68MOKyxowvWss0tTM6MNvvoXABoLClVWpoKuIzrK+FApWa5b8G
	Z7s3MfuSpgXJGsYVLWQ2I2AY61dZy9TivQ5Uechm5+Oja7dDnh4oZiqQzoEWb6io+1QOiBc8SEd
	JoicVnE9Tpix4dieuz+cMOKyLzyiUV7qjVj+MLz7wn35PC09haVQUzh6DuO0Eq8Y6Z7ine8r83A
	dx0U2JWF3m+Z1JfouNWoeTH6VR01tKQJjVmTyr+X7qfw
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18510797eec.32.1795708939894;
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Thu, 26 Nov 2026 21:31:00 +0530
Message-Id: <20261126160102.52163-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1

