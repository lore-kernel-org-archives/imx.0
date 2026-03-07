Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDCB1EB5FD
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898914; cv=none; b=qMdtMNt73EglvFoKSq/TN6G/SuQU/+0bx+XR7LRWcnIdJCUusLGBd3htkkU+n9o8a1HnHRiCex1qq4FgnvudnBnyjcp0gCzgFdVsjiA7kCjP/oKShWDHnziRuvCvG26xYhxAZgExVVec1ie2dC/Oo1pLtEXy5vchgFLvDg24BGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898914; c=relaxed/simple;
	bh=bh971L15rJ6CI+8b9I7ulSU8l63UC4yuq5IwC4BKYYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmLGis0pFYIRmwJnvxHj5T4aye3+wiX0oFZAhaY2SifQysqPBvbXGcFu8do4uw3bh8PYiKXeXa43+XtrrVBlVH+QZdO2+s6NvMyYeGfB295a6x1UcOXzA1vYaQf5nGKDxA5KEVbl6TnP+x9/tnXPwcDUqgXevPcughrO5bEo7fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bitfnUol; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bitfnUol"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48375f1defeso76965095e9.0
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898911; x=1773503711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9oa0AHQoPurBACCzWUh4c9uWAceyEmwnMnCZmzmFq8=;
        b=bitfnUoljGuZQ6rRRL2blrDONmbhDvMGEBh0TN2/k3BjvvjOJixL/pYD6kBXevAWG4
         BqdDlGPgikFAqySGTamUlgv/frNP5ASUSo5VRichW18s+LyqDP5Jh1yOIsbSBDwLD/xw
         jLiiqnfD5/ohUvDs7dhsWvX+Qy7gpQtnbMUz5LqH9KeqbmkTHrkyP4OGxD8qrDlbJlBI
         ros0I9uY6Lew1zT5ET4SiKJ8wlzvXQMvn33huZJtEJdzjNkivRvYEh1VKxKvMzANokKl
         yD3gc0Y4gDvm2+HLf71Xe+zFnr/4HnzBjN5Uguxo94SKW2FcSikgGMQkfwbgZ3si+eiE
         L9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898911; x=1773503711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9oa0AHQoPurBACCzWUh4c9uWAceyEmwnMnCZmzmFq8=;
        b=dTmbmIP/D6PuQK/AsnC4ghNB4dcHf2oDqRVrcXJYm5TJcMYuAHyiIaomXYxNIs9qwX
         Z9JftUc0m14kB8g9k0r91OEPP4tT3HbLl+gxkqofMCXfWHXyi2JodwPw3cwClno6RQ7p
         oObLzVTNMq3sxYZl9deaCCCXDx+pJizplKhuKilyTDJcMnLCYp1xGZYTmaVAxhR3lzb4
         PhyGT3gnPx0MfO/K+Pl+pp2gUv1PYOOH+4Wo6PKywN1jSqPxOn9LnYy2ICNcIBcutU56
         cEIXMf+i0AoRb6Bo83iihwEERvZ3LCE8GUdiNWVUVcCFf3a8XnQHp8LSWSD2JwyZp4pN
         Mfyg==
X-Forwarded-Encrypted: i=1; AJvYcCXE/SO/XDlirydTuKBYgkADUFL2jtsXsbBqvW9jwhxaviWjwS2JbpQe7TyewZf2mcKZYPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM07HaVKW5vmFFabjP35Zqvd7oEQOqY1oQji2kUF3nymAclg51
	dRqggFhsMt3+x+cSl6woG+u8GTeXmcX60EeT4sI5uOk+G0fxcjmG2KpW
X-Gm-Gg: ATEYQzxsv/jdVTd7yVszkLxu8a9ITc6tTkDguEZ51P2UImo/LimpyfMYF2CQ+mZw3W/
	alab5hx4SjxiQAcaU4tmzlg9SnSSNkMzT4mX0SrTu/4d/WVHlm0DqnIsL8iWtY36cnjAW1JaFPI
	HHqmn17MVSi8m/9dhauOzN1wbOj7WAvSNxNFcQdap5F4mtAttJgmeIJYGn8Gwk5/rdEwgE5iWUt
	yYapUypINURRfh0ucJiy2JZYRdv3XUeuc4hKz64XwieCu3puClcpqaUeJjqSgD9e2Dmk1uSc7In
	ltqB4Gl9DX1nHle2iakPFE+Cre21F/BvL3Evjl6vbS/GmSg72aFmyVPqWWoT6BmNoVQcsIVUuOp
	lduWhAWmB/61/MEW6ttAPz//SJKU+EdRGMBZ0s0DrtP/0fQ27duEbQJfrao6fh9DkXh/6xVW7JO
	PHCpFaUFm03oAIm2CRShYAQeqbD4k0g3w7k7sZIlQZfq6D7h/donuRB6d61f6u/m/g7lNuPvg3f
	lc6oQ7bpTsptUmDAz6k9jrpuw==
X-Received: by 2002:a05:600c:c4a3:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-4852692c943mr101324685e9.14.1772898910962;
        Sat, 07 Mar 2026 07:55:10 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:10 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Sat,  7 Mar 2026 16:54:36 +0100
Message-ID: <cover.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v2->v3:
 - Add clock-names porperty along with clocks

v1->v2:
 - Moved phy LED configurations to symphony dts
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

Stefano Radaelli (11):
  arm64: dts: freescale: imx8mm-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 .../dts/freescale/imx8mm-var-som-symphony.dts | 225 ++++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 4 files changed, 503 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3

