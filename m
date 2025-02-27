Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8B1A841B
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675974; cv=none; b=ghuiroabYuFkq765ptVPiQEgyjj+X0wvUy9iOQXchZdvtw+S5f5RmbHSCCfoSvShg0q3ThFyqbDZM7TIiOYqX/DSsdAm8cjWU96pKYWjEnB/Ro9PxVuBw6IioeDwYIAlETbetCJAUccPhXuNt/BpXQIkZoocgfjdG9qzlHvLJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675974; c=relaxed/simple;
	bh=DxBxDS7njlYdXtEvqHFAv+PE/paifj80Gj2m8iqU3uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9QOZO3BkZjtdJtB5P/wt5IueZz0ekHTgYxAiKumrYmMeU48reX68gq5zczBivNGbs6BPHlLWd48RleM3OGZRgePmjgr/f/aurCKPMfuRlwXHcR5GY/EUVyXSbVVBLAmGoQ3AKKn94AdJeEy2yzpY3DXwm72XojGjcOxyodLn4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWMRrU5J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWMRrU5J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394036c0efso8288185e9.2
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675971; x=1741280771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ij+1zKEH9Ba/kB5z4KtEJBYfC9RnQvjSfyNgQo+oss=;
        b=dWMRrU5JhUil2hS6q6EXsFS4s2u1v5z14xTxk3SlSCJoRebQn1agMYQaYoHfjKi60u
         V17f1lK9ICsg6mTqgz0Ex3pkzceg8An1NcqdgVmGqGZ2DbuEZ3tihgQdQ7ughx2al7TR
         Nih2jI9r9kIacE91E6dVbZUQU7rvHAuzRyMvxfhkHs08J5/EDZmgUKbwNPU9uOeKkOj0
         lV+vLSZmbm6ojJiIQrnRsddxDmGVJFgaop85vDTUjXDNLNIgEf+i3//tjX1e2+Salc9i
         +0MgT0BVriXQShTsvckZCpp/mNYTh+2eH1Z9i8ZpuYW/QTugkaLioi1UffQeFGO4rctc
         kAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675971; x=1741280771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ij+1zKEH9Ba/kB5z4KtEJBYfC9RnQvjSfyNgQo+oss=;
        b=KMve13U9NieydE7wNVu6gUG8m+4Fc1jwk3RWW/EdwjUzlc/iUrsPAogLSlzLmwuXoB
         tdFlik3V0CNd2+77m8NKvPJp5tbVh/q6u/TTjMxi8WeBdnuAPtW62bNuleyfOhD98cnU
         oTJQAckCIfFWbURW13Y3JW8hlJAjIJQAprlBqCPQlQoTAAKsIzXqg7HBt7RPWTs/w9kz
         7CCitg2+RsW1NUBm2b4gZf75C7VXSgu2iBbx1vyHuqqcwonP8rNt7OfjCZym3K3BKZib
         cSNENmu4apSjeUs0r4poj1Py34byjFg8K9YCR0Uf1IaRIeo/sp4QOhpFF6VneSvnHdiC
         HHRg==
X-Forwarded-Encrypted: i=1; AJvYcCX92d3BypeU+BGTqW9fSql0vXXcgBLtsNkH2daDc01bXV5wsGVYSWOk3iZJELNVrhGyVA0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtH6Oi+/E5wiWGkcsVZn3Gc5shpiFL3oPz0VhS3/pe+Y+sWOFT
	kI+EOPa5k5y97eQrbDKxkBo7XJGzUo3u7M9XjruSfyLzQ2TPatgz
X-Gm-Gg: ASbGncuzy7ZtyLXhvnujLtwxky7I1Te9VlzbTPxuPu/W7VsfX2lx6VbwlbjjfteyDKf
	NSgAYsxAalg5+SnEZ3v1ewPXcc+iina3m572ujgJ/5O2UW6CYiUxKA42EP2RY2J7h32iTcQBO/v
	WU8aBaJlWPmYKExFUZuGc0S24Ss1M7TI0bNnuMq8d/y3AfVP3Be8W4Vs4kd4ydoaq1SelG0JQom
	U9JF0irzAGvDI8oivh2mwhtJAR9S5gpGpIt/0N7risP7B4dnE+XJTwdy6ZlnXCF3RtRf4Gdz9jO
	3jhYc7v/8O+FXYQrljkXNy091yMmjuumHG85157eFyTyhDaFLM6ULylz4nvS5d0XPksjgl2CuLj
	HWufW
X-Google-Smtp-Source: AGHT+IFz/HuE+h4ot474pv//qiTEPyaVwEbLVUzle5E5RWvan8sfzGk2Q6TpIzTePER/mMGEQAtPYA==
X-Received: by 2002:a5d:47cf:0:b0:390:e599:5bd0 with SMTP id ffacd0b85a97d-390e59963damr2661178f8f.28.1740675970773;
        Thu, 27 Feb 2025 09:06:10 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:10 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Thu, 27 Feb 2025 18:04:51 +0100
Message-ID: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

The STMPE811 touchscreen controller is no longer disabled by default.
The STMPE811 is self contained within the SoM, therefore, disabling it
is not the correct default behavior.

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

Ernest Van Hoecke (2):
  ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
  ARM: dts: apalis/colibri-imx6: Add support for v1.2

 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
 14 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

-- 
2.43.0

