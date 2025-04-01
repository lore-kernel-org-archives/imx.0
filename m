Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348920C028
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522350; cv=none; b=umHBGCiB8zVSnznI0L9ZN+0TjFiOO9HDcsKPQ5uNQthHM8slV/30HGI9YCA7zbAIRfONeS4O8S+eSF70IXDaupTFsaGJi/GMgiUovdliD3IAOp2Mi4IYSI8omBw9WU7GFCttVvyVop8dp4vnr3GAWY2Ev+M1812IBmtD5pDp/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522350; c=relaxed/simple;
	bh=IZl+SfnZiNB3eblr5+5BUK4KuET7Fyh/voPaywYEQW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HU1R9N/P1ahyJeA68Mzdem/bKRXNS/CPWNgsZhCVnUmGjqJuUkvSxXR0Jjwult9hSY2mCRpfdwhwsENHmm2CXWdTE6lnsJsnoXFx4LfzMPPOF8FYpVZwVJ0Ytm2nu0GUXYAvYkgSqf1Qcy3ixzJD/8WlT6XlV+FkhLZLENP2FlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L92tsiip; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L92tsiip"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so35253045e9.1
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522347; x=1744127147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=L92tsiipkbT/62Aq7KiYuJsl8BP1ZFLiC8Uq4WWsIBwMwHHxr9N66Sp7Sa6EICI+zm
         5jrTXcfCtkO2rX/ZiRQkZiMuFkUdygc4bnZ8j1OFG62RNUNvuklEKEmCsQ8v1T4Lq5MD
         j9W2L67UZj3MoAc116+nqAkIdgKhqBjzkeQZxH1rFe5sD/u/2oa4moSlxnjWLo01b+fT
         MIkYh9G562vsJSYs34S7aNJs1M3csi3K1iucI2tlSQvfLtiIdwWoM6gTgudZcbJh3CfY
         4+ypwlY94mnOlh7jBQugddKko9ODXN3qb+y+tSYOaulfPPsb4eMGHMOEbPbpGxTKJJHf
         HHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522347; x=1744127147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=cHJaTMd2PjIjAzQpvC6nUWakNfk9c41xuAJKpOH6umy6hk+AFNlk+3IhYyxEmyUIuP
         rRMk9N8quFfJNdVfngHrtFACe7rO6YJX/fEwNUxZx3+HxD5d31dF/He3vwcT9/gnzZ9p
         IwsjcYwU1sYyVgwHYyrn/g6k4VxtmuheTzlPnXvocA4T8yVn2erw+nqyOCE0I7FAFtOf
         YCyMQhWOg7kMavQUhKtkdkmGbXi9VOVqQ2Gd2wJ7e/Zf43KkLSgg6BzRYRj5S8XCrnnG
         ackxuRR8dgASDYqZNhXM14GGOkOQBUai/5HgyQyXMC/Dn3eoOFpkqxApiEchpA3u4dq9
         TJYg==
X-Forwarded-Encrypted: i=1; AJvYcCUnnKNhe1DmFa3gjzV4GMRDHf0oKJGqLJuAWVkTRg8CdmAh934+MXw0VZPu4sutTIS04R8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4tdtAETBcXhfHbPih+PF4omj0oI5TWoQjpsF2+xUtVVKTXZVs
	5BvUPFmULQdkKeyBqA81QtXAp59B6APaYd5u+Uh0++l7j9Jjma7Qx93eN7o/
X-Gm-Gg: ASbGnctlRmq8QtQde4CGtapTlY/WXcBJDcGwFKMUJCYe4Lv4J9kENUETnWhUq1wh8bA
	cvt1vREiOav5Pe/uPcWMb2RXXwY22+h8NseUqrtNXobr0WkVCUA9bpjO0JZQfKuEFpHgj9tNMNd
	/ViG+taJ/j1c7JdDiMYv5/DgNfhoTxM/Q3/Ydxh+H4882nnf/mEMxhkced0HV2LiBqa+g5SDs2g
	7GGy7Fix3VAsYitjbZ4Re6igFWhvfKgc/jUoIVpZQS5+UuN6PScak2OUgmNk3o+Fk/7h0Xz08cC
	nsQ9hUc/NMTpcWnw5+pdGuK6DAaCbyc78xLmBW2oMzyiZ1p7y7QUORVjN+kmIKtmCdTzcwh1znn
	vG5Lpguk=
X-Google-Smtp-Source: AGHT+IFKiVxzUU2B9RPhqEV6JDP87B+NzuBTFyeKmjre2c1ZpVECp9TuSc269NxnKveemRjQQW/DLw==
X-Received: by 2002:a05:600c:285:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43eb055b4b9mr3423905e9.2.1743522346657;
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:43:58 -0400
Message-Id: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
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
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz master ID definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  25 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
 8 files changed, 264 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c
 create mode 100644 include/dt-bindings/bus/imx-aipstz.h

-- 
2.34.1

