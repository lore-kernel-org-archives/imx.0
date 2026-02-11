Received: from mx-relay128-hz1.antispameurope.com (mx-relay128-hz1.antispameurope.com [94.100.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3698F33B6CF
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813366; cv=pass; b=nKqFjtyM6zYL/zhj20naSGG4mNmU+oOMEgs1BkkGg0dVuF/Ud1qW/QWTQPJHoU8OJEaiSbgQOa2fEk49+TD9R5X2mvLf8tc48Zhsi543XBjEHEOSczka9wvbcPb73/QBdhItVrGZ8xIRWx+5BM0Y9xB9JoBRideKvSgULsxrhf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813366; c=relaxed/simple;
	bh=VZKGAiWgFqKvUlRhNiG9TSUoowFI3whqpIuUPg/BfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwPcHqv5MXsbJ3lX9WCqGTYLo23n28o4U5p/liXX2ZTo1ItVj4nWvLzLyRy3HVohOaNSwGud/s0cFaUO34Cc4/Pd3hnCksXQXdpCgINKcHI1cXnRJhLY4bt/xXYddPDuaA5ZZt1pfxk5Vi5eH2yht2TKsr5uDhv+POFPgBC0ZzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mKAxsY9y; arc=pass smtp.client-ip=94.100.132.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mKAxsY9y"
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813300;
 b=Gb4pXKpqoDk05ie4jB6dgM0SW/FZgSZX1DSam/aBtQoK/O1ml1DNDAsOVhk3OzeR0ElTAJXT
 eBOjXQhmIJOI/HYa5P5N0Caq/AqxD+KD0sZT7/EAEmFVyIoMS4hIB3D6PQLd7Uez0MU7snWS5mw
 yVTAYjBkJh86qQqnR1uK7PSXG1fPiYqtca5mXL+krhi/LzT2cadGizaVcKJ9Qfmz3k6XoK16m0+
 pIGcqdnCT3Jx22DuZDeDCrEGw1ai+xOZU8ulxVv6AfXKswcgtl0++SpKESGano8rceQz/XeFT4a
 dvNkhighLEN0YiZcbrlN8AwW9BO+dO3EHCuo24gVfBNRg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813300;
 b=QlSMGMuLd6e+bJYnWkSqCR4pT9efPANA3j99/jxbDALjlXuGDwB0NxaqUztizEyarZg/YqFB
 rB4Bzaqe/sG11XGOdAlYjYBTGM6I8yiCRlIxvJ1dTNCj1mrnhhox+eVLZTPtrJZ6sEZKZa9h3ld
 QbwtSygzSNAIfMKs/A4M0QVi2tg8n0wJQ3uLV1p0AWWrFx3I+ASx/FprTBci7xYDZX6DAHc+93H
 UDy+9eYLQjC/G237o3f2LkawhyFtaB3NLeuXcsJHkvp6RdGCApY3L/b9Jwg3hKZPYfGNzHDS38D
 ASMqH4iJuqDmnqY1SrABA4HTPAUmq2T19ch9qJ1DWRQ8A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:34:59 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6742C5A12DB;
	Wed, 11 Feb 2026 13:34:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Wed, 11 Feb 2026 13:34:28 +0100
Message-ID: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4f9yYc4gf8zvb1m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:127a990275954f2aedbe66286a895387
X-cloud-security:scantime:2.345
DKIM-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813299; v=1;
 b=mKAxsY9yXt8eHcVNUkRdPNxcexsAkZ7QlcjVRhjY1oavdjnxmFTEaBnYmwqT8yy1IV0cDdUo
 sOClbSf1e3xPmsgZjb04xk3qcF4g4lwnSwOP3b6/3BRfOTQj6tzfb1hbfRE8A3jkf+9JGRWGJOK
 yltK/IaNjY4bjV2+VByf6C3AXoVN29I5HEmVOx/Jc1132ow/ShpdRwCOCn4w1MbHViIf7Eygnnb
 lN9JysM1HWZBFNiPDLq59x0/ESalCytQQc14vhxKjt0LFgc7Q3vDG0aY6RKS/81YgOU8YSlBeI6
 ArMgIW8gGw7b3D4c079B3HcWRCkVOdvSNmCdhsmAYQJVw==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* reference usb-xhci.yaml# directly (suggested by Rob)

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

