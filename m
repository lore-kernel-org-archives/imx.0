Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594995;
	b=kwOJ0c5v6KtMg5EgkYjO7eLtNbEjhKVyxgyr6USWpmrqhCKwrl9kyU9Kh29127ddbef/
	 Zq8NVuFeFN3K4JoswTV2BQCdlxteku22WkTz0c1eG3qKsik6oW0TusaKp2EO7/t37N2xy
	 8yBeckJCFMH+I6aEMom84mjZcWZVOGhHqPTgdCb9aMT3Vg0AfNC5whB/0qoZq6UjGNrff
	 4EV/jlP5l/h07auXDjDLibKKnztnTAli+RhQ5YkVAGxO373JEHmbtg4C0oVni4P/zChXb
	 om90Zek8WIRh28WExqApPAXpR5THIFDGJ6VmOhWK5wWuE3JNwTS+CTWcBuqbPbQivMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
	b=dOTTM7B8R3/WQtmj0c59TwXKr5gB6keHBasQZ2UjC7P0TxLMerL2jRaMhS9GkDInSLJe
	 KVFfyXb/iOI0HFyEamvIBfmZxUt2EIir1WAXTqkmFEzD4w2oRwQ80U7wJ0X4oRXnKCMw8
	 yAxNmaMgzuc5/Hj++OPkHlvfU8vloZznIHS5U1i1/rrOYZIep24qcAVpN+QV1jmW4rwhk
	 8V2TtiUK3B2cdJzDMVCs9f0cuiDYk2IlubKn7N3l3HAGx+P3RM0HMSQAMl2kBN+9LT+gh
	 l/WmeAjSdfLhRkv7RAbnEUkAvLf099U5Qz2Xrw9LmtG4/zzk2eB3BTz4j8FCXsWGZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQYBhFer;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACBD606A32E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACBD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQYBhFer
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385c497bf94so2135288eec.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594995; x=1796199795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=sQYBhFerojRZiRuKMbVDOtY7dWy0+103P8beIOX9jLwRgKmnAJjx2Mabi1lOlJvUbB
         oZvbi5yrUBkFk9EUy/RSZt+lrZoIZyaeMqXHxIDqpirpvm6JKJyDaTMf6ea1buLRTtLs
         LBovRCv+mPOGOdJxZwjYgG8VeVGngS45vg6bwjyveSGBDKFMszV3U7FWVXCKRk2dnHQx
         c/c4fzCqSzJt3MCwEqrPqecXbTqDaMi4zSl5Xw9Y/s8qfVvb0c6sJf0rt2ScZDN26ZG0
         EyPAtVpXkZVsQAoHXvjudfTZAUaV5SpBug89o5SAQ9jyztwmhtco1i4dswgL2OTvB5Cf
         grEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594995; x=1796199795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=jUurvJ5JxHwIexWFewh+s1zCsSoQRhDLxlIdK1FX8exkmjPuh2+Hh1oPmvYYSSAfQy
         D68s6HxWSsw/S1LOQu1G+LQ+XY2tkr/6aElFdF7ZglERMxzjZ2LEJHMFEq+jEcU89612
         rMPCzjzgTw4bDeTLDed6ctE3o3Ykjg1wtUeUTPrIsUbkrFyvewv+d4W1sm9n/+7eV15g
         EA6UHOg7kktSmRBfo0itch4kzMHDt4OUvicybIMiI8LVXTDDv+/fKpcPRK9oC7Ww4Gal
         CdS/UTduMo+ylOSr3tYNaaGnKK9iaQwXdAdVUXl/2dNBsK19uIvg1iYOL211Q9DS4rNv
         rcvA==
X-Gm-Message-State: APuU4Z/A1zoAr+5eqJtzwkZyOdG1UG6FpvHqkfIVyYrKLHp3MS2HNRI9
	DAj7HCcxs4t+a7Q4GCx5WXX47yHb6+4tCScqZ2D9XdzGUeOzHd7rRWoW
X-Gm-Gg: AZFdTZd4+y57s894/t0/uT0s+Gvg/hDCBc/qu1ln8p5DOr1q35gPt7MkFOiXbeV8fEW
	9UypnZcPRahxELS9bmlcyDsmI0lw93bQyBwj2Au9pFG5WTY8u4onsd4vKIMHJabliHzvRVCoA/A
	lc+g5M8pMxxxD/LnzmJpDFRnXpUOhYm+uaftlSAHJGVaNOSs9pboCHHoY4w1XOdXa8IQCKf6Vz2
	M1SNGIP5B1MGsXvOexp35+PeQd8XRjQcXqF7cgGq5R3FzPJLXnxe/3Qpcd6yv5Yh4u8PuqUCWHO
	9w/v+zL+JcWRiJ8aIU/GaDVu+iix8/xMVyMin4ZZ9H8wI/hRQf7uuHCCF73SqxKDVkEzpbM36s0
	S1I4Ovr/G3gVbavZL4JOdKzglYFp5dPlc1nQGFotpc4SuBVtkYv044IdAySskl2AUUn/3gB9hd5
	8B3UeOpZz6DSzAosTNYn2vhuWaaG82mpoX00GGaJxs6Bg6mLXmvZqw0t7YYQ1nELmRJdL+eudMW
	GBa5rNn/xeGLROzKx4xm6ak1H3yu1ASEUrQAnsTLpVyMlUDeoK0PcCCyAoEsYDg5ruZEqEXdceZ
	zsIwT/tT6NNjn49KIJYtazptNVbTevSIpFjBPN6eCHSljFSmLqHe4ZtPLZCVuhKJoV6KihlJYYJ
	SIO4WpIiAYfCQ6wLD6w==
X-Received: by 2002:a05:693c:88d8:b0:386:954f:7c18 with SMTP id 5a478bee46e88-386954f7cf0mr14871602eec.31.1795594994538;
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 13:52:20 +0530
Message-Id: <20261125082222.136238-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
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

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1

