Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CF2512E8
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165591; cv=none; b=TJlYjr69toq/oMqJXJy8xPYd9T68p+rWyE57KnECuUfYfU9BDlZ9w7XWah6XgQ9gCorwCpLdw4m5MIVDWpzCFgDCIqh+9IF4GBPd8d0z0kQX2Tjis3Sb4WhD5ZBCi7B8XlL8OXpuoEngjSd4hJS5ea9jRgiqYUQgKGAchvE8680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165591; c=relaxed/simple;
	bh=RPDPvXXCdl5OOS5xVDWyVGfRoFTm67EFsfdf8l0PY2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbcMOwUs/BsYzpeXbLd3WLWYax+gHh1iXJKiwMBGpRD8SD2ywREfKHfhajYfGIsGvPi7VNAZX5gCqTkZnBZ0XPuy/6iY4UL8vH0efm+TrgBPLD5qhGY/UJS2KzBJAa1alkulqDqcjRcd2W44f1aSwJQBuZUP4+hZEQKJRKbA2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuMZ+4CT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuMZ+4CT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so4645682a12.1
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165587; x=1740770387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/2Y+JVQ+n3qognQWqPMWeNlR2lyIlTcpQrbV4OKmFc=;
        b=KuMZ+4CTYoiLY7BzhJ1fz9m8I+dKYDHcPdPAJqOtzx2l5m9C+E2r47KdXQw7L3Tp0U
         qXT2FSQP1iM07oldS+BEtaNe0Ou8jp9yfP25IXrdXSqGpCmQW0C6gqGSKKpZjuNqVNer
         5PmIdQ+Ds9CLrAgOjgD5rFBY47zlZ13cCbbSlX+7Cip7jNHMqGHVysrnX2cASqCbViU+
         vkTRIpUQsPSpueqrpnLNCgUqbOUmEZcXlcBld13g8h8A6jo0CA8CbLdfaahj/L14mfoB
         h1ORh+E87OjmtjniFyw20OdEVsSpUCi8B6F1bM2Ozn1HlxFykKX7xPISFwcz6VAwQr64
         r4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165587; x=1740770387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/2Y+JVQ+n3qognQWqPMWeNlR2lyIlTcpQrbV4OKmFc=;
        b=RNLrldmOTHLz+vW43IV/6TMOD2nY+ImYcpttUOQmDdhL8H6GVk7wvO0QXARHDNeWHK
         xMhC4ZiGabvjD91r0XRI5K8k39VdaIzyoHZSQw9+t5DfWdhxSf1QZ/amSvOnl5kKbmOs
         5ibBq2y97EXfOehWvG9RwtYdtUmE7cEtFeIcDhqCbHARCvJnrTmry5Kha7O1Dp+VFYgh
         eR2jG/XgjvfYJGqIhK3gRKhpOYGoL8pVeslSOCS1InietAS+N3COWkuB1wIKiTxAV25V
         Bc2ULr4QlXhJ3+HzjY3RzCcLYUXS5Fh1l0kckH9ccbQrusDVa5Ra3mogl6q8EgVemR1f
         DFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAC3CG0gPrCmYsaHj8ugWmyFdecu12V/0UQp+o9HHjAd/DurJ9N+g90wwdgeRzhoUWr9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo3tjh8bmdQ+OwsQISVF6PdG806IWAhRQ8VenRn3OpnV0UTMQk
	SNzfs2fFbEj2gl73qA5VMOra+ZDgtlqT/+D9fkf3PD8e3J+Q1Q6l
X-Gm-Gg: ASbGnctMzGTEopdx+srEcISBYRlrTWiXz3EGB3kBSZsuEQ1ZcULChdwik8jT8iNrEmL
	1a0TsaHI541J1JKtf+uHx5CG2wE6yKf1bYVLIT6IfmWO8949YpaNaj+/YadNYbxRDuClwsystME
	OCm/2uRG1GGLxuYpOy0hx8p50jvanMUqd20wmzBFDUPlk/wrTw0CoLsbcb8D4W4RmQupkE1ptc1
	bzNUOEDcSlZRXl2f+lOyRaKatMWvBx3sk5p51qKAErSmDzSDrmbG52zIQdyTwn8pzkS/yHSBtFu
	v40Ie1z3QtVLJwnj48GC/vAsjm7IOttItnp70RuJSpCYzKj7uom28Bnt2e8=
X-Google-Smtp-Source: AGHT+IF9tApOtHa/eVZuK45pBA9WYfu0ZGkbzV+G11JP6nOVObxv/pxkKji13DPey3g2T7mpP51GsA==
X-Received: by 2002:a17:906:c113:b0:ab7:8930:5669 with SMTP id a640c23a62f3a-abc09a43488mr529740466b.18.1740165587254;
        Fri, 21 Feb 2025 11:19:47 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:04 -0500
Message-Id: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
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

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/


Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 62 +++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  9 +-
 drivers/bus/Kconfig                           |  6 ++
 drivers/bus/Makefile                          |  1 +
 drivers/bus/imx-aipstz.c                      | 92 +++++++++++++++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

