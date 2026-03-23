Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CC3B4E8F
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288834; cv=none; b=B31cSFBFhc19sDQr1rVfzyc51HwdImZzoqG0C1Al10+UOiZNMQyngGbDFdbeGe/+Br2P7oUh46ab9XfG6r+3D+Qzm+XNNnhzOzx1kKiaXXtyZU9KdhCZOY/4IX8Cj2HZl4FXtxJ+Qwo2bpYQK0ZLkE6OW+VL2mcWR0v4ejgnMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288834; c=relaxed/simple;
	bh=E/nHdjHS1PPiOI/cZ5nnAbtoJk9ukFKughnCfizAjOE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lsCOmu7iuEvV5HcZYQlzeAbzDZtjMlvfrtk/tTTbIJqVIdokRvcNQhDNyK5b2Gc6fJbI+xy7C+8zla7LNeyR7rn0diO5zmIv4BoXJFEIuN5Lzg1tN7tO8ilrlr3Yzi6oLfV70G/4IwCfe3CeV3h0aD044GcNkJFaT3w7Bq7t4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai7ayVRP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai7ayVRP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so32258465e9.3
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288831; x=1774893631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vrYgx725Haq61UFRJXQREBllY8BXNI16WOSLFDeY60o=;
        b=Ai7ayVRP+cjlEt7DPNIjdf20B6RhibEUhINEAwQC4EEJk1FnIctTOu0ytZGihE155h
         u3QIV27ejGhaezEa6ncgJxpboBAjuBCQmrLmQivYZzQQqEMiVsIkotoYDhsEzJ6T1auk
         sndTq0+1vD/5XK6M2wKjbUQE8Y1zSCf1vPuHzOLAcF6zqYpSKT2XzvHa4IIr0wjJ2Pdy
         XQ4082tqKYad3AcpggJosVVUmP6ZWand87mkR+cANH6u0YpA3jpY7R8Fwqs9oKrHii5H
         3M7b4JlmezYZ3sCjFFdVw1uoq9HC5hLosNgEMTIO1GESoTLHAQX0GltKWomfawoYwDmc
         OTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288831; x=1774893631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrYgx725Haq61UFRJXQREBllY8BXNI16WOSLFDeY60o=;
        b=DMTclB9jPVRnmAJueccqRvQJ4307L/AYgRB0kwWcFzE4e2c2cExNMm1rqXKf841JmK
         qmn1K0MXu4Piky+uFucaAltx3hX8iC9YFpugj/tipN195ej2NCgqa/eKFDbypf7sJ4c6
         0SQhnf/163Mg42gFHOCduftueq8miWdIFeD1x1JkDQiS4UFLOUk9wmNRu6OiSKboXgiV
         1/I8uJx+YkR0jrGVFg3d7/S4IbQT/1bO0EuA5rQRycvewGVUpwGIbvlqYvULJ0Qb4HjT
         6vjdqPwFUQY7I4JxG5uGMR+/R/08tm47zhQBc6OdIIOgqhhs/3/yyKrb7qS78SQWZbRS
         cqhA==
X-Forwarded-Encrypted: i=1; AJvYcCWfELa25v2PeL0o+Klr8iqCqHsT2wqH4J2jpsOx9ZSYi+qA7dJV7N5RBsWvCP6LZhnVvAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHeTRcWEpNQzqx0OddNfOZ+mmyggTYCf66rDQfxYoVi6qjNl1J
	/pbj1+FFJ2XMDCj4CEvZk5Eq/n1XWWcTLlQIkgHj33Io/iZILn5RdKua
X-Gm-Gg: ATEYQzz8eUCFdS2Sag58N32c6s3qu6A+cg4jE5s9fWDTpkRUD5Qzy4Bbp3WSWQV3YbT
	ik9DvSvWX7wKq6v8SF5e2Z56xN1tFUJfdMUrMAuAY0lqQJJnEiVGGBhi56wdQRIegPOUw7rO/av
	6o7yqN+lNS/ZV20YZB46qwPbMKoSK3SolqiXhk6saf5RZ2ZkHMdGYRLB68Ys8yBvsEFGxyIem5O
	8ON1zikC2jQLEyIsWEkCrr0NyuJVJenmvnfosp54vWgx0Ki86oY+LevwOllCeTVC3ku6Asqa26s
	wMFTQjH2TFydwbOLeHDYYethO1VJT+BV9VmFELsSdtXIH8WWRrGguyfXnOBUfoC46sARFVmhP7D
	RLijFWGC5PuxceBZChnhi9SrpJyS/5F+YD0tsURbV2tIDWzCFMAEkW9DuXxyfP4FOyRU1hEiBzY
	X3GLFTRogMA8feGKfZP2Etk/0=
X-Received: by 2002:a05:600c:45c7:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-486fede721amr169762575e9.5.1774288830519;
        Mon, 23 Mar 2026 11:00:30 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:29 -0700 (PDT)
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
Subject: [PATCH v2 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 19:59:43 +0200
Message-ID: <20260323175948.302441-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts the Technologic Systems TS-4800 Watchdog timer
bindings to DT schema and fixes the active hardware node in the iMX51
device tree.

---
Changes in v2:
- dt-bindings: watchdog: Moved 'allOf' block below 'required'.
- dt-bindings: watchdog: Removed the 'syscon' node from the example.

Eduard Bostina (2):
  dt-bindings: watchdog: Convert TS-4800 to DT schema
  ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

 .../watchdog/technologic,ts4800-wdt.yaml      | 40 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ------------
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 3 files changed, 41 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

-- 
2.53.0

