Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C522F38E
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126974; cv=none; b=IHVdK9Gn8QQE3xk7Wm0gsBybmkmQgiRyQq/3VDORVawJRgyDEJXYn6ObHreUtseFPrCZcnJCAIUiK0h1PsMMjRFk2ecS9jYAOso7UBN7saTeHhgrvUyCrdBqtTJtIb7Fe9wuUkg9xwq4/6OVYizP0DFDgl7pEaU8CtTzZszca3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126974; c=relaxed/simple;
	bh=aU8QBFtLgQjelJCNVNjdB/oGNPTciJe5rUczc8N4X9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mrS3ZP69o/IvgFXzswAZ3vKwQXs2YjJ9iEF5mL01YKjiCS2lciJYn5649PKawzsyhoXWiF2J8k20yuhUp9vtSjldNUj8XYSzfwfbosYbZicD5s0NZdtpfBpW/ksvL2OfAywtPNXlpoReWjY5cZzhNgORclR+Heiwq4DORKd7vVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlFZwDBJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlFZwDBJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so62027945e9.3
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126971; x=1744731771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=KlFZwDBJYkpX/CoZVOj690EDZ5GUWBu2vg/wzgwBPY2fBhBVeWxmYn/Bn77kwcH7HC
         aBMczaS0r7V4J+DYgU6K2GvirjYjJAYQmIfLGZnce3hiqOucRPqlCj0ncW1UqxRHerXH
         83qj+4kVieTsCpsMwDbIgrBM6EuvYKkk/l5fwPojkDSFJVeElBmuIGwSfLo9Qtr8JOeo
         Xw3AWQUH5NMi/bWwRFdKsutsJDl3HjrZfp+AsV73qFYfaMXptyyZjTkURuULwO4CTTCi
         3dCICfxZB4ZuVIIMIr8PA8INmuBqrJPMfsKr60AvH6F7oqUXsv6m+F6LEuTnN5RZeILk
         9IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126971; x=1744731771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=Ww85tfbatJePfl3Ur45DkyxlYGZR/AihtkVgNdLHFz7xkA1r9pLy3HXwkABJ9YIqJk
         tFyx8dkAkS/wkitYqbou6rIDr6aGqVqA/I5WQWqOLZXFCx3+nbcY7N4M4IUiYnQvbi17
         Lr9GDk2FH1g/ad12N4z31QyfD8zxXBhnxQBx+VXJQgTJe9QTtB3NzOXBtObt11DwNWws
         3MHI6SM4oeV6nxJQFz6wY40olWcawQhInAM7LRsx0DGoqDrHsUQXFQvVcWZikxNjG4Ev
         QVTpSdj47xcRj8wp+IrdVuX3U33zQSwq6KbXjFDeLNH6MaKWxubtoz/ashxWb3941jkO
         ec8g==
X-Forwarded-Encrypted: i=1; AJvYcCVVo1UN0lWduUQruA79d8DLDz94/LvrFScTChG9iSH3UxtGcUnvmYHOxK7Rdxw3AvXhia0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3QRiXCZ6iHvzCZk2WvUozkpleyUt42KpZ0kLrp4qoxgqKqsAI
	2ED3mKdTlrPt5g+RB7RZ0mn4iqbrGOWt1p+V+a8wsrN63UyeLPf5
X-Gm-Gg: ASbGncuoEq9jEG0LzHrSOqBsjwywMj/87IcQCgIunviTnrSwiYQHENznjPw5HWHFcgr
	/02+vFuDG2uoghWKDhu8rcGv12L5luoqYASne7qkDviOgbzjBJB1uuegojnqmT6ZU5B3QVrdTCA
	nyhINMccnaEjqn938n75G8txCHPp9jHmMVMgXRLLHhh4UbqoMEWC+tMaz1F8IXRqzm0zIJS/Efs
	GFChp8uqleDFBkasXnoMynGHivPchk8iA7gWycE2OF98EJqYbUy6pxcAbBzd5Yg16HeqBqNuzs1
	sXkzqE+OYmzgrDPRUN3gdvRZSsPhIUwtLQhPNvbVc9b3/LlYJBM2c9jJkVclvuXq7gTt5cQ2ohw
	vi4M/DwU=
X-Google-Smtp-Source: AGHT+IEsYOAvrRYx9U7RkXBzKdYrz1m/zDGUfOXgzDK4kgV+9jgyDCOg9AoAc+QioVKMgn9BFwQyuA==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr180587605e9.13.1744126970824;
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
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
Subject: [PATCH v5 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:30 -0400
Message-Id: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  39 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 253 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

