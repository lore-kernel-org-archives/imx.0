Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05F31CA6A
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129033; cv=none; b=PXxdlCvCLUhA1M/+08VaprSaDxXbC7/hv7Bh6inf9QTjBimGHja6c9Fr3T/jj+pTqAD/CSltZiYalxwwjhuc1nzl+caW2sRiaVUqeXOXNo5Bxhn9salBuLhgJePNceb+LkelcKf9dYpAvMQEym1ahAItcGnbpD7/J5kU6ZsT4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129033; c=relaxed/simple;
	bh=7RBQ1rxq9cwOIH31iq0O2exHw9ltAWV8KJdyPMcuMpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRGaaZPNOEdS1SHOjK/Y6rYKYw0MaOQF1uIVWv/ykxLzbN2C9AvsPpWJKe7Ow/+KIa5jGSPHiuofTkyW9Eni1/Y2zW3uDg7kNms26QJGeMUGu4nYvFwtTHsa+BAEuOHGz1Af9l2KSaH4S5iN5U5AIGO0wNPf+WIXlHBpWgHR4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOATvRrY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOATvRrY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b312a086eso1250396f8f.2
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129030; x=1763733830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsEhbkw7/qEJclFbO4NyPPkv0/guRdzyvArRrjN0KIE=;
        b=JOATvRrYPyN0QmcpGKJLwpzUn6scKZv5yF6bL6oMgxOtb4bZ8JciS1j5fhNzs+1Rhu
         lS/oQdin7k8Bnjl1WmiK6xCFmoHSBvLLQofOIOsppsn897S9CpO52UXtZWxhDUduEQ77
         LolpBR2MmtNcnJ+4Yh+2Q/KEmnoL/bdpAVks/gz30aE+fiAcP4o9L6SQ47pYJALNuZVc
         V6o/269KXc9QaFNDAh51F/KeTBqoSC0LwA5gTKjorQTMAIf3qCxjSfYvoWPbehzlio+0
         LSIm4+WCY7OFjZQX1eWM78jvQ+5F+XVBJbFD8y4yoK8b8yjeX4g0b55ZQvExv1QXfk7p
         oIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129030; x=1763733830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEhbkw7/qEJclFbO4NyPPkv0/guRdzyvArRrjN0KIE=;
        b=ElcxJAhIg9lzz4acPoi3sDt/EgakGVPmyjyeRvWbyEKjrGnTbOTYOcvwrnU/X4HW/s
         NAFvtu4WbIXZklsRpP/98hWXOfD6hE76zz8mrugPEk6N3OZwqZ4kJ/kQuS+JwFJK3aV+
         l8WVu4FfLSjZX4DImgkueWu/ncgxoxjW7cu03lPdYyqKdueT4c/02OhNsm49DBfnfhiN
         T6A9Vz9Rtw0yMNQP814t8wrc1e2vidRdixDVtHXe0U5hVg66M4L61MH21hqKekrqNlvg
         AH2b6X08UsZVGn4yO9wrhZs6dVB/wYVFbHq0eBmLPM1dGr9O1prB0YD9Vgxik64eyJJT
         aj+A==
X-Gm-Message-State: AOJu0YxNbEdYOS+hvlGlcM3OiEpYnMrRy3LygwJDnh042p7WNJuK9qrD
	x7EWqInIAXfZlQnf383Uqu9/Kykp4KZ4Lx0D+/WUS7f5rq++yAbRi4nx2q5PvOPDMrc=
X-Gm-Gg: ASbGnctVIPpF8goYC351/5itA6IVj+J9Tk9oV88LeIPi22noRhg2KWsCh2EfcXURTn5
	fU/CuOlWpCGaEctiMkQLwtGQSv8UOJTRaDBszbyyUAQbNqvYd7SfjjZoJWQGGqVnuAFfst3LySx
	/bszh7vswM+PTrmHXBf51pFXybEntfIauXnf0yBM2OY/B91/tXYfIdWuBG7vFFIpo3O/094uO4S
	N6q/CrpztZQp7RhWQLLM3zKadrhqnIyOsXPoHlsCaLeSOUFkLDlVsDBg98XQTdlGhBZ1bTlc3Xj
	k7wwgSTuU3oCTeLaAJt1cFu5UsdC2fzhRQtp29IpYRkn/59rttukGlD+yPF8u2t8CQNxMbJdQZw
	AUTrV4B6y2fgnmM5PoIfXqI2gDVlkoXST6QMIpKdk3oLXiqRH6fRB1v5xvKBMakBUq6B2QB4d+Q
	==
X-Google-Smtp-Source: AGHT+IGA/B1SzNJ6LDArjnRCHI7gdzJpdYz7fDscB0tGXVzq/cjWi9I4cngB9uUtqy66QBErU5TPQQ==
X-Received: by 2002:a05:6000:144c:b0:42b:389a:b49 with SMTP id ffacd0b85a97d-42b5935a894mr2976159f8f.28.1763129029328;
        Fri, 14 Nov 2025 06:03:49 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm9852161f8f.38.2025.11.14.06.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:03:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.19
Date: Fri, 14 Nov 2025 15:58:42 +0200
Message-ID: <20251114135842.1473203-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.19

for you to fetch changes up to fdc1dc7dd53b95805d3943ed36785c1ec812915e:

  clk: imx: add driver for imx8ulp's sim lpav (2025-11-11 18:01:25 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.19

- Add delay to the PCC enable/disable in i.MX7ULP composite, needed by
  some specific peripherals.
- Simplify the i.MX8MP auxiomix by using devm_auxiliary_device_create()
- Add the i.MX8ULP SIM LPAV platform specific clock provider.

----------------------------------------------------------------
Jacky Bai (1):
      clk: imx: Add some delay before deassert the reset

Laurentiu Mihalcea (2):
      dt-bindings: clock: document 8ULP's SIM LPAV
      clk: imx: add driver for imx8ulp's sim lpav

Peng Fan (1):
      clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml       |  72 ++++++++++
 drivers/clk/imx/Kconfig                            |   1 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-composite-7ulp.c               |  13 ++
 drivers/clk/imx/clk-imx8mp-audiomix.c              |  39 +-----
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c             | 156 +++++++++++++++++++++
 include/dt-bindings/clock/imx8ulp-clock.h          |   5 +
 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h   |  16 +++
 8 files changed, 268 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
