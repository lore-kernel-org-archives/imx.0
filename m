Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BBB61FCE
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592018; cv=none; b=i9hV8A4qRzmguju6RTduNSCA/3ACov2txEEpC5eZJfvG8pU6ybYPDsYolYszc/gHKucTdVH4I41lsCNZfW/eSH3+pB3SIfKXPvgygROWpKw0Eo2qt3Q7P133o4Mw0I40DbOrf4K8EHgu0pgvdWJpjpslvckVZxyq5tjnw85jCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592018; c=relaxed/simple;
	bh=sn3kEcEnJGdq+CGH93mNVsRhQPGquWnTXTjgFVpFIlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rlEbi7hzIR+wB1uW/0/1cb7FQ5u7ByhqBPOspOjkLUHgUhcE+xLZCVrz0VO39a0KkyrouXqZvDWe3oHzes5O1LyhaawnHHtDdcLrXiJ9kApcwopRY/YU4Vi0m+g7iktGTKLe72Q8lzHwo7WtY5q9Yifjo8tiucmyIQTAY8QYDZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9gtZcdh; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9gtZcdh"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-611a7c617b4so164639eaf.3
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592016; x=1752196816; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=y9gtZcdhoCZdj1VtIn5gpTt9hY29UiJQb0oMlfUX3OEJCghgksvlgWKyL5+AXxYsuG
         mR6U+9zh5pFHz1WNXsvMBJ3wHp8UZSrBL1XRAMyyp90/7WOz4dfniaLpV0qEJRHsENV7
         0MW6GDV0xKZL1muz0JQGFdVPnifrgnZKp9zJO/R6g4YqiMAsgCK/YHcgTaS/C9ZD/OSG
         c+OsrMKCKtFjKf1wvPjkORdElwbni4T55i9gjO+Sj4Eb8BjdpLo7QXAHaNb0jm6qn+pX
         aod133SvJNF/v4zu1/Ms+MqCDRsFC1Vn7FuOO+dQ7QXkYtmj4pi4W8VFGQ+JDE+eC9Su
         uEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592016; x=1752196816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=AXmqh9qZ4EmH6cjLgo44u/pjUSYDpC/1VJ3PTkm7xVNK/VoKgq317PT/ZiyDJMl+zu
         qELHeVF81Y7pYoWjYg3sXqPMTzZ8zqsjAeqJdsvX+JJzHvPzqEYTNrqLDGx7QMASQ1V9
         vCl/kldykFud22mVuL7+CrZ3aEqspcpo4bvWUC5Ftboj+C7sNrr3QeiY0CpxuGBcJd8j
         lQq42DREHdTbpODLlHG368sJ9DhkcujOus4y4T6Iu+O4+q1nE0L87uvt/NpRNrXVtNue
         foWdBdQZFYcnaXFAVgeip54sdbSGKluMDJoqwfkIXOKQGIDtrmKLFsIBCTSPzsowa7CY
         UfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrWfhjZHUSAkfN4le4p7WqsEPKjCw8pGkO69BAdhbKxGO7VSDZ9tjn2wQVguEXkz379Kk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDR7KuFFsx1lP/BWj6KnznifshPxjiQXCgXDqZAzV7s3NJLdxO
	X2Fpj+CBylutHiMPuIFi/3sfaWp1dpY3yCUooN2pXnhynM7UoKZ7jrLHCEGMojkFPQM=
X-Gm-Gg: ASbGnctffCnwjhc8VtP5wJCoXgDFc8IgYDlac5LFqarIWfh62uGIk3G5OcTFjt/AR9X
	0zaqCS0CselHHtt1L2fIUbt/2SaBC3cwlk8iSU+D25cp/5Hi+pKoEAwSLzklwlrdQjOvniQpSYy
	t/JKnfGrUPNFvk8qR+hqje3tNRd03WF/CXlWSj41lGU3EgkhOK6bSTcevqQLWDT9XONFnoJgDXC
	SPteNg6zF1FkSgnObNz659tJ57JZDo/hvZ5IxAOgRurNyu9co4gFybU33aNVv4bdt+fTJJuLG6S
	bT9oifgXRYSbBDui1saJ9yLnynw6MXj0wjN8PbJkjrpUt9699D+LnKzXonlR0eQNEj2fbg==
X-Google-Smtp-Source: AGHT+IE2gfIyrgT2GmZQ15R5wrbiEzA2Rw3RJESsngVF1fw51ISYnu4DuG+UdMI6ohqlrXf2k5q/SA==
X-Received: by 2002:a05:6820:2901:b0:610:fc12:cbb4 with SMTP id 006d021491bc7-6138ffbca71mr549586eaf.1.1751592015623;
        Thu, 03 Jul 2025 18:20:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6138e4be31csm164217eaf.9.2025.07.03.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:14 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <5c3e57db-0642-4e8a-a194-f204da5fd2e0@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Changes since v2:
* Add the dts changes (patch 4)
* Fix Signed-off-by lines
* Fix the device tree spec
* Provide the complete errata information in the commit message
  and a link.

Changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Dan Carpenter (1):
  arm64: dts: s32g: Add USB device tree information for s32g2/s32g3

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  5 ++
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 23 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 23 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 88 +++++++++++++++++++
 6 files changed, 147 insertions(+)

-- 
2.47.2

