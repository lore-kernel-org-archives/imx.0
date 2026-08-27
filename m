Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8147DFAB
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851737; cv=none; b=gZkIvbY1aHZVkgVt3g8poG5OA6e5BAtnCX9NzJRvZJkRUnVvp0uEpb8p5RsRYiqaYqciK6zp7YOW5BPUlB/zUc36wTR/L0ePveG9gemM28zaXjQDoYqnIP2XoGzBVcsfWzpfjuCVNxNpGjux9PJjzqTqNMMh/4fQDgi5HTXi8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851737; c=relaxed/simple;
	bh=TcNkhtAJPXCNU3w69CX6YKlvbCy6MpFd+mQ5kqZZz7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLWstNvFyoUF9X2/GAhCc2Zb4SoZC22pBqu2VGwcgz9+0pVav8GL6HYDpFztnrFNJe+tUmLVDBFzbSfZK/V/Y7xf7Iy0QmjeEga3IBFKDGCok5/UjWbuGjPPMU4VyxxosFOV0P/gTbR0lw8C8BSlnFoQ4+zrjrspxp118W6fjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smyBnYcD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smyBnYcD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47db714766aso952385f8f.0
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851734; x=1788456534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Wz4g+7ot6HdvLOjTX7EiZxAEslXo8qlb18PeyocVGY=;
        b=smyBnYcDXgiPuNpF+2bubCtji6ahosW3TwCIQvkMfJy2Jwl0SIJW7WQ6Mv5sCV5CXH
         0eUkAf7HQVdWN7DBQKLS9ys6W6daVsnGNxc1z0f6mIk8dKEHk2gK792k8kzct0DWExjC
         jWZq3E6wxSf3uWPgBRT2erJ03UuY7ZoDzRA1UhuEyAVde64i+ejb2UIO9R9Q3Qom7aKs
         YOed9Qb/MUTgRFmDuH90/exZFRKI2rupkZHfH3jmYp6agFD+rhn4zLRMNSkFWiVYkfgr
         olkV9wr3hqSc6LWm5sWvxPPgkd7actgO+op6bkn8a94T5nN/acEy61AIfg8ktU6HtuQl
         qaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851734; x=1788456534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Wz4g+7ot6HdvLOjTX7EiZxAEslXo8qlb18PeyocVGY=;
        b=tHGeX/dfC/11q+zg64oFIkQQ8MA3v+l6aaV7uNyvzSGSrl436PVa3cADLzTSqryVqI
         m3aDhuylYa3tZAfCnJ58Rm7lGUoeFgyJMbQebwXVpqwCvi+h2q7fd6qNY4iwFt4qEzEV
         LoMlgqxnUJfXG4l8Sugw3vjkkD0N5JuROlohZIdFcRtHG8A1NaKFG2ZJ8RcwEMRi6V2Z
         HOrisENahTKeYuKHUTpm/0cd0oRJlg2Fctcf7xWgISgvaQQy1OFTmwNbfBWjJyYlUC/L
         Qocx+tXPtsksYL1xWw2f7JFURt+P9zkoYwo8Xw4wUM++TCUYdO+bCnwOL2LnaZHGkVRo
         aZKA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi54yonw52DT0CrItuvED/y2dm3OSDZAOB7JeVKNPJNWhR+tJlg5BgA3PfX97CddgBnrU=@lists.linux.dev
X-Gm-Message-State: AFuF++kzQn6jbLkbe+b2Pmu8PevE18phHPwXb0Ge+EWaJHyRTiLzPS16
	omDnhWU0ds5NatwZQK26nVG6OyiuBAp45/4tvPsHIpOPV5PkglipFUta
X-Gm-Gg: AR+sD13CjX6hk/vrPOft5j9wKM2VOlly9FhIuXfe9yuA1rmo28VMkp3LgvEPvit+Yik
	bTfo0oGPVWXZvHqPO2QuwecbFzI66by/DjAPMH9aR6ZZjXH6fNfWhemLRzAelwuBDPUDlrBwTcF
	IMHr3Ov9KRL3Ac1pN0mAE5bVGu1+ZGBjLXvRdOZgdgphl21V0RJwQwCipqtX19ayuKVAJ/SQRfq
	dkjzQRo9AMTdAjBC3Ht/SmirQI1ntw05YK5WzHSlC3dOWslmIrxiQSsiLQMPLwCcB8N6jtQBXXy
	3irMkzvKbNdReyP/1zl8MKMLoBroVS4f5N8ypnJY/YyUZa3bb2Bs2imDulHC0qGseJrSPKB6iw2
	ZzrTnzT3CIN9I1NbaXkxtbz2waqHQMhkSC/gbijTpq9u3Ji5FwbH1GEr65za2Irp7jFViJ15gR4
	OxhfBmPbhNh5fODUFu9IABXcYKCvcV1J1FBWytgpcgxiz3ZNtd5KP1CjUfTroJKPVrH3QNPrrQZ
	qTiWAorsQygftib1Tp9/11+VyXG9zzKr+8/PY0uelrj5/HEqu+7i8aFR+fqN3XYKA==
X-Received: by 2002:a05:600c:1e24:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b91a6d41emr11236165e9.7.1787851733390;
        Thu, 27 Aug 2026 10:28:53 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm2174405e9.0.2026.08.27.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:28:52 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Thu, 27 Aug 2026 19:28:45 +0200
Message-ID: <cover.1787851637.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  90 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1446 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

