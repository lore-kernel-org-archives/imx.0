Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FB314B91
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756226280; cv=none; b=QZtfGkWyOg8Zq8ckt7TvTv9kDXO02w0dnpGoeF37yu5hJO/OiLnRDzPcZGalnOzUExBJvB+yMoTRls13FIR0x9IcFhiPqBtXaQ6fJWHdxrsLQRVsLEmjW76l9Qrt5/yoMOry9B/73yWbL06V1aJnV9udYogT595oOYBQYMNHCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756226280; c=relaxed/simple;
	bh=qoVpdmGthhQwIvIAInNuWNaL30K614K46buqtNbFa18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZn4eocngtLGGK2NIlQ/AVkf9fmdoGl0dUJQahXoQgZ+3e9jc1ZpOC6cSG90ZjxkHO9B/bUbgxe79j7jUtpz/uH5rbksdT1RZz0588u3KL3Mue4jXD7Sc/o3o4vjVMmhGH2mAsOdxmVdDGTZKvKKOeKW4Qcuor+wAFqP93drys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLo5n8tU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLo5n8tU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a286135c8so398525e9.0
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756226276; x=1756831076; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXjzFWweCUpLGhqs+Qc2v5kfooS7EDEgFn61h3Rxlrg=;
        b=nLo5n8tUpGoDNsafFGwiUfjWT9pu7gZtq4mjpWX+ZwGg2j6p4IG2+v1Fx12q6h1H7H
         RpEvAhdXsFFv1FrpeJBFCYpON4XEBoRmza1XMjiJFBa1O0T9uwtJeKzaVkhSRRL45+9B
         T+iZBoJfkQwJXWN3YQ/kKI+tjHp7LpABN5o+/mZpNYINaH6HdfZ9Hd1v6MAj1V1bxZTn
         OuIp9n7H0aJZK+PBr9Zus7BfLe2hsAoueEkyJsNlbupQfPAUBlbtVumq0BGbDv7NZ2VG
         chzHIENMREiEvtYKtM4Q5qq+PWsUkDGRSI8GfoyI8+NVP3ec9SmGGBYyWYsL2ucFdNtA
         VyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226276; x=1756831076;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXjzFWweCUpLGhqs+Qc2v5kfooS7EDEgFn61h3Rxlrg=;
        b=a7ZStdzRT+npoC1H9TobgLeX6T57GyTVJOEucNlXlAXfz9F+B+/48XBOwAaazgYp/B
         PK5Z6dQZyFdSRx2SpNlcNf+ufiw+Mz8OG/gARIBHWuuVctPwUoa0nwTI37/rwoUH03TR
         pjaxKgHQyJ8i8ln04YHHfv4TcWk+fdQHiU8C/vnXd6uIKIeDXm91I9bl50JoxO2pY6aF
         rh0+Jtcp/ajVyDyFQm6k/dfajP6OKd6/2VkBXbIAZgOTXHbJFKb+cwL1G0UuhUCr1DWW
         L4hYFBYbSr3XRoZlGNuzNI62klO+9moRvo2pAcd1mc9Cig3N8TsE5vJelI1HhshaT86u
         /LQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZj6HnLB36G6GTyW6GbPRIixi19txBGi/eE3pyqfmVsNJCAKmk+AIz8szhtFyePKdHrEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR2yAyUnQpZ9zLHmgIzsMKbkHkjaIz2wq4mcbLN+qwXdC2Dn60
	/FwKtUxX2cd4kkKMTPoR5Hl2D0w5WfmI0aPPAKG0eg+DiIMRKsIZWKhLeLyrjxCkwKo=
X-Gm-Gg: ASbGncveJA1wIxGEZ8AKdDSEctYLzngJ31+5iCrsfjim2bIohGhb6vVzMURMxDr/i8b
	G7ZfgwnjKaIkrYXN/cg7NbDlsue9R0CIQThPw4jby1fJHyANU/xRtl+GckP+Kf2SJtXIUM4Irap
	EnTABJlvoX5MSpUskkm+6fngklcyhaGHMEr3tme5hpWxUtBF+52j6D5v7nNMR5VNRuJ+b5O/oFx
	gZz9x7fVI1zc6Ui69So0nDJ5phU4lpJR9Nwan+7FWqQP5eRK5oHALazNy9MXkPemLIxqJhhWmDA
	iFvt6BTTKuAUXY8A0Ccgj0FLmvqzcTcKNhOQMBmJq8UpAmydjyhqlFdwel0HMBReCI56AbBjOss
	ys/hlle289ZbqwJ/W5TilIZX2ZQA=
X-Google-Smtp-Source: AGHT+IFteKF0n9oClwejHyr5agehXDb0k7S2tqnIcjSRDmL+smq006tk4p7iGhuoEHb8FtlFd6aJOA==
X-Received: by 2002:a05:600c:19ca:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45b6870e3dfmr26425085e9.17.1756226275893;
        Tue, 26 Aug 2025 09:37:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7113fdacfsm16879530f8f.35.2025.08.26.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:37:55 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:37:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH v2 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1756219848.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This driver provides a way to access the On Chip One-Time Programmable
Controller (OCOTP) on the s32g chipset.  There are three versions of this
chip but they're compatible.

v2:
I have fixed everything that people pointed out about version 1.

Sorry, Rob and Krzysztof, for the problems with the device tree YAML
file.  I had an issue with my dtschema installation and it's fixed now.

I also screwed up the From headers in v1.  I called git format-patch
without passing the --from argument.  I've fixed my scripts so that
won't happen again.  I also messed up the Signed-off by lines in patch
1 and 2.  Sorry!

My other mistakes were from not being a familiar enough with the
subsystem and those are addressed as well.  Especially re-writing the
driver using keepouts cut down a lot of lines of code.  I've tested it
and the results are the same before and after.

Ciprian Costea (2):
  dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
  nvmem: s32g-ocotp: Add driver for S32G OCOTP

Dan Carpenter (1):
  arm64: dts: s32g: Add device tree information for the OCOTP driver

 .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  45 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 ++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g-ocotp-nvmem.c              | 101 ++++++++++++++++++
 6 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2

