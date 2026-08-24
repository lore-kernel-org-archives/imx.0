Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B83EE1E4
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567201; cv=none; b=ezHQI/yM5Q83N+eTKNJD3oxyaT19nRidWLSwcsK8zry1qLuTnLnZ2+ZZTJikojeVuF8L5UIFTggYw7OUIt73G2U3iJfDb3TMr/hIQvNln7If4mtr24KsKtj582MqUdJGMKgN5JLDetFyezdT/hO5Vs98g5EnkIxsDtrlQxXqeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567201; c=relaxed/simple;
	bh=Z8sKP1dPVrA1fu/4bg7DrY5xY/2wOA6PX/K3W1Kci3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXm7Ktxm8Av9T9sfvtVrB1A7HCoxyrw+EeNzWsXQ26OhsJIZN6DJ3KsnGBnGihphUC6o88kSUQgyG6p8iXI4PrmNZC07i2KX8EljeqhUrGr0ia11cb1t1osNsQH1brSmprzu0fjtKzdmD+1thoz2drnzi52ZjylnKJ4eN/THOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdWSHei2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdWSHei2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20ce3c118aso617570166b.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567198; x=1788171998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=fdWSHei28KTe71R2v8dNMJL9xSJG0YglpnqAa7le3eucM6cBkG4T9I1VljHHM1s4M9
         AsZ/erw4ZVDRzd7uPyEGqyx7ASm4yX4lwL7aB83JmV1o9g178KFHYI2jX0SnevAFzdxI
         oXTaMaFGa34GhptiDzsENaBaDsZ2VSbirEOaKV8AiG5BepjiCXu4n6oZmR4iugrisa6W
         5AkdHPmHNmFT85Ns3uETxlV8wCGD5noKT1ULAAfSiPd1s1Im2xZUqAvn3A1tJccqUYQm
         8srRYER03nT99oPB28C7jtVQfGm5yJ6GIdOrAVPI/96sN1JE129k7FdxAyY4XisEJSrH
         d8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567198; x=1788171998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=iL0WPSJH1jX5D+WqeIvQDRg76gBkmikMBkp5pLGFdaUQ8MT/et46XS66dxZFqYqdPF
         5kRQ7vQ/0x7TMZP1sDe4RFWZeYQTBm2R7lifhOVbHWEawmTkgIJeFW+73nJWrjhX+fRj
         J6OkyqsjlscbSNCpPzFG38eYorkW6sM4jRnR3Ld9+Akn4OL32wqckoJYNwaPf1Q04GZj
         S6dDxw6c7YCoUterdbKTNQH99LcMzPg1MWM9QFYxCPMiHf2l17Bu7hrKJyPm8OpEcRpj
         eJbquZYuYLK1MJNm/f/jgbzJ4Y98c803o21MZkOQDPKfd/IEIeDaen5Syr/YsoPdwWu9
         nCQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiVPw/aA2MSJFMAB5R67iAyTqkL6Hn4Ms/fdB/1LGunp7RPCZKbECUbjouhTRa3IVicEY=@lists.linux.dev
X-Gm-Message-State: AFuF++mJMkuB2ZONMvbRXsJvi9qEj1tjAsdsOYHN7u51kEMFjnu/wing
	auprHoqFJujlI8A/t/HStauYrzFTafKmU3sAEsk8zgU2M1O7DaPxzxnJ
X-Gm-Gg: AR+sD10MEh5tCxd/awuw9dH1d2TpbGLTmXSNV4pRMyBSCfcWdzB7mbz/tjMtAi3avav
	kKI0jb5Awsj8ekF+9xBzVuREMe6CwqUMziXznCampSf9RR6OV4fiPV9a9gBX8X3EAK/TJpHz53H
	C6zL+i31oLE4+WjRCzO/uWrp0BEipAHkOIC3jpUe2cuInAAZfqJ3vzyHaO3A8hGQhJYKfpJa4nR
	E3XQvxPIal0XJE5txS3rgDsmgwq6UFLsAs0ARB59nuIdWTukkcDe8YOH3L07j3+geA9mcRtXLrZ
	3M5KtpRl/gZXmIOmXBbGqbU+YUDHGgvMPs+3vBdIi2KpkpePhweRSlFikrPtx5w0LluBmzGBDSC
	Nz1LQ8RDkRNtA04XAMVtWiQHxLBda16yC9IiGOI2lugkz07oigh2oDZ/8HxXEyg2CmjCqO3qMUq
	JZ0UGnhvxjCdyt3Wl1LnE7zWg07tJI7kzt/OlGREeIeCfF3OIL8dDCcVEZZZknE61vlupiuFpo1
	6gG3kKRy+j14Pn/xPSI+iw0FIVJ8dU=
X-Received: by 2002:a17:907:9610:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c246d582330mr2376009666b.1.1787567197725;
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 12:26:27 +0200
Message-ID: <cover.1787566980.git.stefano.r@variscite.com>
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

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio propery
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
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  64 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 637 ++++++++++++++++++
 14 files changed, 1480 insertions(+)
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

