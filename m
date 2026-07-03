Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE237F8B3
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068391; cv=none; b=Vruqceo5NyXjyz8NrILu+scUhoG8B6lIv2FKsCD/lkkqg9ncwZcAX4AglMgRe9QDPvVeU9dcZwGXyGKBn4G6dHZLo0Gk8/KfacpoYoBZ0Jm7jzNtexCDXViF/IIWfcpkpZGUJ7Do/n+ROssRNXeXyf0rsTlcJI/1yhRAN0BKFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068391; c=relaxed/simple;
	bh=rcKMJehS8cUvmu7Wr9QE3dsbUNJSkKpdJsK13VtMdsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rw3Qhow3pjRrxp9pfwqYG7Ln4ykl7btjD/8cx1PcWuBolQQVZHQFiihPdoaEsHocoEcICER5WQkXHj4u3LJ20a4uyJlUHK4+dABjyTFnA5QWq+Ne9b5tsFvLCcoeHZpvmp9irToBg+SbqkX4/BkdemvJdm5ZbosjOAiBzMcobDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du3HLHmP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du3HLHmP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so1950505e9.0
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068377; x=1783673177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=Du3HLHmPW+PTvd9hU8DVJbiyubbpjl/YB9QnXG4R1oQkLpZBtPtYqC/YjyZ+xaVLqn
         Y8HiG9BzrQgRJxOQA2XYxlGfUtiF5KOOuywXA4DkzQaHegs5cEZpZZ/NC38efGvjK4bL
         2YNG8bUTYA3mTYXenQ04UG+B5CdZ/QyuablFDGGAIN/8n5E3VrXeM3c7B1XquQ9HzQ7Y
         gdkOiZDKxpzAMPO3tqW4N8fP9lRqic5FuM18a8QI7S2dwM7kEO13E46BMwFYLBmt2h6w
         ZmlvlQVFZD8XM6NSxrQ0bd76HyFqRQy2plfJQzR+nEB1UPbRMi1V/IHoSKsEqPpsqwyS
         rDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068377; x=1783673177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=AuvFnbwIKWl+ajFq+rGyu5g2oqco+ZDfFbB9HITKti5FXPODzY3IEWXcT67UcjDnDr
         3A5BuTkBL5Kadt5mbFeMRWZsosolia+P8OzQf6GBGzb7bsT5tgiqLU3JiQe0rAc59JEv
         WX09AlxvadZMoM2WAU/bzT/lj5yXprL9k6rZeaEoXQM43HQNyCzhxsv2dLvRJC9eajgU
         iz6hGYkGeHn/3H2RFe53PXA4kCz6I855n44lBbeKty6SYEgSPc2ubsd3kpmyJsFd+RbI
         LcA0905p2uZB2gkpQvEHw30yu+oOATSUGY425+bNlBmxn6gJqy9MhV2Dk9gISCV2SOfn
         4R0g==
X-Forwarded-Encrypted: i=1; AFNElJ+cePgz1UgskBKwZ9JOUpn0vcYs+1NJUiHVZxuFDSDAE53ca2iZNKK5evsINje18Y5ou8k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5z0FMPpQEj4/Xy8N1hKgWAp1b9NdYjm1B4wYr7yaj17WycAK/
	QOfF61kB+fgJ5Y53ZlJm+SupFbdSUD8XKfz2buX1hscgSk2XcrPAKJTj
X-Gm-Gg: AfdE7cmZE3zQVsgyw9ljIw6YF1AJ01rw6wJondehaMbpjajNKVdj3QxM4O0kUm9HBdP
	k9ALg5n7tuTSSLxrQHNdpLk4hALcBXEXaAuwUDcNAX+rEtqqnUZ2xFQVWCKSs8y2YNlnYnXu161
	SA3n3nTd8asxBiUycDuWqBM8r7jHPibt6gICO0tyhz6d4FeZqIvLqSbWS830lqHAsY/YGAG5orQ
	okpqqldARTc8zxg52TqU9eEqgtNIFIlIsA+537tUguwNk+TYEHaOGhjzluv+6KNQP3j7aZqyfm1
	TDmN24P2Iya+mJ/r7cPAwVHmjKqzGOQgMMfGDlrwuKwHcQpjdnXdUVZ4SXc8vG3sZOLqpYUWSpN
	UJcHWxW3kDZwyANYwQMQyRiaBRzqSpkgbJU0/MplQV+GS3S+CCYjhl0UDfmkARGvqUpxQRS/x20
	U4Oa0uasLvh2ZVKaBHSvXsWm2ypl7dYZC1JxLJcPAlWCFCvrI0sotL2snSOTc0DywcWZGEN+hKC
	ptgPvpYRI0cr1xfGfU4B972dA==
X-Received: by 2002:a05:600c:19ca:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493cce03d79mr16704165e9.4.1783068376592;
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Fri,  3 Jul 2026 10:45:55 +0200
Message-ID: <3bf0960b005e174b22df28ddf31268f0560f51b9.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index ff5f658b33de..0abc2d33e711 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3

