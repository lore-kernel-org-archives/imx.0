Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260C21ABBB
	for <imx@lists.linux.dev>; Thu, 29 May 2025 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529355; cv=none; b=ragrUhdzrhTGpi9iLsNb4IoZyJOPnUamyGhE+KDrT/biZBWBao7rN9onQIznbjCmXxLgivdTuoDxLqRCr7qaiqzi+wPAhFFub903N47jC5rkDtfJGQe0E2+wQ3JS5lv2/a+Ll9nqTmIJQLHtJ9kavi0V3kPJ3IX9KmOLqFZT0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529355; c=relaxed/simple;
	bh=gA9tjOLVx8ac1A/yQTSk8Q1ajFXlqMG1hbeiLwWZnXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+Zoi/LjfE1HOUVxOQlA3vrGXACWYbs63MNFYmIlq5M+ZpGpBtMbZFnxtTIVubDEPc4M3fSQgu9IByVXlwzBnDpgyUv6skX66f7hQpgwJXTxVsgnmJe+elgJJBiiLqprRmgz9fxKqIIyAer4aQk2GrRzzpH6G76iffpf3aM80Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NtJDIznB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NtJDIznB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad56829fabdso142542666b.1
        for <imx@lists.linux.dev>; Thu, 29 May 2025 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529352; x=1749134152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=NtJDIznB3n3kzcSdMw9r9IwDBaPa2ZKFDKUojA/E26QbyT7O4NncYciLbMAXL82laV
         M1C7v/eQLlHTztdockUdidgoksoCsV/mvhJT8D+SjgeJFnR2N8oWQ7o9XEWqaEEYhP2u
         Qb6+OcL6YasiF1wdAm0ru3iBMv6lQCWS5Pn8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529352; x=1749134152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=EgPY2l25v039Ap/+7atwDRCQ3+cYp8WI78BIutp7lzSP6dQwzrgPI5dYHLxf++Q1aO
         lLQue9TwTh1CuHu6Z9rQyBSlOpowPX/1zC8MVIDkfyrYWBfMNFmJg0aMU2eXUqm/iWIj
         DB7amEi4vZ7kN/DEhn68TBhplCJmkHaARmmZ1vqKTiGHVlyQ7yNbvHZwePSdMuA4A2UN
         93tGRygcMyFHiLAYTNx/O8edaZvkiB7oftbOChvWXTEXKE8iaMkL3wd9xkWCmjqeNm6+
         Ss/mRaYndp7QcR5n8TrdBDktqip2tiWZCAARwvLNTCSHOA/AlGcWO/P4zf7f6K/lc7fE
         5iww==
X-Forwarded-Encrypted: i=1; AJvYcCXV4ulDUHD/Cwo6I8YlyP8WFmp4xEoXDzJcOKIwGmwY9z5Hb5TIsQF3lz7CaHbzoZdeMXk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqEfVXpKCJW3b0No//5TSLFRtGdmdhtWn0sE2wQnU8ZjQSG7yG
	GSrZt7sAaTWTWCMjzO4XB6zecNG/OrKa1yxUcxNPC4TqXu3kdUFnE26Mb1NxUUExvA0=
X-Gm-Gg: ASbGncsnZ2lkoZcb3Uhew0QuhIeUTgAynN+KS0+rrWKydPzVDAQYDw8uENdSxMAhylJ
	GZcbvdrdnl4gP48gjxKKGnccaxIiplHSqy4sT7p4RGXu4ki50hCvuy9nmqY6ThSRlzaezmvtH/q
	dNGDCDa/matzsAZvdCYTFVV6IauJgcPHPl17W6VhhUbRKQAisoDCSQKC0G+kXsjvZaKJ1B83ozu
	h3HNxYVNgOnrhW2njkxK7+YOJPlMdTOA+Ghip7HRUaDSGJ7Fpi7tyG2OndovYTg2j7fFDkbSMer
	rhv27zVQt0etIaJ0Ct9i0vf/oAEghJCo9nm/MQPrGNTePt3/igkpHw4XEph6VfcwKAxkrRO10Tc
	YO3/MjgBS3+FsJg7L
X-Google-Smtp-Source: AGHT+IGERChiFGE/d/VgaSjB/fBHCcIx46SIOubK/5eXYgYTFXXviLMgUfe7m+xgS8A7iYuziAf9Ew==
X-Received: by 2002:a17:907:944b:b0:adb:1b2b:fe27 with SMTP id a640c23a62f3a-adb1b2c0fe2mr217561966b.36.1748529352037;
        Thu, 29 May 2025 07:35:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] Support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 16:35:07 +0200
Message-ID: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

Dario Binacchi (6):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 7 files changed, 447 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 2d1e9b3978bc041336f1bf6c611fbbf435a297f5
branch: imx28-amarula-rmm
